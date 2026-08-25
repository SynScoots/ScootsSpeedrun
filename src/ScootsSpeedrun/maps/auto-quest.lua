ScootsSpeedrun.extraQuests = {
    -- Misc
    [3421] = true, -- Return Trip
    [3503] = true, -- Meeting with the Master
}

ScootsSpeedrun.extraQuestsDontAutoUseStartItem = {
    -- Misc
    [13148] = true, -- Necklace Repair
    [14203] = true, -- Waterlogged Recipe
    
    -- Silithus
    [8534] = true, -- Hive'Zora Scout Report
    [8738] = true, -- Hive'Regal Scout Report
    [8739] = true, -- Hive'Ashi Scout Report
    [8535] = true, -- Hoary Templar
    [8536] = true, -- Earthen Templar
    [8537] = true, -- Crimson Templar
    [8737] = true, -- Azure Templar
    [8498] = true, -- Twilight Battle Orders
    [8740] = true, -- Twilight Marauders
    [8770] = true, -- Target: Hive'Ashi Defenders
    [8771] = true, -- Target: Hive'Ashi Sandstalkers
    [8501] = true, -- Target: Hive'Ashi Stingers
    [8502] = true, -- Target: Hive'Ashi Workers
    [8774] = true, -- Target: Hive'Regal Ambushers
    [8777] = true, -- Target: Hive'Regal Burrowers
    [8776] = true, -- Target: Hive'Regal Slavemakers
    [8775] = true, -- Target: Hive'Regal Spitfires
    [8539] = true, -- Target: Hive'Zora Hive Sisters
    [8773] = true, -- Target: Hive'Zora Reavers
    [8687] = true, -- Target: Hive'Zora Tunnelers
    [8772] = true, -- Target: Hive'Zora Waywatchers
}

for questId, _ in pairs(ScootsSpeedrun.extraQuestsDontAutoUseStartItem) do
    ScootsSpeedrun.extraQuests[questId] = true
end