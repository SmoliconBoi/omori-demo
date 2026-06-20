SMODS.Joker{ --Life Jam
    key = "lifejam",
    config = {
        extra = {
            mult = 15,
            percent = 50,
            mult_loss = 5
        }
    },
    loc_txt = {
        ['name'] = 'Life Jam',
        ['text'] = {
            [1] = 'Prevents Death',
            [2] = 'if chips scored',
            [3] = 'are less than {C:attention}#1#%{}',
            [4] = 'of required chips,',
            [5] = 'loses {C:red}+#3#{} Mult',
            [6] = '{C:inactive}(Currently{} {C:red}+#2#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 8,
        y = 2
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.percent,card.ability.extra.mult,card.ability.extra.mult_loss}}
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
        if (context.end_of_round and context.game_over and context.main_eval) and to_big(G.GAME.chips / G.GAME.blind.chips) <= to_big(card.ability.extra.percent / 100) and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand_text_area.blind_chips:juice_up()
                    G.hand_text_area.game_chips:juice_up()
                    play_sound('tarot1')
                    return true
                end
            }))
                if card.ability.extra.mult - card.ability.extra.mult_loss <= 0 then
                    SMODS.destroy_cards(card, nil, nil, true)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Emptied!", colour = G.C.RED})
                else
                    card.ability.extra.mult = card.ability.extra.mult-card.ability.extra.mult_loss
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-" .. card.ability.extra.mult_loss, colour = G.C.MULT})
                end
            return {
                saved = "Revived by Life Jam!",
                colour = G.C.RED
            }
        end
    end
}