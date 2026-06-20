SMODS.Joker{ --SWEETHEART
    key = "sweetheart",
    config = {
        extra = {
            xmult = 3
        }
    },
    loc_txt = {
        ['name'] = 'SWEETHEART',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult if all',
            [2] = '{C:attention}played cards{} are',
            [3] = 'of {C:hearts}Heart{} suit'
        }
    },
    pos = {
        x = 2,
        y = 4
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
        return {vars = {card.ability.extra.xmult}}
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local heart_suit = true
            for _, played_card in ipairs(context.full_hand) do
                if not played_card:is_suit("Hearts") or SMODS.has_any_suit(played_card) then
                    heart_suit=false
                    break
                end
            end
            if heart_suit then
                return {
                    Xmult = card.ability.extra.xmult
                }
            end
        end
    end
}