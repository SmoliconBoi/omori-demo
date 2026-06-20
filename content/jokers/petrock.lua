SMODS.Joker{ --Pet Rock
    key = "petrock",
    config = {
        extra = {
            chips = 100,
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Pet Rock',
        ['text'] = {
            [1] = 'Each {C:attention}Stone Card{}',
            [2] = 'held in hand has',
            [3] = 'a {C:green}#2# in #3#{} chance',
            [4] = 'to give {C:blue}+#1#{} Chips',
            [5] = '{C:inactive,E:1}{}'
        }
    },
    pos = {
        x = 5,
        y = 7
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    enhancement_gate = "m_stone",
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_omori_petrock') 
        return {vars = {card.ability.extra.chips, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if SMODS.has_enhancement(context.other_card,"m_stone")
                and SMODS.pseudorandom_probability(card, 'petrock', 1, card.ability.extra.odds, 'j_omori_petrock', false) then
                    return{
                        chips = card.ability.extra.chips
                    }
            end
        end
    end
}