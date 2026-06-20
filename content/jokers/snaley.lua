SMODS.Joker{ --SNALEY
    key = "snaley",
    config = {
        extra = {
            mult = 20,
            xmult = 0.75,
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'SNALEY',
        ['text'] = {
            [1] = '{C:green}#3# in #4#{} chance',
            [2] = 'for {C:red}+#1#{} Mult',
            [3] = '{C:green}#3# in #4#{} chance',
            [4] = 'for {X:red,C:white}X#2#{} Mult'
        }
    },
    pos = {
        x = 5,
        y = 5
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_omori_snaley')
        return {vars = {card.ability.extra.mult,card.ability.extra.xmult, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if SMODS.pseudorandom_probability(card, 'snaley_mult', 1, card.ability.extra.odds, 'j_omori_snaley', false) then
                return{
                    mult = card.ability.extra.mult
                }
            end
            if SMODS.pseudorandom_probability(card, 'snaley_xmult', 1, card.ability.extra.odds, 'j_omori_snaley', false) then
                return{
                    Xmult = card.ability.extra.xmult
                }
            end    
        end
    end
}