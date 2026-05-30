---
name: monthly-review
description:
  Use this skill to create a monthly review based on the weekly-review notes from this ending month.
---

# Week Reviewer

This skill guides the agent to create a monthly review based on the weekly notes from this month.

## Workflow

### 1. Review Notes

- **Review**: Review the notes with titles that fall under dates for this month in ~/notebook/daily-notes/
- **Review**: Review the notes with titles that fall under dates for this month in ~/notebook/daily-notes/weekly-review/
- **Consider a summary, take-aways**: From the reviewed notes, consider a summary and take-aways from the content

### 2. Create Weekly Review

- **Fill out monthly review template**: Use [the monthly review template](~/notebook/daily-notes/.agents/skills/monthly-review/assets/monthly-review-template.md), and replace the example text with the information reviewed from the daily and weekly notes for this current week (sun-sat)
- **Write file**: Write the finished template in the monthly-review/ directory in the current working directory

You are now finished with the review!
