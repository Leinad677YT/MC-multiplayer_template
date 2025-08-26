# SMALL PLAYER MODULE

## Content

This pack allows you to apply vanilla freezing to players, 

> As this relies on subtick trickery, it won't work for every usecase. Block updates on the player feets will not be "registered" well while they are influenced by this.

> [!TIP]
> An easy way to use this without issues is to set the player's block interaction range to 0 when they are freezing, **and being careful with things that update blocks around them**

### Specification

- **entity tags**   
    - `l.player_freeze`
    > Players with this tag on will receive freezing from powdered snow regardless of where they are.
