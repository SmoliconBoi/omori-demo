SMODS.Joker{ --Vast Forest
    key = 'vastforest',
    config = {
        extra = {
            mult = 10,
            amount = 5
        }
    },
    loc_txt = {
        ['name'] = 'Vast Forest',
        ['text'] = {
            [1] = '{C:red}+#1#{} Mult if poker hand',
            [2] = 'has exactly {C:attention}#2#{} cards'
        },
    },
    pos = {
        x = 6,
        y = 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.mult,card.ability.extra.amount}}
    end,
    calculate = function (self,card,context)
        if context.joker_main and #context.scoring_hand == card.ability.extra.amount then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}