SMODS.Joker{ --KING CARNIVORE
    key = "kingcarnivore",
    config = {
        extra = {
            mult = 2
        }
    },
    loc_txt = {
        ['name'] = 'KING CARNIVORE',
        ['text'] = {
            [1] = 'Played cards in {C:attention}first hand{}',
            [2] = 'of round permanently gain',
            [3] = '{C:red}+#1#{} Mult when scored'
        },
    },
    pos = {
        x = 0,
        y = 4
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and G.GAME.current_round.hands_played == 0 then
            context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.mult
            return {
                extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }
            }
        end
    end
}