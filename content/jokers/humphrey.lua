SMODS.Joker{ --HUMPHREY
    key = "humphrey",
    config = {
        extra = {
            dollars = 0
        }
    },
    loc_txt = {
        ['name'] = 'HUMPHREY',
        ['text'] = {
            [1] = 'all cards held in hand',
            [2] = 'are {C:attention}destroyed{} if round',
            [3] = 'ends with {C:money}$#1#{} or less',
            [4] = '{C:inactive,s:0.8}I fucking love air conditioning{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 6
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.dollars}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if to_big(G.GAME.dollars) <= to_big(card.ability.extra.dollars) then
                G.E_MANAGER:add_event(Event({
                SMODS.destroy_cards(G.hand.cards),
                play_sound("omori_humphrey")
                }))
                return{
                    message = "Nyak Nyak!"
                }
            end
        end
    end
}