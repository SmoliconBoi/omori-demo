SMODS.Joker{ --Good Morning
    key = "goodmorning",
    config = {
        extra ={
            mult = 0,
            mult_gain = 2,
            poker_hand = "High Card"
        }
    },
    loc_txt = {
        ['name'] = 'Good Morning',
        ['text'] = {
            [1] = 'Gains {C:red}+#1#{} Mult if poker',
            [2] = 'hand is a {C:attention}#2#{},',
            [3] = '{s:0.8}hand changes at end of round{}',
            [4] = '{C:inactive}(Currently{} {C:red}+#3#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 0,
        y = 11
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function (self,info_queue,card)
        return {vars = {card.ability.extra.mult_gain,localize(card.ability.extra.poker_hand, 'poker_hands'),card.ability.extra.mult}}
    end,
    set_ability = function(self, card, initial)
        local pokervar_hands = {}
            for handname, _ in pairs(G.GAME.hands) do
                if G.GAME.hands[handname].visible then
                    pokervar_hands[#pokervar_hands + 1] = handname
                end
            end
            if pokervar_hands[1] then
                card.ability.extra.poker_hand = pseudorandom_element(pokervar_hands, pseudoseed('pokervar' .. G.GAME.round_resets.ante))
            end
    end,
    calculate = function (self,card,context)
        if context.before and not context.blueprint then
            if context.scoring_name == card.ability.extra.poker_hand then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local pokervar_hands = {}
                for handname, _ in pairs(G.GAME.hands) do
                    if G.GAME.hands[handname].visible then
                        pokervar_hands[#pokervar_hands + 1] = handname
                    end
                end
                if pokervar_hands[1] then
                    card.ability.extra.poker_hand = pseudorandom_element(pokervar_hands, pseudoseed('pokervar' .. G.GAME.round_resets.ante))
                end
            return {
                message = localize('k_reset')
            }
        end
    end
}