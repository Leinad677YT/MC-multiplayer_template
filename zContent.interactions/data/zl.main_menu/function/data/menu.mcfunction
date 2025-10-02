## TRIGGERS
    data modify storage l.menu:triggers -677 set value {\
                                    list_t:[\
                                        {\
                                            trigger: "in",\
                                            predicate: "zl.main_menu:jump" \
                                        },\
                                        {\
                                            trigger: "back",\
                                            predicate: "zl.main_menu:sprint" \
                                        },\
                                        {\
                                            trigger: "left",\
                                            predicate: "zl.main_menu:left" \
                                        },\
                                        {\
                                            trigger: "right",\
                                            predicate: "zl.main_menu:right" \
                                        },\
                                        {\
                                            trigger: "up",\
                                            predicate: "zl.main_menu:forward" \
                                        },\
                                        {\
                                            trigger: "down",\
                                            predicate: "zl.main_menu:backward" \
                                        }\
                                    ]\
    }
##

## RESET
    data modify storage l.menu:-677 0 set value {\
                                    d_list:[{display:"tmain_1"},{display:"tmain_2"},{display:"tmain_3"},{display:"tmain_4"},{display:"tmain_5"},{display:"tmain_6"},{display:"tmain_7"},{display:"imain_1"},{display:"imain_2"},{display:"imain_3"}],\
                                    d_imain_1: {\
                                        transformation:{\
                                            scale:[0.0f,0.0f,0.0f],\
                                            translation:[0.0f,0.0f,-0.15f],\
                                            left_rotation:[0.0f,0.0f,1.0f,0.0f]\
                                        },\
                                        view_range: 0.01,\
                                        interpolation_duration: 2,\
                                        start_interpolation: 0,\
                                        billboard: center \
                                    },\
                                    d_imain_2: {\
                                        transformation:{\
                                            scale:[0.0f,0.0f,0.0f],\
                                            translation:[0.0f,0.0f,-0.15f],\
                                            left_rotation:[0.0f,0.0f,1.0f,0.0f]\
                                        },\
                                        view_range: 0.01,\
                                        interpolation_duration: 2,\
                                        start_interpolation: 0,\
                                        billboard: center \
                                    },\
                                    d_imain_3: {\
                                        transformation:{\
                                            scale:[0.0f,0.0f,0.0f],\
                                            translation:[0.0f,0.0f,-0.15f],\
                                            left_rotation:[0.0f,0.0f,1.0f,0.0f]\
                                        },\
                                        view_range: 0.01,\
                                        interpolation_duration: 2,\
                                        start_interpolation: 0,\
                                        billboard: center \
                                    },\
                                    d_tmain_1: {\
                                        transformation:{\
                                            scale:[0.0f,0.0f,0.0f],\
                                            translation:[0.0f,0.0f,-0.15f]\
                                        },\
                                        view_range: 0.01,\
                                        interpolation_duration: 2,\
                                        start_interpolation: 0,\
                                        billboard: center \
                                    },\
                                    d_tmain_2: {\
                                        transformation:{\
                                            scale:[0.0f,0.0f,0.0f],\
                                            translation:[0.0f,-0.05f,-0.15f]\
                                        },\
                                        view_range: 0.01,\
                                        interpolation_duration: 2,\
                                        start_interpolation: 0,\
                                        billboard: center \
                                    },\
                                    d_tmain_3: {\
                                        transformation:{\
                                            scale:[0.0f,0.0f,0.0f],\
                                            translation:[0.0f,-0.05f,-0.15f]\
                                        },\
                                        view_range: 0.01,\
                                        interpolation_duration: 2,\
                                        start_interpolation: 0,\
                                        billboard: center \
                                    },\
                                    d_tmain_4: {\
                                        transformation:{\
                                            scale:[0.0f,0.0f,0.0f],\
                                            translation:[0.0f,-0.05f,-0.15f]\
                                        },\
                                        view_range: 0.01,\
                                        interpolation_duration: 2,\
                                        start_interpolation: 0,\
                                        billboard: center \
                                    },\
                                    d_tmain_5: {\
                                        transformation:{\
                                            scale:[0.0f,0.0f,0.0f],\
                                            translation:[0.0f,-0.05f,-0.15f]\
                                        },\
                                        view_range: 0.01,\
                                        interpolation_duration: 2,\
                                        start_interpolation: 0,\
                                        billboard: center \
                                    },\
                                    d_tmain_6: {\
                                        transformation:{\
                                            scale:[0.0f,0.0f,0.0f],\
                                            translation:[0.0f,-0.05f,-0.15f]\
                                        },\
                                        view_range: 0.01,\
                                        interpolation_duration: 2,\
                                        start_interpolation: 0,\
                                        billboard: center \
                                    },\
                                    d_tmain_7: {\
                                        transformation:{\
                                            scale:[0.0f,0.0f,0.0f],\
                                            translation:[0.0f,-0.05f,-0.15f]\
                                        },\
                                        view_range: 0.01,\
                                        interpolation_duration: 2,\
                                        start_interpolation: 0,\
                                        billboard: center \
                                    }\
    }

##

## MAIN/
    data modify storage l.menu:-677 1 set value {\
                                    t_in: {\
                                        function:"zl.main_menu:menu/anim_specific {target:101}",\
                                        main: -677,\
                                        secondary: 0 \
                                    },\
                                    t_left: {\
                                        main: -677, \
                                        secondary: 2 \
                                    },\
                                    t_right: {\
                                        main: -677, \
                                        secondary: 3 \
                                    },\
                                    d_list:[{display:"tmain_1"},{display:"tmain_2"},{display:"tmain_3"},{display:"imain_1"},{display:"imain_2"},{display:"imain_3"}],\
                                    d_imain_1: {\
                                        item:{id:"minecraft:grass_block"},\
                                        transformation:{\
                                            scale:[0.06f,0.06f,0.06f],\
                                            translation:[0.0f,0.04f,-0.15f],\
                                            left_rotation:[0.2f,0.0f,0.0f,1.0f]\
                                        },\
                                        interpolation_duration: 4,\
                                        start_interpolation: 0 \
                                    },\
                                    d_imain_2: {\
                                        item:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-200804845,1379617583,-2022526449,577512640],properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOWE5YTdmMDdkYTliZGEyODBiMGY5MDliNDk1ZWJjOWZiMWFlZTM1NTJjYjE3ZTM5YmExYjRjOTZkMDJhMjBjYSJ9fX0="}]}}},\
                                        transformation:{\
                                            scale:[0.06f,0.06f,0.06f],\
                                            translation:[-0.1f,0.04f,-0.15f],\
                                            left_rotation:[0.2f,-1.0f,0.0f,1.0f]\
                                        },\
                                        interpolation_duration: 4,\
                                        start_interpolation: 0 \
                                    },\
                                    d_imain_3: {\
                                    item:{id:"minecraft:heavy_core"},\
                                        transformation:{\
                                            scale:[0.06f,0.06f,0.06f],\
                                            translation:[0.1f,0.04f,-0.15f],\
                                            left_rotation:[0.2f,0.5f,0.0f,1.0f]\
                                        },\
                                        interpolation_duration: 4,\
                                        start_interpolation: 0 \
                                    },\
                                    d_tmain_1: {\
                                        text:[{translate:"[%s] ",color:"#33ddff",with:[{keybind:"key.jump",color:"#ddddff"}]},{translate:"leinad.menu.main.games",color:"#eeeeff",fallback:"to select a game"}],\
                                        transformation:{\
                                            scale:[0.04f,0.04f,0.04f],\
                                            translation:[0.0f,-0.015f,-0.15f]\
                                        },\
                                        background: 0,\
                                        shadow: true,\
                                        interpolation_duration: 3,\
                                        start_interpolation: 0 \
                                    },\
                                    d_tmain_2: {\
                                        text:[{translate:"leinad.menu.main.social_off",fallback:"Social"}],\
                                        transformation:{\
                                            scale:[0.04f,0.04f,0.04f],\
                                            translation:[-0.1f,-0.01f,-0.15f]\
                                        },\
                                        background: 0,\
                                        shadow: true,\
                                        interpolation_duration: 3,\
                                        start_interpolation: 0 \
                                    },\
                                    d_tmain_3: {\
                                        text:[{translate:"leinad.menu.main.settings_off",fallback:"Settings"}],\
                                        transformation:{\
                                            scale:[0.04f,0.04f,0.04f],\
                                            translation:[0.1f,-0.01f,-0.15f]\
                                        },\
                                        background: 0,\
                                        shadow: true,\
                                        interpolation_duration: 3,\
                                        start_interpolation: 0 \
                                    }\
    }

    data modify storage l.menu:-677 2 set value {\
                                    t_in: {\
                                        main: -677,\
                                        secondary: 200, \
                                    },\
                                    t_right: {\
                                        main: -677, \
                                        secondary: 1 \
                                    },\
                                    d_list:[{display:"tmain_1"},{display:"tmain_2"},{display:"tmain_3"},{display:"imain_1"},{display:"imain_2"},{display:"imain_3"}],\
                                    d_imain_1: {\
                                        transformation:{\
                                            scale:[0.04f,0.04f,0.04f],\
                                            translation:[0.0f,0.04f,-0.15f],\
                                            left_rotation:[0.2f,0.5f,0.0f,1.0f]\
                                        },\
                                        interpolation_duration: 4,\
                                        start_interpolation: 0 \
                                    },\
                                    d_imain_2: {\
                                        transformation:{\
                                            scale:[0.08f,0.08f,0.08f],\
                                            translation:[-0.1f,0.04f,-0.15f],\
                                            left_rotation:[0.2f,-1.2f,0.0f,1.0f]\
                                        },\
                                        interpolation_duration: 4,\
                                        start_interpolation: 0 \
                                    },\
                                    d_imain_3: {\
                                        transformation:{\
                                            scale:[0.04f,0.04f,0.04f],\
                                            translation:[0.1f,0.04f,-0.15f],\
                                            left_rotation:[0.2f,0.3f,0.0f,1.0f]\
                                        },\
                                        interpolation_duration: 4,\
                                        start_interpolation: 0 \
                                    },\
                                    d_tmain_1: {\
                                        text:[{translate:"leinad.menu.main.games_off",fallback:"Games"}],\
                                        transformation:{\
                                            scale:[0.04f,0.04f,0.04f],\
                                            translation:[0.0f,-0.01f,-0.15f]\
                                        },\
                                        background: 0,\
                                        shadow: true,\
                                        interpolation_duration: 3,\
                                        start_interpolation: 0 \
                                    },\
                                    d_tmain_2: {\
                                        text:[{translate:"[%s] ",color:"#33ddff",with:[{keybind:"key.jump",color:"#ddddff"}]},{translate:"leinad.menu.main.games",color:"#eeeeff",fallback:"to open the social menu",with:[{keybind:"key.jump"}]}],\
                                        transformation:{\
                                            scale:[0.04f,0.04f,0.04f],\
                                            translation:[-0.1f,-0.015f,-0.15f]\
                                        },\
                                        background: 0,\
                                        shadow: true,\
                                        interpolation_duration: 3,\
                                        start_interpolation: 0 \
                                    },\
                                    d_tmain_3: {\
                                        text:[{translate:"leinad.menu.main.settings_off",fallback:"Settings"}],\
                                        transformation:{\
                                            scale:[0.04f,0.04f,0.04f],\
                                            translation:[0.1f,0.0f,-0.15f]\
                                        },\
                                        background: 0,\
                                        shadow: true,\
                                        interpolation_duration: 3,\
                                        start_interpolation: 0 \
                                    }\
    }

    data modify storage l.menu:-677 3 set value {\
                                    t_in: {\
                                        main: -677,\
                                        secondary: 300, \
                                    },\
                                    t_left: {\
                                        main: -677, \
                                        secondary: 1 \
                                    },\
                                    d_list:[{display:"tmain_1"},{display:"tmain_2"},{display:"tmain_3"},{display:"imain_1"},{display:"imain_2"},{display:"imain_3"}],\
                                    d_imain_1: {\
                                        transformation:{\
                                            scale:[0.04f,0.04f,0.04f],\
                                            translation:[0.0f,0.04f,-0.15f],\
                                            left_rotation:[0.2f,-0.5f,0.0f,1.0f]\
                                        },\
                                        interpolation_duration: 4,\
                                        start_interpolation: 0 \
                                    },\
                                    d_imain_2: {\
                                        transformation:{\
                                            scale:[0.04f,0.04f,0.04f],\
                                            translation:[-0.1f,0.04f,-0.15f],\
                                            left_rotation:[0.2f,-0.8f,0.0f,1.0f]\
                                        },\
                                        interpolation_duration: 4,\
                                        start_interpolation: 0 \
                                    },\
                                    d_imain_3: {\
                                        transformation:{\
                                            scale:[0.08f,0.08f,0.08f],\
                                            translation:[0.1f,0.04f,-0.15f],\
                                            left_rotation:[0.2f,0.7f,0.0f,1.0f]\
                                        },\
                                        interpolation_duration: 4,\
                                        start_interpolation: 0 \
                                    },\
                                    d_tmain_1: {\
                                        text:[{translate:"leinad.menu.main.games_off",fallback:"Games"}],\
                                        transformation:{\
                                            scale:[0.04f,0.04f,0.04f],\
                                            translation:[0.0f,-0.01f,-0.15f]\
                                        },\
                                        background: 0,\
                                        shadow: true,\
                                        interpolation_duration: 3,\
                                        start_interpolation: 0 \
                                    },\
                                    d_tmain_2: {\
                                        text:[{translate:"leinad.menu.main.social_off",fallback:"Social"}],\
                                        transformation:{\
                                            scale:[0.04f,0.04f,0.04f],\
                                            translation:[-0.1f,0.0f,-0.15f]\
                                        },\
                                        background: 0,\
                                        shadow: true,\
                                        interpolation_duration: 3,\
                                        start_interpolation: 0 \
                                    },\
                                    d_tmain_3: {\
                                        text:[{translate:"[%s] ",color:"#33ddff",with:[{keybind:"key.jump",color:"#ddddff"}]},{translate:"leinad.menu.main.settings",color:"#eeeeff",fallback:"to open the settings",with:[{keybind:"key.jump"}]}],\
                                        transformation:{\
                                            scale:[0.04f,0.04f,0.04f],\
                                            translation:[0.1f,-0.015f,-0.15f]\
                                        },\
                                        background: 0,\
                                        shadow: true,\
                                        interpolation_duration: 3,\
                                        start_interpolation: 0 \
                                    }\
    }

##

## MAIN/GAMES/
    data modify storage l.menu:-677 101 set value {\
                                    t_in: {\
                                        function: "zl.main_menu:send_to {mode:\"survival\"}",\
                                    },\
                                    t_back: {\
                                        function:"zl.main_menu:menu/anim_specific {target:1}",\
                                        main: -677,\
                                        secondary: 0\
                                    },\
                                    d_list:[{display:"tmain_1"},{display:"tmain_2"},{display:"tmain_3"},{display:"tmain_4"},{display:"tmain_5"}],\
                                    d_tmain_1: {\
                                        text:[{text:"> ",color:"#33ddff"},{translate:"leinad.menu.main.games.all",fallback:"All modes",color:"#ddddff"},{text:" <",color:"#33ddff"}],\
                                        transformation:{\
                                            scale:[0.04f,0.04f,0.04f],\
                                            translation:[-0.12f,0.01f,-0.15f]\
                                        },\
                                        background: 0,\
                                        shadow: true,\
                                        interpolation_duration: 3,\
                                        start_interpolation: 0 \
                                    },\
                                    d_tmain_2: {\
                                        text:[{translate:"leinad.menu.main.games.favorites",fallback:"Favorites"}],\
                                        transformation:{\
                                            scale:[0.04f,0.04f,0.04f],\
                                            translation:[-0.12f,-0.01f,-0.15f]\
                                        },\
                                        background: 0,\
                                        shadow: true,\
                                        interpolation_duration: 3,\
                                        start_interpolation: 0 \
                                    },\
                                    d_tmain_3: {\
                                        text:[{translate:"leinad.menu.main.games.recents",fallback:"Recently played"}],\
                                        transformation:{\
                                            scale:[0.04f,0.04f,0.04f],\
                                            translation:[-0.12f,-0.03f,-0.15f]\
                                        },\
                                        background: 0,\
                                        shadow: true,\
                                        interpolation_duration: 3,\
                                        start_interpolation: 0 \
                                    },\
                                    d_tmain_4: {\
                                        text:[{sprite:"minecraft:block/grass_block_side"}],\
                                        transformation:{\
                                            scale:[0.3f,0.3f,0.3f],\
                                            translation:[0.0f,0.00f,-0.15f]\
                                        },\
                                        background: 0,\
                                        shadow: true,\
                                        Glowing:true,\
                                        interpolation_duration: 3,\
                                        start_interpolation: 0 \
                                    },\
                                    d_tmain_5: {\
                                        text:[{translate:"[%s] ",color:"#33ddff",with:[{keybind:"key.jump",color:"#ddddff"}]},{translate:"leinad.menu.main.games.play",color:"#eeeeff",fallback:"to play"}],\
                                        transformation:{\
                                            scale:[0.04f,0.04f,0.04f],\
                                            translation:[0.0f,-0.02f,-0.15f]\
                                        },\
                                        background: 0,\
                                        shadow: true,\
                                        Glowing:true,\
                                        interpolation_duration: 3,\
                                        start_interpolation: 0 \
                                    }\
    }

##
