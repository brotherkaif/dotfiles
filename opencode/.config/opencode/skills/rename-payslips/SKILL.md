---
name: rename-payslips
description: Rename payslip PDF files in ~/Downloads/slips/payslips to the convention 1[YYYYMMDD]-PS-KAA-BBC.pdf. Use when asked to rename payslips, pay slips, or PDFs in that folder, including when a "-additional" suffix is requested.
---

# Rename payslips

Rename the PDF files located in `~/Downloads/slips/payslips` to the payslip naming convention.

## Naming convention

Each file must be renamed to:

```
1[YYYYMMDD]-PS-KAA-BBC.pdf
```

The only dynamic part is the date `YYYYMMDD`. The literal prefix is `1`, followed by the date, then `-PS-KAA-BBC.pdf`.

Examples:

```
120211115-PS-KAA-BBC.pdf   (pay date 2021-11-15)
120260315-PS-KAA-BBC.pdf   (pay date 2026-03-15)
```

## Determining the date

Infer `YYYYMMDD` from the "Pay Date" inside the document:

1. Extract text from each PDF, e.g. `pdftotext "$f" -`.
2. Search for the pay date, e.g. a line like `Pay Date is 15th October.` or a `Paydate` field with a value like `15/04/2026`.
3. The year is usually also confirmed by text in the document (e.g. a filename or content containing `2026`) or from the month in the original filename (e.g. `Apr'26`).
4. Build `YYYYMMDD` from the pay date. Example: "Pay Date is 15th October" with year 2026 → `20261015` → `120261015-PS-KAA-BBC.pdf`.

If the pay date cannot be determined from the document, infer it from the filename itself; otherwise ask the user.

## Optional suffix

If the user requests it, add the suffix `-additional` before the `.pdf` extension:

```
1[YYYYMMDD]-PS-KAA-BBC-additional.pdf
```

## Procedure

1. List the files: `ls -la ~/Downloads/slips/payslips`.
2. For every PDF, determine its pay date and show/apply the mapping.
3. Back up the originals before renaming, e.g. to `/tmp/opencode/payslip-backup/` (use a unique subfolder per run, such as `round2`, to avoid overwriting earlier backups).
4. Rename with `mv`, quoting the filenames (original names contain spaces and apostrophes).
5. Confirm no filename collisions: every pay date is unique, so `1[YYYYMMDD]-PS-KAA-BBC*.pdf` names will not collide if the dates differ.
6. Verify with `ls -1`.
