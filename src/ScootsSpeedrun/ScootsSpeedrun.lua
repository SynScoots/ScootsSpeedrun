local SPRFrame = CreateFrame('Frame', nil, UIParent)

-- npcMap[locationName][NPCName] = GossipChoiceNumber
local npcMap = {
	-- WotLK raids
	['Icecrown Citadel'] = {
		['Muradin Bronzebeard'] = 1,
		['Zafod Boombox'] = 1,
		['High Overlord Saurfang'] = 1,
		['Highlord Tirion Fordring'] = 1
	},
	['Trial of the Crusader'] = {
		['Barrett Ramsey'] = 1
	},
	['Ulduar'] = {
		['Lore Keeper of Norgannon'] = 1,
		['Expedition Commander'] = 1
	},
	
	-- WotLK dungeons
	['Halls of Reflection'] = {
		['Lady Jaina Proudmoore'] = 'SPECIAL_HOR_LJP',
		['Lady Sylvanas Windrunner'] = 'SPECIAL_HOR_LJP'
	},
	['Trial of the Champion'] = {
		['Arelas Brightstar'] = 'SPECIAL_TOC_AB',
		['Jaeren Sunsworn'] = 'SPECIAL_TOC_AB'
	},
	['The Violet Hold'] = {
		['Lieutenant Sinclari'] = 2
	},
	['The Culling of Stratholme'] = {
		['Chromie'] = 'SPECIAL_TCOS_C',
		['Arthas'] = 1
	},
	['The Oculus'] = {
		['Verdisa'] = 2,
		['Belgaristrasz'] = 1,
		['Eternos'] = 2
	},
	['Halls of Stone'] = {
		['Brann Bronzebeard'] = 1
	},
	
	-- TBC raids
	['Black Temple'] = {
		['Akama'] = 1
	},
	['Hyjal Summit'] = {
		['Lady Jaina Proudmoore'] = 1,
		['Thrall'] = 1,
		['Tyrande Whisperwind'] = 1
	},
	['Zul\'Aman'] = {
		['Harrison Jones'] = 1
	},
	['Karazhan'] = {
		['Berthold'] = 4,
		['Barnes'] = 1,
		['Grandmother'] = 1,
		['Echo of Medivh'] = 1,
		['Human Footman'] = 1,
		['Conjured Water Elemental'] = 1,
		['Human Charger'] = 1,
		['Human Cleric'] = 1,
		['Human Conjurer'] = 1,
		['King Llane'] = 1,
		['Orc Grunt'] = 1,
		['Summoned Daemon'] = 1,
		['Orc Wolf'] = 1,
		['Orc Necrolyte'] = 1,
		['Orc Warlock'] = 1,
		['Warchief Blackhand'] = 1
	},
	
	-- TBC dungeons
	['Old Hillsbrad Foothills'] = {
		['Erozion'] = 1,
		['Brazen'] = 1,
		['Thrall'] = 1
	},
	['Caverns of Time'] = {
		['Sa\'at'] = 1
	},
	['The Slave Pens'] = {
		['Naturalist Bite'] = 1,
		['Ice Stone'] = 1
	},
	
	-- Vanilla raids
	['Blackwing Lair'] = {
		['Vaelastrasz the Corrupt'] = 1,
		['Lord Victor Nefarius'] = 1
	},
	['The Molten Core'] = {
		['Majordomo Executus'] = 1
	},
	['Ruins of Ahn\'Qiraj'] = {
		['Lieutenant General Andorov'] = 1
	},
	
	-- Vanilla dungeons
	['Dire Maul'] = {
		['Broken Trap'] = 'SPECIAL_DMN_BT',
		['Knot Thimblejack'] = 'SPECIAL_DMN_KT',
		['Captain Kromcrush'] = 1,
		['Mizzle the Crafty'] = 1,
--		['Pusillin'] = 1,
		['Ironbark the Redeemed'] = 1
	},
	['Blackrock Depths'] = {
		['Ribbly Screwspigot'] = 1,
		['Plugger Spazzring'] = 'SPECIAL_BRD_PS',
		['Private Rocknot'] = 'SPECIAL_BRD_PR',
		['Doom\'rel'] = 1,
		['Coren Direbrew'] = 1
	},
	['Zul\'Farrak'] = {
		['Sergeant Bly'] = 1,
		['Weegli Blastfuse'] = 1
	},
	['Razorfen Downs'] = {
		['Belnistrasz'] = 'SPECIAL_RFD_B',
		['Belnistrasz\'s Brazier'] = 'SPECIAL_RFD_B'
	},
	['Gnomeregan'] = {
		['Blastmaster Emi Shortfuse'] = 1
	},
	['Shadowfang Keep'] = {
		['Sorcerer Ashcrombe'] = 1,
		['Deathstalker Adamant'] = 1,
		['Apothecary Hummel'] = 1
	},
	['The Wailing Caverns'] = {
		['Disciple of Naralex'] = 1
	}
}

SPRFrame:SetScript('OnEvent', function(self, event)
	if(not IsAltKeyDown()) then
		if(event == 'CONFIRM_XP_LOSS') then
			_G['StaticPopup1Button1']:Click()
			_G['StaticPopup1Button1']:Click()
		elseif(event == 'GOSSIP_SHOW' or event == 'QUEST_DETAIL' or event == 'QUEST_PROGRESS' or event == 'QUEST_COMPLETE' or event == 'MERCHANT_SHOW') then
			local choiceCount = GetNumGossipOptions()  
			local loc = GetZoneText()
			local npc = UnitName('npc')
			
			if(npcMap[loc] and npcMap[loc][npc]) then
				if(type(npcMap[loc][npc]) ~= 'string') then
					if(npcMap[loc][npc] <= choiceCount) then
						SelectGossipOption(npcMap[loc][npc])
					end
				else
					-- Special handlers for non-standard cases
					if(npcMap[loc][npc] == 'SPECIAL_HOR_LJP' or npcMap[loc][npc] == 'SPECIAL_TOC_AB') then
						-- Halls of Reflection: Lady Jaina Proudmoore
						-- Trial of the Champion: Arelas Brightstar
						if(choiceCount == 2) then
							SelectGossipOption(2)
						elseif(choiceCount == 1) then
							SelectGossipOption(1)
						end
					elseif(npcMap[loc][npc] == 'SPECIAL_TCOS_C') then
						-- The Culling of Stratholme: Chromie
						if(choiceCount == 3) then
							SelectGossipOption(3)
						elseif(choiceCount == 2) then
							SelectGossipOption(2)
						end
					elseif(npcMap[loc][npc] == 'SPECIAL_DMN_BT') then
						-- Dire Maul North: Broken Trap
						_G['QuestFrameCompleteButton']:Click()
						_G['QuestFrameCompleteQuestButton']:Click()
					elseif(npcMap[loc][npc] == 'SPECIAL_DMN_KT') then
						-- Dire Maul North: Knot Thimblejack
						SelectGossipActiveQuest(1)
						_G['QuestFrameCompleteButton']:Click()
						_G['QuestFrameCompleteQuestButton']:Click()
						SelectGossipAvailableQuest(1)
						AcceptQuest()
					elseif(npcMap[loc][npc] == 'SPECIAL_BRD_PS') then
						-- Blackrock Depths: Plugger Spazzring
						local name, _, _, _, numAvailable = GetMerchantItemInfo(1)
						if(name == 'Dark Iron Ale Mug' and numAvailable >= 6) then
							BuyMerchantItem(1, 6)
						end
					elseif(npcMap[loc][npc] == 'SPECIAL_BRD_PR') then
						-- Blackrock Depths: Private Rocknot
						SelectGossipAvailableQuest(1)
						_G['QuestFrameCompleteButton']:Click()
						_G['QuestFrameCompleteQuestButton']:Click()
					elseif(npcMap[loc][npc] == 'SPECIAL_RFD_B') then
						-- Razorfen Downs: Belnistrasz
						-- Razorfen Downs: Belnistrasz's Brazier
						AcceptQuest()
						_G['QuestFrameCompleteButton']:Click()
						_G['QuestFrameCompleteQuestButton']:Click()
					end
				end
			end
		end
	end
end)

SPRFrame:RegisterEvent('GOSSIP_SHOW')
SPRFrame:RegisterEvent('QUEST_DETAIL')
SPRFrame:RegisterEvent('QUEST_PROGRESS')
SPRFrame:RegisterEvent('QUEST_COMPLETE')
SPRFrame:RegisterEvent('MERCHANT_SHOW')
SPRFrame:RegisterEvent('CONFIRM_XP_LOSS')
