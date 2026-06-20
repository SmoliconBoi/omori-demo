SMODS.Joker{ --My Time
    key = "mytime",
    config = {
        extra = {
            xmult = 6,
            xmult_loss = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'My Time',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult',
            [2] = '{X:red,C:white}-X#2#{} Mult for',
            [3] = 'every hand played'
        }
    },
    pos = {
        x = 9,
        y = 10
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult,card.ability.extra.xmult_loss}}
    end,
    
    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            if card.ability.extra.xmult - card.ability.extra.xmult_loss <= 1 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve({G.C.PURPLE}, nil, 1.6)
                        return true
                    end
                }))
            return {
                message = "Oyasumi...",
                colour = G.C.RED
            }
        else
            card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.xmult_loss
            return {
                message = localize { type = 'variable', key = 'a_xmult_minus', vars = { card.ability.extra.xmult_loss } },
                colour=G.C.RED
            }
            end
        end

        if context.joker_main  then
        return {
            Xmult = card.ability.extra.xmult
        }
        end
    end

}