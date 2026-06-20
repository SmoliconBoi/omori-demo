SMODS.Joker{ --DOWNLOAD WINDOW
    key = "downloadwindow",
    config = {
        extra = {
            rounds = 0,
            rounds_to_sell = 2
        }
    },
    loc_txt = {
        ['name'] = 'DOWNLOAD WINDOW',
        ['text'] = {
            [1] = 'After {C:attention}#1#{} rounds,',
            [2] = 'sell this card to',
            [3] = 'create a random',
            [4] = 'Joker with {C:dark_edition}Edition{}',
            [5] = '{C:inactive}(Currently{} {C:attention}#2#{}{C:inactive}/#1#){}'
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.rounds_to_sell,card.ability.extra.rounds}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                card.ability.extra.rounds = card.ability.extra.rounds + 1
                    if card.ability.extra.rounds == card.ability.extra.rounds_to_sell then
                        local eval = function(card) return not card.REMOVED end
                        juice_card_until(card, eval, true)
                    end
                    return {
                        message = (card.ability.extra.rounds < card.ability.extra.rounds_to_sell) and
                        (card.ability.extra.rounds ..'/'.. card.ability.extra.rounds_to_sell) or
                        localize('k_active_ex'),
                        colour = G.C.FILTER
                    }
            end
        if context.selling_self and card.ability.extra.rounds >= card.ability.extra.rounds_to_sell and not context.blueprint then
                return {
                    func = function()
                        play_sound("omori_dlwindow_sold")
                        local created_joker = false
                        if #G.jokers.cards <= G.jokers.config.card_limit then
                            created_joker = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    SMODS.add_card({ set = 'Joker', edition = SMODS.poll_edition { key = "j_omori_dlwindow_sold", guaranteed = true, no_negative = false }})
                                    G.GAME.joker_buffer = 0
                                    return true
                                end
                            }))
                        end
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                        end
                        return true
                    end
                }
            end
        end
    
}