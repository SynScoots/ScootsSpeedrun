-- Silithus
ScootsSpeedrun.map[1377] = {
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
            ['action'] = 'dismount',
        },
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
    [49446] = { -- Lesser Wind Stone
        {
            ['action'] = 'dismount',
        },
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
    [49457] = { -- Lesser Wind Stone
        {
            ['action'] = 'dismount',
        },
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
    [49472] = { -- Lesser Wind Stone
        {
            ['action'] = 'dismount',
        },
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
    [49477] = { -- Lesser Wind Stone
        {
            ['action'] = 'dismount',
        },
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
    [49492] = { -- Lesser Wind Stone
        {
            ['action'] = 'dismount',
        },
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
    [49389] = { -- Wind Stone
        {
            ['action'] = 'dismount',
        },
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
    [49462] = { -- Wind Stone
        {
            ['action'] = 'dismount',
        },
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
    [49482] = { -- Wind Stone
        {
            ['action'] = 'dismount',
        },
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
    [49394] = { -- Greater Wind Stone
        {
            ['action'] = 'dismount',
        },
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
    [49467] = { -- Greater Wind Stone
        {
            ['action'] = 'dismount',
        },
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
    [49487] = { -- Greater Wind Stone
        {
            ['action'] = 'dismount',
        },
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
}

-- Caverns of Time
ScootsSpeedrun.map[6035] = {
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
}

-- Tanaris
ScootsSpeedrun.map[440] = {
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
}