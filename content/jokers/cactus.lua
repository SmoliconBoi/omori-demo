SMODS.Joker{ --Cactus
    key = "cactus",
    config = {
        extra = {
            mult = 6
        }
    },
    loc_txt = {
        ['name'] = 'Cactus',
        ['text'] = {
            [1] = 'Each played',
            [2] = '{C:attention}Stone Card{}',
            [3] = 'gives {C:red}+#1#{} Mult',
            [4] = 'when scored'
        }
    },
    pos = {
        x = 4,
        y = 8
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    enhancement_gate = "m_stone",
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
        return { vars = { card.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.has_enhancement(context.other_card,"m_stone") then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}