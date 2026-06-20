SMODS.Joker{ --Neighbour's Room
    key = "neighboursroom",
    config = {
        extra = {
            repetitions = 2
        }
    },
    loc_txt = {
        ['name'] = "Neighbour's Room",
        ['text'] = {
            [1] = 'When round begins, apply',
            [2] = 'a random {C:attention}Enhancement{}',
            [3] = 'to {C:attention}#1#{} cards held in hand'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.repetitions}}
    end,

    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local valid_cards = 0
            for _, card in ipairs(G.hand.cards) do
                if not card.debuff then
                valid_cards = valid_cards + 1
                end
            end
            local cards_changed = 0
            for i = 1, math.min(card.ability.extra.repetitions,valid_cards) do
                local set = true
                while set do
                    local card_to_enhance = pseudorandom_element(G.hand.cards,"neighboursroom_convert")
                        if not card_to_enhance.changed then    
                            card_to_enhance:set_ability(SMODS.poll_enhancement({guaranteed = true, type_key = "j_omori_neighboursroom"}),nil,true)  
                            card_to_enhance.changed = true
                            cards_changed = cards_changed + 1
                            set = false
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.1,
                                func = function ()
                                    card_to_enhance:juice_up()
                                    return true
                                end
                            }))
                        end
                    end
            end
            for _, clean_up in ipairs(G.hand.cards) do
                if clean_up.changed then 
                    clean_up.changed = nil 
                end
            end
            if cards_changed > 0 then 
            return{
                message = "Opened!"
            }
            end
        end
    end
}