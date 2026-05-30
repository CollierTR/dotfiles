---
name: todoist-process-tasks
description:
  Use this skill to process tasks in todoist
---

# Todoist Task Processing

This skill guides the agent to process unprocessed tasks in Todoist

## Workflow

### 1. Note
For this skill you will need to use the Todoist MCP connection

If a task cannot be confidently processed:

- Skip the task
- Add it to an "Needs Clarification" section in the final report
- Continue processing all remaining tasks

Only interrupt the workflow and ask the user immediately if more than 25% of tasks are ambiguous.

### 2. Pull all labels for referance
- Pull all labels from Todoist. These will be the labels that you will assign to the tasks as you process them.

### 3. Pull all tasks that do not have the "processed" label
- Pull all tasks that **DO NOT** have the "processed" label. 

### 4. Process each task
For each unprocessed task, perform the following task loop:

Only assign a label if confidence is high based on the task title.

If confidence is low:
- Leave the label unassigned
- Document the uncertainty in the report

- Never create new labels
- Never assign labels that do not exist

#### a. Assign Labels

Assign labels to the task using the following guide:

**time**
Use one of the "time-<duration>" labels to assign an approximate duration for the task

**effort**
Use one of the "effort-<ammount>" labels to assign an approximate effort level for the task

**location**
If it can be determined by the task title, use one of the "location-<place>" labels to assign a location for the task

**work**
This is used for work/occupation based tasks

**hannah**
This is used to track discussion points that involve my wife (Hannah)

**eliz**
This is used to track discussion points that involve my manager (Elizabeth)

**important-event**
This is used as a reminder for important events. **Do not use this label!**

**other**
Use other labels as needed if the task title indicates a relation to the labels

#### b. Assign Priority

Assign priority to the task using the following guide:

Note: I am using the 4 priorities in Todoist modeled after the Eisenhower Matrix. 

**p1**
task is both important and urgent

**p2**
task is important but not urgent

**p3**
task is urgent but not important

**None/p4**
task is neither important or urgent

When determining priority:

P1
- Deadline within 7 days
- Serious consequence if missed

P2
- Important goal or responsibility
- No immediate deadline

P3
- Time-sensitive request
- Low long-term impact

P4
- Someday/maybe
- No urgency
- Low impact

#### c. Add to description

Do this only if a task title indicates needed information, learning, research, or simular, add information to the description.

If the task already contains a description:

- Preserve existing content
- Append additional information below it
- Separate new content with a heading

Example: if the task title is "Learn how to solder", then fill the description with information that is needs (i.e: a learning plan and resources)

Example: if the task title is "Look into Branson, MO attractions", then fill the description with information on  popular attractions in Branson, MO

Description additions should:

- Be concise
- Be actionable
- Be less than 500 words
- Focus on next steps, resources, or key information

#### d. Add "processed" label to task
- Add the "processed" label to the task. This indicates that a task has been processed and won't need to be processed again.

END OF TASK LOOP

### 5. Give a report on how the task processing went

Once all tasks have been processed, generate the following report:

Report:

- Total unprocessed tasks found
- Total successfully processed
- Total skipped
- Total failed

For skipped tasks:
- Task name
- Reason clarification is needed

For failures:
- Task name
- Error encountered

For notable decisions:
- Task name
- Explanation
