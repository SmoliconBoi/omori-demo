SMODS.Joker{ --HECTOR
    key = "hector",
    config = {
        extra = {
            odds = 2,
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'HECTOR',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance for',
            [2] = 'played {C:attention}Stone Cards{}',
            [3] = 'to retrigger an',
            [4] = 'additional time'
        }
    },
    pos = {
        x = 9,
        y = 0
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    enhancement_gate = "m_stone",
    atlas = 'OMO_jokers',
    
    soul_pos = {
        x = 0,
        y = 1
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_omori_hector') 
        return {vars = {new_numerator, new_denominator}}
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if SMODS.has_enhancement(context.other_card,"m_stone") 
                and SMODS.pseudorandom_probability(card, 'hector', 1, card.ability.extra.odds, 'j_omori_hector', false) then
                    return {repetitions = card.ability.extra.repetitions}
            end
        end
    end
}