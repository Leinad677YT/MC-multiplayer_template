# CORE MODULE

### Content

This pack helps with inventory (mode) management, saving items, health, spawnpoint and position context easily in the database. Along with that, it allows you to execute functions before updating the items into the cache, having access to the previous inventory state.
> - **functions**   > _`linv/function/user/`_
> - **call events** > _`zleinad_pack_manager/tags/function/user/inventory/`_

### Entity tags
To avoid saving position/spawn changes on players into the database (make them remain as it were saved), apply them the following tags
> `linv.not_save_pos`
> `linv.not_save_spawn`
