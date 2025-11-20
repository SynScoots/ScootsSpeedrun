-- Blackwing Lair
ScootsSpeedrun.map[2677] = {
    [13020] = { -- Vaelastrasz the Corrupt
        {
            ['action'] = 'select-available-quest',
            ['data'] = 8730, -- Nefarius's Corruption
        },
        {
            ['action'] = 'accept-quest',
            ['data'] = 8730, -- Nefarius's Corruption
        },
        {
            ['action'] = 'dialogue-select',
            ['data'] = 1,
            ['conditions'] = {
                {
                    ['type'] = 'available-quest-count',
                    ['data'] = 0,
                },
            },
        },
    },
    [10162] = { -- Lord Victor Nefarius
        {
            ['action'] = 'dialogue-select',
            ['data'] = 1,
        },
    },
}

-- The Molten Core
ScootsSpeedrun.map[2717] = {
    [12018] = { -- Majordomo Executus
        {
            ['action'] = 'dialogue-select',
            ['data'] = 1,
        },
    },
}

-- Ruins of Ahn'Qiraj
ScootsSpeedrun.map[3429] = {
    [15471] = { -- Lieutenant General Andorov
        {
            ['action'] = 'dialogue-select',
            ['data'] = 1,
        },
    },
}