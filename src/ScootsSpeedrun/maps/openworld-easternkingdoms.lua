-- Blackrock Mountain
ScootsSpeedrun.map[25] = {
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
        },
    },
}

-- Blasted Lands
ScootsSpeedrun.map[4] = {
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
}

-- Stranglethorn Vale
ScootsSpeedrun.map[33] = {
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
}

-- Eastern Plaguelands
ScootsSpeedrun.map[139] = {
    [16135] = { -- Rayne
        {
            ['action'] = 'select-available-quest',
            ['data'] = 9137, -- Savage Fronds
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 22529, -- Savage Frond
                        ['count'] = 30,
                    },
                },
            },
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 9137, -- Savage Fronds
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 22529, -- Savage Frond
                        ['count'] = 30,
                    },
                },
            },
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 9137, -- Savage Fronds
        },
        {
            ['action'] = 'select-fewest-owned-reward-in-set',
            ['data'] = {
                22523, -- Insignia of the Dawn
                22524, -- Insignia of the Crusade
            },
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 9137, -- Savage Fronds
        },
        {
            ['action'] = 'select-available-quest',
            ['data'] = 9136, -- Savage Flora
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 22529, -- Savage Frond
                        ['count'] = 30,
                    },
                },
            },
        },
        {
            ['action'] = 'accept-quest',
            ['data'] = 9136, -- Savage Flora
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 22529, -- Savage Frond
                        ['count'] = 30,
                    },
                },
            },
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 9136, -- Savage Flora
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 22529, -- Savage Frond
                        ['count'] = 30,
                    },
                },
            },
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 9136, -- Savage Flora
        },
        {
            ['action'] = 'select-fewest-owned-reward-in-set',
            ['data'] = {
                22523, -- Insignia of the Dawn
                22524, -- Insignia of the Crusade
            },
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 9136, -- Savage Flora
        },
    },
    [1855] = { -- Tirion Fordring
        {
            ['action'] = 'select-available-quest',
            ['data'] = 27047, -- Halls of Reflection: Reward
        },
        {
            ['action'] = 'accept-quest',
            ['data'] = 27047, -- Halls of Reflection: Reward
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 27047, -- Halls of Reflection: Reward
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 27047, -- Halls of Reflection: Reward
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 27047, -- Halls of Reflection: Reward
        },
    },
}

-- Swamp of Sorrows
ScootsSpeedrun.map[8] = {
    [7572] = { -- Fallen Hero of the Horde
        {
            ['action'] = 'select-available-quest',
            ['data'] = 27027, -- Drak'Tharon Keep: Reward
        },
        {
            ['action'] = 'accept-quest',
            ['data'] = 27027, -- Drak'Tharon Keep: Reward
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 27027, -- Drak'Tharon Keep: Reward
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 27027, -- Drak'Tharon Keep: Reward
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 27027, -- Drak'Tharon Keep: Reward
        },
    },
}

-- Alterac Mountains
ScootsSpeedrun.map[36] = {
    [6768] = { -- Lord Jorach Ravenholdt
        {
            ['action'] = 'select-available-quest',
            ['data'] = 27077, -- Utgarde Keep: Reward
        },
        {
            ['action'] = 'accept-quest',
            ['data'] = 27077, -- Utgarde Keep: Reward
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 27077, -- Utgarde Keep: Reward
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 27077, -- Utgarde Keep: Reward
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 27077, -- Utgarde Keep: Reward
        },
    },
}

-- Isle of Quel'Danas
ScootsSpeedrun.map[4080] = {
    [25977] = { -- Yrma
        {
            ['action'] = 'withdraw-from-resource-bank',
            ['data'] = 34664, -- Sunmote
            ['conditions'] = {
                {
                    ['type'] = 'item-not-in-bags',
                    ['data'] = 34664, -- Sunmote
                },
            },
        },
        {
            ['action'] = 'register-callback-on-event',
            ['data'] = {
                ['event'] = 'MERCHANT_CLOSED',
                ['callback'] = ScootsSpeedrun.action.depositToResourceBank,
            },
        },
    },
}