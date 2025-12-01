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
}

-- Shattrath City
ScootsSpeedrun.map[3703] = {
    [22429] = { -- Vekax
        {
            ['action'] = 'use-item',
            ['data'] = 31800, -- Outcast's Cache
        },
        {
            ['action'] = 'select-available-quest',
            ['data'] = 10918, -- More Feathers
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 25719, -- Arakkoa Feather
                        ['count'] = 30,
                    },
                },
            },
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 10918, -- More Feathers
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 10918, -- More Feathers
        },
        {
            ['action'] = 'select-available-quest',
            ['data'] = 10917, -- The Outcast's Plight
        },
        {
            ['action'] = 'accept-quest',
            ['data'] = 10917, -- The Outcast's Plight
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 10917, -- The Outcast's Plight
            ['conditions'] = {
                {
                    ['type'] = 'quest-handin-ready',
                    ['data'] = 10917, -- The Outcast's Plight
                },
            },
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 10917, -- The Outcast's Plight
        },
    },
}

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

-- Terokkar Forest
ScootsSpeedrun.map[3519] = {
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
}

-- Nagrand
ScootsSpeedrun.map[3518] = {
    [18816] = { -- Chief Researcher Amereldine
        {
            ['action'] = 'select-available-quest',
            ['data'] = 10075, -- Oshu'gun Crystal Powder
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 26042, -- Oshu'gun Crystal Powder Sample
                        ['count'] = 10,
                    },
                },
            },
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 10075, -- Oshu'gun Crystal Powder
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 26042, -- Oshu'gun Crystal Powder Sample
                        ['count'] = 10,
                    },
                },
            },
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 10075, -- Oshu'gun Crystal Powder
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 10075, -- Oshu'gun Crystal Powder
        },
        {
            ['action'] = 'select-available-quest',
            ['data'] = 10074, -- Oshu'gun Crystal Powder
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 26042, -- Oshu'gun Crystal Powder Sample
                        ['count'] = 10,
                    },
                },
            },
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 10074, -- Oshu'gun Crystal Powder
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 26042, -- Oshu'gun Crystal Powder Sample
                        ['count'] = 10,
                    },
                },
            },
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 10074, -- Oshu'gun Crystal Powder
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 10074, -- Oshu'gun Crystal Powder
        },
    },
    [18817] = { -- Chief Researcher Kartos
        {
            ['action'] = 'select-available-quest',
            ['data'] = 10077, -- Oshu'gun Crystal Powder
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 26043, -- Oshu'gun Crystal Powder Sample
                        ['count'] = 10,
                    },
                },
            },
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 10077, -- Oshu'gun Crystal Powder
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 26043, -- Oshu'gun Crystal Powder Sample
                        ['count'] = 10,
                    },
                },
            },
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 10077, -- Oshu'gun Crystal Powder
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 10077, -- Oshu'gun Crystal Powder
        },
        {
            ['action'] = 'select-available-quest',
            ['data'] = 10076, -- Oshu'gun Crystal Powder
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 26043, -- Oshu'gun Crystal Powder Sample
                        ['count'] = 10,
                    },
                },
            },
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 10076, -- Oshu'gun Crystal Powder
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 26043, -- Oshu'gun Crystal Powder Sample
                        ['count'] = 10,
                    },
                },
            },
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 10076, -- Oshu'gun Crystal Powder
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 10076, -- Oshu'gun Crystal Powder
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