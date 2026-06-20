SMODS.Joker{ --JASH
    key = "jash",
    config = {
        extra = {
            deduction = 1,
        }
    },
    loc_txt = {
        ['name'] = 'JASH',
        ['text'] = {
            [1] = 'All {C:green}Rerolls{} in',
            [2] = 'the shop are',
            [3] = '{C:money}$#1#{} cheaper'
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars={card.ability.extra.deduction}}
    end,
    add_to_deck = function (self,card,from_debuff)
        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - card.ability.extra.deduction
        G.GAME.current_round.reroll_cost = math.max(0,G.GAME.current_round.reroll_cost - card.ability.extra.deduction)
    end,
    remove_from_deck = function (self,card,from_debuff)
        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + card.ability.extra.deduction
        G.GAME.current_round.reroll_cost = math.max(0,G.GAME.current_round.reroll_cost + card.ability.extra.deduction)
    end,
}