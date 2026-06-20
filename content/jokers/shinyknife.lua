SMODS.Joker{ --Shiny Knife
    key = "shinyknife",
    config = {
        extra = {
            xmult = 4
        }
    },
    loc_txt = {
        ['name'] = 'Shiny Knife',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult if played{}',
            [2] = 'hand is only {C:attention}1{} card',
            [3] = 'with {C:spades}Spade{} suit'
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',
    
    loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.xmult} }
	end,

    calculate = function(self, card, context)
        if context.joker_main then
            if #context.full_hand == 1 and context.full_hand[1] and context.full_hand[1]:is_suit("Spades") then
                return {
                    Xmult = card.ability.extra.xmult
                }
            end
        end
    end
}