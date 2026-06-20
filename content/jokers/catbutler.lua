SMODS.Joker{ --BUTLER
    key = "catbutler",
    config = {
        extra ={
            dollars = 3
        }
    },
    loc_txt = {
        ['name'] = 'BUTLER',
        ['text'] = {
            [1] = 'Earn {C:money}$#1#{} when a',
            [2] = '{C:attention}playing card{}',
            [3] = 'with {C:spades}Spade{} suit',
            [4] = 'is destroyed'
        }
    },
    pos = {
        x = 9,
        y = 9
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function (self,info_queue,card)
        return {vars = {card.ability.extra.dollars}}
    end,
    calculate = function (self,card,context)
        if context.remove_playing_cards and not context.blueprint then
            local spades = 0
            for _, removed_card in ipairs(context.removed) do
                if removed_card:is_suit('Spades', nil, true) then
                    spades = spades + 1
                end
            end
            if spades > 0 then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + (card.ability.extra.dollars * spades)
                return {
                    dollars = (card.ability.extra.dollars * spades),
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