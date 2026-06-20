SMODS.Joker{ --Sunflower
    key = "sunflower",
    config = {
        extra = {
            dollars = 2
        }
    },
    loc_txt = {
        ['name'] = 'Sunflower',
        ['text'] = {
            [1] = '{C:attention}Gold Cards{} held in',
            [2] = '{C:attention}first hand{} of round',
            [3] = 'each give {C:money}$#1#{}'
        }
    },
    pos = {
        x = 6,
        y = 8
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    enhancement_gate = "m_gold",
    atlas = 'OMO_jokers',
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
        return { vars = { card.ability.extra.dollars}}
    end,
    calculate = function (self, card, context)
        if (context.individual and context.cardarea == G.hand) then
            if SMODS.has_enhancement(context.other_card, 'm_gold') and G.GAME.current_round.hands_played == 0 then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
            end
        end
    end
}