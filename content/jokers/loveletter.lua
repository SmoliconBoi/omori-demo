SMODS.Joker{ --Love Letter
    key = "loveletter",
    config = {
        extra = {
            mult = 0,
            mult_gain = 1
        }
    },
    loc_txt = {
        ['name'] = 'Love Letter',
        ['text'] = {
            [1] = '{C:red}+#1#{} Mult for each',
            [2] = 'card with {C:hearts}Heart{} suit',
            [3] = 'drawn this round',
            [4] = '{C:inactive}(Currently{} {C:red}+#2#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 1,
        y = 10
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function (self,info_queue,card)
        return {vars = {card.ability.extra.mult_gain,card.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.hand_drawn and not context.blueprint then
            local hearts = 0
            for i = 1, #context.hand_drawn do
                if context.hand_drawn[i]:is_suit("Hearts") or SMODS.has_any_suit(context.hand_drawn[i]) then
                    hearts = hearts + 1
                end
            end
            card.ability.extra.mult = card.ability.extra.mult + hearts * card.ability.extra.mult_gain
        end
        if context.joker_main then
            return{mult = card.ability.extra.mult}
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.mult = 0
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
        end
    end
}