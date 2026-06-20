SMODS.Joker{ --Laptop (REWORK THIS)
    key = "laptop",
    config = {
        extra = {
            repetitions = 2
        }
    },
    loc_txt = {
        ['name'] = 'Laptop',
        ['text'] = {
            [1] = 'Retrigger first',
            [2] = 'played {C:attention}numerical{}',
            [3] = 'card {C:attention}#1#{} times'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.repetitions}}
    end,

    calculate = function (self,card,context)
        if context.repetition and context.cardarea == G.play then
            local first_number = false
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:get_id() <= 10 and context.scoring_hand[i]:get_id() >= 0 then
                        first_number = context.scoring_hand[i] == context.other_card
                        break
                    end
                end
            if first_number then
                return {repetitions = card.ability.extra.repetitions}
            end
        end
    end
}