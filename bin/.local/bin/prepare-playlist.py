#!/usr/bin/env python3
import os
import sys

def time_to_seconds(t_str):
    """Converts MM:SS or HH:MM:SS to total seconds."""
    parts = t_str.strip().split(':')
    try:
        if len(parts) == 2:
            return int(parts[0]) * 60 + int(parts[1])
        elif len(parts) == 3:
            return int(parts[0]) * 3600 + int(parts[1]) * 60 + int(parts[2])
    except ValueError:
        pass
    return 0

def seconds_to_time(sec):
    """Converts total seconds to standard HH:MM:SS format."""
    h = sec // 3600
    m = (sec % 3600) // 60
    s = sec % 60
    return f"{h:02d}:{m:02d}:{s:02d}"

def normalize_time(input_str):
    """Pads user input to standard HH:MM:SS format, handling roll-overs."""
    input_str = input_str.strip()
    if not input_str:
        return None
    parts = input_str.split(':')
    try:
        if len(parts) == 1:
            # Assume minutes if they type just a number
            val = int(parts[0])
            h = val // 60
            m = val % 60
            return f"{h:02d}:{m:02d}:00"
        elif len(parts) == 2:
            # MM:SS -> HH:MM:SS
            m = int(parts[0])
            s = int(parts[1])
            h = m // 60
            m = m % 60
            return f"{h:02d}:{m:02d}:{s:02d}"
        elif len(parts) >= 3:
            # HH:MM:SS -> handle any rollover logic
            h = int(parts[0])
            m = int(parts[1])
            s = int(parts[2])

            # Rollover seconds to minutes
            additional_m = s // 60
            s = s % 60
            m += additional_m

            # Rollover minutes to hours
            additional_h = m // 60
            m = m % 60
            h += additional_h

            return f"{h:02d}:{m:02d}:{s:02d}"
    except ValueError:
        pass
    return "00:00:00"

def escape_markdown_field(val):
    """Escapes pipes for Markdown tables."""
    return val.strip().replace('|', '\\|')

def main():
    if len(sys.argv) < 2:
        print("Usage: ./prepare_playlist.sh <rekordbox_playlist.txt>")
        sys.exit(1)

    input_path = sys.argv[1]
    if not os.path.exists(input_path):
        print(f"Error: File '{input_path}' not found.")
        sys.exit(1)

    # Read Rekordbox UTF-16 raw format
    try:
        with open(input_path, "r", encoding="utf-16") as f:
            content = f.read()
    except Exception as e:
        print(f"Error reading file (UTF-16): {e}")
        sys.exit(1)

    lines = content.strip().split("\n")
    if not lines:
        print("Error: The playlist file is empty.")
        sys.exit(1)

    header = lines[0].split("\t")
    try:
        title_idx = header.index("Track Title")
        artist_idx = header.index("Artist")
    except ValueError:
        print("Error: Could not find 'Track Title' or 'Artist' columns in header.")
        sys.exit(1)

    # Duration column is optional, fallback if not present
    time_idx = header.index("Time") if "Time" in header else None

    tracks = []
    for line in lines[1:]:
        parts = line.split("\t")
        if len(parts) <= max(title_idx, artist_idx):
            continue
        artist = parts[artist_idx].strip()
        title = parts[title_idx].strip()
        duration = parts[time_idx].strip() if (time_idx is not None and len(parts) > time_idx) else "00:00"
        tracks.append({
            'artist': artist,
            'title': title,
            'duration': duration
        })

    if not tracks:
        print("No tracks found in the playlist.")
        sys.exit(1)

    print(f"Loaded {len(tracks)} tracks. Starting interactive timecode entry...\n")

    current_seconds = 0
    results = []

    for i, track in enumerate(tracks, 1):
        suggested_time = seconds_to_time(current_seconds)
        print(f"[{i}/{len(tracks)}] {track['artist']} - {track['title']} (Duration: {track['duration']})")

        user_input = input(f"   Enter start time [Default: {suggested_time}]: ").strip()
        if not user_input:
            start_time = suggested_time
        else:
            start_time = normalize_time(user_input)

        print(f"   Saved start time: {start_time}\n")

        results.append({
            'artist': track['artist'],
            'title': track['title'],
            'start_time': start_time
        })

        # Accumulate duration to propose the next start time
        dur_sec = time_to_seconds(track['duration'])
        start_sec = time_to_seconds(start_time)
        current_seconds = start_sec + dur_sec

    # Determine output paths
    base_name, _ = os.path.splitext(input_path)
    txt_output_path = f"{base_name}_mixcloud.txt"
    md_output_path = f"{base_name}_blog.md"

    # 1. Write standard Mixcloud Plain Text format
    txt_lines = []
    for track in results:
        artist_clean = track['artist'].strip()
        title_clean = track['title'].strip()
        txt_lines.append(f"{artist_clean} - {title_clean} - {track['start_time']}")

    with open(txt_output_path, "w", encoding="utf-8") as f:
        f.write("\n".join(txt_lines) + "\n")

    # 2. Write the Markdown file (Hugo blog format)
    md_lines = [
        "| Artist | Track Title | Start Time |",
        "| :--- | :--- | :--- |"
    ]
    for track in results:
        artist_esc = escape_markdown_field(track['artist'])
        title_esc = escape_markdown_field(track['title'])
        md_lines.append(f"| {artist_esc} | {title_esc} | {track['start_time']} |")

    with open(md_output_path, "w", encoding="utf-8") as f:
        f.write("\n".join(md_lines) + "\n")

    print("--- Output Files Generated ---")
    print(f"1. Mixcloud Plain Text file: {os.path.basename(txt_output_path)}")
    print(f"2. Hugo Blog MD file: {os.path.basename(md_output_path)}")

if __name__ == "__main__":
    main()
