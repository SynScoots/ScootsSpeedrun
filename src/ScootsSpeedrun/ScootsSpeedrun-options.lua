local options

options = {
    ['defaultOptions'] = {
        ['auto-release'] = false,
        ['include-free-quests'] = false,
        ['include-event-quests'] = false,
        ['auto-quest-start-items'] = true,
        ['auto-use-items'] = true,
        ['debug'] = false,
        
        ['toc5-3options'] = 'do-nothing',
        ['toc5-2options'] = 'dialogue-2',
        
        ['vh-8options'] = 'do-nothing',
        ['vh-7options'] = 'do-nothing',
    },
    ['load'] = function()
        ScootsSpeedrun.storage.options = ScootsSpeedrun.storage.options or {}
        
        local appliedOptions = {}
        
        for key, _ in pairs(options.defaultOptions) do
            if(ScootsSpeedrun.storage.options[key] ~= nil) then
                appliedOptions[key] = ScootsSpeedrun.storage.options[key]
            else
                appliedOptions[key] = options.defaultOptions[key]
            end
        end
        
        ScootsSpeedrun.storage.options = appliedOptions
    end,
    ['get'] = function(key)
        if(ScootsSpeedrun.storage == nil
        or ScootsSpeedrun.storage.options == nil) then
            return nil
        end
        
        return ScootsSpeedrun.storage.options[key]
    end,
    ['set'] = function(key, value, applyToField)
        if(ScootsSpeedrun.storage.options == nil) then
            ScootsSpeedrun.storage.options = {}
        end
        
        ScootsSpeedrun.storage.options[key] = value
        
        if(applyToField == true and options.fieldKeys and options.fieldKeys[key]) then
            options.fieldKeys[key].applyExternalValue(value)
        end
    end,
    ['open'] = function()
        if(ScootsSpeedrun.frames.options ~= nil) then
            InterfaceOptionsFrame_OpenToCategory(ScootsSpeedrun.frames.options)
        end
    end,
    ['build'] = function()
        if(ScootsSpeedrun.frames.options ~= nil) then
            return nil
        end
        
        options.optionPageDefinitions = {
            ['general'] = {
                ['framename'] = 'General',
                ['title'] = 'General options',
                ['description'] = nil,
                ['callback'] = options.defineGeneralOptions,
            },
            ['trial-of-the-champion'] = {
                ['framename'] = 'TrialOfTheChampion',
                ['title'] = 'Trial of the Champion',
                ['description'] = nil,
                ['callback'] = options.defineTrialOfTheChampionOptions,
            },
            ['violet-hold'] = {
                ['framename'] = 'VioletHold',
                ['title'] = 'Violet Hold',
                ['description'] = nil,
                ['callback'] = options.defineVioletHoldOptions,
            },
        }
        
        ScootsSpeedrun.frames.options = {}
        options.fieldKeys = {}
        ScootsSpeedrun.frames.options.main = ScootsLibOptions.core.createOptionsInterface(
            ScootsSpeedrun.frames.options,
            options.fieldKeys,
            {
                ['framename'] = 'ScootsSpeedrun-Options',
                ['title'] = ScootsSpeedrun.title,
                ['version'] = ScootsSpeedrun.version,
                ['optionGetCallback'] = options.get,
                ['optionChangeCallback'] = function(pageKey, fieldKey, value)
                    options.set(fieldKey, value)
                end,
            },
            options.optionPageDefinitions,
            function()
                ScootsSpeedrun.frames.options.menuLinks.general.select()
                ScootsSpeedrun.frames.options.contentHolder.setActiveChild(ScootsSpeedrun.frames.options.optionPages.general)
                options.sortMenuLinks()
            end
        )
    end,
    ['sortMenuLinks'] = function()
        local height = 8
        local prevLink
        
        for _, key in ipairs({
            'general',
            'trial-of-the-champion',
            'violet-hold',
        }) do
            local menuLink = ScootsSpeedrun.frames.options.menuLinks[key]
            
            if(prevLink == nil) then
                menuLink:SetPoint('TOPLEFT', ScootsSpeedrun.frames.options.menuScrollChild, 'TOPLEFT', 0, -8)
            else
                menuLink:SetPoint('TOPLEFT', prevLink, 'BOTTOMLEFT', 0, 0)
            end
            
            height = height + menuLink:GetHeight()
            prevLink = menuLink
        end
        
        ScootsSpeedrun.frames.options.menuScrollChild:SetHeight(height)
    end,
    ['defineGeneralOptions'] = function()
        return {
            {
                ['key'] = 'auto-release',
                ['type'] = 'checkbox',
                ['framename'] = 'AutoRelease',
                ['label'] = 'Auto-release spirit on death',
                ['tooltip'] = 'With this option enabled, you will instantly release spirit when you die.\n\nThis functionality is disabled when in Icecrown Citadel.',
            },
            {
                ['key'] = 'include-free-quests',
                ['type'] = 'checkbox',
                ['framename'] = 'IncludeFreeQuests',
                ['label'] = 'Include "free quests"',
                ['tooltip'] = 'Adds quests which are just "go here, talk to this person" to the auto-quest-pickup function.',
                ['callback'] = function(pageKey, fieldKey, value)
                    if(value) then
                        ScootsSpeedrun.applyAutoQuestFreeQuests()
                        StaticPopup_Hide('SCOOTSSPEEDRUN_OPTION_CONFIRM')
                    else
                        ScootsSpeedrun.action.showConfirmDialogue({
                            ['key'] = 'SCOOTSSPEEDRUN_OPTION_CONFIRM',
                            ['text'] = 'Disabling this option requires you to reload the UI to take effect.\n\nDo you wish to reload the UI now?',
                            ['confirmButton'] = 'Yes',
                            ['cancelButton'] = 'No',
                            ['onConfirm'] = ReloadUI,
                        })
                    end
                end,
            },
            {
                ['key'] = 'include-event-quests',
                ['type'] = 'checkbox',
                ['framename'] = 'IncludeEventQuests',
                ['label'] = 'Include event quests',
                ['tooltip'] = 'Adds quests for the Midsummer Festival, Lunar Festival, Love is in the Air, and Hallows End events to the auto-quest-pickup function.',
                ['callback'] = function(pageKey, fieldKey, value)
                    if(value) then
                        ScootsSpeedrun.applyAutoQuestEventQuests()
                        StaticPopup_Hide('SCOOTSSPEEDRUN_OPTION_CONFIRM')
                    else
                        ScootsSpeedrun.action.showConfirmDialogue({
                            ['key'] = 'SCOOTSSPEEDRUN_OPTION_CONFIRM',
                            ['text'] = 'Disabling this option requires you to reload the UI to take effect.\n\nDo you wish to reload the UI now?',
                            ['confirmButton'] = 'Yes',
                            ['cancelButton'] = 'No',
                            ['onConfirm'] = ReloadUI,
                        })
                    end
                end,
            },
            {
                ['key'] = 'auto-quest-start-items',
                ['type'] = 'checkbox',
                ['framename'] = 'AutoQuestStartItems',
                ['label'] = 'Apply auto-quest-pickup to items',
                ['tooltip'] = 'Automatically use quest-starting items in your bags.\n\nFollows the same logic as other auto-quest-accept behaviour.',
                ['callback'] = function(pageKey, fieldKey, value)
                    if(value) then
                        ScootsSpeedrun.processQuestStartItems()
                    else
                        ScootsSpeedrun.storage.questStartItems = nil
                    end
                end,
            },
            {
                ['key'] = 'auto-use-items',
                ['type'] = 'checkbox',
                ['framename'] = 'AutoUseItems',
                ['label'] = 'Auto-use items',
                ['tooltip'] = 'With this option enabled, certain items will automatically be used as soon as they appear in your bags.',
            },
        
            {
                ['key'] = 'debug',
                ['type'] = 'checkbox',
                ['framename'] = 'Debug',
                ['label'] = 'Debug mode',
                ['tooltip'] = 'Display debug information in chat when relevant operations performed.',
            },
        }
    end,
    ['defineTrialOfTheChampionOptions'] = function()
        return {
            {
                ['key'] = 'toc5-3options',
                ['type'] = 'radio',
                ['framename'] = '3Options',
                ['label'] = 'Dialogue choice when there are 3 options',
                ['choices'] = {
                    {
                        ['name'] = 'Do nothing',
                        ['value'] = 'do-nothing',
                    },
                    {
                        ['name'] = 'Select choice 1',
                        ['value'] = 'dialogue-1',
                    },
                    {
                        ['name'] = 'Select choice 2',
                        ['value'] = 'dialogue-2',
                    },
                    {
                        ['name'] = 'Select choice 3',
                        ['value'] = 'dialogue-3',
                    },
                },
            },
            {
                ['key'] = 'toc-info',
                ['type'] = 'group',
                ['framename'] = 'Info',
                ['label'] = 'Dialogue choices',
                ['width'] = 180,
                ['customPosition'] = {'TOPRIGHT', 'TOPRIGHT', 0, 0},
                ['callback'] = function(group, header)
                    local height = 10
                    
                    group.text = group:CreateFontString(nil, 'OVERLAY', 'GameFontNormalSmall')
                    group.text:SetPoint('TOPLEFT', header, 'BOTTOMLEFT', 0, -10)
                    group.text:SetWidth(160)
                    group.text:SetJustifyH('LEFT')
                    group.text:SetWordWrap(true)
                    group.text:SetText(table.concat({
                        'The first choice will be to start the encounter normally.',
                        'If you have at least a 30 speed buff, then the next choice will be to start the encounter, skipping the opening jousting.',
                        'If you have unlocked the trial waves event, the next choice will be to start it.',
                    }, '\n\n'))
                    
                    height = height + group.text:GetHeight() 
                    
                    return height + 10
                end,
            },
            {
                ['key'] = 'toc5-2options',
                ['type'] = 'radio',
                ['framename'] = '2Options',
                ['label'] = 'Dialogue choice when there are 2 options',
                ['choices'] = {
                    {
                        ['name'] = 'Do nothing',
                        ['value'] = 'do-nothing',
                    },
                    {
                        ['name'] = 'Select choice 1',
                        ['value'] = 'dialogue-1',
                    },
                    {
                        ['name'] = 'Select choice 2',
                        ['value'] = 'dialogue-2',
                    },
                },
            },
        }
    end,
    ['defineVioletHoldOptions'] = function()
        return {
            {
                ['key'] = 'vh-8options',
                ['type'] = 'radio',
                ['framename'] = '8Options',
                ['label'] = 'Dialogue choice when there are 8 options',
                ['choices'] = {
                    {
                        ['name'] = 'Do nothing',
                        ['value'] = 'do-nothing',
                    },
                    {
                        ['name'] = 'Select choice 2',
                        ['value'] = 'dialogue-2',
                    },
                    {
                        ['name'] = 'Select choice 3',
                        ['value'] = 'dialogue-3',
                    },
                    {
                        ['name'] = 'Select choice 4',
                        ['value'] = 'dialogue-4',
                    },
                    {
                        ['name'] = 'Select choice 5',
                        ['value'] = 'dialogue-5',
                    },
                    {
                        ['name'] = 'Select choice 6',
                        ['value'] = 'dialogue-6',
                    },
                    {
                        ['name'] = 'Select choice 7',
                        ['value'] = 'dialogue-7',
                    },
                    {
                        ['name'] = 'Select choice 8',
                        ['value'] = 'dialogue-8',
                    },
                },
            },
            {
                ['key'] = 'vh-info',
                ['type'] = 'group',
                ['framename'] = 'Info',
                ['label'] = 'Dialogue choices',
                ['width'] = 180,
                ['customPosition'] = {'TOPRIGHT', 'TOPRIGHT', 0, 0},
                ['callback'] = function(group, header)
                    local height = 10
                    
                    group.text = group:CreateFontString(nil, 'OVERLAY', 'GameFontNormalSmall')
                    group.text:SetPoint('TOPLEFT', header, 'BOTTOMLEFT', 0, -10)
                    group.text:SetJustifyH('LEFT')
                    group.text:SetText(table.concat({
                        '1. Lore dump',
                        '2. Start encounter normally',
                        '3. Select Moragg',
                        '4. Select Erekem',
                        '5. Select Ichoron',
                        '6. Select Lavanthor',
                        '7. Select Xevozz',
                        '8. Select Zuramat',
                    }, '\n'))
                    
                    height = height + group.text:GetHeight() 
                    
                    return height + 10
                end,
            },
            {
                ['key'] = 'vh-7options',
                ['type'] = 'radio',
                ['framename'] = '7Options',
                ['label'] = 'Dialogue choice when there are 7 options',
                ['choices'] = {
                    {
                        ['name'] = 'Do nothing',
                        ['value'] = 'do-nothing',
                    },
                    {
                        ['name'] = 'Select choice 2',
                        ['value'] = 'dialogue-2',
                    },
                    {
                        ['name'] = 'Select choice 3',
                        ['value'] = 'dialogue-3',
                    },
                    {
                        ['name'] = 'Select choice 4',
                        ['value'] = 'dialogue-4',
                    },
                    {
                        ['name'] = 'Select choice 5',
                        ['value'] = 'dialogue-5',
                    },
                    {
                        ['name'] = 'Select choice 6',
                        ['value'] = 'dialogue-6',
                    },
                    {
                        ['name'] = 'Select choice 7',
                        ['value'] = 'dialogue-7',
                    },
                },
            },
            {
                ['key'] = 'vh-info-2',
                ['type'] = 'group',
                ['framename'] = 'Info2',
                ['width'] = 180,
                ['customPosition'] = {'TOPRIGHT', 'TOPRIGHT', 0, 0},
                ['callback'] = function(group)
                    local height = 10
                    
                    group.text = group:CreateFontString(nil, 'OVERLAY', 'GameFontNormalSmall')
                    group.text:SetPoint('TOPLEFT', group, 'TOPLEFT', 10, -10)
                    group.text:SetWidth(160)
                    group.text:SetJustifyH('LEFT')
                    group.text:SetWordWrap(true)
                    group.text:SetText('After first boss is chosen, choices that come after that boss will move up by 1.')
                    
                    height = height + group.text:GetHeight() 
                    
                    return height + 10
                end,
            },
        }
    end,
}

ScootsSpeedrun.options = options