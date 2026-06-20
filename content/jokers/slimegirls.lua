SMODS.Joker{ --SLIME GIRLS
    key = "slimegirls",
    config = {
        extra = {
            poker_hand = "Three of a Kind"
        }
    },
    loc_txt = {
        ['name'] = 'SLIME GIRLS',
        ['text'] = {
            [1] = 'If {C:attention}first hand{} of round is',
            [2] = 'a {C:attention}#1#{}, convert',
            [3] = 'all scored cards into',
            [4] = '{C:attention}Steel{}, {C:attention}Wild{}, or {C:attention}Glass Cards{}'
        }
    },
    pos = {
        x = 8,
        y = 6
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
        info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
        return {vars = {localize(card.ability.extra.poker_hand, 'poker_hands')}}
    end,

    calculate = function(self, card, context) 
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.before and not context.blueprint then
            if context.scoring_name == "Three of a Kind" and G.GAME.current_round.hands_played == 0 then
                local cards = 0
                    for _, scored_card in ipairs(context.scoring_hand) do
                        if not scored_card.debuff then
                            cards = cards + 1
                            scored_card:set_ability(
                                SMODS.poll_enhancement({guaranteed = true, type_key = "slimegirls", options = {"m_steel","m_wild","m_glass"} }),
                                nil,
                                true
                            )
                                G.E_MANAGER:add_event(Event({
                                func = function()
                                    scored_card:juice_up()
                                    return true 
                                end
                            }))
                        end    
                    end      
                if cards > 0 then
                    return {
                    message="Modified!"
                    }
                end
            end
        end
    end
}