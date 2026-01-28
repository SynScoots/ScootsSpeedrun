ScootsSpeedrun = {
    ['version'] = '2.14.0',
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
    ['options'] = {
        ['autoRelease'] = false,
    },
    ['queuedEvents'] = {},
    ['queueTimer'] = 0,
    ['watchedItems'] = {},
    ['doBagUpdateAt'] = nil,
}

-- ########### --

ScootsSpeedrun.eventHandler = function(_, event, arg1, arg2)
    if(event == 'ADDON_LOADED') then
        if(_G['SCOOTS_SPEED_RUN_OPTIONS'] ~= nil) then
            for key, _ in pairs(ScootsSpeedrun.options) do
                if(_G['SCOOTS_SPEED_RUN_OPTIONS'][key] ~= nil) then
                    ScootsSpeedrun.options[key] = _G['SCOOTS_SPEED_RUN_OPTIONS'][key]
                end
            end
        end
        
        return nil
    elseif(event == 'PLAYER_LOGOUT') then
        _G['SCOOTS_SPEED_RUN_OPTIONS'] = ScootsSpeedrun.options
        return nil
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
    
    if(npcId and ScootsSpeedrun.options.debug) then
        local location = GetZoneText()
        
        local npc = UnitName('npc')
        if(npc == nil) then
            npc = UnitName('target')
        end
        
        ScootsSpeedrun.printDebug(event .. '\n' .. location .. ': ' .. locationId .. '\n' .. npc .. ': ' .. npcId)
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
    or event == 'SCOOTSSPEEDRUN_POPUP_SHOW') then
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
end

ScootsSpeedrun.printDebug = function(message, force)
    if(ScootsSpeedrun.options.debug or force) then
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
        elseif(map[mapIndex].action == 'select-attuneable-reward-or-complete-quest') then
            if(event ~= 'QUEST_PROGRESS' and event ~= 'QUEST_COMPLETE') then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'select-fewest-owned-reward-in-set') then
            if(event ~= 'QUEST_PROGRESS' and event ~= 'QUEST_COMPLETE') then
                basicConditionsMet = false
            end
        elseif(map[mapIndex].action == 'select-attuneable-reward') then
            if(event ~= 'QUEST_PROGRESS' and event ~= 'QUEST_COMPLETE') then
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
                            
                            if(ScootsSpeedrun.options.debug ~= true) then
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
        if(ScootsSpeedrun.options.autoRelease and locationId ~= 4812) then -- 4812 = Icecrown Citadel
            RepopMe()
        end
        
        return true
    elseif(popup.which == 'XP_LOSS') then
        AcceptXPLoss()
        return true
    end
    
    return false
end

-- ########### --#

ScootsSpeedrun.handleChatCommand = function(params)
    local header = '\124cff' .. '98fb98' .. ScootsSpeedrun.title .. ' ' .. ScootsSpeedrun.version .. '\124r'
    local output = {}
    
    if(params ~= nil and params == 'auto-release') then
        ScootsSpeedrun.options.autoRelease = not ScootsSpeedrun.options.autoRelease
        table.insert(output, header)
        table.insert(output, table.concat({
            'Auto-release toggled ',
            '\124cff',
            '9898fb',
            ((ScootsSpeedrun.options.autoRelease and 'on') or 'off'),
            '\124r',
        }))
    elseif(params ~= nil and params == 'debug') then
        ScootsSpeedrun.options.debug = not ScootsSpeedrun.options.debug
        table.insert(output, header)
        table.insert(output, table.concat({
            'Debug mode toggled ',
            '\124cff',
            '9898fb',
            ((ScootsSpeedrun.options.debug and 'on') or 'off'),
            '\124r',
        }))
    else
        table.insert(output, header .. ' usage:\n')
        table.insert(output, table.concat({
            '\124cff',
            '98fb98',
            '/scootsspeedrun auto-release',
            '\124r',
            ' - Auto-release spirit on death (except in Icecrown Citadel) - currently ',
            '\124cff',
            '9898fb',
            ((ScootsSpeedrun.options.autoRelease and 'on') or 'off'),
            '\124r',
        }, ''))
        table.insert(output, table.concat({
            '\124cff',
            '98fb98',
            '/scootsspeedrun debug',
            '\124r',
            ' - Display debug when relevant operations performed - currently ',
            '\124cff',
            '9898fb',
            ((ScootsSpeedrun.options.debug and 'on') or 'off'),
            '\124r',
        }, ''))
    end
    
    print(table.concat(output, '\n'))
end

SLASH_SCOOTSSPEEDRUN1 = '/scootsspeedrun'
SlashCmdList['SCOOTSSPEEDRUN'] = ScootsSpeedrun.handleChatCommand

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
ScootsSpeedrun.frames.events:RegisterEvent('ITEM_PUSH')
ScootsSpeedrun.frames.events:RegisterEvent('BAG_UPDATE')
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