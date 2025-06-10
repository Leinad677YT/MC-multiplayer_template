# IMPORTANT
  · This pack requires forceloading the overworld at (0,0) to use a sign, to understand why, go to the function lteam:update_player
  · This pack will FLOOD your team list if you don't remove the team after someone leaves, it creates a new team for every player that joins the server.
  · This datapack requires players to have the score "lplayer.id" as a numeric ID in order to assign serverside teams
  · This pack needs a forced enchanted item on the players in order to manage friendly fire.

# NOTES ON BEHAVIOUR 
  > serverside teams
    · Players can join a team if
      - it was the last one they were invited to
      - at least a player has invited them as their last invitation sent
  > lteam:get_prefix & lteam:get_suffix 
    · They are example functions, you should mind changing them

# USEFUL FUNCTIONS
  > lteam:update_player {name:"PLAYER"} 
    · Changes the prefix and suffix of PLAYER depending on which scores they have (see function lteam:get_prefix & lteam:get_suffix)
  > lteam:serverside/* // if the executor doesn't have a team, invite and list will create one for them
    · lteam:serverside/invite {target:"PLAYER"} invites PLAYER to the team
    · lteam:serverside/join_last {} tries to join the last team that the executor was invited to, fail if not invited || don't have an assigned id
    · lteam:serverside/join_specific {target:"PLAYER"} tries to join the team where PLAYER is, fail if not invited
    · lteam:serverside/list {} displays the current team the player is on

# DEPENDENCIES
  · LOAD FUNCTION
    > zleinad_pack_manager:load_team_overhaul

  · NEEDED:
    > player id assigner
      · Required for players to have the score "lplayer.id" as a numeric ID in order to assign serverside teams  
  
  · Recommended to use along with:
    > fixed enchantment on slot for hit detection 
      · To disable friendly fire using the predicate lteam:same_serverside_team
    > join/leave detection
      · To remove team on disconnection for less unused data on the world
      · To remove serverside_team on disconnection for easier team usage
      · To remove serverside_team invites on disconnection to avoid "lurkers"