SMODS.Joker{ --HECTOR JR.
    key = "hectorjr",
    config = {
        extra = {
            chips = 0,
            chip_gain = 25
        }
    },
    loc_txt = {
        ['name'] = 'HECTOR JR.',
        ['text'] = {
            [1] = 'Gains {C:blue}+#2#{} Chips for',
            [2] = 'every {C:attention}Stone Card{}',
            [3] = 'discarded this round',
            [4] = '{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips){}'
        }
    },
    pos = {
        x = 1,
        y = 5
    },
    display_size = {
        w = 71 * 0.7, 
        h = 95 * 0.7
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    enhancement_gate = "m_stone",
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
        return {vars = {card.ability.extra.chips,card.ability.extra.chip_gain}}
    end,
    calculate = function(self, card, context)
        if context.discard and not context.blueprint then
            if SMODS.has_enhancement(context.other_card,"m_stone") then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.BLUE,
                    delay = 0.45
                }
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.chips > 0 then
                card.ability.extra.chips = 0
                return {
                    message = localize('k_reset'),
                    colour = G.C.BLUE
                }
            end
        end
    end
}