# SMALL PLAYER MODULE

### Content

This pack allows you to apply vanilla freezing to players, 

> As this relies on subtick trickery, it won't work for every usecase. Block updates on the player feets will not be "registered" well while they are influenced by this.

> - **entity tags**   > _`l.player_freeze`_

### Usage

Apply to the players you want to add freezing the tag `l.player_freeze`. They will increase their freezing until the vanilla cap until you remove the tag from them.

> [!TIP]
> An easy way to use this without issues is to set the player's block interaction range to 0 when they are freezing, **and being careful with things that update blocks around them**