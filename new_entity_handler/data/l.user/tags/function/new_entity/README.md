## Entity data

The `#entity_data` functions are meant to modify the data inside the path `storage leinad_temp:entity_spawn macro.data`. The data here is what the pack will try to check to compare it with the previous data, by changing something, you update the version and thus all entities will load as if they were new.

Their **MINIMAL** structure should match the following scheme depending on the modules loaded:
```
{
    
}
```

> [!NOTE]
> **I STRONGLY RECOMMEND TO NOTE ENTITY CHANGES HERE TO USE THEM IF NEEDED**
> Remember that this is only orientative until you add changes to the entites, if you add something, remember that you could have stored data about changes here before to fix those entities

> [!TIP]
> You may have noticed that it iterates over old versions, **this is VERY BAD for performance in older worlds**,
> every time you start a "new world" you should reset this by using the load score

## Version control

There should be a file here that isn't in other calls, but there isn't, that file is the `manage_old_data` call.
That call doesn't exist because modules fix themselves (at least by now) when updating, but if you add data to the entity nbt it won't remove it, to solve issues, use their related function following the call inside `l.new_entity/function/manage_old_data`:

```$function zleinad_pack_manager/user/call/new_entity/fix_v$(version) with storage storage leinad_perm:version on_entity_spawn.data.$(version)``` 