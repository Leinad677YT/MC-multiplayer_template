##  Team data
The `#get_teamdata` functions are meant to modify the player individual teams.

Inside the path `storage leinad_temp:teamdata raw.prefix` and `storage leinad_temp:teamdata raw.suffix`. should be a text component like in the ones used in the very bad examples :works_as_intended: (check inside the namespace)

The `storage leinad_temp:teamdata raw` path **MINIMAL** structure should match the following scheme:
```
{
    name:"$(name)",      // this should not be touched, it is used to set the team prefix/suffix afterwards
    prefix:[
        {
            text:""
        }
    ],
    suffix:[
        {
            text:""
        }
    ]
}
```

> [!NOTE]
> This data gets set before the call, but if you use `data modify PATH set` you could accidentally break it, be sure to leave always a valid text component.

## Create

This call happens when the player already belongs to the target team, it can access `$(new_team)`, which is a team integer id.

## Join

This call happens when the player already belongs to the target team, it can access `$(new_team)`, which is a team integer id.

## Leave

This call happens when the player leaves, or changes their team, it can access `$(old_team)`, which is their old team integer id.