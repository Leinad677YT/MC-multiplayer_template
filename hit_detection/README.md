# Module # Hit detection 

## Content

By running the user functions you can enable or disable hit detection on entities. After an entity with the detection gets hit by another one, even if they don't detect, it will trigger the related function calls for you to execute things afterwards.

> [!NOTE]
> To properly select between ranged and melee, the attacker **MUST** have an ID

### Specifications

- **entity_type tag**
    - `#l.user:detects_hits`  
        > Entities on the tag will get hit detection automatically placed on them if you have the `new_entity` module installed.

- **function**
    - `l.user:prepare_entity` and `l.user:prepare_player`  
        > Execute as the entity you want to activate hit detection on. It doesn't matter if the entity already had hit detection, it will work anyways. If the entity is a player, it is prefferred to use their specific version.
    - `l.user:remove_detection`  
        > Execute at the entity you want to activate hit detection on. It doesn't matter if the entity already had hit detection, it will work anyways.
- **function call**  
    All of them, listed in the order of execution after a hit gets detected:
    - `#l.user:hit_det/victim`  
        > Executed **as** the victim of the attack.
    - `#l.user:hit_det/attacker`  
        > Executed **as** the attacker, regardless of how the attack was done.
    - `#l.user:hit_det/atk_melee` and `#l.user:hit_det/atk_ranged`  
        > Executed **as** the attacker.  
        > Melee only triggers when the hit was done directly.  
        > Ranged triggers when the hit came from a projectile or the attacker entity had no ID.