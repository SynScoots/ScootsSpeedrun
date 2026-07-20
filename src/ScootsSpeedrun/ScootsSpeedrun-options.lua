ScootsSpeedrun.options = {}

ScootsSpeedrun.options.load = function()
    local defaultOptions = {
        ['auto-use-items'] = true,
        ['auto-release'] = false,
        ['debug'] = false,
        ['toc5-3options'] = 'do-nothing',
        ['toc5-2options'] = 'dialogue-2',
        ['vh-8options'] = 'do-nothing',
        ['vh-7options'] = 'do-nothing',
    }
    
    ScootsSpeedrun.storage.options = ScootsSpeedrun.storage.options or {}
    
    local options = {}
    
    for name, defaultValue in pairs(defaultOptions) do
        options[name] = defaultValue
        
        if(ScootsSpeedrun.storage.options[name] ~= nil) then
            options[name] = ScootsSpeedrun.storage.options[name]
        else
            options[name] = defaultOptions[name]
        end
    end
    
    ScootsSpeedrun.storage.options = options
end

ScootsSpeedrun.options.get = function(optionName)
    if(ScootsSpeedrun.storage == nil
    or ScootsSpeedrun.storage.options == nil) then
        return nil
    end
    
    return ScootsSpeedrun.storage.options[optionName]
end

ScootsSpeedrun.options.set = function(optionName, optionValue)
    if(ScootsSpeedrun.storage.options == nil) then
        ScootsSpeedrun.storage.options = {}
    end
    
    ScootsSpeedrun.storage.options[optionName] = optionValue
end

ScootsSpeedrun.options.open = function()
    if(ScootsSpeedrun.frames.options ~= nil) then
        InterfaceOptionsFrame_OpenToCategory(ScootsSpeedrun.frames.options)
    end
end

ScootsSpeedrun.options.build = function()
    if(ScootsSpeedrun.frames.options ~= nil) then
        return nil
    end
    
    InterfaceOptionsFrame:SetWidth(math.max(900, InterfaceOptionsFrame:GetWidth()))
    
    ScootsSpeedrun.options.buildGeneralOptions()
    ScootsSpeedrun.options.buildVioletHoldOptions()
    ScootsSpeedrun.options.buildTocOptions()
end

ScootsSpeedrun.options.buildGeneralOptions = function()
    ScootsSpeedrun.frames.options = CreateFrame('Frame', 'ScootsSpeedrun-Options', UIParent)
    ScootsSpeedrun.frames.options.name = ScootsSpeedrun.title
    InterfaceOptions_AddCategory(ScootsSpeedrun.frames.options)
    
    ScootsSpeedrun.frames.options:HookScript('OnShow', function()
        if(ScootsSpeedrun.options.builtGeneral ~= nil) then
            return nil
        end
        
        ScootsSpeedrun.frames.optionsScrollFrame = CreateFrame('ScrollFrame', 'ScootsSpeedrun-Options-ScrollFrame', ScootsSpeedrun.frames.options, 'UIPanelScrollFrameTemplate')
        ScootsSpeedrun.frames.optionsScrollFrame:SetWidth(663)
    
        ScootsSpeedrun.frames.optionsScrollChild = CreateFrame('Frame', 'ScootsSpeedrun-Options-ScrollChild', ScootsSpeedrun.frames.optionsScrollFrame)
        ScootsSpeedrun.frames.optionsScrollChild:SetWidth(ScootsSpeedrun.frames.optionsScrollFrame:GetWidth())
        
        local scrollBarName = ScootsSpeedrun.frames.optionsScrollFrame:GetName()
        local scrollBar = _G[scrollBarName .. 'ScrollBar']
        local scrollUpButton = _G[scrollBarName .. 'ScrollBarScrollUpButton']
        local scrollDownButton = _G[scrollBarName .. 'ScrollBarScrollDownButton']

        scrollUpButton:ClearAllPoints()
        scrollUpButton:SetPoint('TOPRIGHT', ScootsSpeedrun.frames.optionsScrollFrame, 'TOPRIGHT', -2, -2)

        scrollDownButton:ClearAllPoints()
        scrollDownButton:SetPoint('BOTTOMRIGHT', ScootsSpeedrun.frames.optionsScrollFrame, 'BOTTOMRIGHT', -2, 2)

        scrollBar:ClearAllPoints()
        scrollBar:SetPoint('TOP', scrollUpButton, 'BOTTOM', 0, -2)
        scrollBar:SetPoint('BOTTOM', scrollDownButton, 'TOP', 0, 2)

        ScootsSpeedrun.frames.optionsScrollFrame:SetScrollChild(ScootsSpeedrun.frames.optionsScrollChild)
        ScootsSpeedrun.frames.optionsScrollFrame:SetPoint('TOPLEFT', ScootsSpeedrun.frames.options, 'TOPLEFT', 0, -5)
        ScootsSpeedrun.frames.optionsScrollFrame:SetHeight(419)
        
        local height = 0
        
        --
        
        ScootsSpeedrun.frames.optionsScrollChild.titleText = ScootsSpeedrun.frames.optionsScrollChild:CreateFontString(nil, 'OVERLAY', 'GameFontNormalLarge')
        ScootsSpeedrun.frames.optionsScrollChild.titleText:SetPoint('TOPLEFT', ScootsSpeedrun.frames.optionsScrollChild, 'TOPLEFT', 16, -10)
        ScootsSpeedrun.frames.optionsScrollChild.titleText:SetText(ScootsSpeedrun.title)
    
        ScootsSpeedrun.frames.optionsScrollChild.versionText = ScootsSpeedrun.frames.optionsScrollChild:CreateFontString(nil, 'OVERLAY', 'GameFontHighlight')
        ScootsSpeedrun.frames.optionsScrollChild.versionText:SetPoint('BOTTOMLEFT', ScootsSpeedrun.frames.optionsScrollChild.titleText, 'BOTTOMRIGHT', 5, 1)
        ScootsSpeedrun.frames.optionsScrollChild.versionText:SetText(ScootsSpeedrun.version)
        ScootsSpeedrun.frames.optionsScrollChild.versionText:SetTextColor(0.6, 0.98, 0.6)
        
        height = height + ScootsSpeedrun.frames.optionsScrollChild.titleText:GetHeight()
        
        --
        
        ScootsSpeedrun.frames.optionAutoUseItems = ScootsSpeedrun.options.insertOptionsCheckbox({
            ['framename'] = 'ScootsSpeedrun-Options-AutoUseItems',
            ['parent'] = ScootsSpeedrun.frames.optionsScrollChild,
            ['prior'] = ScootsSpeedrun.frames.optionsScrollChild.titleText,
            ['offset'] = -10,
            ['name'] = 'Auto-use items',
            ['defaultState'] = ScootsSpeedrun.options.get('auto-use-items'),
            ['tooltip'] = 'With this option enabled, certain items will automatically be used as soon as they appear in your bags.',
            ['onClickEvent'] = function(self)
                ScootsSpeedrun.options.set('auto-use-items', (self:GetChecked() and true) or false)
            end,
        })
        
        height = height + ScootsSpeedrun.frames.optionAutoUseItems:GetHeight() + 5
        
        --
        
        ScootsSpeedrun.frames.optionAutoRelease = ScootsSpeedrun.options.insertOptionsCheckbox({
            ['framename'] = 'ScootsSpeedrun-Options-AutoRelease',
            ['parent'] = ScootsSpeedrun.frames.optionsScrollChild,
            ['prior'] = ScootsSpeedrun.frames.optionAutoUseItems,
            ['offset'] = -5,
            ['name'] = 'Auto-release spirit on death',
            ['defaultState'] = ScootsSpeedrun.options.get('auto-release'),
            ['tooltip'] = 'With this option enabled, you will instantly release spirit when you die.\n\nThis functionality is disabled when in Icecrown Citadel.',
            ['onClickEvent'] = function(self)
                ScootsSpeedrun.options.set('auto-release', (self:GetChecked() and true) or false)
            end,
        })
        
        height = height + ScootsSpeedrun.frames.optionAutoRelease:GetHeight() + 5
        
        --
        
        ScootsSpeedrun.frames.optionDebug = ScootsSpeedrun.options.insertOptionsCheckbox({
            ['framename'] = 'ScootsSpeedrun-Options-Debug',
            ['parent'] = ScootsSpeedrun.frames.optionsScrollChild,
            ['prior'] = ScootsSpeedrun.frames.optionAutoRelease,
            ['offset'] = -5,
            ['name'] = 'Debug mode',
            ['defaultState'] = ScootsSpeedrun.options.get('debug'),
            ['tooltip'] = 'Display debug information in chat when relevant operations performed.',
            ['onClickEvent'] = function(self)
                ScootsSpeedrun.options.set('debug', (self:GetChecked() and true) or false)
            end,
        })
        
        height = height + ScootsSpeedrun.frames.optionDebug:GetHeight() + 5
        
        --
    
        ScootsSpeedrun.frames.optionsScrollChild:SetHeight(height)
        
        if(height <= ScootsSpeedrun.frames.optionsScrollFrame:GetHeight()) then
            scrollBar:Hide()
        else
            scrollBar:Show()
        end
        
        ScootsSpeedrun.options.builtGeneral = true
    end)
end

ScootsSpeedrun.options.buildVioletHoldOptions = function()
    ScootsSpeedrun.frames.violetHoldOptions = CreateFrame('Frame', 'ScootsSpeedrun-Options-VioletHold', UIParent)
    ScootsSpeedrun.frames.violetHoldOptions.parent = ScootsSpeedrun.title
    ScootsSpeedrun.frames.violetHoldOptions.name = 'Violet Hold'
    InterfaceOptions_AddCategory(ScootsSpeedrun.frames.violetHoldOptions)
    
    ScootsSpeedrun.frames.violetHoldOptions:HookScript('OnShow', function()
        if(ScootsSpeedrun.options.builtVioletHold ~= nil) then
            return nil
        end
        
        ScootsSpeedrun.frames.violetHoldOptionsScrollFrame = CreateFrame('ScrollFrame', 'ScootsSpeedrun-Options-VioletHold-ScrollFrame', ScootsSpeedrun.frames.violetHoldOptions, 'UIPanelScrollFrameTemplate')
        ScootsSpeedrun.frames.violetHoldOptionsScrollFrame:SetWidth(663)
    
        ScootsSpeedrun.frames.violetHoldOptionsScrollChild = CreateFrame('Frame', 'ScootsSpeedrun-Options-VioletHold-ScrollChild', ScootsSpeedrun.frames.violetHoldOptionsScrollFrame)
        ScootsSpeedrun.frames.violetHoldOptionsScrollChild:SetWidth(ScootsSpeedrun.frames.violetHoldOptionsScrollFrame:GetWidth())
        
        local scrollBarName = ScootsSpeedrun.frames.violetHoldOptionsScrollFrame:GetName()
        local scrollBar = _G[scrollBarName .. 'ScrollBar']
        local scrollUpButton = _G[scrollBarName .. 'ScrollBarScrollUpButton']
        local scrollDownButton = _G[scrollBarName .. 'ScrollBarScrollDownButton']

        scrollUpButton:ClearAllPoints()
        scrollUpButton:SetPoint('TOPRIGHT', ScootsSpeedrun.frames.violetHoldOptionsScrollFrame, 'TOPRIGHT', -2, -2)

        scrollDownButton:ClearAllPoints()
        scrollDownButton:SetPoint('BOTTOMRIGHT', ScootsSpeedrun.frames.violetHoldOptionsScrollFrame, 'BOTTOMRIGHT', -2, 2)

        scrollBar:ClearAllPoints()
        scrollBar:SetPoint('TOP', scrollUpButton, 'BOTTOM', 0, -2)
        scrollBar:SetPoint('BOTTOM', scrollDownButton, 'TOP', 0, 2)

        ScootsSpeedrun.frames.violetHoldOptionsScrollFrame:SetScrollChild(ScootsSpeedrun.frames.violetHoldOptionsScrollChild)
        ScootsSpeedrun.frames.violetHoldOptionsScrollFrame:SetPoint('TOPLEFT', ScootsSpeedrun.frames.violetHoldOptions, 'TOPLEFT', 0, -5)
        ScootsSpeedrun.frames.violetHoldOptionsScrollFrame:SetHeight(419)
        
        local height = 0
        
        --
        
        ScootsSpeedrun.frames.violetHoldOptionsScrollChild.titleText = ScootsSpeedrun.frames.violetHoldOptionsScrollChild:CreateFontString(nil, 'OVERLAY', 'GameFontNormalLarge')
        ScootsSpeedrun.frames.violetHoldOptionsScrollChild.titleText:SetPoint('TOPLEFT', ScootsSpeedrun.frames.violetHoldOptionsScrollChild, 'TOPLEFT', 16, -10)
        ScootsSpeedrun.frames.violetHoldOptionsScrollChild.titleText:SetText(ScootsSpeedrun.title)
    
        ScootsSpeedrun.frames.violetHoldOptionsScrollChild.versionText = ScootsSpeedrun.frames.violetHoldOptionsScrollChild:CreateFontString(nil, 'OVERLAY', 'GameFontHighlight')
        ScootsSpeedrun.frames.violetHoldOptionsScrollChild.versionText:SetPoint('BOTTOMLEFT', ScootsSpeedrun.frames.violetHoldOptionsScrollChild.titleText, 'BOTTOMRIGHT', 5, 1)
        ScootsSpeedrun.frames.violetHoldOptionsScrollChild.versionText:SetText(ScootsSpeedrun.version)
        ScootsSpeedrun.frames.violetHoldOptionsScrollChild.versionText:SetTextColor(0.6, 0.98, 0.6)
        
        height = height + ScootsSpeedrun.frames.violetHoldOptionsScrollChild.titleText:GetHeight()
        
        --
        
        ScootsSpeedrun.frames.violetHoldOptionsScrollChild.subTitle = ScootsSpeedrun.frames.violetHoldOptionsScrollChild:CreateFontString(nil, 'OVERLAY', 'GameFontHighlight')
        ScootsSpeedrun.frames.violetHoldOptionsScrollChild.subTitle:SetPoint('TOPLEFT', ScootsSpeedrun.frames.violetHoldOptionsScrollChild.titleText, 'BOTTOMLEFT', 0, -2)
        ScootsSpeedrun.frames.violetHoldOptionsScrollChild.subTitle:SetText('Violet Hold choice selection')
        
        height = height + ScootsSpeedrun.frames.violetHoldOptionsScrollChild.subTitle:GetHeight()
        
        -- ######### --
        
        local groupHeight
        ScootsSpeedrun.frames.violetHold8Options, groupHeight = ScootsSpeedrun.options.insertOptionsGroup({
            ['framename'] = 'ScootsSpeedrun-Options-VioletHold8Options',
            ['parent'] = ScootsSpeedrun.frames.violetHoldOptionsScrollChild,
            ['width'] = 310,
            ['title'] = 'Dialogue choice when there are 8 options',
        })
        
        ScootsSpeedrun.frames.violetHold8Options:SetPoint('TOPLEFT', ScootsSpeedrun.frames.violetHoldOptionsScrollChild.subTitle, 'BOTTOMLEFT', 0, -10)
        
        --
        
        _, ScootsSpeedrun.frames.violetHold8OptionsCheckboxes = ScootsSpeedrun.options.insertOptionsRadio({
            ['framenameprefix'] = 'ScootsSpeedrun-Options-VioletHold8Options-',
            ['parent'] = ScootsSpeedrun.frames.violetHold8Options,
            ['prior'] = ScootsSpeedrun.frames.violetHold8Options.title,
            ['offset'] = -5,
            ['internalOffset'] = 5,
            ['onClickEvent'] = function(choice)
                ScootsSpeedrun.options.set('vh-8options', choice.value)
            end,
            ['choices'] = {
                {
                    ['framenamesuffix'] = 'DoNothing',
                    ['name'] = 'Do nothing',
                    ['value'] = 'do-nothing',
                },
                {
                    ['framenamesuffix'] = 'Choice2',
                    ['name'] = 'Select choice 2',
                    ['value'] = 'dialogue-2',
                },
                {
                    ['framenamesuffix'] = 'Choice3',
                    ['name'] = 'Select choice 3',
                    ['value'] = 'dialogue-3',
                },
                {
                    ['framenamesuffix'] = 'Choice4',
                    ['name'] = 'Select choice 4',
                    ['value'] = 'dialogue-4',
                },
                {
                    ['framenamesuffix'] = 'Choice5',
                    ['name'] = 'Select choice 5',
                    ['value'] = 'dialogue-5',
                },
                {
                    ['framenamesuffix'] = 'Choice6',
                    ['name'] = 'Select choice 6',
                    ['value'] = 'dialogue-6',
                },
                {
                    ['framenamesuffix'] = 'Choice7',
                    ['name'] = 'Select choice 7',
                    ['value'] = 'dialogue-7',
                },
                {
                    ['framenamesuffix'] = 'Choice8',
                    ['name'] = 'Select choice 8',
                    ['value'] = 'dialogue-8',
                },
            },
            ['defaultState'] = ScootsSpeedrun.options.get('vh-8options'),
        })
        
        for checkboxIndex, checkbox in pairs(ScootsSpeedrun.frames.violetHold8OptionsCheckboxes) do
            groupHeight = groupHeight + checkbox:GetHeight()
            
            if(checkboxIndex > 1) then
                groupHeight = groupHeight - 5
            end
        end
        
        --
        
        ScootsSpeedrun.frames.violetHold8Options:SetHeight(groupHeight)
        height = height + groupHeight + 10
        
        -- ######### --
        
        ScootsSpeedrun.frames.violetHoldInfo, groupHeight = ScootsSpeedrun.options.insertOptionsGroup({
            ['framename'] = 'ScootsSpeedrun-Options-VioletHoldInfo',
            ['parent'] = ScootsSpeedrun.frames.violetHoldOptionsScrollChild,
            ['width'] = 310,
            ['title'] = 'Dialogue choices',
        })
        
        ScootsSpeedrun.frames.violetHoldInfo:SetPoint('TOPLEFT', ScootsSpeedrun.frames.violetHold8Options, 'TOPRIGHT', 10, 0)
        
        --
        
        ScootsSpeedrun.frames.violetHoldInfo.text = ScootsSpeedrun.frames.violetHoldInfo:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
        ScootsSpeedrun.frames.violetHoldInfo.text:SetJustifyH('LEFT')
        ScootsSpeedrun.frames.violetHoldInfo.text:SetPoint('TOPLEFT', ScootsSpeedrun.frames.violetHoldInfo.title, 'BOTTOMLEFT', 0, -10)
        ScootsSpeedrun.frames.violetHoldInfo.text:SetText(table.concat({
            '1. Lore dump',
            '2. Start encounter normally',
            '3. Select Moragg',
            '4. Select Erekem',
            '5. Select Ichoron',
            '6. Select Lavanthor',
            '7. Select Xevozz',
            '8. Select Zuramat',
        }, '\n'))
        
        groupHeight = groupHeight + ScootsSpeedrun.frames.violetHoldInfo.text:GetHeight() + 10
        ScootsSpeedrun.frames.violetHoldInfo:SetHeight(groupHeight)
        
        -- ######### --
        
        ScootsSpeedrun.frames.violetHold7Options, groupHeight = ScootsSpeedrun.options.insertOptionsGroup({
            ['framename'] = 'ScootsSpeedrun-Options-VioletHold7Options',
            ['parent'] = ScootsSpeedrun.frames.violetHoldOptionsScrollChild,
            ['width'] = 310,
            ['title'] = 'Dialogue choice when there are 7 options',
            ['subtitle'] = 'After first boss is chosen, choices that come after that boss will move up by 1',
        })
        
        ScootsSpeedrun.frames.violetHold7Options:SetPoint('TOPLEFT', ScootsSpeedrun.frames.violetHold8Options, 'BOTTOMLEFT', 0, -10)
        
        --
        
        _, ScootsSpeedrun.frames.violetHold7OptionsCheckboxes = ScootsSpeedrun.options.insertOptionsRadio({
            ['framenameprefix'] = 'ScootsSpeedrun-Options-VioletHold7Options-',
            ['parent'] = ScootsSpeedrun.frames.violetHold7Options,
            ['prior'] = ScootsSpeedrun.frames.violetHold7Options.subtitle,
            ['offset'] = -5,
            ['internalOffset'] = 5,
            ['onClickEvent'] = function(choice)
                ScootsSpeedrun.options.set('vh-7options', choice.value)
            end,
            ['choices'] = {
                {
                    ['framenamesuffix'] = 'DoNothing',
                    ['name'] = 'Do nothing',
                    ['value'] = 'do-nothing',
                },
                {
                    ['framenamesuffix'] = 'Choice2',
                    ['name'] = 'Select choice 2',
                    ['value'] = 'dialogue-2',
                },
                {
                    ['framenamesuffix'] = 'Choice3',
                    ['name'] = 'Select choice 3',
                    ['value'] = 'dialogue-3',
                },
                {
                    ['framenamesuffix'] = 'Choice4',
                    ['name'] = 'Select choice 4',
                    ['value'] = 'dialogue-4',
                },
                {
                    ['framenamesuffix'] = 'Choice5',
                    ['name'] = 'Select choice 5',
                    ['value'] = 'dialogue-5',
                },
                {
                    ['framenamesuffix'] = 'Choice6',
                    ['name'] = 'Select choice 6',
                    ['value'] = 'dialogue-6',
                },
                {
                    ['framenamesuffix'] = 'Choice7',
                    ['name'] = 'Select choice 7',
                    ['value'] = 'dialogue-7',
                },
            },
            ['defaultState'] = ScootsSpeedrun.options.get('vh-7options'),
        })
        
        for checkboxIndex, checkbox in pairs(ScootsSpeedrun.frames.violetHold7OptionsCheckboxes) do
            groupHeight = groupHeight + checkbox:GetHeight()
            
            if(checkboxIndex > 1) then
                groupHeight = groupHeight - 5
            end
        end
        
        --
        
        ScootsSpeedrun.frames.violetHold7Options:SetHeight(groupHeight)
        height = height + groupHeight + 10
        
        -- ######### --
    
        height = height + 25
        ScootsSpeedrun.frames.violetHoldOptionsScrollChild:SetHeight(height)
        
        if(height <= ScootsSpeedrun.frames.violetHoldOptionsScrollFrame:GetHeight()) then
            scrollBar:Hide()
        else
            scrollBar:Show()
        end
        
        ScootsSpeedrun.options.builtVioletHold = true
    end)
end

ScootsSpeedrun.options.buildTocOptions = function()
    ScootsSpeedrun.frames.tocOptions = CreateFrame('Frame', 'ScootsSpeedrun-Options-Toc', UIParent)
    ScootsSpeedrun.frames.tocOptions.parent = ScootsSpeedrun.title
    ScootsSpeedrun.frames.tocOptions.name = 'Trial of the Champion'
    InterfaceOptions_AddCategory(ScootsSpeedrun.frames.tocOptions)
    
    ScootsSpeedrun.frames.tocOptions:HookScript('OnShow', function()
        if(ScootsSpeedrun.options.builtToc ~= nil) then
            return nil
        end
        
        ScootsSpeedrun.frames.tocOptionsScrollFrame = CreateFrame('ScrollFrame', 'ScootsSpeedrun-Options-Toc-ScrollFrame', ScootsSpeedrun.frames.tocOptions, 'UIPanelScrollFrameTemplate')
        ScootsSpeedrun.frames.tocOptionsScrollFrame:SetWidth(663)
    
        ScootsSpeedrun.frames.tocOptionsScrollChild = CreateFrame('Frame', 'ScootsSpeedrun-Options-Toc-ScrollChild', ScootsSpeedrun.frames.tocOptionsScrollFrame)
        ScootsSpeedrun.frames.tocOptionsScrollChild:SetWidth(ScootsSpeedrun.frames.tocOptionsScrollFrame:GetWidth())
        
        local scrollBarName = ScootsSpeedrun.frames.tocOptionsScrollFrame:GetName()
        local scrollBar = _G[scrollBarName .. 'ScrollBar']
        local scrollUpButton = _G[scrollBarName .. 'ScrollBarScrollUpButton']
        local scrollDownButton = _G[scrollBarName .. 'ScrollBarScrollDownButton']

        scrollUpButton:ClearAllPoints()
        scrollUpButton:SetPoint('TOPRIGHT', ScootsSpeedrun.frames.tocOptionsScrollFrame, 'TOPRIGHT', -2, -2)

        scrollDownButton:ClearAllPoints()
        scrollDownButton:SetPoint('BOTTOMRIGHT', ScootsSpeedrun.frames.tocOptionsScrollFrame, 'BOTTOMRIGHT', -2, 2)

        scrollBar:ClearAllPoints()
        scrollBar:SetPoint('TOP', scrollUpButton, 'BOTTOM', 0, -2)
        scrollBar:SetPoint('BOTTOM', scrollDownButton, 'TOP', 0, 2)

        ScootsSpeedrun.frames.tocOptionsScrollFrame:SetScrollChild(ScootsSpeedrun.frames.tocOptionsScrollChild)
        ScootsSpeedrun.frames.tocOptionsScrollFrame:SetPoint('TOPLEFT', ScootsSpeedrun.frames.tocOptions, 'TOPLEFT', 0, -5)
        ScootsSpeedrun.frames.tocOptionsScrollFrame:SetHeight(419)
        
        local height = 0
        
        --
        
        ScootsSpeedrun.frames.tocOptionsScrollChild.titleText = ScootsSpeedrun.frames.tocOptionsScrollChild:CreateFontString(nil, 'OVERLAY', 'GameFontNormalLarge')
        ScootsSpeedrun.frames.tocOptionsScrollChild.titleText:SetPoint('TOPLEFT', ScootsSpeedrun.frames.tocOptionsScrollChild, 'TOPLEFT', 16, -10)
        ScootsSpeedrun.frames.tocOptionsScrollChild.titleText:SetText(ScootsSpeedrun.title)
    
        ScootsSpeedrun.frames.tocOptionsScrollChild.versionText = ScootsSpeedrun.frames.tocOptionsScrollChild:CreateFontString(nil, 'OVERLAY', 'GameFontHighlight')
        ScootsSpeedrun.frames.tocOptionsScrollChild.versionText:SetPoint('BOTTOMLEFT', ScootsSpeedrun.frames.tocOptionsScrollChild.titleText, 'BOTTOMRIGHT', 5, 1)
        ScootsSpeedrun.frames.tocOptionsScrollChild.versionText:SetText(ScootsSpeedrun.version)
        ScootsSpeedrun.frames.tocOptionsScrollChild.versionText:SetTextColor(0.6, 0.98, 0.6)
        
        height = height + ScootsSpeedrun.frames.tocOptionsScrollChild.titleText:GetHeight()
        
        --
        
        ScootsSpeedrun.frames.tocOptionsScrollChild.subTitle = ScootsSpeedrun.frames.tocOptionsScrollChild:CreateFontString(nil, 'OVERLAY', 'GameFontHighlight')
        ScootsSpeedrun.frames.tocOptionsScrollChild.subTitle:SetPoint('TOPLEFT', ScootsSpeedrun.frames.tocOptionsScrollChild.titleText, 'BOTTOMLEFT', 0, -2)
        ScootsSpeedrun.frames.tocOptionsScrollChild.subTitle:SetText('Trial of the Champion (ToC5) choice selection')
        
        height = height + ScootsSpeedrun.frames.tocOptionsScrollChild.subTitle:GetHeight()
        
        -- ######### --
        
        local groupHeight
        ScootsSpeedrun.frames.toc3Options, groupHeight = ScootsSpeedrun.options.insertOptionsGroup({
            ['framename'] = 'ScootsSpeedrun-Options-Toc3Options',
            ['parent'] = ScootsSpeedrun.frames.tocOptionsScrollChild,
            ['width'] = 310,
            ['title'] = 'Dialogue choice when there are 3 options',
        })
        
        ScootsSpeedrun.frames.toc3Options:SetPoint('TOPLEFT', ScootsSpeedrun.frames.tocOptionsScrollChild.subTitle, 'BOTTOMLEFT', 0, -10)
        
        --
        
        _, ScootsSpeedrun.frames.toc3OptionsCheckboxes = ScootsSpeedrun.options.insertOptionsRadio({
            ['framenameprefix'] = 'ScootsSpeedrun-Options-Toc3Options-',
            ['parent'] = ScootsSpeedrun.frames.toc3Options,
            ['prior'] = ScootsSpeedrun.frames.toc3Options.title,
            ['offset'] = -5,
            ['internalOffset'] = 5,
            ['onClickEvent'] = function(choice)
                ScootsSpeedrun.options.set('toc5-3options', choice.value)
            end,
            ['choices'] = {
                {
                    ['framenamesuffix'] = 'DoNothing',
                    ['name'] = 'Do nothing',
                    ['value'] = 'do-nothing',
                },
                {
                    ['framenamesuffix'] = 'Choice1',
                    ['name'] = 'Select choice 1',
                    ['value'] = 'dialogue-1',
                },
                {
                    ['framenamesuffix'] = 'Choice2',
                    ['name'] = 'Select choice 2',
                    ['value'] = 'dialogue-2',
                },
                {
                    ['framenamesuffix'] = 'Choice3',
                    ['name'] = 'Select choice 3',
                    ['value'] = 'dialogue-3',
                },
            },
            ['defaultState'] = ScootsSpeedrun.options.get('toc5-3options'),
        })
        
        for checkboxIndex, checkbox in pairs(ScootsSpeedrun.frames.toc3OptionsCheckboxes) do
            groupHeight = groupHeight + checkbox:GetHeight()
            
            if(checkboxIndex > 1) then
                groupHeight = groupHeight - 5
            end
        end
        
        --
        
        ScootsSpeedrun.frames.toc3Options:SetHeight(groupHeight)
        height = height + groupHeight + 10
        
        -- ######### --
        
        ScootsSpeedrun.frames.tocInfo, groupHeight = ScootsSpeedrun.options.insertOptionsGroup({
            ['framename'] = 'ScootsSpeedrun-Options-TocInfo',
            ['parent'] = ScootsSpeedrun.frames.tocOptionsScrollChild,
            ['width'] = 310,
            ['title'] = 'Dialogue choices',
        })
        
        ScootsSpeedrun.frames.tocInfo:SetPoint('TOPLEFT', ScootsSpeedrun.frames.toc3Options, 'TOPRIGHT', 10, 0)
        
        --
        
        ScootsSpeedrun.frames.tocInfo.text = ScootsSpeedrun.frames.tocInfo:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
        ScootsSpeedrun.frames.tocInfo.text:SetPoint('TOPLEFT', ScootsSpeedrun.frames.tocInfo.title, 'BOTTOMLEFT', 0, -10)
        ScootsSpeedrun.frames.tocInfo.text:SetWidth(ScootsSpeedrun.frames.tocInfo:GetWidth() - 20)
        ScootsSpeedrun.frames.tocInfo.text:SetJustifyH('LEFT')
        ScootsSpeedrun.frames.tocInfo.text:SetWordWrap(true)
        ScootsSpeedrun.frames.tocInfo.text:SetText(table.concat({
            'The first choice will be to start the encounter normally.',
            'If you have at least a 30 speed buff, then the next choice will be to start the encounter, skipping the opening jousting.',
            'If you have unlocked the trial waves event, the next choice will be to start it.',
        }, '\n\n'))
        
        groupHeight = groupHeight + ScootsSpeedrun.frames.tocInfo.text:GetHeight() + 10
        ScootsSpeedrun.frames.tocInfo:SetHeight(groupHeight)
        
        -- ######### --
        
        ScootsSpeedrun.frames.toc2Options, groupHeight = ScootsSpeedrun.options.insertOptionsGroup({
            ['framename'] = 'ScootsSpeedrun-Options-Toc2Options',
            ['parent'] = ScootsSpeedrun.frames.tocOptionsScrollChild,
            ['width'] = 310,
            ['title'] = 'Dialogue choice when there are 2 options',
        })
        
        ScootsSpeedrun.frames.toc2Options:SetPoint('TOPLEFT', ScootsSpeedrun.frames.toc3Options, 'BOTTOMLEFT', 0, -10)
        
        --
        
        _, ScootsSpeedrun.frames.toc2OptionsCheckboxes = ScootsSpeedrun.options.insertOptionsRadio({
            ['framenameprefix'] = 'ScootsSpeedrun-Options-Toc2Options-',
            ['parent'] = ScootsSpeedrun.frames.toc2Options,
            ['prior'] = ScootsSpeedrun.frames.toc2Options.title,
            ['offset'] = -5,
            ['internalOffset'] = 5,
            ['onClickEvent'] = function(choice)
                ScootsSpeedrun.options.set('toc5-2options', choice.value)
            end,
            ['choices'] = {
                {
                    ['framenamesuffix'] = 'DoNothing',
                    ['name'] = 'Do nothing',
                    ['value'] = 'do-nothing',
                },
                {
                    ['framenamesuffix'] = 'Choice1',
                    ['name'] = 'Select choice 1',
                    ['value'] = 'dialogue-1',
                },
                {
                    ['framenamesuffix'] = 'Choice2',
                    ['name'] = 'Select choice 2',
                    ['value'] = 'dialogue-2',
                },
            },
            ['defaultState'] = ScootsSpeedrun.options.get('toc5-2options'),
        })
        
        for checkboxIndex, checkbox in pairs(ScootsSpeedrun.frames.toc2OptionsCheckboxes) do
            groupHeight = groupHeight + checkbox:GetHeight()
            
            if(checkboxIndex > 1) then
                groupHeight = groupHeight - 5
            end
        end
        
        --
        
        ScootsSpeedrun.frames.toc2Options:SetHeight(groupHeight)
        height = height + groupHeight + 10
        
        -- ######### --
    
        height = height + 25
        ScootsSpeedrun.frames.tocOptionsScrollChild:SetHeight(height)
        
        if(height <= ScootsSpeedrun.frames.tocOptionsScrollFrame:GetHeight()) then
            scrollBar:Hide()
        else
            scrollBar:Show()
        end
        
        ScootsSpeedrun.options.builtToc = true
    end)
end

ScootsSpeedrun.options.insertOptionsGroup = function(data)
    local groupFrame = CreateFrame('Frame', data.framename, data.parent)
    
    groupFrame:SetWidth(data.width)
    groupFrame:SetBackdrop({
        bgFile = 'Interface\\Tooltips\\UI-Tooltip-Background',
        edgeFile = 'Interface\\Tooltips\\UI-Tooltip-Border',
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = {
            left = 5,
            right = 5,
            top = 5,
            bottom = 5,
        },
    })

    groupFrame:SetBackdropColor(0, 0, 0, 0.2)
    groupFrame:SetBackdropBorderColor(1, 1, 1, 0.5)
    
    groupFrame.title = groupFrame:CreateFontString(nil, 'OVERLAY', 'GameFontHighlight')
    groupFrame.title:SetPoint('TOPLEFT', groupFrame, 'TOPLEFT', 10, -10)
    groupFrame.title:SetWidth(groupFrame:GetWidth() - 20)
    groupFrame.title:SetJustifyH('LEFT')
    groupFrame.title:SetWordWrap(true)
    groupFrame.title:SetText(data.title)
    
    local height = groupFrame.title:GetHeight() + 20
    
    if(data.subtitle) then
        groupFrame.subtitle = groupFrame:CreateFontString(nil, 'OVERLAY', 'GameFontNormalSmall')
        groupFrame.subtitle:SetPoint('TOPLEFT', groupFrame.title, 'BOTTOMLEFT', 0, 0)
        groupFrame.subtitle:SetWidth(groupFrame.title:GetWidth())
        groupFrame.subtitle:SetJustifyH('LEFT')
        groupFrame.subtitle:SetWordWrap(true)
        groupFrame.subtitle:SetText(data.subtitle)
        
        height = height + groupFrame.subtitle:GetHeight()
    end
    
    return groupFrame, height
end

ScootsSpeedrun.options.insertOptionsCheckbox = function(data)
    local checkbox = CreateFrame('CheckButton', data.framename, data.parent, 'UICheckButtonTemplate')
    checkbox:SetSize(28, 28)
    checkbox:SetPoint('TOPLEFT', data.prior, 'BOTTOMLEFT', 0, data.offset)
    
    _G[checkbox:GetName() .. 'Text']:SetFontObject('GameFontNormal')
    _G[checkbox:GetName() .. 'Text']:SetText(data.name)
    _G[checkbox:GetName() .. 'Text']:ClearAllPoints()
    _G[checkbox:GetName() .. 'Text']:SetPoint('LEFT', checkbox, 'RIGHT', 0, 0)
    
    checkbox:SetHitRectInsets(0, 0 - _G[checkbox:GetName() .. 'Text']:GetWidth(), 0, 0)
    checkbox:SetChecked(data.defaultState)
    
    if(data.tooltip ~= nil) then
        checkbox:SetScript('OnEnter', function()
            GameTooltip:SetOwner(checkbox, 'ANCHOR_TOPLEFT')
            GameTooltip:SetText(data.tooltip, nil, nil, nil, nil, 1)
            GameTooltip:Show()
        end)
        
        checkbox:SetScript('OnLeave', GameTooltip_Hide)
    end
    
    checkbox:SetScript('OnClick', data.onClickEvent)
    
    return checkbox
end

ScootsSpeedrun.options.insertOptionsRadio = function(data)
    local prior = data.prior
    local header

    if(data.name) then
        header = data.parent:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightSmall')
        header:SetPoint('TOPLEFT', data.prior, 'BOTTOMLEFT', 0, data.offset)
        header:SetJustifyH('LEFT')
        header:SetText(data.name)
        
        prior = header
    end
    
    local checkboxes = {}
    local index = 1
    for _, choice in ipairs(data.choices) do
        local offset = data.internalOffset
        if(index == 1) then
            offset = 0
        end
    
        local checkbox = ScootsSpeedrun.options.insertOptionsCheckbox({
            ['framename'] = data.framenameprefix .. choice.framenamesuffix,
            ['parent'] = data.parent,
            ['prior'] = prior,
            ['offset'] = offset,
            ['name'] = choice.name,
            ['defaultState'] = choice.value == data.defaultState,
            ['onClickEvent'] = function(self)
                self:Disable()
            
                for _, otherCheckbox in pairs(checkboxes) do
                    if(otherCheckbox:GetName() ~= self:GetName()) then
                        otherCheckbox:SetChecked(false)
                        otherCheckbox:Enable()
                    end
                end
                
                data.onClickEvent(choice)
            end,
        })
        
        if(choice.value == data.defaultState) then
            checkbox:Disable()
        end
        
        prior = checkbox
        table.insert(checkboxes, checkbox)
        index = index + 1
    end
    
    return header, checkboxes
end