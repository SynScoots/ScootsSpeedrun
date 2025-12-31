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

ScootsSpeedrun.action.selectFewestOwnedRewardInSet = function(data)
    if(CustomExtractItemId == nil) then
        return false
    end

    local setCheck = {}
    for _, item in pairs(data) do
        setCheck[item] = 0
    end
    
    for bagIndex = 0, 4 do
        local bagSlots = GetContainerNumSlots(bagIndex)
            
        for slotIndex = 1, bagSlots do
            local _, itemCount, _, _, _, _, itemLink = GetContainerItemInfo(bagIndex, slotIndex)
            local itemId = CustomExtractItemId(itemLink)

            if(itemId and setCheck[itemId] ~= nil) then
                setCheck[itemId] = setCheck[itemId] + itemCount
            end
        end
    end
    
    local lowest = nil
    local chooseItemId = nil
    for itemId, count in pairs(setCheck) do
        if(lowest == nil or count < lowest) then
            lowest = count
            chooseItemId = itemId
        end
    end

    local numRewards = GetNumQuestChoices()
    if(numRewards == 0) then
        return false
    end
    
    for rewardIndex = 1, numRewards do
        local itemId = CustomExtractItemId(GetQuestItemLink('choice', rewardIndex))
        
        if(itemId == chooseItemId) then
            _G['QuestInfoItem' .. rewardIndex]:Click()
            return false
        end
    end
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

ScootsSpeedrun.action.dismount = function()
    if(GetPerkOption ~= nil and TogglePerkOption ~= nil) then
        if(GetPerkOption('Automatic Mount', 'Disabled') == nil) then
            TogglePerkOption('Automatic Mount', 'Disabled', false)
            
            ScootsSpeedrun.pushQueuedEvent(2, function()
                TogglePerkOption('Automatic Mount', 'Disabled', false)
            end)
        end
    end

    Dismount()
    
    return false
end

ScootsSpeedrun.action.doNothing = function()
    return true
end