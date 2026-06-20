SMODS.Joker{ --White Egret Orchid
    key = "whitegretorchid",
    config = {
        extra = {
            enhancement = "m_bonus",
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'White Egret Orchid',
        ['text'] = {
            [1] = 'Retrigger all',
            [2] = 'played {C:attention}#1#s',
            [3] = '{s:0.8}Card changes every round{}'
        },
    },
    pos = {
        x = 8,
        y = 8
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]
        return {vars = {localize{ type = 'name_text', set = 'Enhanced', key = card.ability.extra.enhancement} ,card.ability.extra.repetitions}}
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if playing_card.config.center.key ~= "c_base" then
                return true
            end
        end
        return false
    end,
    set_ability = function(self, card, initial)
        local valid_enhancement = {}
            for _, playing_card in ipairs(G.playing_cards or {}) do
                if playing_card.config.center.key ~= "c_base" then
                    valid_enhancement[#valid_enhancement + 1] = playing_card
                end
            end
        local orchid_card = pseudorandom_element(valid_enhancement, pseudoseed('enhancement'..G.GAME.round_resets.ante))
        if orchid_card then
            card.ability.extra.enhancement = orchid_card.config.center.key
        else
            local enhancement = get_current_pool("Enhanced")
                for enhance, _ in ipairs(enhancement) do
                    if enhance ~= "UNAVAILABLE" then
                        valid_enhancement[#valid_enhancement + 1] = enhance
                    end
                end
            if #valid_enhancement > 0 then
            card.ability.extra.enhancement = pseudorandom_element(enhancement, pseudoseed('enhancement'..G.GAME.round_resets.ante))
            end
        end
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, card.ability.extra.enhancement) then
                return{
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local valid_enhancement = {}
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card.config.center.key ~= "c_base" then
                        valid_enhancement[#valid_enhancement + 1] = playing_card
                    end
                end
            local orchid_card = pseudorandom_element(valid_enhancement, pseudoseed('enhancement'..G.GAME.round_resets.ante))
            if orchid_card then
                card.ability.extra.enhancement = orchid_card.config.center.key
            else
                local enhancement = get_current_pool("Enhanced")
                    for enhance, _ in ipairs(enhancement) do
                        if enhance ~= "UNAVAILABLE" then
                            valid_enhancement[#valid_enhancement + 1] = enhance
                        end
                    end
                if #valid_enhancement > 0 then
                card.ability.extra.enhancement = pseudorandom_element(enhancement, pseudoseed('enhancement'..G.GAME.round_resets.ante))
                end
            end
        end
    end
}