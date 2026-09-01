-- Dalaran
ScootsSpeedrun.map[4395] = {
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
    [31848] = { -- Zidormi
        {
            ['action'] = 'dialogue-select',
            ['data'] = 1
        },
    },
    [32169] = { -- Arcanist Braedin
        {
            ['action'] = 'dialogue-select',
            ['data'] = 1
        },
    },
    [32170] = { -- Magister Surdiel
        {
            ['action'] = 'dialogue-select',
            ['data'] = 1
        },
    },
}

-- Borean Tundra
ScootsSpeedrun.map[3537] = {
    [26117] = { -- Raelorasz
        {
            ['action'] = 'select-available-quest',
            ['data'] = 27067, -- Ahn'kahet: Reward
        },
        {
            ['action'] = 'accept-quest',
            ['data'] = 27067, -- Ahn'kahet: Reward
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 27067, -- Ahn'kahet: Reward
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 27067, -- Ahn'kahet: Reward
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 27067, -- Ahn'kahet: Reward
        },
    },
}

-- Dragonblight
ScootsSpeedrun.map[65] = {
    [27765] = { -- Nalice
        {
            ['action'] = 'select-available-quest',
            ['data'] = 27057, -- The Nexus: Reward
        },
        {
            ['action'] = 'accept-quest',
            ['data'] = 27057, -- The Nexus: Reward
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 27057, -- The Nexus: Reward
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 27057, -- The Nexus: Reward
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 27057, -- The Nexus: Reward
        },
    },
    [27856] = { -- Chromie
        {
            ['action'] = 'select-available-quest',
            ['data'] = 27007, -- The Culling of Stratholme: Reward
        },
        {
            ['action'] = 'accept-quest',
            ['data'] = 27007, -- The Culling of Stratholme: Reward
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 27007, -- The Culling of Stratholme: Reward
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 27007, -- The Culling of Stratholme: Reward
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 27007, -- The Culling of Stratholme: Reward
        },
    },
}