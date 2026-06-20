SMODS.Joker{ --SPELLING BEE
    key = "spellingbee",
    config = {
        extra = {
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'SPELLING BEE',
        ['text'] = {
            [1] = 'B-E-E-T-R-I-G-G-E-R A-L-L S-C-O-R-E-D',
            [2] = 'C-A-R-D-S I-F P-L-A-Y-E-D H-A-N-D',
            [3] = 'C-O-N-T-A-I-N-S A {C:attention}S-T-R-A-I-G-H-T{}!'
        }
    },
    pos = {
        x = 5,
        y = 4
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play
            and next(context.poker_hands["Straight"]) then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
        end
    end
}