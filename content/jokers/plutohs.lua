SMODS.Joker{ --PLUTO
    key = "plutohs",
    config = {
        extra = {
            poker_hand = "High Card"
        }
    },
    loc_txt = {
        ['name'] = 'PLUTO',
        ['text'] = {
            [1] = 'Upgrade level of',
            [2] = '{C:attention}#1#{} when',
            [3] = '{C:attention}Blind{} is selected'
        }
    },
    pos = {
        x = 2,
        y = 3
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {localize(card.ability.extra.poker_hand, 'poker_hands')}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind then
                return{ 
                    message = localize('k_level_up_ex'),
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.upgrade_poker_hands({hands={card.ability.extra.poker_hand},level_up=1,from=context.blueprint_card or card})
                            return true
                        end
                    }))
                }
            
        end
    end
}