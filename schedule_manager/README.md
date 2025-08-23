# CORE

### Content

This pack controls scheduled events for functions, 
ticking events and how many should execute at the same tick*
> the limit only applies to internal calls like instance clearing, and can be specified by setting the `#max_scheduled_events_per_tick l.core.temp_condition` score, which defaults to 20 on the `load` core function.

> - **functions**   > _`l.user/function/schedule/`_

### Usage

There are more than 1 ways to make something happen in some time, this module controls the following:
> - Making something happen past X seconds IRL (if you close the world, this will still apply, being executed the first tick afterwards)
> - Making something happen past X seconds IRL if a player is online
> - Making something happen past X ticks
> - Making something happen past X ticks if a player is online
> - Making something happen under an external trigger if a player is online

All of them, are controlled internally like this:

#### TIME SCHEDULING

> [!NOTE]
> If you add to the context `save:1b`, **it WILL** save the event on the player queues when they disconnect with it on their queue.

```function l.user:schedule/time {function:"foo:bar",context:{a:"test"},seconds:90}```
Will add to the time queue: `function foo:bar {a:"test",function:"foo:bar",time:UNIX_INT_OF_TRIGGER}`, and it will execute after 90 seconds.

```function l.user:schedule/player/time {function:"foo:bar",context:{a:"test"},seconds:90,lower:"pepito777"}```
Will add to the time queue of Pepito777 (as lower is just the lowercased nickname): `function foo:bar {a:"test",function:"foo:bar",time:UNIX_INT_OF_TRIGGER}`, and it will execute after 90 seconds, even it they are offline.

> [!NOTE]
> The **offline** player schedules are saved under `storage z_p$(lower):root data.schedule`

#### TICK SCHEDULING

> [!WARNING]
> This queue type cannot be saved between sessions, even with `save:1b`

```function l.user:schedule/ticks {function:"foo:bar",context:{a:"test"},ticks:20}```
Will add to the tick queue: `function foo:bar {a:"test",function:"foo:bar",time:INTERNAL_TICK_OF_TRIGGER}`, and it will execute after 20 ticks.


```function l.user:schedule/player/ticks {function:"foo:bar",context:{a:"test"},ticks:20,lower:"pepito777"}```
Will add to the tick queue of Pepito777 (as lower is just the lowercased nickname): `function foo:bar {a:"test",function:"foo:bar",time:INTERNAL_TICK_OF_TRIGGER}`, and it will execute after 20 ticks. This only works if the player is online.

#### TRIGGER SCHEDULING

> [!NOTE]
> If you add to the context `save:1b`, **it WILL** save the event on the queue when the player leaves with it on its queue.

```function l.user:schedule/player/trigger {function:"foo:bar",context:{a:"test"},seconds:90,lower:"pepito777"}```
Will add to the time queue of Pepito777 (as lower is just the lowercased nickname): `function foo:bar {a:"test",function:"foo:bar",trigger:TRIGGER_INT}`, and it will execute if something else detects it.

> [!NOTE]
> The **offline** player schedules are saved under `storage z_p$(lower):root data.schedule`

> [!NOTE]
> I will hijack [0,1023] for internal triggers, like disconnections. The updated list of internal triggers will be on a separate file.

To create your own triggers, you will need to add something similar to the following scheme to your "trigger" check:

```
### EXECUTE THE TRIGGER 2000 OF ALL THE PLAYERS ONLINE
    # move the events outside session data
        $data modify storage leinad_perm:schedule function append from storage leinad_perm:online session[].schedule_trigger[{trigger:2000}]
    # execute them using the core queue executor
        execute if data storage leinad_perm:schedule function[0] run function l.user:misc/execute_queue with storage leinad_perm:schedule function[-1]
    # remove the events on the session data
        $data remove storage leinad_perm:online session[].schedule_trigger[{trigger:2000}]
```