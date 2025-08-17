# CORE MODULE

### Content

This pack helps managing temporal games (instances). It allows you to send or kick players from instances, as well as managing the instances themselves. Players will get kicked out of an instance if they disconnect.
> - **functions**   > _`l.user/function/instance/`_
> - **call events** > _`l.user/tags/function/instance/`_

### Functions

#### **send / kick**

To move players into an instance, you have 2 options. Either you send all players inside the same serverside team to a new one, or you send a specific player into an already existing one.
For any of these 2, the player that queues **must not** be already queuing up into a game.