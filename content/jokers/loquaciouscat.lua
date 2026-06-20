SMODS.Joker{ --LOQUACIOUS CAT
    key = "loquaciouscat",
    config = {
        extra = {
            chips = 75,
            mult = 5,
            xmult = 1.2,
            dollars = 2,
        }
    },
    loc_txt = {
        ['name'] = 'LOQUACIOUS CAT',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips, {C:red}+#2#{} Mult,',
            [2] = '{X:red,C:white}X#3#{} Mult, or earn {C:money}$#4#{}'
        },
    },
    pos = {
        x = 0,
        y = 10
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips,card.ability.extra.mult,card.ability.extra.xmult,card.ability.extra.dollars}}
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local rand = pseudorandom("loquaciouscat") * 3
            if math.floor(rand) < 0 then
                return {
                    chips = card.ability.extra.chips
                }
            elseif math.floor(rand) < 1 then
                return {
                    mult = card.ability.extra.mult
                }
            elseif math.floor(rand) < 2 then
                return {
                    xmult = card.ability.extra.xmult
                }
            else
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