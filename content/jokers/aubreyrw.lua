SMODS.Joker{ --Aubrey (Faraway)
    key = "aubreyrw",
    config = {
        extra = {
            xmult = 1,
            xmult_gain = 0.1,
            limit = 2
        }
    },
    loc_txt = {
        ['name'] = 'Aubrey',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X#2#{} Mult',
            [2] = 'per {C:attention}consecutive hand{}',
            [3] = 'played without scoring',
            [4] = '{C:attention}#3#{} or more {C:attention}Glass Cards{}',
            [5] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 3,
        y = 9
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    enhancement_gate = "m_glass",
    atlas = 'OMO_jokers',

    loc_vars = function (self,info_queue,card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
        return {vars = {card.ability.extra.xmult,card.ability.extra.xmult_gain,card.ability.extra.limit}}
    end,
    calculate = function (self,card,context)
        if context.before and not context.blueprint then
            local glass = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                if SMODS.has_enhancement(scored_card,"m_glass") then
                    glass = glass + 1
                end
            end
            if glass >= card.ability.extra.limit and card.ability.extra.xmult > 1 then
                card.ability.extra.xmult = 1
                return{
                    message=localize('k_reset'),
                    colour=G.C.MULT
                }
            else
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
            end
        end
        if context.joker_main then
            return{
                xmult=card.ability.extra.xmult
            }
        end
    end
}