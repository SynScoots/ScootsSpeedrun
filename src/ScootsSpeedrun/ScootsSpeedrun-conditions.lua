ScootsSpeedrun.condition.gossipChoiceCount = function(numOptions)
    return GetNumGossipOptions() == numOptions
end

ScootsSpeedrun.condition.questHandinReady = function(checkQuestId)
    local questIndex
    for questIndex = 1, GetNumQuestLogEntries() do
        local _, _, _, _, isHeader, _, isComplete, _, questId = GetQuestLogTitle(questIndex)
        
        if(not isHeader and questId == checkQuestId) then
            if(isComplete == 1) then
                return true
            end
            
            break
        end
    end
    
    return false
end

ScootsSpeedrun.condition.questComplete = function(questId)
    if(ScootsSpeedrun.executedQueryQuestsCompleted == nil) then
        QueryQuestsCompleted()
        ScootsSpeedrun.executedQueryQuestsCompleted = true
    end
    
    if(GetQuestsCompleted()[questId]) then
        return true
    end
    
    return false
end

ScootsSpeedrun.condition.questCompleteAny = function(questIdList)
    if(ScootsSpeedrun.executedQueryQuestsCompleted == nil) then
        QueryQuestsCompleted()
        ScootsSpeedrun.executedQueryQuestsCompleted = true
    end
    
    for _, questId in pairs(questIdList) do
        if(GetQuestsCompleted()[questId]) then
            return true
        end
    end
    
    return false
end

ScootsSpeedrun.condition.questNotInLog = function(checkQuestId)
    local questIndex
    for questIndex = 1, GetNumQuestLogEntries() do
        local _, _, _, _, isHeader, _, _, _, questId = GetQuestLogTitle(questIndex)
        
        if(not isHeader and questId == checkQuestId) then
            return false
        end
    end
    
    return true
end

ScootsSpeedrun.condition.availableQuestCount = function(numQuests)
    return GetNumGossipAvailableQuests() == numQuests
end

ScootsSpeedrun.condition.activeQuestCount = function(numQuests)
    return GetNumGossipActiveQuests() == numQuests
end

ScootsSpeedrun.condition.completableQuestCount = function(numQuests)
    local activeQuests = GetNumGossipActiveQuests()
    if(activeQuests < numQuests) then
        return false
    elseif(activeQuests == 0 and numQuests == 0) then
        return true
    end
    
    local questList = Custom_GetGossipQuests(2)
    if(questList == nil) then
        return false
    end
    
    local completeableQuests = 0
    for _, questId in pairs(questList) do
        if(ScootsSpeedrun.condition.questHandinReady(questId)) then
            completeableQuests = completeableQuests + 1
        end
    end
    
    return completeableQuests == numQuests
end

ScootsSpeedrun.condition.itemInBags = function(data)
    local currentCount = 0
    for bagIndex = 0, 4 do
        local bagSlots = GetContainerNumSlots(bagIndex)
        
        for slotIndex = 1, bagSlots do
            local _, itemCount, _, _, _, _, itemLink = GetContainerItemInfo(bagIndex, slotIndex)
            local itemId = CustomExtractItemId(itemLink)

            if(itemId and itemId == data.item) then
                currentCount = currentCount + itemCount
        
                if(currentCount >= data.count) then
                    return true
                end
            end
        end
    end
    
    return false
end

ScootsSpeedrun.condition.itemNotInBags = function(itemIdCheck)
    for bagIndex = 0, 4 do
        local bagSlots = GetContainerNumSlots(bagIndex)
        
        for slotIndex = 1, bagSlots do
            local itemLink = select(7, GetContainerItemInfo(bagIndex, slotIndex))
            local itemId = CustomExtractItemId(itemLink)

            if(itemId and itemId == itemIdCheck) then
                return false
            end
        end
    end
    
    return true
end

ScootsSpeedrun.condition.ownFewestInSet = function(data)
    if(ScootsSpeedrun.setCheck == nil) then
        ScootsSpeedrun.setCheck = {}
        for _, item in pairs(data.set) do
            ScootsSpeedrun.setCheck[item] = 0
        end
    
        for bagIndex = 0, 4 do
            local bagSlots = GetContainerNumSlots(bagIndex)
            
            for slotIndex = 1, bagSlots do
                local _, itemCount, _, _, _, _, itemLink = GetContainerItemInfo(bagIndex, slotIndex)
                local itemId = CustomExtractItemId(itemLink)

                if(itemId and ScootsSpeedrun.setCheck[itemId] ~= nil) then
                    ScootsSpeedrun.setCheck[itemId] = ScootsSpeedrun.setCheck[itemId] + itemCount
                end
            end
        end
    end
    
    local lowest = nil
    for _, count in pairs(ScootsSpeedrun.setCheck) do
        if(lowest == nil or count < lowest) then
            lowest = count
        end
    end
    
    return ScootsSpeedrun.setCheck[data.item] == lowest
end

ScootsSpeedrun.condition.itemInBagsAndResourceBank = function(data)
    local currentCount = GetCustomGameData(13, data.item)
    if(currentCount >= data.count) then
        return true
    end
    
    for bagIndex = 0, 4 do
        local bagSlots = GetContainerNumSlots(bagIndex)
        
        for slotIndex = 1, bagSlots do
            local _, itemCount, _, _, _, _, itemLink = GetContainerItemInfo(bagIndex, slotIndex)
            local itemId = CustomExtractItemId(itemLink)

            if(itemId and itemId == data.item) then
                currentCount = currentCount + itemCount
        
                if(currentCount >= data.count) then
                    return true
                end
            end
        end
    end
    
    return false
end