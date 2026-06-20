SMODS.Joker{ --GINGERDEAD MAN
    key = "gingerdeadman",
        config = {
            extra = {
                mult = 21, 
                mult_odds = 3,
                death_odds =10
            },
        },
        loc_txt = {
        ['name'] = 'GINGERDEAD MAN',
        ['text'] = {
            [1] = '{C:green}#2# in #3#{} chance for {C:red}+#1#{} Mult',
            [2] = '{C:green}#4# in #5#{} chance this card is',
            [3] = 'destroyed {C:attention}after{} scoring'
        }
    },
    pos = {
        x = 8,
        y = 4
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        local mul_numerator, mul_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.mult_odds, 'j_omori_gingerdeadman_mult')
        local des_numerator, des_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.death_odds, 'j_omori_gingerdeadman_death')
        return {vars = { card.ability.extra.mult, mul_numerator, mul_denominator, des_numerator, des_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
                if SMODS.pseudorandom_probability(card, 'gingerdeadman_mult', 1, card.ability.extra.mult_odds, 'j_omori_gingerdeadman_mult', false) then
                    return {
                        mult = card.ability.extra.mult
                    }
                end
        end
        if context.after and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'gingerdeadman_death', 1, card.ability.extra.death_odds, 'j_omori_gingerdeadman_death', false) then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = "Crumbled!"
                }
            end
        end
    end
}