SMODS.Joker{ --OMOLI
    key = "omoli",
    config = {
        extra = {
            xmult = 0.2,
            dollars = 10
        }
    },
    loc_txt = {
        ['name'] = 'OMOLI',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult for',
            [2] = 'every {C:money}$#2#{} you have',
            [3] = '{C:inactive}(Currently {}{X:red,C:white}X#3#{}{C:inactive} Mult){}'
        }
    },
    pos = {
        x = 8,
        y = 9
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.dollars, (1+card.ability.extra.xmult * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars)) } }
    end,

    calculate = function(self, card, context)
        if context.joker_main  then
            return {
                Xmult = 1 + card.ability.extra.xmult *
                    math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars)
            }
        end
    end
}