ScootsSpeedrun.action = {
    ['dialogueSelect'] = function(dialogueIndex)
        SelectGossipOption(dialogueIndex)
        return true
    end,
    ['dynamicOptionDialogueSelect'] = function(optionName)
        local choice = tostring(ScootsSpeedrun.options.get(optionName)):match('^dialogue%-(%d)$')
        
        if(choice ~= nil) then
            return ScootsSpeedrun.action.dialogueSelect(tonumber(choice))
        end
        
        return ScootsSpeedrun.action.doNothing()
    end,
    ['closeGossip'] = function()
        CloseGossip()
        return true
    end,
    ['closeMerchant'] = function()
        CloseMerchant()
        return true
    end,
    ['selectAvailableQuest'] = function(selectQuestId)
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
    end,
    ['acceptQuest'] = function(questId)
        ScootsSpeedrun.printDebug('action-test : accept-quest : ' .. Custom_GetGossipQuests(3) .. ' == ' .. questId)
        
        if(Custom_GetGossipQuests(3) ~= questId) then
            return false
        end
        
        AcceptQuest()
        return true
    end,
    ['selectActiveQuest'] = function(selectQuestId)
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
    end,
    ['progressQuest'] = function(questId)
        if(Custom_GetGossipQuests(3) == questId) then
            QuestFrameCompleteButton:Click()
            return true
        end
        
        return false
    end,
    ['completeQuest'] = function(questId)
        if(Custom_GetGossipQuests(3) == questId) then
            QuestFrameCompleteQuestButton:Click()
            return true
        end
        
        return false
    end,
    ['selectAttuneableReward'] = function(preventFollowupQueue)
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
        
        if(preventFollowupQueue ~= true) then
            ScootsSpeedrun.pushQueuedEvent(0.1, function()
                ScootsSpeedrun.action.selectAttuneableReward(true)
            end)
        end
        
        return false
    end,
    ['selectAttuneableRewardOrCompleteQuest'] = function(param)
        if(GetNumQuestChoices() > 0) then
            return ScootsSpeedrun.action.selectAttuneableReward(param)
        end
        
        local numRewards = GetNumQuestRewards()
        
        if(numRewards == 0) then
            return ScootsSpeedrun.action.completeQuest(param)
        else
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
    end,
    ['selectFewestOwnedRewardInSet'] = function(data)
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
    end,
    ['useItemFromBag'] = function(itemIdToUse, returnTrueOnSuccess)
        if(not ScootsSpeedrun.options.get('auto-use-items')) then
            return true
        end

        for bagIndex = 0, 4 do
            local bagSlots = GetContainerNumSlots(bagIndex)
            
            for slotIndex = 1, bagSlots do
                local itemLink = select(7, GetContainerItemInfo(bagIndex, slotIndex))
                local itemId = CustomExtractItemId(itemLink)

                if(itemId and itemId == itemIdToUse) then
                    UseContainerItem(bagIndex, slotIndex)
                    return (returnTrueOnSuccess == true)
                end
            end
        end
        
        return false
    end,
    ['registerItemForUseFromBag'] = function(itemId)
        if(not ScootsSpeedrun.options.get('auto-use-items')) then
            return nil
        end
        
        local texture = select(10, GetItemInfoCustom(itemId))
        
        if(ScootsSpeedrun.watchedItems[texture] == nil) then
            ScootsSpeedrun.watchedItems[texture] = {}
        end
        
        table.insert(ScootsSpeedrun.watchedItems[texture], itemId)
    end,
    ['purchaseItem'] = function(data)
        local maxShopIndex = GetMerchantNumItems()
        local purchaseIndex = nil
        local availableStock = 0
        
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
        
        BuyMerchantItem(purchaseIndex, math.min(data.count, availableStock))
        
        if(data.continue == nil or data.continue ~= true) then
            return true
        end
        
        return false
    end,
    ['purchaseItemUpToCount'] = function(data)
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
    end,
    ['autoConfirm'] = function(popupWhich)
        for popupIndex = 1, 10 do
            local popup = _G['StaticPopup' .. popupIndex]
            
            if(popup and popup:IsVisible() and popup.which == popupWhich) then
                _G['StaticPopup' .. popupIndex .. 'Button1']:Click()
            end
        end
    end,
    ['dismount'] = function()
        if(GetPerkOption('Automatic Mount', 'Disabled') == nil) then
            TogglePerkOption('Automatic Mount', 'Disabled', false)
            
            ScootsSpeedrun.pushQueuedEvent(2, function()
                TogglePerkOption('Automatic Mount', 'Disabled', false)
            end)
        end

        Dismount()
        
        return false
    end,
    ['setPerkOption'] = function(data)
        ChangePerkOption(data.perk, data.option, data.value, true)
    end,
    ['withdrawFromResourceBank'] = function(itemId)
        local frame = _G['RBankFrame']
        local line = _G['RBankFrame-ILine-1']
        local button = _G['RBankFrame-Withdraw']
        
        if(frame and not line) then
            local oldOnUpdate = frame:GetScript('OnUpdate')
            
            frame:SetScript('OnUpdate', function(...)
                if(frame:IsVisible()) then
                    frame:Click()
                    line = _G['RBankFrame-ILine-1']
                    
                    if(line) then
                        frame:Hide()
                        frame:SetScript('OnUpdate', oldOnUpdate)
                        
                        line.ItemId = itemId
                        line:Click()
                        button:Click()
                    end
                end
                
                if(oldOnUpdate) then
                    oldOnUpdate(...)
                end
            end)
            
            frame:Show()
        elseif(frame and line and button) then
            line.ItemId = itemId
            line:Click()
            button:Click()
        end
        
        return false
    end,
    ['depositToResourceBank'] = function()
        local button = _G['RBankFrame-DepositAll']
        
        if(button) then
            button:Click()
        end
        
        return false
    end,
    ['registerCallbackOnEvent'] = function(data)
        ScootsSpeedrun.registeredEvents[data.event] = ScootsSpeedrun.registeredEvents[data.event] or {}
        
        table.insert(ScootsSpeedrun.registeredEvents[data.event], data.callback)
        
        return false
    end,
    ['showInfoDialogue'] = function(data)
        StaticPopupDialogs[data.key or 'SCOOTSSPEEDRUN_INFO'] = {
            ['text'] = data.text,
            ['button1'] = data.button,
            ['timeout'] = 0,
            ['whileDead'] = 1,
            ['hideOnEscape'] = 1,
        }
        StaticPopup_Show(data.key or 'SCOOTSSPEEDRUN_INFO')
        
        return (data.stop == true)
    end,
    ['doNothing'] = function()
        return true
    end,
    ['showConfirmDialogue'] = function(data)
        StaticPopupDialogs[data.key or 'SCOOTSSPEEDRUN_CONFIRM'] = {
            ['text'] = data.text,
            ['button1'] = data.confirmButton,
            ['button2'] = data.cancelButton,
            ['timeout'] = 0,
            ['exclusive'] = 1,
            ['whileDead'] = 1,
            ['hideOnEscape'] = 1,
            ['OnAccept'] = data.onConfirm or function() end,
            ['OnCancel'] = data.onCancel or function() end,
            ['OnHide'] = data.onCancel or function() end,
        }
        
        local dialogueFrame = StaticPopup_Show(data.key or 'SCOOTSSPEEDRUN_CONFIRM')
        local dialogueFrameStrata = dialogueFrame:GetFrameStrata()
        
        dialogueFrame:SetFrameStrata('TOOLTIP')
        
        local hideHook = function()
            dialogueFrame:SetFrameStrata(dialogueFrameStrata)
        end
        
        dialogueFrame:HookScript('OnHide', hideHook)
        
        return (data.stop == true)
    end,
    ['doNothing'] = function()
        return true
    end
}