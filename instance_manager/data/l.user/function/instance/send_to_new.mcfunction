## called with session-data + room_type
$say {would_call: i$(session).$(room)}
$function l.schedule:no_context/schedule {ticks:2,function:"test:say",context:{say:"i$(session) <- $(name)"}}
function l.user:team/serverside/list