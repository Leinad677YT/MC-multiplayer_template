# CORE MODULE

### Content

This pack helps with inventory (mode) management, saving items, health, spawnpoint and position context easily in the database. Along with that, it allows you to execute functions before updating the items into the cache, having access to the previous inventory state.
> - **functions**   > _`l.user/function/inventory/`_
> - **call events** > _`l.user/tags/function/inventory/`_

### Entity tags
To avoid saving position/spawn changes on players into the database (make them remain as it were saved), apply them the following tags
> `l.inventory.not_save_pos`
> `l.inventory.not_save_spawn`
