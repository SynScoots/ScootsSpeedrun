ScootsSpeedrun = {
    ['version'] = '2.9.1',
    ['title'] = 'ScootsSpeedrun',
    ['debug'] = false,
    ['frames'] = {
        ['events'] = CreateFrame('Frame', 'ScootsSpeedrun-Events', UIParent),
    },
    ['action'] = {},
    ['condition'] = {},
    ['map'] = {
        -- ['zoneId'] = { ['npcId'] = { ... } }
    },
    ['noNpcQuests'] = {
        {
            ['action'] = 'accept-quest',
            ['data'] = 13148, -- Necklace Repair
        },
        {
            ['action'] = 'accept-quest',
            ['data'] = 14203, -- Waterlogged Recipe
        },
    },
    ['onLootEvent'] = {
        ['Interface\\Icons\\INV_Egg_06'] = {
            {
                ['action'] = 'use-item',
                ['data'] = 45072, -- Brightly Colored Egg
            },
        },
    },
    ['autoCompleteIgnoreLootItems'] = {
        [23247] = true, -- Burning Blossom
    },
    ['questsFromTracker'] = {},
}

-- ########### --

ScootsSpeedrun.eventHandler = function(_, event, arg1, arg2)
    if(IsAltKeyDown()) then
        return nil
    end
    
    if(event == 'CONFIRM_XP_LOSS') then
        StaticPopup1Button1:Click()
        StaticPopup1Button1:Click()
        return nil
    end
    
    if(not Custom_GetGossipQuests or not CustomExtractItemId) then
        return nil
    end
    
    local npcGuid = UnitGUID('npc')
    if(npcGuid == nil) then
        npcGuid = UnitGUID('target')
    end
    
    local npcId = nil
    
    if(npcGuid) then
        npcId = tonumber(npcGuid:sub(9, 12), 16)
    end
    
    local locationId = Custom_GetCurrentZone()
    
    if(npcId and ScootsSpeedrun.debug) then
        local location = GetZoneText()
        
        local npc = UnitName('npc')
        if(npc == nil) then
            npc = UnitName('target')
        end
        
        ScootsSpeedrun.printDebug(event .. '\n' .. location .. ': ' .. locationId .. '\n' .. npc .. ': ' .. npcId)
    end
    
    if(event == 'GOSSIP_SHOW'
    or event == 'QUEST_GREETING'
    or event == 'QUEST_DETAIL'
    or event == 'QUEST_PROGRESS'
    or event == 'QUEST_COMPLETE'
    or event == 'MERCHANT_SHOW'
    or event == 'SCOOTSSPEEDRUN_POPUP_SHOW') then
        local actionPerformed = false
        ScootsSpeedrun.setCheck = nil
        
        if(npcId and ScootsSpeedrun.map[locationId] and ScootsSpeedrun.map[locationId][npcId]) then
            actionPerformed = ScootsSpeedrun.handleCharacterMap(event, ScootsSpeedrun.map[locationId][npcId])
        end
        
        if(actionPerformed == false) then
            ScootsSpeedrun.printDebug('Using noNpcQuests')
            actionPerformed = ScootsSpeedrun.handleCharacterMap(event, ScootsSpeedrun.noNpcQuests)
        end
        
        if(actionPerformed == false) then
            ScootsSpeedrun.printDebug('Calling buildMapFromTracker()')
            local map = ScootsSpeedrun.buildMapFromTracker(event)
            
            if(map == nil or #map == 0) then
                ScootsSpeedrun.printDebug('Calling buildMapFromHandinReadyQuests()')
                map = ScootsSpeedrun.buildMapFromHandinReadyQuests()
            end
            
            if(map ~= nil and #map > 0) then
                ScootsSpeedrun.handleCharacterMap(event, map)
            end
        end
    end
    
    if(event == 'ITEM_PUSH') then
        local map = ScootsSpeedrun['onLootEvent'][arg2]
        
        if(map ~= nil) then
            ScootsSpeedrun.handleCharacterMap(event, map)
        end
    end
end

ScootsSpeedrun.printDebug = function(message, force)
    if(ScootsSpeedrun.debug or force) then
        print('\124cff' .. '98fb98' .. ScootsSpeedrun.title .. '\124r' .. ' DEBUG: \n' .. message)
    end
end

ScootsSpeedrun.printError = function(message)
    print('\124cff' .. '98fb98' .. ScootsSpeedrun.title .. '\124r' .. '\124cff' .. 'fc4903' .. ' ERROR: \n' .. message .. '\124r')
end

ScootsSpeedrun.buildMapFromTracker = function(event)
    if(event == 'QUEST_PROGRESS' or event == 'QUEST_COMPLETE') then
        local questId = Custom_GetGossipQuests(3)
        return {
            {
                ['action'] = 'progress-quest',
                ['data'] = questId,
            },
            {
                ['action'] = 'select-attuneable-reward-or-complete-quest',
                ['data'] = questId,
            },
        }
    elseif(event == 'QUEST_DETAIL') then
        local questId = Custom_GetGossipQuests(3)
        
        if(ScootsSpeedrun.questsFromTracker[questId] ~= true and ScootsSpeedrun.extraQuests[questId] ~= true) then
            ScootsSpeedrun.updateTrackerQuestCache()
        else
            return {
                {
                    ['action'] = 'accept-quest',
                    ['data'] = questId,
                },
            }
        end
    elseif(event == 'GOSSIP_SHOW' or event == 'QUEST_GREETING') then
        local map = {}
        
        if(GetNumGossipAvailableQuests() > 0) then
            local availableQuests = Custom_GetGossipQuests(1)
            
            for questIndex = 1, #availableQuests do
                if(ScootsSpeedrun.questsFromTracker[availableQuests[questIndex]] ~= true and ScootsSpeedrun.extraQuests[availableQuests[questIndex]] ~= true) then
                    ScootsSpeedrun.updateTrackerQuestCache()
                    break
                end
            end
            
            for questIndex = 1, #availableQuests do
                if(ScootsSpeedrun.questsFromTracker[availableQuests[questIndex]] == true or ScootsSpeedrun.extraQuests[availableQuests[questIndex]] == true) then
                    table.insert(map, {
                        ['action'] = 'select-available-quest',
                        ['data'] = availableQuests[questIndex],
                    })
                end
            end
        end
            
        return map
    end
end

ScootsSpeedrun.buildMapFromHandinReadyQuests = function()
    if(GetNumGossipActiveQuests() > 0) then
        local activeQuests = Custom_GetGossipQuests(2)
        local map = {}
            
        for questIndex = 1, #activeQuests do
            table.insert(map, {
                ['action'] = 'select-active-quest',
                ['data'] = activeQuests[questIndex],
                ['conditions'] = {
                    {
                        ['type'] = 'quest-handin-ready',
                        ['data'] = activeQuests[questIndex],
                    },
                },
            })
        end
        
        return map
    end
end

ScootsSpeedrun.buildMapFromExtraQuests = function(event)

end

ScootsSpeedrun.updateTrackerQuestCache = function()
    ScootsSpeedrun.questsFromTracker = {}
    
    local tracker = ItemHuntFrame and ItemHuntFrame.cele.objArr
    if(tracker) then
        for trackerIndex = 1, #tracker do
            local trackerObject = tracker[trackerIndex]
            
            if(trackerObject.objType and trackerObject.objType == 2 and trackerObject.objId and trackerObject.objId > 0) then
                ScootsSpeedrun.questsFromTracker[trackerObject.objId] = true
            end
        end
    end
end

ScootsSpeedrun.handleCharacterMap = function(event, map)
    local mapIndex
    for mapIndex = 1, #map do
        local basicConditionsMet = true
        
        if(map[mapIndex].action == 'dialogue-select') then
            if((event ~= 'GOSSIP_SHOW' and event ~= 'QUEST_GREETING') or GetNumGossipOptions() < map[mapIndex].data) then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'select-available-quest') then
            if((event ~= 'GOSSIP_SHOW' and event ~= 'QUEST_GREETING') or GetNumGossipAvailableQuests() == 0) then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'accept-quest') then
            if(event ~= 'QUEST_DETAIL') then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'select-active-quest') then
            if((event ~= 'GOSSIP_SHOW' and event ~= 'QUEST_GREETING') or GetNumGossipActiveQuests() == 0) then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'progress-quest') then
            if(event ~= 'QUEST_PROGRESS') then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'complete-quest') then
            if(event ~= 'QUEST_COMPLETE') then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'purchase-item' or map[mapIndex].action == 'purchase-item-to-count') then
            if(event ~= 'MERCHANT_SHOW') then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'auto-confirm') then
            if(event ~= 'SCOOTSSPEEDRUN_POPUP_SHOW') then
                basicConditionsMet = false
            end
        end
        
        ScootsSpeedrun.printDebug('basic condition : ' .. map[mapIndex].action .. ' : ' .. tostring(basicConditionsMet))
        
        if(basicConditionsMet) then
            local conditionsMet = true
            
            if(map[mapIndex].conditions) then
                local conditionChecks = {
                    ['gossip-choice-count'] = ScootsSpeedrun.condition.gossipChoiceCount,
                    ['quest-handin-ready'] = ScootsSpeedrun.condition.questHandinReady,
                    ['quest-not-in-log'] = ScootsSpeedrun.condition.questNotInLog,
                    ['quest-complete'] = ScootsSpeedrun.condition.questComplete,
                    ['quest-complete-any'] = ScootsSpeedrun.condition.questCompleteAny,
                    ['available-quest-count'] = ScootsSpeedrun.condition.availableQuestCount,
                    ['active-quest-count'] = ScootsSpeedrun.condition.activeQuestCount,
                    ['completeable-quest-count'] = ScootsSpeedrun.condition.completableQuestCount,
                    ['item-in-bags'] = ScootsSpeedrun.condition.itemInBags,
                    ['item-not-in-bags'] = ScootsSpeedrun.condition.itemNotInBags,
                    ['own-fewest-in-set'] = ScootsSpeedrun.condition.ownFewestInSet,
                    ['item-in-bags-and-resource-bank'] = ScootsSpeedrun.condition.itemInBagsAndResourceBank,
                }
                
                local conditionIndex
                for conditionIndex = 1, #map[mapIndex].conditions do
                    local thisConditionMet = true
                    local conditionType = map[mapIndex].conditions[conditionIndex].type
                    local conditionData = map[mapIndex].conditions[conditionIndex].data
                
                    if(conditionChecks[conditionType] == nil) then
                        ScootsSpeedrun.printError('condition : ' .. conditionType .. ' : HANDLER MISSING')
                    else
                        if(conditionChecks[conditionType](conditionData) ~= true) then
                            thisConditionMet = false
                        end
                    
                        ScootsSpeedrun.printDebug('condition : ' .. conditionType .. '(' .. tostring(conditionData) .. ') : ' .. tostring(thisConditionMet))
                    
                        if(thisConditionMet == false) then
                            conditionsMet = false
                            
                            if(ScootsSpeedrun.debug ~= true) then
                                break
                            end
                        end
                    end
                end
            end
            
            if(conditionsMet) then
                local actions = {
                    ['dialogue-select'] = ScootsSpeedrun.action.dialogueSelect,
                    ['close-gossip'] = ScootsSpeedrun.action.closeGossip,
                    ['select-available-quest'] = ScootsSpeedrun.action.selectAvailableQuest,
                    ['select-attuneable-reward-or-complete-quest'] = ScootsSpeedrun.action.selectAttuneableRewardOrCompleteQuest,
                    ['accept-quest'] = ScootsSpeedrun.action.acceptQuest,
                    ['select-active-quest'] = ScootsSpeedrun.action.selectActiveQuest,
                    ['progress-quest'] = ScootsSpeedrun.action.progressQuest,
                    ['complete-quest'] = ScootsSpeedrun.action.completeQuest,
                    ['select-attuneable-reward'] = ScootsSpeedrun.action.selectAttuneableReward,
                    ['use-item'] = ScootsSpeedrun.action.useItemFromBag,
                    ['purchase-item'] = ScootsSpeedrun.action.purchaseItem,
                    ['purchase-item-to-count'] = ScootsSpeedrun.action.purchaseItemUpToCount,
                    ['auto-confirm'] = ScootsSpeedrun.action.autoConfirm,
                    ['do-nothing'] = ScootsSpeedrun.action.doNothing,
                }
                
                local actionType = map[mapIndex].action
                local actionData = map[mapIndex].data
                local actionExecuted = false
                
                if(actions[actionType]) then
                    actionExecuted = actions[actionType](actionData)
                    ScootsSpeedrun.printDebug('action : ' .. actionType .. '(' .. tostring(actionData) .. ') : ' .. tostring(actionExecuted))
                else
                    ScootsSpeedrun.printError('action : ' .. actionType .. ' : HANDLER MISSING')
                end
                
                if(actionExecuted) then
                    return true
                end
            end
        end
    end
    
    return false
end

-- ########### --

ScootsSpeedrun.action.dialogueSelect = function(dialogueIndex)
    SelectGossipOption(dialogueIndex)
    return true
end

ScootsSpeedrun.action.closeGossip = function()
    CloseGossip()
    return true
end

ScootsSpeedrun.action.selectAvailableQuest = function(selectQuestId)
    local questList = Custom_GetGossipQuests(1)
    if(questList == nil) then
        return false
    end
    
    for questIndex, questId in ipairs(questList) do
        if(questId == selectQuestId) then
            SelectGossipAvailableQuest(questIndex)
            return true
        end
    end
    
    return false
end

ScootsSpeedrun.action.acceptQuest = function(questId)
    ScootsSpeedrun.printDebug('action-test : accept-quest : ' .. Custom_GetGossipQuests(3) .. ' == ' .. questId)
    
    if(Custom_GetGossipQuests(3) ~= questId) then
        return false
    end
    
    AcceptQuest()
    return true
end

ScootsSpeedrun.action.selectActiveQuest = function(selectQuestId)
    local questList = Custom_GetGossipQuests(2)
    if(questList == nil) then
        return false
    end
    
    for questIndex, questId in ipairs(questList) do
        if(questId == selectQuestId) then
            SelectGossipActiveQuest(questIndex)
            return true
        end
    end
    
    return false
end

ScootsSpeedrun.action.progressQuest = function(questId)
    if(Custom_GetGossipQuests(3) == questId) then
        QuestFrameCompleteButton:Click()
        return true
    end
    
    return false
end

ScootsSpeedrun.action.completeQuest = function(questId)
    if(Custom_GetGossipQuests(3) == questId) then
        QuestFrameCompleteQuestButton:Click()
        return true
    end
    
    return false
end

ScootsSpeedrun.action.selectAttuneableReward = function()
    if(CanAttuneItemHelper == nil or CustomExtractItemId == nil) then
        return false
    end

    local numRewards = GetNumQuestChoices()
    if(numRewards == 0) then
        return false
    end
    
    for rewardIndex = 1, numRewards do
        local itemId = CustomExtractItemId(GetQuestItemLink('choice', rewardIndex))
        
        if(CanAttuneItemHelper(itemId) > 0) then
            _G['QuestInfoItem' .. rewardIndex]:Click()
            return true
        end
    end
    
    return false
end

ScootsSpeedrun.action.selectAttuneableRewardOrCompleteQuest = function(param)
    if(GetNumQuestChoices() > 0) then
        return ScootsSpeedrun.action.selectAttuneableReward(param)
    end
    
    local numRewards = GetNumQuestRewards()
    
    if(numRewards == 0) then
        return ScootsSpeedrun.action.completeQuest(param)
    elseif(CustomExtractItemId ~= nil) then
        ignoreRewards = true
        
        for rewardIndex = 1, numRewards do
            local itemId = CustomExtractItemId(GetQuestItemLink('reward', rewardIndex))
            
            if(ScootsSpeedrun.autoCompleteIgnoreLootItems[itemId] ~= true) then
                ignoreRewards = false
                break
            end
        end
        
        if(ignoreRewards) then
            return ScootsSpeedrun.action.completeQuest(param)
        end
    end
    
    return false
end

ScootsSpeedrun.action.useItemFromBag = function(itemIdToUse)
    for bagIndex = 0, 4 do
        local bagSlots = GetContainerNumSlots(bagIndex)
        
        for slotIndex = 1, bagSlots do
            local itemLink = select(7, GetContainerItemInfo(bagIndex, slotIndex))
            local itemId = CustomExtractItemId(itemLink)

            if(itemId and itemId == itemIdToUse) then
                UseContainerItem(bagIndex, slotIndex)
                return false -- Always return false to allow next action to happen
            end
        end
    end
    
    return false
end

ScootsSpeedrun.action.purchaseItem = function(data)
    local maxShopIndex = GetMerchantNumItems()
    local purchaseIndex = nil
    local availableStock = nil
    for shopIndex = 1, maxShopIndex do
        local itemLink = GetMerchantItemLink(shopIndex)
        local itemId = CustomExtractItemId(itemLink)
        
        if(itemId == data.item) then
            purchaseIndex = shopIndex
            availableStock = select(5, GetMerchantItemInfo(shopIndex))
            break
        end
    end
    
    if(purchaseIndex == nil or availableStock == 0) then
        return false
    end
    
    BuyMerchantItem(purchaseIndex, data.count)
    return true
end

ScootsSpeedrun.action.purchaseItemUpToCount = function(data)
    local maxShopIndex = GetMerchantNumItems()
    local purchaseIndex = nil
    local availableStock = nil
    for shopIndex = 1, maxShopIndex do
        local itemLink = GetMerchantItemLink(shopIndex)
        local itemId = CustomExtractItemId(itemLink)
        
        if(itemId == data.item) then
            purchaseIndex = shopIndex
            availableStock = select(5, GetMerchantItemInfo(shopIndex))
            break
        end
    end
    
    if(purchaseIndex == nil or (availableStock > -1 and availableStock < data.count)) then
        return false
    end
    
    local currentCount = 0
    for bagIndex = 0, 4 do
        local bagSlots = GetContainerNumSlots(bagIndex)
        
        for slotIndex = 1, bagSlots do
            local _, itemCount, _, _, _, _, itemLink = GetContainerItemInfo(bagIndex, slotIndex)
            local itemId = CustomExtractItemId(itemLink)

            if(itemId and itemId == data.item) then
                currentCount = currentCount + itemCount
            end
        end
    end
    
    if(currentCount == data.count) then
        return false
    end
    
    local toBuy = data.count - currentCount
    
    if(toBuy == 0 or (availableStock > -1 and availableStock < toBuy)) then
        return false
    end
    
    BuyMerchantItem(purchaseIndex, toBuy)
    return true
end

ScootsSpeedrun.action.autoConfirm = function(popupWhich)
    for popupIndex = 1, 10 do
        local popup = _G['StaticPopup' .. popupIndex]
        
        if(popup and popup:IsVisible() and popup.which == popupWhich) then
            _G['StaticPopup' .. popupIndex .. 'Button1']:Click()
        end
    end
end

ScootsSpeedrun.action.doNothing = function()
    return true
end

-- ########### --

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

-- ########### --

ScootsSpeedrun.handleChatCommand = function(params)
    local heading = table.concat({
        '\124cff',
        '98fb98',
        ScootsSpeedrun.title,
        ' ',
        ScootsSpeedrun.version,
        '\124r',
        '\n'
    }, '')

    if(params == 'debug') then
        print(heading .. 'Debug toggled ' .. ((ScootsSpeedrun.debug and 'off') or 'on') .. '.')
        ScootsSpeedrun.debug = not ScootsSpeedrun.debug
    else
        print(heading .. 'Type "/scootsspeedrun debug" to toggle debug mode.\nDebug mode is currently ' .. ((ScootsSpeedrun.debug and 'on') or 'off') .. '.')
    end
end

SLASH_SCOOTSSPEEDRUN1 = '/scootsspeedrun'
SlashCmdList['SCOOTSSPEEDRUN'] = ScootsSpeedrun.handleChatCommand

-- ########### --

ScootsSpeedrun.frames.events:SetScript('OnEvent', ScootsSpeedrun.eventHandler)

ScootsSpeedrun.frames.events:RegisterEvent('GOSSIP_SHOW')
ScootsSpeedrun.frames.events:RegisterEvent('QUEST_GREETING')
ScootsSpeedrun.frames.events:RegisterEvent('QUEST_DETAIL')
ScootsSpeedrun.frames.events:RegisterEvent('QUEST_PROGRESS')
ScootsSpeedrun.frames.events:RegisterEvent('QUEST_COMPLETE')
ScootsSpeedrun.frames.events:RegisterEvent('CONFIRM_XP_LOSS')
ScootsSpeedrun.frames.events:RegisterEvent('MERCHANT_SHOW')
ScootsSpeedrun.frames.events:RegisterEvent('ITEM_PUSH')

for popupIndex = 1, 10 do
    local popup = _G['StaticPopup' .. popupIndex]
    if(popup) then
        popup:HookScript('OnShow', function()
            ScootsSpeedrun.eventHandler(nil, 'SCOOTSSPEEDRUN_POPUP_SHOW')
        end)
    end
end