SMODS.Joker{ --Lily of the Valley
    key = "lilyofthevalley",
    config = {
        extra = {
            xmult = 3
        }
    },
    loc_txt = {
        ['name'] = 'Lily of the Valley',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult during {C:attention}Boss Blind{}'
        }
    },
    pos = {
        x = 7,
        y = 8
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

        loc_vars = function(self, info_queue, card)
            return { vars = { card.ability.extra.xmult}}
        end,
    calculate = function(self, card, context)
        if context.joker_main  then
            if G.GAME.blind.boss then
                return {
                    Xmult = card.ability.extra.xmult
                }
            end
        end
    end
}