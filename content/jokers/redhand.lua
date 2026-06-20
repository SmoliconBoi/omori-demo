SMODS.Joker{ --RED HAND
    key = "redhand",
    config = {
        extra = {
            ante_loss = 1,
            rounds = 0,
            rounds_to_sell = 4
        }
    },
    loc_txt = {
        ['name'] = 'RED HAND',
        ['text'] = {
            [1] = 'After {C:attention}#1#{} rounds,',
            [2] = 'sell this card',
            [3] = 'for {C:attention}-#2#{} Ante',
            [4] = '{C:inactive}(Currently{} {C:attention}#3#{}{C:inactive}/#1#){}'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.rounds_to_sell,card.ability.extra.ante_loss,card.ability.extra.rounds} }
	end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            card.ability.extra.rounds = card.ability.extra.rounds + 1
                if card.ability.extra.rounds == card.ability.extra.rounds_to_sell  then
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
        if context.selling_self and not context.blueprint then
            if G.GAME.round_resets.ante > 0 and (card.ability.extra.rounds >= card.ability.extra.rounds_to_sell) then
                    play_sound("omori_redhand",1,0.7)
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra.ante_loss    
                    ease_ante(-card.ability.extra.ante_loss)
                return {
                    message = -card.ability.extra.ante_loss.. " Ante"
                }
            end
        end
    end
}