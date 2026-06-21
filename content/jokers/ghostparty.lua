SMODS.Joker{ --Ghost Party
    key = "ghostparty",
    config = {
        extra = {
            chips = 20
        }
    },
    loc_txt = {
        ['name'] = 'Ghost Party',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips for each',
            [2] = 'card above {C:attention}#2#{} in',
            [3] = 'your full deck',
            [4] = '{C:inactive}(Currently{} {C:blue}+#3#{} {C:inactive}Chips){}'
        }
    },
    pos = {
        x = 9,
        y = 5
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
        return {vars = {card.ability.extra.chips, G.GAME.starting_deck_size, math.max(0, card.ability.extra.chips * (G.playing_cards and (#G.playing_cards-G.GAME.starting_deck_size)or 0))}}
    end,
    calculate = function (self,card,context)
        if context.joker_main then
            return{
                chips = math.max(0, card.ability.extra.chips * (#G.playing_cards-G.GAME.starting_deck_size))
            }
        end
    end
}
