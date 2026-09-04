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

for _, data in pairs({
    {
        ['npc'] = 16135, -- Rayne
        ['quests'] = {
            9137, -- Savage Fronds
            9136, -- Savage Flora
        },
        ['item'] = 22529, -- Savage Frond
        ['count'] = 30,
        ['selectFewest'] = true,
    },
    {
        ['npc'] = 16116, -- Archmage Angela Dosantos <Brotherhood of the Light>
        ['quests'] = {
            9128, -- The Elemental Equation
            9129, -- Core of Elements
        },
        ['item'] = 22527, -- Core of Elements
        ['count'] = 30,
    },
    {
        ['npc'] = 16112, -- Korfax, Champion of the Light <Brotherhood of the Light>
        ['quests'] = {
            9131, -- Binding the Dreadnaught
            9132, -- Dark Iron Scraps
        },
        ['item'] = 22528, -- Dark Iron Scraps
        ['count'] = 30,
    },
    {
        ['npc'] = 16132, -- Huntsman Leopold <The Scarlet Crusade>
        ['quests'] = {
            9124, -- Cryptstalker Armor Doesn't Make Itself...
            9125, -- Crypt Fiend Parts
        },
        ['item'] = 22525, -- Crypt Fiend Parts
        ['count'] = 30,
    },
    {
        ['npc'] = 16131, -- Rohan the Assassin <The Scarlet Crusade>
        ['quests'] = {
            9126, -- Bonescythe Digs
            9127, -- Bone Fragments
        },
        ['item'] = 22526, -- Bone Fragments
        ['count'] = 30,
    },
}) do
    ScootsSpeedrun.map[139][data.npc] = {}
    
    for _, questId in ipairs(data.quests) do
        table.insert(ScootsSpeedrun.map[139][data.npc], {
            ['action'] = 'select-available-quest',
            ['data'] = questId,
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = data.item,
                        ['count'] = data.count,
                    },
                },
            },
        })
        
        table.insert(ScootsSpeedrun.map[139][data.npc], {
            ['action'] = 'accept-quest',
            ['data'] = questId,
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = data.item,
                        ['count'] = data.count,
                    },
                },
            },
        })
        
        table.insert(ScootsSpeedrun.map[139][data.npc], {
            ['action'] = 'select-active-quest',
            ['data'] = questId,
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = data.item,
                        ['count'] = data.count,
                    },
                },
            },
        })
        
        table.insert(ScootsSpeedrun.map[139][data.npc], {
            ['action'] = 'progress-quest',
            ['data'] = questId,
        })
        
        if(data.selectFewest) then
            table.insert(ScootsSpeedrun.map[139][data.npc], {
                ['action'] = 'select-fewest-owned-reward-in-set',
                ['data'] = {
                    22523, -- Insignia of the Dawn
                    22524, -- Insignia of the Crusade
                },
            })
        end
        
        table.insert(ScootsSpeedrun.map[139][data.npc], {
            ['action'] = 'complete-quest',
            ['data'] = questId,
        })
    end
end

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
                    ['data'] = {
                        ['item'] = 34664, -- Sunmote
                    },
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