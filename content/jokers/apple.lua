SMODS.Joker{ --Apple
    key = "apple",
    config = {
        extra ={
            levels = 3
        }
    },
    loc_txt = {
        ['name'] = 'Apple...?',
        ['text'] = {
            [1] = 'Upgrade the level',
            [2] = 'of {C:attention}final hand{} of',
            [3] = 'round by {C:attention}#1#{} levels',
            [4] = '{C:red,E:2}self destructs{}'
        }
    },
    pos = {
        x = 5,
        y = 6
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function (self,info_queue,card)
        return {vars = {card.ability.extra.levels}}
    end,
    calculate = function (self,card,context)
        if context.before and G.GAME.current_round.hands_left == 0 then
            return{
                level_up = card.ability.extra.levels,
                message=localize('k_level_up_ex')
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.current_round.hands_left == 0 and not context.blueprint then
            SMODS.destroy_cards(card, nil, nil, true)
            return{
                message=localize('k_eaten_ex')
            }
        end
    end
}