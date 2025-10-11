-- Halls of Stone
ScootsSpeedrun.map[4264] = {
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
}

-- Trial of the Champion
ScootsSpeedrun.map[4723] = {
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
}

-- The Culling of Stratholme
ScootsSpeedrun.map[4100] = {
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
}

-- The Oculus
ScootsSpeedrun.map[4228] = {
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
}

-- The Violet Hold
ScootsSpeedrun.map[4415] = {
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
}

-- The Forge of Souls
ScootsSpeedrun.map[4809] = {
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
}

-- The Pit of Saron
ScootsSpeedrun.map[4813] = {
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
}

-- Halls of Reflection
ScootsSpeedrun.map[4820] = {
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
}