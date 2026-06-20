SMODS.Joker{ --MR. PLANTEGG
    key = "stuffedtoy",
    config = {
        extra = {
            xmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'MR. PLANTEGG',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    set_ability = function(self, card, initial)
        if OMORI.config.easter_eggs and ((pseudorandom("mrplantegg") <1/143)) then
            card.children.center:set_sprite_pos({x = 7,y=12})
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
    end
}