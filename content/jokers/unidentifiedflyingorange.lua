SMODS.Joker{ --Unidentified Flying Orange
    key = "unidentifiedflyingorange",
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'U.F.O.',
        ['text'] = {
            [1] = 'Played {C:attention}face{} cards',
            [2] = 'have a {C:green}#1# in #2#{} chance',
            [3] = 'to gain a random',
            [4] = '{C:attention}seal{} when scored'
        },
    },
    pos = {
        x = 9,
        y = 2
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_omori_ufo') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
                local sealed = false
                    for _, scored_card in ipairs(context.scoring_hand) do
                        if SMODS.pseudorandom_probability(card, 'ufo_odds', 1, card.ability.extra.odds, 'j_omori_ufo', false) then
                            if scored_card:is_face() and not scored_card.seal and not scored_card.debuff then
                                sealed = true
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                            scored_card:set_seal(
                                                SMODS.poll_seal({ guaranteed = true, type_key = "ufo_seal" }),
                                                nil,
                                                true
                                            )
                                        scored_card:juice_up()
                                        return true
                                    end
                                }))
                                
                            end
                        end
                    end
                if sealed then
                    return{message="Orange!"}
                end
		end
    end

}
