ScootsSpeedrun = {
    ['version'] = '2.2.0',
    ['title'] = 'ScootsSpeedrun',
    ['debug'] = false,
    ['frames'] = {
        ['events'] = CreateFrame('Frame', 'ScootsSpeedrun-Events', UIParent),
    },
    ['action'] = {},
    ['condition'] = {},
    ['map'] = {
        -- ['zoneId'] = { ['npcId'] = { ... } }
        -- WotLK raids
        [4812] = { -- Icecrown Citadel
            [38995] = { -- Highlord Tirion Fordring
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [36948] = { -- Muradin Bronzebeard (Rampart of Skulls)
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [36939] = { -- High overlaud Saurfang (Rampart of Skulls)
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [37187] = { -- Muradin Bronzebeard / High overlaud Saurfang (Deathbringer's Rise)
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [37184] = { -- Zafod Boombox
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
        },
        [4722] = { -- Trial of the Crusader
            [34816] = { -- Barrett Ramsey
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
        },
        [4273] = { -- Ulduar
            [33210] = { -- Expedition Commander
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [33686] = { -- Lore Keeper of Norgannon
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
        },
        
        -- WotLK dungeons
        [4264] = { -- Halls of Stone
            [28070] = { -- Brann Bronzebeard
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 13207, -- Halls of Stone
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 13207, -- Halls of Stone
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 13207, -- Halls of Stone
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-handin-ready',
                            ['data'] = 13207, -- Halls of Stone
                        },
                    },
                },
                {
                    ['action'] = 'select-attuneable-reward',
                },
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        {
                            ['type'] = 'completeable-quest-count',
                            ['data'] = 0,
                        },
                    },
                },
            },
        },
        [4723] = { -- Trial of the Champion
            [35004] = { -- Arelas Brightstar / Jaeren Sunsworn
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 2,
                },
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
        },
        [4100] = { -- The Culling of Stratholme
            [26527] = { -- Chromie (start)
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 13149, -- Dispelling Illusions
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 13149, -- Dispelling Illusions
                },
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 3,
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-complete',
                            ['data'] = 13149, -- Dispelling Illusions
                        },
                    },
                },
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 2,
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-complete',
                            ['data'] = 13149, -- Dispelling Illusions
                        },
                    },
                },
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
                {
                    ['action'] = 'close-gossip',
                },
            },
            [27915] = { -- Chromie (middle)
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 13149, -- Dispelling Illusions
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-handin-ready',
                            ['data'] = 13149, -- Dispelling Illusions
                        },
                    },
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 13149, -- Dispelling Illusions
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 13151, -- A Royal Escort
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 13151, -- A Royal Escort
                },
            },
            [26499] = { -- Arthas
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [30997] = { -- Chromie (end)
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 13151, -- A Royal Escort
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-handin-ready',
                            ['data'] = 13151, -- A Royal Escort
                        },
                    },
                },
                {
                    ['action'] = 'select-attuneable-reward',
                },
            },
        },
        [4228] = { -- The Oculus
            [27657] = { -- Verdisa
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 2,
                    ['conditions'] = {
                        {
                            ['type'] = 'gossip-choice-count',
                            ['data'] = 3,
                        },
                    },
                },
            },
            [27658] = { -- Belgaristrasz
                -- TODO: Quests
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        {
                            ['type'] = 'gossip-choice-count',
                            ['data'] = 2,
                        },
                        {
                            ['type'] = 'available-quest-count',
                            ['data'] = 0
                        },
                        {
                            ['type'] = 'active-quest-count',
                            ['data'] = 0
                        },
                    },
                },
            },
            [27659] = { -- Eternos
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 2,
                    ['conditions'] = {
                        {
                            ['type'] = 'gossip-choice-count',
                            ['data'] = 3,
                        },
                    },
                },
            },
        },
        [4415] = { -- The Violet Hold
            [30658] = { -- Lieutenant Sinclari
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 2,
                    ['conditions'] = {
                        {
                            ['type'] = 'gossip-choice-count',
                            ['data'] = 2,
                        },
                    },
                },
            },
        },
        [4809] = { -- The Forge of Souls
            [37596] = { -- Lady Jaina Proudmoore / Lady Sylvanas Windrunner (start)
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 24510, -- Inside the Frozen Citadel
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 24510, -- Inside the Frozen Citadel
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 24506, -- Inside the Frozen Citadel
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 24506, -- Inside the Frozen Citadel
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 24499, -- Echoes of Tortured Souls
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 24499, -- Echoes of Tortured Souls
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 24499, -- Echoes of Tortured Souls
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-handin-ready',
                            ['data'] = 24499, -- Echoes of Tortured Souls
                        },
                    },
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 24499, -- Echoes of Tortured Souls
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 24511, -- Echoes of Tortured Souls
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 24511, -- Echoes of Tortured Souls
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 24511, -- Echoes of Tortured Souls
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-handin-ready',
                            ['data'] = 24511, -- Echoes of Tortured Souls
                        },
                    },
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 24511, -- Echoes of Tortured Souls
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 24683, -- The Pit of Saron
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 24682, -- The Pit of Saron
                },
            },
            [38161] = { -- Lady Jaina Proudmoore / Lady Sylvanas Windrunner (end)
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 24499, -- Echoes of Tortured Souls
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 24511, -- Echoes of Tortured Souls
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 24683, -- The Pit of Saron
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 24682, -- The Pit of Saron
                },
            },
        },
        [4813] = { -- The Pit of Saron
            [36990] = { -- Lady Jaina Proudmoore / Lady Sylvanas Windrunner (start)
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 24683, -- The Pit of Saron
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 24682, -- The Pit of Saron
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 24498, -- The Path to the Citadel
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 24507, -- The Path to the Citadel
                },
            },
            [37592] = { -- Martin Victus / Goruk Ironskull
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 24498, -- The Path to the Citadel
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 24507, -- The Path to the Citadel
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 24710, -- Deliverance from the Pit
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 24712, -- Deliverance from the Pit
                },
            },
            [38189] = { -- Lady Jaina Proudmoore / Lady Sylvanas Windrunner (end)
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 24710, -- Deliverance from the Pit
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 24712, -- Deliverance from the Pit
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 24711, -- Frostmourne
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 24713, -- Frostmourne
                },
            },
        },
        [4820] = { -- Halls of Reflection
            [37223] = { -- Lady Jaina Proudmoore / Lady Sylvanas Windrunner (start)
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 24711, -- Frostmourne
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 24713, -- Frostmourne
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 24711, -- Frostmourne
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 24713, -- Frostmourne
                },
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 2,
                },
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-complete-any',
                            ['data'] = {24711, 24713}, -- Frostmourne
                        },
                    },
                },
            },
            [37779] = { -- Archmage Koreln / Dark Ranger Loralen
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 24500, -- Wrath of the Lich King
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 24802, -- Wrath of the Lich King
                },
            },
            [37554] = { -- Lady Jaina Proudmoore / Lady Sylvanas Windrunner (end)
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 24500, -- Wrath of the Lich King
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 24802, -- Wrath of the Lich King
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 24500, -- Wrath of the Lich King
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 24802, -- Wrath of the Lich King
                },
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        {
                            ['type'] = 'active-quest-count',
                            ['data'] = 0
                        },
                    },
                },
            },
        },
        
        -- TBC raids
        [3959] = { -- Black Temple
            [23411] = { -- Spirit of Olum
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        {
                            ['type'] = 'gossip-choice-count',
                            ['data'] = 1,
                        },
                    },
                },
            },
            [23191] = { -- Akama (Shade of Akama)
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [23089] = { -- Akama (Chamber of Command)
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
        },
        [3606] = { -- Hyjal Summit
            [17772] = { -- Lady Jaina Proudmoore
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [17852] = { -- Thrall
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [17948] = { -- Tyrande Whisperwind
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
        },
        [3805] = { -- Zul'Aman
            [24358] = { -- Harrison Jones
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [23999] = { -- Harkor
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [23790] = { -- Tanzar
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [24001] = { -- Ashli
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [24024] = { -- Kraz
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
        },
        [3457] = { -- Karazhan
            [16153] = { -- Berthold
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 4,
                },
            },
            [16812] = { -- Barnes
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [17603] = { -- Grandmother
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [16816] = { -- Shade of Medivh
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [17211] = { -- Human Footman
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [21160] = { -- Conjured Water Elemental
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [21664] = { -- Human Charger
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [21682] = { -- Human Cleric
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [21683] = { -- Human Conjurer
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [21684] = { -- King Llane
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [17489] = { -- Orc Grunt
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [21726] = { -- Summoned Daemon
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [21748] = { -- Orc Wolf
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [21747] = { -- Orc Necrolyte
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [21750] = { -- Orc Warlock
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [21752] = { -- Warchief Blackhand
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
        },
        
        -- TBC dungeons
        [2367] = { -- Old Hillsbrad Foothills
            [18723] = { -- Erozion
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 10282, -- Old Hillsbrad
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 10282, -- Old Hillsbrad
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 10283, -- Taretha's Diversion
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 10283, -- Taretha's Diversion
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 10285, -- Return to Andormu
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 10285, -- Return to Andormu
                },
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
                {
                    ['action'] = 'close-gossip',
                },
            },
            [18725] = { -- Brazen
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [17876] = { -- Thrall
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 10283, -- Taretha's Diversion
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-handin-ready',
                            ['data'] = 10283, -- Taretha's Diversion
                        },
                    },
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 10283, -- Taretha's Diversion
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 10284, -- Escape from Durnholde
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 10284, -- Escape from Durnholde
                },
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
        },
        [3717] = { -- Slave Pens
            [17893] = { -- Naturalist Bite
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
        },
        
        -- Vanilla raids
        [2677] = { -- Blackwing Lair
            [13020] = { -- Vaelastrasz the Corrupt
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [10162] = { -- Lord Victor Nefarius
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
        },
        [2717] = { -- The Molten Core
            [12018] = { -- Majordomo Executus
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
        },
        [3429] = { -- Ruins of Ahn'Qiraj
            [15471] = { -- Lieutenant General Andorov
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
        },
        
        -- Vanilla dungeons
        [2557] = { -- Dire Maul
            [48413] = { -- Broken trap
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 1193, -- A Broken Trap
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 1193, -- A Broken Trap
                },
            },
            [14338] = { -- Knot Thimblejack
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 5525, -- Free Knot!
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 5525, -- Free Knot!
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 5525, -- Free Knot!
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 5525, -- Free Knot!
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 7429, -- Free Knot! (repeatable)
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 7429, -- Free Knot! (repeatable)
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 7429, -- Free Knot! (repeatable)
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 7429, -- Free Knot! (repeatable)
                },
            },
            [14353] = { -- Mizzle the Crafty
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [14325] = { -- Captain Kromcrush
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
--            [14354] = { -- Pusillin
--                {
--                    ['action'] = 'dialogue-select',
--                    ['data'] = 1,
--                },
--            },
            [14241] = { -- Ironbark the Redeemed
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
        },
        [1584] = { -- Blackrock Depths
            [9543] = { -- Ribbly Screwspigot
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [9499] = { -- Plugger Spazzring
                {
                    ['action'] = 'purchase-item-to-count',
                    ['data'] = {
                        ['item'] = 11325, -- Dark Iron Ale Mug
                        ['count'] = 6,
                    },
                },
            },
            [9503] = { -- Private Rocknot
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 4295,
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 4295,
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 4295,
                },
            },
            [9039] = { -- Doom'rel
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
        },
        [1176] = { -- Zul'Farrak
            [7607] = { -- Weegil Blastfuse
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [7604] = { -- Sergeant Bly
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
        },
        [722] = { -- Razorfen Downs
            [8516] = { -- Belnistrasz
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 3523, -- Scourge of the Downs
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 3523, -- Scourge of the Downs
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 3525, -- Extinguishing the Idol
                },
            },
            [21025] = { -- Belnistrasz's Brazier
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 3525, -- Extinguishing the Idol
                },
            },
        },
        [721] = { -- Gnomeregan
            [7998] = { -- Blastmaster Emi Shortfuse
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [44013] = { -- The Sparklematic 5000 (north)
                {
                    ['action'] = 'use-item',
                    ['data'] = 9363, -- Sparklematic-Wrapped Box
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 4604, -- More Sparklematic Action
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 4604, -- More Sparklematic Action
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 4604, -- More Sparklematic Action
                },
                {
                    ['action'] = 'auto-confirm',
                    ['data'] = 'CONFIRM_COMPLETE_EXPENSIVE_QUEST',
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 4602, -- The Sparklematic 5200!
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 4602, -- The Sparklematic 5200!
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 4602, -- The Sparklematic 5200!
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 4606, -- The Sparklematic 5200!
                },
            },
            [11415] = { -- The Sparklematic 5000 (east)
                {
                    ['action'] = 'use-item',
                    ['data'] = 9363, -- Sparklematic-Wrapped Box
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 2953, -- More Sparklematic Action
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 2953, -- More Sparklematic Action
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 2953, -- More Sparklematic Action
                },
                {
                    ['action'] = 'auto-confirm',
                    ['data'] = 'CONFIRM_COMPLETE_EXPENSIVE_QUEST',
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 2951, -- The Sparklematic 5200!
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 2951, -- The Sparklematic 5200!
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 2951, -- The Sparklematic 5200!
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 2952, -- The Sparklematic 5200!
                },
            },
            [44012] = { -- The Sparklematic 5000 (south-west)
                {
                    ['action'] = 'use-item',
                    ['data'] = 9363, -- Sparklematic-Wrapped Box
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 4603, -- More Sparklematic Action
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 4603, -- More Sparklematic Action
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 4603, -- More Sparklematic Action
                },
                {
                    ['action'] = 'auto-confirm',
                    ['data'] = 'CONFIRM_COMPLETE_EXPENSIVE_QUEST',
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 4601, -- The Sparklematic 5200!
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 4601, -- The Sparklematic 5200!
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 4601, -- The Sparklematic 5200!
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 4605, -- The Sparklematic 5200!
                },
            },
        },
        [209] = { -- Shadowfang Keep
            [3850] = { -- Sorcerer Ashcrombe
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [3850] = { -- Deathstalker Adamant
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
        },
        [718] = { -- The Wailing Caverns
            [3678] = { -- Disciple of Naralex
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
        },
        
        -- Open World
        [25] = { -- Blackrock Mountain
            [48807] = { -- Orb of Command
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                }
            },
            [14387] = { -- Lothos Riftwalker
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        {
                            ['type'] = 'available-quest-count',
                            ['data'] = 0,
                        },
                        {
                            ['type'] = 'active-quest-count',
                            ['data'] = 0,
                        },
                    },
                }
            },
        },
        [4] = { -- Blasted Lands
            [7363] = { -- Kum'isha the Collector
                {
                    ['action'] = 'use-item',
                    ['data'] = 12122, -- Kum'isha's Junk
                },
                {
                    ['action'] = 'use-item',
                    ['data'] = 10752, -- Emerald Encrusted Chest
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 3501, -- Everything Counts In Large Amounts
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 10593, -- Imperfect Draenethyst Fragment
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 3501, -- Everything Counts In Large Amounts
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 10593, -- Imperfect Draenethyst Fragment
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 3501, -- Everything Counts In Large Amounts
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 10593, -- Imperfect Draenethyst Fragment
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 3501, -- Everything Counts In Large Amounts
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 3501, -- Everything Counts In Large Amounts
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 3502, -- One Draenei's Junk
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 10593, -- Imperfect Draenethyst Fragment
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 3502, -- One Draenei's Junk
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 10593, -- Imperfect Draenethyst Fragment
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 3502, -- One Draenei's Junk
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 10593, -- Imperfect Draenethyst Fragment
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 3502, -- One Draenei's Junk
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 3502, -- One Draenei's Junk
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 2521, -- To Serve Kum'isha
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 8244, -- Flawless Draenethyst Sphere
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 2521, -- To Serve Kum'isha
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 8244, -- Flawless Draenethyst Sphere
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 2521, -- To Serve Kum'isha
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 8244, -- Flawless Draenethyst Sphere
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 2521, -- To Serve Kum'isha
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 2521, -- To Serve Kum'isha
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 2522, -- Kum'isha's Endeavors
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 8244, -- Flawless Draenethyst Sphere
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 2522, -- Kum'isha's Endeavors
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 8244, -- Flawless Draenethyst Sphere
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 2522, -- Kum'isha's Endeavors
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 8244, -- Flawless Draenethyst Sphere
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 2522, -- Kum'isha's Endeavors
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 2522, -- Kum'isha's Endeavors
                },
            },
        },
        [4395] = { -- Dalaran
            [37776] = { -- Apprentice Nelphi
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 24510, -- Inside the Frozen Citadel
                },
            },
            [37780] = { -- Dark Ranger Vorel
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 24506, -- Inside the Frozen Citadel
                },
            },
            [28742] = { -- Marcia Chase
                {
                    ['action'] = 'use-item',
                    ['data'] = 46007, -- Bag of Fishing Treasures
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 13836, -- Disarmed!
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 13836, -- Disarmed!
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 13832, -- Jewel Of The Sewers
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 13832, -- Jewel Of The Sewers
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 13832, -- Jewel Of The Sewers
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-handin-ready',
                            ['data'] = 13832, -- Jewel Of The Sewers
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 13832, -- Jewel Of The Sewers
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 13832, -- Jewel Of The Sewers
                },
            },
            [28706] = { -- Olisarra the Kind
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 13836, -- Disarmed!
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 13836, -- Disarmed!
                },
            },
            [32337] = { -- Christi Stockton
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 14203, -- Waterlogged Recipe
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 14203, -- Waterlogged Recipe
                },
            },
            [28701] = { -- Timothy Jones
                {
                    ['action'] = 'use-item',
                    ['data'] = 43297, -- Damaged necklace (quest starter)
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-not-in-log',
                            ['data'] = 13148, -- Necklace Repair
                        },
                        {
                            ['type'] = 'item-in-bags-and-resource-bank',
                            ['data'] = {
                                ['item'] = 36923, -- Chalcodeny
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 13148, -- Necklace Repair
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-handin-ready',
                            ['data'] = 13148, -- Necklace Repair
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 13148, -- Necklace Repair
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 13148, -- Necklace Repair
                },
            },
        },
        [1377] = { -- Silithus
            [15540] = { -- Windcaller Kaldon
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 8507, -- Field Duty
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 8507, -- Field Duty
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 8507, -- Field Duty
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-handin-ready',
                            ['data'] = 8507, -- Field Duty
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 8507, -- Field Duty
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 8731, -- Field Duty
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 8731, -- Field Duty
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 8731, -- Field Duty
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-handin-ready',
                            ['data'] = 8731, -- Field Duty
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 8731, -- Field Duty
                },
            },
            [15440] = { -- Captain Blackanvil
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 8508, -- Field Duty Papers
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 23024, -- Prepared Field Duty Papers
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 8508, -- Field Duty Papers
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 8508, -- Field Duty Papers
                },
            },
            [15612] = { -- Krug Skullsplit
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 8732, -- Field Duty Papers
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 23024, -- Prepared Field Duty Papers
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 8732, -- Field Duty Papers
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 8732, -- Field Duty Papers
                },
            },
            [15611] = { -- Cenarion Scout Jalia
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [15610] = { -- Cenarion Scout Azenel
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [15609] = { -- Cenarion Scout Landion
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [15282] = { -- Aurel Goldleaf
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 8333, -- Medallion of Station
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 20513, -- Abyssal Crest
                                ['count'] = 3,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 8333, -- Medallion of Station
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 8333, -- Medallion of Station
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-handin-ready',
                            ['data'] = 8333, -- Medallion of Station
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 8333, -- Medallion of Station
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 8333, -- Medallion of Station
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 8342, -- Twilight Ring of Lordship
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 20514, -- Abyssal Signet
                                ['count'] = 3,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 8342, -- Twilight Ring of Lordship
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 8342, -- Twilight Ring of Lordship
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-handin-ready',
                            ['data'] = 8342, -- Twilight Ring of Lordship
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 8342, -- Twilight Ring of Lordship
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 8342, -- Twilight Ring of Lordship
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 8332, -- Dukes of the Council
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 8332, -- Dukes of the Council
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 8332, -- Dukes of the Council
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-handin-ready',
                            ['data'] = 8332, -- Dukes of the Council
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 8332, -- Dukes of the Council
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 8332, -- Dukes of the Council
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 8341, -- Lords of the Council
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 8341, -- Lords of the Council
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 8341, -- Lords of the Council
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-handin-ready',
                            ['data'] = 8341, -- Lords of the Council
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 8341, -- Lords of the Council
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 8341, -- Lords of the Council
                },
            },
            [49384] = { -- Lesser Wind Stone
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        ['type'] = 'gossip-choice-count',
                        ['data'] = 1,
                    },
                },
            },
            [49446] = { -- Lesser Wind Stone
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        ['type'] = 'gossip-choice-count',
                        ['data'] = 1,
                    },
                },
            },
            [49457] = { -- Lesser Wind Stone
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        ['type'] = 'gossip-choice-count',
                        ['data'] = 1,
                    },
                },
            },
            [49472] = { -- Lesser Wind Stone
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        ['type'] = 'gossip-choice-count',
                        ['data'] = 1,
                    },
                },
            },
            [49477] = { -- Lesser Wind Stone
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        ['type'] = 'gossip-choice-count',
                        ['data'] = 1,
                    },
                },
            },
            [49492] = { -- Lesser Wind Stone
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        ['type'] = 'gossip-choice-count',
                        ['data'] = 1,
                    },
                },
            },
            [49389] = { -- Wind Stone
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        ['type'] = 'gossip-choice-count',
                        ['data'] = 1,
                    },
                },
            },
            [49462] = { -- Wind Stone
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        ['type'] = 'gossip-choice-count',
                        ['data'] = 1,
                    },
                },
            },
            [49482] = { -- Wind Stone
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        ['type'] = 'gossip-choice-count',
                        ['data'] = 1,
                    },
                },
            },
            [49394] = { -- Greater Wind Stone
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        ['type'] = 'gossip-choice-count',
                        ['data'] = 1,
                    },
                },
            },
            [49467] = { -- Greater Wind Stone
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        ['type'] = 'gossip-choice-count',
                        ['data'] = 1,
                    },
                },
            },
            [49487] = { -- Greater Wind Stone
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        ['type'] = 'gossip-choice-count',
                        ['data'] = 1,
                    },
                },
            },
            [15306] = { -- Bor Wildmane
                {
                    ['action'] = 'use-item',
                    ['data'] = 20603, -- Bag of Spoils
                },
                {
                    ['action'] = 'use-item',
                    ['data'] = 20601, -- Sack of Spoils
                },
            },
            [15194] = { -- Hermit Ortell
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 8324, -- Still Believing
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 20404, -- Encrypted Twilight Text
                                ['count'] = 3,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 8324, -- Still Believing
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 8324, -- Still Believing
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 20404, -- Encrypted Twilight Text
                                ['count'] = 3,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 8324, -- Still Believing
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 8324, -- Still Believing
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 8323, -- True Believers
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 20404, -- Encrypted Twilight Text
                                ['count'] = 3,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 8323, -- True Believers
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 8323, -- True Believers
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 20404, -- Encrypted Twilight Text
                                ['count'] = 3,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 8323, -- True Believers
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 8323, -- True Believers
                },
            },
        },
        [33] = { -- Stranglethorn Vale
            [15078] = { -- Jang
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 8194, -- Apprentice Angler
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 19807, -- Speckled Tastyfish
                                ['count'] = 5,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 8194, -- Apprentice Angler
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 19807, -- Speckled Tastyfish
                                ['count'] = 5,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 8194, -- Apprentice Angler
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 8194, -- Apprentice Angler
                },
                {
                    ['action'] = 'do-nothing',
                },
            },
            [15079] = { -- Fishbot 5000
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 8225, -- Brownell's Blue Striped Racer
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 19803, -- Prepared Field Duty Papers
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 8225, -- Brownell's Blue Striped Racer
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 19803, -- Prepared Field Duty Papers
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 8225, -- Brownell's Blue Striped Racer
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 8221, -- Keefer's Angelfish
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 19805, -- Keefer's Angelfish
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 8221, -- Keefer's Angelfish
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 19805, -- Keefer's Angelfish
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 8221, -- Keefer's Angelfish
                },
                {
                    ['action'] = 'do-nothing',
                },
            },
        },
        [3519] = { -- Terokkar Forest
            [25580] = { -- Old Man Barlo
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 11666, -- Bait Bandits
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 11666, -- Bait Bandits
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 11666, -- Bait Bandits
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 11668, -- Shrimpin' Ain't Easy
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 11668, -- Shrimpin' Ain't Easy
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 11668, -- Shrimpin' Ain't Easy
                },
            },
            [23042] = { -- Severin
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 11006, -- More Shadow Dust
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 11006, -- More Shadow Dust
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 11006, -- More Shadow Dust
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 11004, -- World of Shadows
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 11004, -- World of Shadows
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 11004, -- World of Shadows
                },
            },
            [23306] = { -- Hazzik
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 11074, -- Tokens of the Descendants
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 32716, -- Gezzarak's Claw
                                ['count'] = 1,
                            },
                        },
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 32715, -- Akkarai's Talons
                                ['count'] = 1,
                            },
                        },
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 32717, -- Karrog's Spine
                                ['count'] = 1,
                            },
                        },
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 32718, -- Vakkiz's Scale
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 11074, -- Tokens of the Descendants
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 11074, -- Tokens of the Descendants
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 32716, -- Gezzarak's Claw
                                ['count'] = 1,
                            },
                        },
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 32715, -- Akkarai's Talons
                                ['count'] = 1,
                            },
                        },
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 32717, -- Karrog's Spine
                                ['count'] = 1,
                            },
                        },
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 32718, -- Vakkiz's Scale
                                ['count'] = 1,
                            },
                        },
                    },
                },
                {
                    ['action'] = 'progress-quest',
                    ['data'] = 11074, -- Tokens of the Descendants
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 11074, -- Tokens of the Descendants
                },
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 11885, -- Adversarial Blood
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 11885, -- Adversarial Blood
                },
                {
                    ['action'] = 'select-active-quest',
                    ['data'] = 11885, -- Adversarial Blood
                    ['conditions'] = {
                        {
                            ['type'] = 'quest-handin-ready',
                            ['data'] = 11885, -- Adversarial Blood,
                        },
                    },
                },
                {
                    ['action'] = 'complete-quest',
                    ['data'] = 11885, -- Adversarial Blood
                },
            },
            [54841] = { -- Skull Pile
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 32620, -- Time-Lost Scroll
                                ['count'] = 10,
                            },
                        },
                        {
                            ['type'] = 'own-fewest-in-set',
                            ['data'] = {
                                ['item'] = 32716, -- Gezzarak's Claw
                                ['set'] = {
                                    32716, -- Gezzarak's Claw
                                    32715, -- Akkarai's Talons
                                    32717, -- Karrog's Spine
                                    32718, -- Vakkiz's Scale
                                },
                            },
                        },
                    },
                },
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 2,
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 32620, -- Time-Lost Scroll
                                ['count'] = 10,
                            },
                        },
                        {
                            ['type'] = 'own-fewest-in-set',
                            ['data'] = {
                                ['item'] = 32715, -- Akkarai's Talons
                                ['set'] = {
                                    32716, -- Gezzarak's Claw
                                    32715, -- Akkarai's Talons
                                    32717, -- Karrog's Spine
                                    32718, -- Vakkiz's Scale
                                },
                            },
                        },
                    },
                },
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 3,
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 32620, -- Time-Lost Scroll
                                ['count'] = 10,
                            },
                        },
                        {
                            ['type'] = 'own-fewest-in-set',
                            ['data'] = {
                                ['item'] = 32717, -- Karrog's Spine
                                ['set'] = {
                                    32716, -- Gezzarak's Claw
                                    32715, -- Akkarai's Talons
                                    32717, -- Karrog's Spine
                                    32718, -- Vakkiz's Scale
                                },
                            },
                        },
                    },
                },
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 4,
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 32620, -- Time-Lost Scroll
                                ['count'] = 10,
                            },
                        },
                        {
                            ['type'] = 'own-fewest-in-set',
                            ['data'] = {
                                ['item'] = 32718, -- Vakkiz's Scale
                                ['set'] = {
                                    32716, -- Gezzarak's Claw
                                    32715, -- Akkarai's Talons
                                    32717, -- Karrog's Spine
                                    32718, -- Vakkiz's Scale
                                },
                            },
                        },
                    },
                },
                
            },
            [54856] = { -- Ancient Skull Pile
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 2,
                    ['conditions'] = {
                        {
                            ['type'] = 'item-in-bags',
                            ['data'] = {
                                ['item'] = 32720, -- Time-Lost Offering
                                ['count'] = 1,
                            },
                        },
                    },
                },
            },
        },
        [6035] = { -- Caverns of Time
            [20142] = { -- Steward of Time
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [20130] = { -- Andormu
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 10282, -- Old Hillsbrad
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 10282, -- Old Hillsbrad
                },
            },
        },
        [440] = { -- Tanaris
            [20142] = { -- Steward of Time
                {
                    ['action'] = 'dialogue-select',
                    ['data'] = 1,
                },
            },
            [20130] = { -- Andormu
                {
                    ['action'] = 'select-available-quest',
                    ['data'] = 10282, -- Old Hillsbrad
                },
                {
                    ['action'] = 'accept-quest',
                    ['data'] = 10282, -- Old Hillsbrad
                },
            },
        },
    },
    ['noNpcQuests'] = {
        {
            ['action'] = 'accept-quest',
            ['data'] = 13148, -- Necklace Repair
        },
        {
            ['action'] = 'accept-quest',
            ['data'] = 14203, -- Waterlogged Recipe
        },
    },
    ['questsFromTracker'] = {},
}

-- ########### --

ScootsSpeedrun.eventHandler = function(_, event)
    if(not Custom_GetGossipQuests or not CustomExtractItemId) then
        return nil
    end

    if(IsAltKeyDown()) then
        return nil
    end
    
    if(event == 'CONFIRM_XP_LOSS') then
        StaticPopup1Button1:Click()
        StaticPopup1Button1:Click()
        return nil
    end
    
    local npcGuid = UnitGUID('npc')
    if(npcGuid == nil) then
        npcGuid = UnitGUID('target')
    end
    
    local npcId = nil
    
    if(npcGuid) then
        npcId = tonumber(npcGuid:sub(9, 12), 16)
    end
    
    local locationId = Custom_GetCurrentZone()
    
    if(npcId and ScootsSpeedrun.debug) then
        local location = GetZoneText()
        
        local npc = UnitName('npc')
        if(npc == nil) then
            npc = UnitName('target')
        end
        
        ScootsSpeedrun.printDebug(event .. '\n' .. location .. ': ' .. locationId .. '\n' .. npc .. ': ' .. npcId)
    end
    
    if(event == 'GOSSIP_SHOW'
    or event == 'QUEST_GREETING'
    or event == 'QUEST_DETAIL'
    or event == 'QUEST_PROGRESS'
    or event == 'QUEST_COMPLETE'
    or event == 'MERCHANT_SHOW'
    or event == 'SCOOTSSPEEDRUN_POPUP_SHOW') then
        local actionPerformed = false
        ScootsSpeedrun.setCheck = nil
        
        if(npcId and ScootsSpeedrun.map[locationId] and ScootsSpeedrun.map[locationId][npcId]) then
            actionPerformed = ScootsSpeedrun.handleCharacterMap(event, ScootsSpeedrun.map[locationId][npcId])
        end
        
        if(actionPerformed == false) then
            ScootsSpeedrun.printDebug('Using noNpcQuests')
            actionPerformed = ScootsSpeedrun.handleCharacterMap(event, ScootsSpeedrun.noNpcQuests)
        end
        
        if(actionPerformed == false) then
            ScootsSpeedrun.printDebug('Calling buildMapFromTracker()')
            local map = ScootsSpeedrun.buildMapFromTracker(event)
            
            if(map == nil or #map == 0) then
                ScootsSpeedrun.printDebug('Calling buildMapFromHandinReadyQuests()')
                map = ScootsSpeedrun.buildMapFromHandinReadyQuests()
            end
            
            if(map ~= nil and #map > 0) then
                ScootsSpeedrun.handleCharacterMap(event, map)
            end
        end
    end
end

ScootsSpeedrun.printDebug = function(message, force)
    if(ScootsSpeedrun.debug or force) then
        print('\124cff' .. '98fb98' .. ScootsSpeedrun.title .. '\124r' .. ' DEBUG: \n' .. message)
    end
end

ScootsSpeedrun.printError = function(message)
    print('\124cff' .. '98fb98' .. ScootsSpeedrun.title .. '\124r' .. '\124cff' .. 'fc4903' .. ' ERROR: \n' .. message .. '\124r')
end

ScootsSpeedrun.buildMapFromTracker = function(event)
    if(event == 'QUEST_PROGRESS' or event == 'QUEST_COMPLETE') then
        local questId = Custom_GetGossipQuests(3)
        return {
            {
                ['action'] = 'progress-quest',
                ['data'] = questId,
            },
            {
                ['action'] = 'select-attuneable-reward-or-complete-quest',
                ['data'] = questId,
            },
        }
    elseif(event == 'QUEST_DETAIL') then
        local questId = Custom_GetGossipQuests(3)
        
        if(ScootsSpeedrun.questsFromTracker[questId] ~= true) then
            ScootsSpeedrun.updateTrackerQuestCache()
        end
        
        if(ScootsSpeedrun.questsFromTracker[questId] == true) then
            return {
                {
                    ['action'] = 'accept-quest',
                    ['data'] = questId,
                },
            }
        end
    elseif(event == 'GOSSIP_SHOW' or event == 'QUEST_GREETING') then
        local map = {}
        
        if(GetNumGossipAvailableQuests() > 0) then
            local availableQuests = Custom_GetGossipQuests(1)
            
            for questIndex = 1, #availableQuests do
                if(ScootsSpeedrun.questsFromTracker[availableQuests[questIndex]] ~= true) then
                    ScootsSpeedrun.updateTrackerQuestCache()
                    break
                end
            end
            
            for questIndex = 1, #availableQuests do
                if(ScootsSpeedrun.questsFromTracker[availableQuests[questIndex]] == true) then
                    table.insert(map, {
                        ['action'] = 'select-available-quest',
                        ['data'] = availableQuests[questIndex],
                    })
                end
            end
        end
            
        return map
    end
end

ScootsSpeedrun.buildMapFromHandinReadyQuests = function()
    if(GetNumGossipActiveQuests() > 0) then
        local activeQuests = Custom_GetGossipQuests(2)
        local map = {}
            
        for questIndex = 1, #activeQuests do
            table.insert(map, {
                ['action'] = 'select-active-quest',
                ['data'] = activeQuests[questIndex],
                ['conditions'] = {
                    {
                        ['type'] = 'quest-handin-ready',
                        ['data'] = activeQuests[questIndex],
                    },
                },
            })
        end
        
        return map
    end
end

ScootsSpeedrun.updateTrackerQuestCache = function()
    ScootsSpeedrun.questsFromTracker = {}
    
    local tracker = ItemHuntFrame and ItemHuntFrame.cele.objArr
    if(tracker) then
        for trackerIndex = 1, #tracker do
            local trackerObject = tracker[trackerIndex]
            
            if(trackerObject.objType and trackerObject.objType == 2 and trackerObject.objId and trackerObject.objId > 0) then
                ScootsSpeedrun.questsFromTracker[trackerObject.objId] = true
            end
        end
    end
end

ScootsSpeedrun.handleCharacterMap = function(event, map)
    local mapIndex
    for mapIndex = 1, #map do
        local basicConditionsMet = true
        
        if(map[mapIndex].action == 'dialogue-select') then
            if((event ~= 'GOSSIP_SHOW' and event ~= 'QUEST_GREETING') or GetNumGossipOptions() < map[mapIndex].data) then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'select-available-quest') then
            if((event ~= 'GOSSIP_SHOW' and event ~= 'QUEST_GREETING') or GetNumGossipAvailableQuests() == 0) then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'accept-quest') then
            if(event ~= 'QUEST_DETAIL') then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'select-active-quest') then
            if((event ~= 'GOSSIP_SHOW' and event ~= 'QUEST_GREETING') or GetNumGossipActiveQuests() == 0) then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'progress-quest') then
            if(event ~= 'QUEST_PROGRESS') then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'complete-quest') then
            if(event ~= 'QUEST_COMPLETE') then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'purchase-item-to-count') then
            if(event ~= 'MERCHANT_SHOW') then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'auto-confirm') then
            if(event ~= 'SCOOTSSPEEDRUN_POPUP_SHOW') then
                basicConditionsMet = false
            end
        end
        
        ScootsSpeedrun.printDebug('basic condition : ' .. map[mapIndex].action .. ' : ' .. tostring(basicConditionsMet))
        
        if(basicConditionsMet) then
            local conditionsMet = true
            
            if(map[mapIndex].conditions) then
                local conditionChecks = {
                    ['gossip-choice-count'] = ScootsSpeedrun.condition.gossipChoiceCount,
                    ['quest-handin-ready'] = ScootsSpeedrun.condition.questHandinReady,
                    ['quest-not-in-log'] = ScootsSpeedrun.condition.questNotInLog,
                    ['quest-complete'] = ScootsSpeedrun.condition.questComplete,
                    ['quest-complete-any'] = ScootsSpeedrun.condition.questCompleteAny,
                    ['available-quest-count'] = ScootsSpeedrun.condition.availableQuestCount,
                    ['active-quest-count'] = ScootsSpeedrun.condition.activeQuestCount,
                    ['completeable-quest-count'] = ScootsSpeedrun.condition.completableQuestCount,
                    ['item-in-bags'] = ScootsSpeedrun.condition.itemInBags,
                    ['item-not-in-bags'] = ScootsSpeedrun.condition.itemNotInBags,
                    ['own-fewest-in-set'] = ScootsSpeedrun.condition.ownFewestInSet,
                    ['item-in-bags-and-resource-bank'] = ScootsSpeedrun.condition.itemInBagsAndResourceBank,
                }
                
                local conditionIndex
                for conditionIndex = 1, #map[mapIndex].conditions do
                    local thisConditionMet = true
                    local conditionType = map[mapIndex].conditions[conditionIndex].type
                    local conditionData = map[mapIndex].conditions[conditionIndex].data
                
                    if(conditionChecks[conditionType] == nil) then
                        ScootsSpeedrun.printError('condition : ' .. conditionType .. ' : HANDLER MISSING')
                    else
                        if(conditionChecks[conditionType](conditionData) ~= true) then
                            thisConditionMet = false
                        end
                    
                        ScootsSpeedrun.printDebug('condition : ' .. conditionType .. '(' .. tostring(conditionData) .. ') : ' .. tostring(thisConditionMet))
                    
                        if(thisConditionMet == false) then
                            conditionsMet = false
                            
                            if(ScootsSpeedrun.debug ~= true) then
                                break
                            end
                        end
                    end
                end
            end
            
            if(conditionsMet) then
                local actions = {
                    ['dialogue-select'] = ScootsSpeedrun.action.dialogueSelect,
                    ['close-gossip'] = ScootsSpeedrun.action.closeGossip,
                    ['select-available-quest'] = ScootsSpeedrun.action.selectAvailableQuest,
                    ['select-attuneable-reward-or-complete-quest'] = ScootsSpeedrun.action.selectAttuneableRewardOrCompleteQuest,
                    ['accept-quest'] = ScootsSpeedrun.action.acceptQuest,
                    ['select-active-quest'] = ScootsSpeedrun.action.selectActiveQuest,
                    ['progress-quest'] = ScootsSpeedrun.action.progressQuest,
                    ['complete-quest'] = ScootsSpeedrun.action.completeQuest,
                    ['select-attuneable-reward'] = ScootsSpeedrun.action.selectAttuneableReward,
                    ['use-item'] = ScootsSpeedrun.action.useItemFromBag,
                    ['purchase-item-to-count'] = ScootsSpeedrun.action.purchaseItemUpToCount,
                    ['auto-confirm'] = ScootsSpeedrun.action.autoConfirm,
                    ['do-nothing'] = ScootsSpeedrun.action.doNothing,
                }
                
                local actionType = map[mapIndex].action
                local actionData = map[mapIndex].data
                local actionExecuted = false
                
                if(actions[actionType]) then
                    actionExecuted = actions[actionType](actionData)
                    ScootsSpeedrun.printDebug('action : ' .. actionType .. '(' .. tostring(actionData) .. ') : ' .. tostring(actionExecuted))
                else
                    ScootsSpeedrun.printError('action : ' .. actionType .. ' : HANDLER MISSING')
                end
                
                if(actionExecuted) then
                    return true
                end
            end
        end
    end
    
    return false
end

-- ########### --

ScootsSpeedrun.action.dialogueSelect = function(dialogueIndex)
    SelectGossipOption(dialogueIndex)
    return true
end

ScootsSpeedrun.action.closeGossip = function()
    CloseGossip()
    return true
end

ScootsSpeedrun.action.selectAvailableQuest = function(selectQuestId)
    local questList = Custom_GetGossipQuests(1)
    if(questList == nil) then
        return false
    end
    
    for questIndex, questId in ipairs(questList) do
        if(questId == selectQuestId) then
            SelectGossipAvailableQuest(questIndex)
            return true
        end
    end
    
    return false
end

ScootsSpeedrun.action.acceptQuest = function(questId)
    ScootsSpeedrun.printDebug('action-test : accept-quest : ' .. Custom_GetGossipQuests(3) .. ' == ' .. questId)
    
    if(Custom_GetGossipQuests(3) ~= questId) then
        return false
    end
    
    AcceptQuest()
    return true
end

ScootsSpeedrun.action.selectActiveQuest = function(selectQuestId)
    local questList = Custom_GetGossipQuests(2)
    if(questList == nil) then
        return false
    end
    
    for questIndex, questId in ipairs(questList) do
        if(questId == selectQuestId) then
            SelectGossipActiveQuest(questIndex)
            return true
        end
    end
    
    return false
end

ScootsSpeedrun.action.progressQuest = function(questId)
    if(Custom_GetGossipQuests(3) == questId) then
        QuestFrameCompleteButton:Click()
        return true
    end
    
    return false
end

ScootsSpeedrun.action.completeQuest = function(questId)
    if(Custom_GetGossipQuests(3) == questId) then
        QuestFrameCompleteQuestButton:Click()
        return true
    end
    
    return false
end

ScootsSpeedrun.action.selectAttuneableReward = function()
    if(CanAttuneItemHelper == nil or CustomExtractItemId == nil) then
        return false
    end

    local numRewards = GetNumQuestChoices()
    if(numRewards == 0) then
        return false
    end
    
    for rewardIndex = 1, numRewards do
        local itemId = CustomExtractItemId(GetQuestItemLink('choice', rewardIndex))
        
        if(CanAttuneItemHelper(itemId) > 0) then
            _G['QuestInfoItem' .. rewardIndex]:Click()
            return true
        end
    end
    
    return false
end

ScootsSpeedrun.action.selectAttuneableRewardOrCompleteQuest = function(param)
    if(GetNumQuestChoices() > 0) then
        return ScootsSpeedrun.action.selectAttuneableReward(param)
    elseif(GetNumQuestRewards() == 0) then
        return ScootsSpeedrun.action.completeQuest(param)
    end
    
    return false
end

ScootsSpeedrun.action.useItemFromBag = function(itemIdToUse)
    for bagIndex = 0, 4 do
        local bagSlots = GetContainerNumSlots(bagIndex)
        
        for slotIndex = 1, bagSlots do
            local itemLink = select(7, GetContainerItemInfo(bagIndex, slotIndex))
            local itemId = CustomExtractItemId(itemLink)

            if(itemId and itemId == itemIdToUse) then
                UseContainerItem(bagIndex, slotIndex)
                return false -- Always return false to allow next action to happen
            end
        end
    end
    
    return false
end

ScootsSpeedrun.action.purchaseItemUpToCount = function(data)
    local maxShopIndex = GetMerchantNumItems()
    local purchaseIndex = nil
    local availableStock = nil
    for shopIndex = 1, maxShopIndex do
        local itemLink = GetMerchantItemLink(shopIndex)
        local itemId = CustomExtractItemId(itemLink)
        
        if(itemId == data.item) then
            purchaseIndex = shopIndex
            availableStock = select(5, GetMerchantItemInfo(shopIndex))
            break
        end
    end
    
    if(purchaseIndex == nil or (availableStock > -1 and availableStock < data.count)) then
        return false
    end
    
    local currentCount = 0
    for bagIndex = 0, 4 do
        local bagSlots = GetContainerNumSlots(bagIndex)
        
        for slotIndex = 1, bagSlots do
            local _, itemCount, _, _, _, _, itemLink = GetContainerItemInfo(bagIndex, slotIndex)
            local itemId = CustomExtractItemId(itemLink)

            if(itemId and itemId == data.item) then
                currentCount = currentCount + itemCount
            end
        end
    end
    
    if(currentCount == data.count) then
        return false
    end
    
    local toBuy = data.count - currentCount
    
    if(toBuy == 0 or (availableStock > -1 and availableStock < toBuy)) then
        return false
    end
    
    BuyMerchantItem(purchaseIndex, toBuy)
    return true
end

ScootsSpeedrun.action.autoConfirm = function(popupWhich)
    for popupIndex = 1, 10 do
        local popup = _G['StaticPopup' .. popupIndex]
        
        if(popup and popup:IsVisible() and popup.which == popupWhich) then
            _G['StaticPopup' .. popupIndex .. 'Button1']:Click()
        end
    end
end

ScootsSpeedrun.action.doNothing = function()
    return true
end

-- ########### --

ScootsSpeedrun.condition.gossipChoiceCount = function(numOptions)
    return GetNumGossipOptions() == numOptions
end

ScootsSpeedrun.condition.questHandinReady = function(checkQuestId)
    local questIndex
    for questIndex = 1, GetNumQuestLogEntries() do
        local _, _, _, _, isHeader, _, isComplete, _, questId = GetQuestLogTitle(questIndex)
        
        if(not isHeader and questId == checkQuestId) then
            if(isComplete == 1) then
                return true
            end
            
            break
        end
    end
    
    return false
end

ScootsSpeedrun.condition.questComplete = function(questId)
    if(ScootsSpeedrun.executedQueryQuestsCompleted == nil) then
        QueryQuestsCompleted()
        ScootsSpeedrun.executedQueryQuestsCompleted = true
    end
    
    if(GetQuestsCompleted()[questId]) then
        return true
    end
    
    return false
end

ScootsSpeedrun.condition.questCompleteAny = function(questIdList)
    if(ScootsSpeedrun.executedQueryQuestsCompleted == nil) then
        QueryQuestsCompleted()
        ScootsSpeedrun.executedQueryQuestsCompleted = true
    end
    
    for _, questId in pairs(questIdList) do
        if(GetQuestsCompleted()[questId]) then
            return true
        end
    end
    
    return false
end

ScootsSpeedrun.condition.questNotInLog = function(checkQuestId)
    local questIndex
    for questIndex = 1, GetNumQuestLogEntries() do
        local _, _, _, _, isHeader, _, _, _, questId = GetQuestLogTitle(questIndex)
        
        if(not isHeader and questId == checkQuestId) then
            return false
        end
    end
    
    return true
end

ScootsSpeedrun.condition.availableQuestCount = function(numQuests)
    return GetNumGossipAvailableQuests() == numQuests
end

ScootsSpeedrun.condition.activeQuestCount = function(numQuests)
    return GetNumGossipActiveQuests() == numQuests
end

ScootsSpeedrun.condition.completableQuestCount = function(numQuests)
    local activeQuests = GetNumGossipActiveQuests()
    if(activeQuests < numQuests) then
        return false
    elseif(activeQuests == 0 and numQuests == 0) then
        return true
    end
    
    local questList = Custom_GetGossipQuests(2)
    if(questList == nil) then
        return false
    end
    
    local completeableQuests = 0
    for _, questId in pairs(questList) do
        if(ScootsSpeedrun.condition.questHandinReady(questId)) then
            completeableQuests = completeableQuests + 1
        end
    end
    
    return completeableQuests == numQuests
end

ScootsSpeedrun.condition.itemInBags = function(data)
    local currentCount = 0
    for bagIndex = 0, 4 do
        local bagSlots = GetContainerNumSlots(bagIndex)
        
        for slotIndex = 1, bagSlots do
            local _, itemCount, _, _, _, _, itemLink = GetContainerItemInfo(bagIndex, slotIndex)
            local itemId = CustomExtractItemId(itemLink)

            if(itemId and itemId == data.item) then
                currentCount = currentCount + itemCount
        
                if(currentCount >= data.count) then
                    return true
                end
            end
        end
    end
    
    return false
end

ScootsSpeedrun.condition.itemNotInBags = function(itemIdCheck)
    for bagIndex = 0, 4 do
        local bagSlots = GetContainerNumSlots(bagIndex)
        
        for slotIndex = 1, bagSlots do
            local itemLink = select(7, GetContainerItemInfo(bagIndex, slotIndex))
            local itemId = CustomExtractItemId(itemLink)

            if(itemId and itemId == itemIdCheck) then
                return false
            end
        end
    end
    
    return true
end

ScootsSpeedrun.condition.ownFewestInSet = function(data)
    if(ScootsSpeedrun.setCheck == nil) then
        ScootsSpeedrun.setCheck = {}
        for _, item in pairs(data.set) do
            ScootsSpeedrun.setCheck[item] = 0
        end
    
        for bagIndex = 0, 4 do
            local bagSlots = GetContainerNumSlots(bagIndex)
            
            for slotIndex = 1, bagSlots do
                local _, itemCount, _, _, _, _, itemLink = GetContainerItemInfo(bagIndex, slotIndex)
                local itemId = CustomExtractItemId(itemLink)

                if(itemId and ScootsSpeedrun.setCheck[itemId] ~= nil) then
                    ScootsSpeedrun.setCheck[itemId] = ScootsSpeedrun.setCheck[itemId] + itemCount
                end
            end
        end
    end
    
    local lowest = nil
    for _, count in pairs(ScootsSpeedrun.setCheck) do
        if(lowest == nil or count < lowest) then
            lowest = count
        end
    end
    
    return ScootsSpeedrun.setCheck[data.item] == lowest
end

ScootsSpeedrun.condition.itemInBagsAndResourceBank = function(data)
    local currentCount = GetCustomGameData(13, data.item)
    if(currentCount >= data.count) then
        return true
    end
    
    for bagIndex = 0, 4 do
        local bagSlots = GetContainerNumSlots(bagIndex)
        
        for slotIndex = 1, bagSlots do
            local _, itemCount, _, _, _, _, itemLink = GetContainerItemInfo(bagIndex, slotIndex)
            local itemId = CustomExtractItemId(itemLink)

            if(itemId and itemId == data.item) then
                currentCount = currentCount + itemCount
        
                if(currentCount >= data.count) then
                    return true
                end
            end
        end
    end
    
    return false
end

-- ########### --

ScootsSpeedrun.handleChatCommand = function(params)
    local heading = table.concat({
        '\124cff',
        '98fb98',
        ScootsSpeedrun.title,
        ' ',
        ScootsSpeedrun.version,
        '\124r',
        '\n'
    }, '')

    if(params == 'debug') then
        print(heading .. 'Debug toggled ' .. ((ScootsSpeedrun.debug and 'off') or 'on') .. '.')
        ScootsSpeedrun.debug = not ScootsSpeedrun.debug
    else
        print(heading .. 'Type "/scootsspeedrun debug" to toggle debug mode.\nDebug mode is currently ' .. ((ScootsSpeedrun.debug and 'on') or 'off') .. '.')
    end
end

SLASH_SCOOTSSPEEDRUN1 = '/scootsspeedrun'
SlashCmdList['SCOOTSSPEEDRUN'] = ScootsSpeedrun.handleChatCommand

-- ########### --

ScootsSpeedrun.frames.events:SetScript('OnEvent', ScootsSpeedrun.eventHandler)

ScootsSpeedrun.frames.events:RegisterEvent('GOSSIP_SHOW')
ScootsSpeedrun.frames.events:RegisterEvent('QUEST_GREETING')
ScootsSpeedrun.frames.events:RegisterEvent('QUEST_DETAIL')
ScootsSpeedrun.frames.events:RegisterEvent('QUEST_PROGRESS')
ScootsSpeedrun.frames.events:RegisterEvent('QUEST_COMPLETE')
ScootsSpeedrun.frames.events:RegisterEvent('CONFIRM_XP_LOSS')
ScootsSpeedrun.frames.events:RegisterEvent('MERCHANT_SHOW')

for popupIndex = 1, 10 do
    local popup = _G['StaticPopup' .. popupIndex]
    if(popup) then
        popup:HookScript('OnShow', function()
            ScootsSpeedrun.eventHandler(nil, 'SCOOTSSPEEDRUN_POPUP_SHOW')
        end)
    end
end