-- Old Hillsbrad Foothills
ScootsSpeedrun.map[2367] = {
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
}

-- Slave Pens
ScootsSpeedrun.map[3717] = {
    [17893] = { -- Naturalist Bite
        {
            ['action'] = 'dialogue-select',
            ['data'] = 1,
        },
    },
}