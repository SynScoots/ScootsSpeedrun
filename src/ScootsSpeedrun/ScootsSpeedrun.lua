ScootsSpeedrun = {
    ['version'] = '2.27.0',
    ['title'] = 'ScootsSpeedrun',
    ['frames'] = {
        ['events'] = CreateFrame('Frame', 'ScootsSpeedrun-Events', UIParent),
    },
    ['action'] = {},
    ['condition'] = {},
    ['map'] = {
        -- ['zoneId'] = { ['npcId'] = { ... } }
    },
    ['autoCompleteIgnoreLootItems'] = {
        [19182] = true, -- Darkmoon Faire Prize Ticket
        [20800] = true, -- Cenarion Logistics Badge
        [20801] = true, -- Cenarion Tactical Badge
        [20802] = true, -- Cenarion Combat Badge
        [20805] = true, -- Followup Logistics Assignment
        [20809] = true, -- Tactical Assignment
        [21132] = true, -- Logistics Assignment
        [21133] = true, -- Followup Tactical Assignment
        [21100] = true, -- Coin of Ancestry
        [23247] = true, -- Burning Blossom
        [26044] = true, -- Halaa Research Token
        [32569] = true, -- Apexis Shard
        [37586] = true, -- Handful of Candy
        [37836] = true, -- Venture Coin
        [43228] = true, -- Stone Keeper's Shard
        [49927] = true, -- Love Token
        [49936] = true, -- Lovely Stormwind Card
        [49940] = true, -- Lovely Ironforge Card
        [49938] = true, -- Lovely Darnassus Card
        [49942] = true, -- Lovely Exodar Card
        [49939] = true, -- Lovely Orgrimmar Card
        [49941] = true, -- Lovely Thunder Bluff Card
        [49937] = true, -- Lovely Undercity Card
        [49943] = true, -- Lovely Silvermoon City Card
    },
    ['questsFromTracker'] = {},
    ['queuedEvents'] = {},
    ['queueTimer'] = 0,
    ['watchedItems'] = {},
    ['doBagUpdateAt'] = nil,
    ['registeredEvents'] = {},
    ['bankOpen'] = false,
	['lastQuestEvent'] = '',
    ['storage'] = {},
}