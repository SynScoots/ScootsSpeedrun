ScootsSpeedrun.options = {}

ScootsSpeedrun.options.load = function()
    local defaultOptions = {
        ['auto-use-items'] = true,
        ['auto-release'] = false,
        ['debug'] = false,
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
end

ScootsSpeedrun.options.buildGeneralOptions = function()
    ScootsSpeedrun.frames.options = CreateFrame('Frame', 'ScootsSpeedrun-Options', UIParent)
    ScootsSpeedrun.frames.options.name = ScootsSpeedrun.title
    InterfaceOptions_AddCategory(ScootsSpeedrun.frames.options)
    
    ScootsSpeedrun.frames.options:HookScript('OnShow', function()
        if(ScootsSpeedrun.options.built ~= nil) then
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
        
        ScootsSpeedrun.options.built = true
    end)
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