-- Shattrath City
ScootsSpeedrun.map[3703] = {
    [22429] = { -- Vekax
        {
            ['action'] = 'use-item',
            ['data'] = 31800, -- Outcast's Cache
        },
        {
            ['action'] = 'select-available-quest',
            ['data'] = 10918, -- More Feathers
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 25719, -- Arakkoa Feather
                        ['count'] = 30,
                    },
                },
            },
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 10918, -- More Feathers
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 10918, -- More Feathers
        },
        {
            ['action'] = 'select-available-quest',
            ['data'] = 10917, -- The Outcast's Plight
        },
        {
            ['action'] = 'accept-quest',
            ['data'] = 10917, -- The Outcast's Plight
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 10917, -- The Outcast's Plight
            ['conditions'] = {
                {
                    ['type'] = 'quest-handin-ready',
                    ['data'] = 10917, -- The Outcast's Plight
                },
            },
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 10917, -- The Outcast's Plight
        },
    },
}

-- Terokkar Forest
ScootsSpeedrun.map[3519] = {
    [25580] = { -- Old Man Barlo
        {
            ['action'] = 'use-item',
            ['data'] = 34863, -- Bag of Fishing Treasures
        },
        {
            ['action'] = 'accept-quest',
            ['data'] = 11666, -- Bait Bandits
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 11666, -- Bait Bandits
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 11666, -- Bait Bandits
        },
        {
            ['action'] = 'accept-quest',
            ['data'] = 11668, -- Shrimpin' Ain't Easy
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 11668, -- Shrimpin' Ain't Easy
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 11668, -- Shrimpin' Ain't Easy
        },
    },
    [23042] = { -- Severin
        {
            ['action'] = 'accept-quest',
            ['data'] = 11006, -- More Shadow Dust
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 11006, -- More Shadow Dust
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 11006, -- More Shadow Dust
        },
        {
            ['action'] = 'accept-quest',
            ['data'] = 11004, -- World of Shadows
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 11004, -- World of Shadows
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 11004, -- World of Shadows
        },
    },
    [23306] = { -- Hazzik
        {
            ['action'] = 'select-available-quest',
            ['data'] = 11074, -- Tokens of the Descendants
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 32716, -- Gezzarak's Claw
                        ['count'] = 1,
                    },
                },
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 32715, -- Akkarai's Talons
                        ['count'] = 1,
                    },
                },
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 32717, -- Karrog's Spine
                        ['count'] = 1,
                    },
                },
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 32718, -- Vakkiz's Scale
                        ['count'] = 1,
                    },
                },
            },
        },
        {
            ['action'] = 'accept-quest',
            ['data'] = 11074, -- Tokens of the Descendants
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 11074, -- Tokens of the Descendants
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 32716, -- Gezzarak's Claw
                        ['count'] = 1,
                    },
                },
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 32715, -- Akkarai's Talons
                        ['count'] = 1,
                    },
                },
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 32717, -- Karrog's Spine
                        ['count'] = 1,
                    },
                },
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 32718, -- Vakkiz's Scale
                        ['count'] = 1,
                    },
                },
            },
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 11074, -- Tokens of the Descendants
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 11074, -- Tokens of the Descendants
        },
        {
            ['action'] = 'select-available-quest',
            ['data'] = 11885, -- Adversarial Blood
        },
        {
            ['action'] = 'accept-quest',
            ['data'] = 11885, -- Adversarial Blood
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 11885, -- Adversarial Blood
            ['conditions'] = {
                {
                    ['type'] = 'quest-handin-ready',
                    ['data'] = 11885, -- Adversarial Blood,
                },
            },
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 11885, -- Adversarial Blood
        },
    },
    [54841] = { -- Skull Pile
        {
            ['action'] = 'dismount',
        },
        {
            ['action'] = 'dialogue-select',
            ['data'] = 1,
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 32620, -- Time-Lost Scroll
                        ['count'] = 10,
                    },
                },
                {
                    ['type'] = 'own-fewest-in-set',
                    ['data'] = {
                        ['item'] = 32716, -- Gezzarak's Claw
                        ['set'] = {
                            32716, -- Gezzarak's Claw
                            32715, -- Akkarai's Talons
                            32717, -- Karrog's Spine
                            32718, -- Vakkiz's Scale
                        },
                    },
                },
            },
        },
        {
            ['action'] = 'dialogue-select',
            ['data'] = 2,
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 32620, -- Time-Lost Scroll
                        ['count'] = 10,
                    },
                },
                {
                    ['type'] = 'own-fewest-in-set',
                    ['data'] = {
                        ['item'] = 32715, -- Akkarai's Talons
                        ['set'] = {
                            32716, -- Gezzarak's Claw
                            32715, -- Akkarai's Talons
                            32717, -- Karrog's Spine
                            32718, -- Vakkiz's Scale
                        },
                    },
                },
            },
        },
        {
            ['action'] = 'dialogue-select',
            ['data'] = 3,
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 32620, -- Time-Lost Scroll
                        ['count'] = 10,
                    },
                },
                {
                    ['type'] = 'own-fewest-in-set',
                    ['data'] = {
                        ['item'] = 32717, -- Karrog's Spine
                        ['set'] = {
                            32716, -- Gezzarak's Claw
                            32715, -- Akkarai's Talons
                            32717, -- Karrog's Spine
                            32718, -- Vakkiz's Scale
                        },
                    },
                },
            },
        },
        {
            ['action'] = 'dialogue-select',
            ['data'] = 4,
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 32620, -- Time-Lost Scroll
                        ['count'] = 10,
                    },
                },
                {
                    ['type'] = 'own-fewest-in-set',
                    ['data'] = {
                        ['item'] = 32718, -- Vakkiz's Scale
                        ['set'] = {
                            32716, -- Gezzarak's Claw
                            32715, -- Akkarai's Talons
                            32717, -- Karrog's Spine
                            32718, -- Vakkiz's Scale
                        },
                    },
                },
            },
        },
        
    },
    [54856] = { -- Ancient Skull Pile
        {
            ['action'] = 'dismount',
        },
        {
            ['action'] = 'dialogue-select',
            ['data'] = 2,
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 32720, -- Time-Lost Offering
                        ['count'] = 1,
                    },
                },
            },
        },
    },
}

-- Nagrand
ScootsSpeedrun.map[3518] = {
    [18816] = { -- Chief Researcher Amereldine
        {
            ['action'] = 'select-available-quest',
            ['data'] = 10075, -- Oshu'gun Crystal Powder
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 26042, -- Oshu'gun Crystal Powder Sample
                        ['count'] = 10,
                    },
                },
            },
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 10075, -- Oshu'gun Crystal Powder
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 26042, -- Oshu'gun Crystal Powder Sample
                        ['count'] = 10,
                    },
                },
            },
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 10075, -- Oshu'gun Crystal Powder
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 10075, -- Oshu'gun Crystal Powder
        },
        {
            ['action'] = 'select-available-quest',
            ['data'] = 10074, -- Oshu'gun Crystal Powder
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 26042, -- Oshu'gun Crystal Powder Sample
                        ['count'] = 10,
                    },
                },
            },
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 10074, -- Oshu'gun Crystal Powder
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 26042, -- Oshu'gun Crystal Powder Sample
                        ['count'] = 10,
                    },
                },
            },
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 10074, -- Oshu'gun Crystal Powder
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 10074, -- Oshu'gun Crystal Powder
        },
    },
    [18817] = { -- Chief Researcher Kartos
        {
            ['action'] = 'select-available-quest',
            ['data'] = 10077, -- Oshu'gun Crystal Powder
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 26043, -- Oshu'gun Crystal Powder Sample
                        ['count'] = 10,
                    },
                },
            },
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 10077, -- Oshu'gun Crystal Powder
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 26043, -- Oshu'gun Crystal Powder Sample
                        ['count'] = 10,
                    },
                },
            },
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 10077, -- Oshu'gun Crystal Powder
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 10077, -- Oshu'gun Crystal Powder
        },
        {
            ['action'] = 'select-available-quest',
            ['data'] = 10076, -- Oshu'gun Crystal Powder
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 26043, -- Oshu'gun Crystal Powder Sample
                        ['count'] = 10,
                    },
                },
            },
        },
        {
            ['action'] = 'select-active-quest',
            ['data'] = 10076, -- Oshu'gun Crystal Powder
            ['conditions'] = {
                {
                    ['type'] = 'item-in-bags',
                    ['data'] = {
                        ['item'] = 26043, -- Oshu'gun Crystal Powder Sample
                        ['count'] = 10,
                    },
                },
            },
        },
        {
            ['action'] = 'progress-quest',
            ['data'] = 10076, -- Oshu'gun Crystal Powder
        },
        {
            ['action'] = 'complete-quest',
            ['data'] = 10076, -- Oshu'gun Crystal Powder
        },
    },
}