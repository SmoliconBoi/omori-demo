SMODS.Joker{ --Red Rose
    key = "redrose",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Red Rose',
        ['text'] = {
            [1] = '{C:attention}Bonus Cards{} and',
            [2] = '{C:attention}Mult Cards{} are',
            [3] = 'considered the',
            [4] = 'same {C:attention}Enhancement{}'
        }
    },
    pos = {
        x = 5,
        y = 8
    },

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',
    loc_vars = function (self,info_queue)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
        info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
    end,
    calculate = function(self, card, context)
        if context.check_enhancement and not context.blueprint then
            if context.other_card.config.center.key == "m_bonus" then
                return{m_mult=true}
            end
            if context.other_card.config.center.key == "m_mult" then
                return{m_bonus=true}
            end
        end
    end,
    in_pool = function(self, args) --not sure if enhancement gate can do this '^^
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_bonus') or SMODS.has_enhancement(playing_card, 'm_mult') then
                return true
            end
        end
        return false
    end
}