ScootsSpeedrun.eventHandler = function(_, event, arg1, arg2)
    if(event == 'ADDON_LOADED') then
        local storage = _G['SCOOTS_SPEED_RUN_OPTIONS']
        
        if(storage ~= nil) then
            ScootsSpeedrun.storage = storage
        end
        
        ScootsSpeedrun.options.load()
        ScootsSpeedrun.options.build()
        return nil
    elseif(event == 'PLAYER_LOGOUT') then
        _G['SCOOTS_SPEED_RUN_OPTIONS'] = ScootsSpeedrun.storage
        return nil
    end
    
    if(event == 'BANKFRAME_OPENED') then
        ScootsSpeedrun.bankOpen = true
    elseif(event == 'BANKFRAME_CLOSED') then
        ScootsSpeedrun.bankOpen = false
        return nil
    end
	
	if(event == 'GOSSIP_SHOW'
	or event == 'QUEST_GREETING'
	or event == 'QUEST_DETAIL'
	or event == 'QUEST_PROGRESS'
    or event == 'QUEST_COMPLETE') then
		ScootsSpeedrun.lastQuestEvent = event
	end

    if(IsAltKeyDown()) then
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
    
    if(npcId and ScootsSpeedrun.options.get('debug')) then
        local location = GetZoneText()
        
        local npc = UnitName('npc')
        if(npc == nil) then
            npc = UnitName('target')
        end
        
        local debugString = event .. '\n' .. location .. ': ' .. locationId .. '\n' .. npc .. ': ' .. npcId
        
        local availableQuests = Custom_GetGossipQuests(1) or {}
        if(#availableQuests > 0) then
            debugString = debugString .. '\nAvailable quests: ' .. table.concat(availableQuests, ', ')
        end
        
        local activeQuests = Custom_GetGossipQuests(2) or {}
        if(#activeQuests > 0) then
            debugString = debugString .. '\nActive quests: ' .. table.concat(activeQuests, ', ')
        end
        
        ScootsSpeedrun.printDebug(debugString)
    end
    
    if(event == 'SCOOTSSPEEDRUN_POPUP_SHOW') then
        if(ScootsSpeedrun.handlePopup(arg1, locationId)) then
            return nil
        end
    end
    
    if(event == 'GOSSIP_SHOW'
    or event == 'QUEST_GREETING'
    or event == 'QUEST_DETAIL'
    or event == 'QUEST_PROGRESS'
    or event == 'QUEST_COMPLETE'
    or event == 'MERCHANT_SHOW'
    or event == 'SCOOTSSPEEDRUN_POPUP_SHOW'
    or event == 'SCOOTSSPEEDRUN_ITEM_TRACKER_UPDATE') then
        local actionPerformed = false
        ScootsSpeedrun.setCheck = nil
        
        if(npcId and ScootsSpeedrun.map[locationId] and ScootsSpeedrun.map[locationId][npcId]) then
            actionPerformed = ScootsSpeedrun.handleCharacterMap(event, ScootsSpeedrun.map[locationId][npcId])
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
    elseif(event == 'ITEM_PUSH') then
        local map = ScootsSpeedrun['onLootEvent'][arg2]
        
        if(map ~= nil) then
            ScootsSpeedrun.handleCharacterMap(event, map)
        end
    elseif(event == 'BAG_UPDATE') then
        ScootsSpeedrun.doBagUpdateAt = ScootsSpeedrun.queueTimer + 0.25
    end
    
    ScootsSpeedrun.processRegisteredEvents(event)
end

ScootsSpeedrun.handleCharacterMap = function(event, map)
	local eventLast = ''
    
	if(event == 'SCOOTSSPEEDRUN_ITEM_TRACKER_UPDATE') then
		eventLast = ScootsSpeedrun.lastQuestEvent
	end
    
    local mapIndex
    
    for mapIndex = 1, #map do
        local basicConditionsMet = true
        
        if(map[mapIndex].action == 'dialogue-select') then
            if(not ScootsSpeedrun.isQuestShowEvent(event) or GetNumGossipOptions() < map[mapIndex].data) then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'select-available-quest') then
            if(not ScootsSpeedrun.isQuestShowEvent(event) or GetNumGossipAvailableQuests() == 0) then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'accept-quest') then
            if(event ~= 'QUEST_DETAIL' and eventLast ~= 'QUEST_DETAIL') then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'select-active-quest') then
            if(not ScootsSpeedrun.isQuestShowEvent(event) or GetNumGossipActiveQuests() == 0) then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'progress-quest') then
            if(event ~= 'QUEST_PROGRESS' and eventLast ~= 'QUEST_PROGRESS') then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'complete-quest') then
            if(event ~= 'QUEST_COMPLETE' and eventLast ~= 'QUEST_COMPLETE') then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'select-attuneable-reward-or-complete-quest') then
            if(event ~= 'QUEST_PROGRESS' and event ~= 'QUEST_COMPLETE' and eventLast ~= 'QUEST_PROGRESS' and eventLast ~= 'QUEST_COMPLETE') then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'select-fewest-owned-reward-in-set') then
            if(event ~= 'QUEST_PROGRESS' and event ~= 'QUEST_COMPLETE' and eventLast ~= 'QUEST_PROGRESS' and eventLast ~= 'QUEST_COMPLETE') then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'select-attuneable-reward') then
            if(event ~= 'QUEST_PROGRESS' and event ~= 'QUEST_COMPLETE' and eventLast ~= 'QUEST_PROGRESS' and eventLast ~= 'QUEST_COMPLETE') then
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
            
            if(map[mapIndex].conditions == nil) then
                ScootsSpeedrun.printDebug('No extra conditions')
            else
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
                    ['item-not-attuned'] = ScootsSpeedrun.condition.itemNotAttuned,
                    ['bank-is-open'] = ScootsSpeedrun.condition.bankIsOpen,
                    ['unit-has-buff'] = ScootsSpeedrun.condition.unitHasBuff,
                    ['unit-does-not-have-buff'] = ScootsSpeedrun.condition.unitDoesNotHaveBuff,
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
                            
                            if(ScootsSpeedrun.options.get('debug') ~= true) then
                                break
                            end
                        end
                    end
                end
            end
            
            if(conditionsMet) then
                local actions = {
                    ['dialogue-select'] = ScootsSpeedrun.action.dialogueSelect,
                    ['dynamic-option-dialogue-select'] = ScootsSpeedrun.action.dynamicOptionDialogueSelect,
                    ['close-gossip'] = ScootsSpeedrun.action.closeGossip,
                    ['close-merchant'] = ScootsSpeedrun.action.closeMerchant,
                    ['select-available-quest'] = ScootsSpeedrun.action.selectAvailableQuest,
                    ['select-attuneable-reward-or-complete-quest'] = ScootsSpeedrun.action.selectAttuneableRewardOrCompleteQuest,
                    ['select-fewest-owned-reward-in-set'] = ScootsSpeedrun.action.selectFewestOwnedRewardInSet,
                    ['accept-quest'] = ScootsSpeedrun.action.acceptQuest,
                    ['select-active-quest'] = ScootsSpeedrun.action.selectActiveQuest,
                    ['progress-quest'] = ScootsSpeedrun.action.progressQuest,
                    ['complete-quest'] = ScootsSpeedrun.action.completeQuest,
                    ['select-attuneable-reward'] = ScootsSpeedrun.action.selectAttuneableReward,
                    ['use-item'] = ScootsSpeedrun.action.useItemFromBag,
                    ['register-item-for-use'] = ScootsSpeedrun.action.registerItemForUseFromBag,
                    ['purchase-item'] = ScootsSpeedrun.action.purchaseItem,
                    ['purchase-item-to-count'] = ScootsSpeedrun.action.purchaseItemUpToCount,
                    ['auto-confirm'] = ScootsSpeedrun.action.autoConfirm,
                    ['dismount'] = ScootsSpeedrun.action.dismount,
                    ['withdraw-from-resource-bank'] = ScootsSpeedrun.action.withdrawFromResourceBank,
                    ['deposit-to-resource-bank'] = ScootsSpeedrun.action.depositToResourceBank,
                    ['register-callback-on-event'] = ScootsSpeedrun.action.registerCallbackOnEvent,
                    ['set-perk-option'] = ScootsSpeedrun.action.setPerkOption,
                    ['show-info-dialogue'] = ScootsSpeedrun.action.showInfoDialogue,
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

ScootsSpeedrun.buildMapFromTracker = function(event)
	local eventLast = ''
    
	if(event == 'SCOOTSSPEEDRUN_ITEM_TRACKER_UPDATE') then
		eventLast = ScootsSpeedrun.lastQuestEvent
	end
    
    if(event == 'QUEST_PROGRESS' or eventLast == 'QUEST_PROGRESS') then
        local questId = Custom_GetGossipQuests(3)
        
        return {
            {
                ['action'] = 'progress-quest',
                ['data'] = questId,
                ['conditions'] = {
                    {
                        ['type'] = 'unit-does-not-have-buff',
                        ['data'] = {
                            ['unit'] = 'Player',
                            ['id'] = 80795, -- Quest Auto Complete Token
                        },
                    },
                },
            },
        }
    elseif(event == 'QUEST_COMPLETE' or eventLast == 'QUEST_COMPLETE') then
        local questId = Custom_GetGossipQuests(3)
        
        return {
            {
                ['action'] = 'select-attuneable-reward-or-complete-quest',
                ['data'] = questId,
                ['conditions'] = {
                    {
                        ['type'] = 'unit-does-not-have-buff',
                        ['data'] = {
                            ['unit'] = 'Player',
                            ['id'] = 80795, -- Quest Auto Complete Token
                        },
                    },
                },
            },
            {
                ['action'] = 'show-info-dialogue',
                ['data'] = {
                    ['text'] = 'WARNING\n\nHanding in this quest will consume a Quest Auto-Complete Token!',
                    ['button'] = 'Okay',
                    ['stop'] = false,
                },
                ['conditions'] = {
                    {
                        ['type'] = 'unit-has-buff',
                        ['data'] = {
                            ['unit'] = 'Player',
                            ['id'] = 80795, -- Quest Auto Complete Token
                        },
                    },
                },
            },
            {
                ['action'] = 'select-attuneable-reward',
                ['data'] = questId,
            },
        }
    elseif(event == 'QUEST_DETAIL' or eventLast == 'QUEST_DETAIL') then
        local questId = Custom_GetGossipQuests(3)
        
        if(ScootsSpeedrun.questsFromTracker[questId] == true or ScootsSpeedrun.extraQuests[questId] == true) then
            return {
                {
                    ['action'] = 'accept-quest',
                    ['data'] = questId,
                    ['conditions'] = {
                        {
                            ['type'] = 'unit-does-not-have-buff',
                            ['data'] = {
                                ['unit'] = 'Player',
                                ['id'] = 80795, -- Quest Auto Complete Token
                            },
                        },
                    },
                },
            }
        end
    elseif(ScootsSpeedrun.isQuestShowEvent(event)) then
        local map = {}
        
        if(GetNumGossipAvailableQuests() > 0 or GetNumAvailableQuests() > 0) then
            local availableQuests = Custom_GetGossipQuests(1) or {}
            
            for questIndex = 1, #availableQuests do
                if(ScootsSpeedrun.questsFromTracker[availableQuests[questIndex]] == true or ScootsSpeedrun.extraQuests[availableQuests[questIndex]] == true) then
                    table.insert(map, {
                        ['action'] = 'select-available-quest',
                        ['data'] = availableQuests[questIndex],
                        ['conditions'] = {
                            {
                                ['type'] = 'unit-does-not-have-buff',
                                ['data'] = {
                                    ['unit'] = 'Player',
                                    ['id'] = 80795, -- Quest Auto Complete Token
                                },
                            },
                        },
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

ScootsSpeedrun.applyAutoQuestAttuneables = function()
    for _, data in pairs(ScootsSpeedrun.extraQuestsAttuneables) do
        for _, itemId in pairs(data.items) do
            if(CanAttuneItemHelper(itemId) > 0 and GetItemAttuneForge(itemId) < 0) then
                for _, questId in pairs(data.quests) do
                    ScootsSpeedrun.extraQuests[questId] = true
                end
                
                break
            end
        end
    end
end

-- ########### --

ScootsSpeedrun.pushQueuedEvent = function(timeout, callback)
    table.insert(ScootsSpeedrun.queuedEvents, {
        ['when'] = ScootsSpeedrun.queueTimer + timeout,
        ['callback'] = callback,
    })
end

ScootsSpeedrun.queueHandler = function(_, elapsed)
    ScootsSpeedrun.queueTimer = ScootsSpeedrun.queueTimer + elapsed
    
    if(#ScootsSpeedrun.queuedEvents > 0) then
        ScootsSpeedrun.processQueuedEvents()
    end
    
    if(ScootsSpeedrun.doBagUpdateAt ~= nil and ScootsSpeedrun.doBagUpdateAt < ScootsSpeedrun.queueTimer) then
        ScootsSpeedrun.doBagUpdateAt = nil
        ScootsSpeedrun.processWatchedItems()
    end
end

ScootsSpeedrun.processQueuedEvents = function()
    local queueIndex = 1
    
    while queueIndex <= #ScootsSpeedrun.queuedEvents do
        if(ScootsSpeedrun.queuedEvents[queueIndex] and ScootsSpeedrun.queuedEvents[queueIndex].when <= ScootsSpeedrun.queueTimer) then
            ScootsSpeedrun.queuedEvents[queueIndex].callback()
            table.remove(ScootsSpeedrun.queuedEvents, queueIndex)
        else
            queueIndex = queueIndex + 1
        end
    end
end

ScootsSpeedrun.processWatchedItems = function()
    local usedItem = false
    
    for texture, items in pairs(ScootsSpeedrun.watchedItems) do
        if(items ~= nil and #items > 0) then
            for _, itemId in ipairs(items) do
                local open = ScootsSpeedrun.action.useItemFromBag(itemId, true)
                
                if(open == true) then
                    usedItem = true
                    break
                end
            end
            
            if(usedItem == true) then
                ScootsSpeedrun.watchedItems[texture] = nil
                break
            end
        end
    end
end

ScootsSpeedrun.handlePopup = function(popup, locationId)
    if(popup.which == 'DEATH') then
        if(ScootsSpeedrun.options.get('auto-release') and locationId ~= 4812) then -- 4812 = Icecrown Citadel
            RepopMe()
        end
        
        return true
    elseif(popup.which == 'XP_LOSS') then
        AcceptXPLoss()
        return true
    end
    
    return false
end

ScootsSpeedrun.processRegisteredEvents = function(event)
    if(ScootsSpeedrun.registeredEvents[event] and #ScootsSpeedrun.registeredEvents[event] > 0) then
        ScootsSpeedrun.printDebug('Processing ' .. tostring(#ScootsSpeedrun.registeredEvents[event]) .. ' callbacks for event ' .. event)
        
        for _, callback in ipairs(ScootsSpeedrun.registeredEvents[event]) do
            callback()
        end
        
        ScootsSpeedrun.registeredEvents[event] = nil
    end
end

ScootsSpeedrun.isQuestShowEvent = function(event)
    return (event == 'GOSSIP_SHOW' or event == 'QUEST_GREETING' or event == 'SCOOTSSPEEDRUN_ITEM_TRACKER_UPDATE')
end

ScootsSpeedrun.printDebug = function(message, force)
    if(ScootsSpeedrun.options.get('debug') or force) then
        print('\124cff' .. '98fb98' .. ScootsSpeedrun.title .. '\124r' .. ' DEBUG: \n' .. message)
    end
end

ScootsSpeedrun.printError = function(message)
    print('\124cff' .. '98fb98' .. ScootsSpeedrun.title .. '\124r' .. '\124cff' .. 'fc4903' .. ' ERROR: \n' .. message .. '\124r')
end

-- ########### --

SLASH_SCOOTSSPEEDRUN1 = '/scootsspeedrun'
SlashCmdList['SCOOTSSPEEDRUN'] = ScootsSpeedrun.options.open

-- ########### --

ChatFrame_AddMessageEventFilter('CHAT_MSG_SYSTEM', function(_, _, message)
    if(message == 'You are not mounted so you can\'t dismount.') then -- There doesn't appear to be a constant for this string for some reason
        return true
    end
end)

-- ########### --

ScootsSpeedrun.frames.events:SetScript('OnEvent', ScootsSpeedrun.eventHandler)
ScootsSpeedrun.frames.events:SetScript('OnUpdate', ScootsSpeedrun.queueHandler)

ScootsSpeedrun.frames.events:RegisterEvent('GOSSIP_SHOW')
ScootsSpeedrun.frames.events:RegisterEvent('QUEST_GREETING')
ScootsSpeedrun.frames.events:RegisterEvent('QUEST_DETAIL')
ScootsSpeedrun.frames.events:RegisterEvent('QUEST_PROGRESS')
ScootsSpeedrun.frames.events:RegisterEvent('QUEST_COMPLETE')
ScootsSpeedrun.frames.events:RegisterEvent('MERCHANT_SHOW')
ScootsSpeedrun.frames.events:RegisterEvent('MERCHANT_CLOSED')
ScootsSpeedrun.frames.events:RegisterEvent('ITEM_PUSH')
ScootsSpeedrun.frames.events:RegisterEvent('BAG_UPDATE')
ScootsSpeedrun.frames.events:RegisterEvent('BANKFRAME_OPENED')
ScootsSpeedrun.frames.events:RegisterEvent('BANKFRAME_CLOSED')
ScootsSpeedrun.frames.events:RegisterEvent('ADDON_LOADED')
ScootsSpeedrun.frames.events:RegisterEvent('PLAYER_LOGOUT')

for popupIndex = 1, 10 do
    local popup = _G['StaticPopup' .. popupIndex]
    if(popup) then
        popup:HookScript('OnShow', function()
            ScootsSpeedrun.eventHandler(nil, 'SCOOTSSPEEDRUN_POPUP_SHOW', popup)
        end)
    end
end

function ScootsSpeedrun__init()
    ScootsSpeedrun.applyAutoQuestAttuneables()
    
    if(ITEMHUNT_UPDATE_INTERVAL and ITEMHUNT_UPDATE_INTERVAL > 0.2) then
        ITEMHUNT_UPDATE_INTERVAL = 0.2
    end

    local original_itemHuntHook = __itemHuntHook
    
    __itemHuntHook = function()
        ScootsSpeedrun.updateTrackerQuestCache()
        ScootsSpeedrun.eventHandler(nil, 'SCOOTSSPEEDRUN_ITEM_TRACKER_UPDATE')
        
        if(original_itemHuntHook) then
            original_itemHuntHook()
        end
    end
end

SynastriaSafeInvoke('ScootsSpeedrun__init')