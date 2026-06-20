SMODS.Joker{ --Gladiolus
    key = "gladiolus",
    config = {
        extra = {
            xmult = 1.5,
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Gladiolus',
        ['text'] = {
            [1] = 'Each {C:attention}Wild Card{}',
            [2] = 'held in hand has',
            [3] = 'a {C:green}#1# in #2#{} chance',
            [4] = 'to give {X:red,C:white}X#3#{} Mult'
        }
    },
    pos = {
        x = 3,
        y = 8
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    enhancement_gate = "m_wild",
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_omori_gladiolus') 
        return {vars = {new_numerator, new_denominator,card.ability.extra.xmult}}
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if SMODS.has_enhancement(context.other_card,"m_wild") and SMODS.pseudorandom_probability(card, 'gladiolus', 1, card.ability.extra.odds, 'j_omori_gladiolus', false) then
                return {
                    xmult=card.ability.extra.xmult
                }
            end
        end
    end
}