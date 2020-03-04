# This section defines all the scheduled tasks to be added.
# {name}Acti - action
# {name}Trig - trigger
# {name}Name - title of task
# {name}Desc - task description

$vscodeActi = New-ScheduledTaskAction -Execute 'code'
$vscodeTrig = New-ScheduledTaskTrigger -Daily -At 9pm
$vscodeName = "Coding at 9pm"
$vscodeDesc = "Opens VSCode at 9pm every day"

# This section registers the scheduled tasks into Task Scheduler.
# Remember to check Task Scheduler to ensure the tasks have been added properly.

Register-ScheduledTask -Action $vscodeActi -Trigger $vscodeTrig -TaskName $vscodeName -Description $vscodeDesc
