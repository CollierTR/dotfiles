---
name: daily-breif
description:
  Use this skill to create a daily breif to kick off the day.
---

# Week Reviewer

This skill guides the agent to create a daily breif based on the last 7 daily notes and todoist items for the current day

## Workflow

### 1. Review

- **Review**: Review the notes with titles that fall under dates for the last 7 days in ~/notebook/daily-notes/ this is to make sure nothing gets forgotten
- **Review**: tasks from todoist for the current day using the todoist mcp server
- **Consider a summary**: From the reviewed notes and action item, consider a summary and action items to brief me for the day.
- **Consider a plan**: for a high impact day

### 2. Create Brief for my review at the top of a daily note

- **Create a daily note for today**: if a note for today doesn't exist, use [the daily note template](~/notebook/.templates/daily-note.md), and replace the example text with the brief. If the today's note already exists, then just update the file to include the brief.
- **Write file**: Write the finished template in the daily-notes/ directory

You are now finished with the Brief!
