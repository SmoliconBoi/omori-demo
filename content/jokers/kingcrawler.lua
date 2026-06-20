SMODS.Joker{ --KING CRAWLER
    key = "kingcrawler",
    config = {
        extra = {
            chips = 0,
            chip_times = 4
        }
    },
    loc_txt = {
        ['name'] = 'KING CRAWLER',
        ['text'] = {
            [1] = 'When {C:attention}Blind{} is selected,',
            [2] = 'destroy Joker to the',
            [3] = 'left and add {C:attention}#1#{} times',
            [4] = 'its sell value to {C:blue}Chips{}',
            [5] = '{C:inactive}(Currently{} {C:blue}+#2#{} {C:inactive}Chips){}'
        },
    },
    pos = {
        x = 9,
        y = 3
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chip_times,card.ability.extra.chips}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        my_pos = i
                        break
                    end
                end
            
                if my_pos and G.jokers.cards[my_pos - 1] and not SMODS.is_eternal(G.jokers.cards[my_pos - 1], card) and not G.jokers.cards[my_pos - 1].getting_sliced then 
                    local target_joker = G.jokers.cards[my_pos - 1]
                    target_joker.getting_sliced = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.joker_buffer = 0
                            card.ability.extra.chips = card.ability.extra.chips + target_joker.sell_cost * card.ability.extra.chip_times
                            card:juice_up(0.8, 0.8)
                            target_joker:start_dissolve({G.C.BLUE}, nil, 1.6)
                            play_sound("omori_crawler_bite")
                            return true
                        end
                    }))
                    return {
                        message = localize { type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips + 4 * target_joker.sell_cost} },
                        colour = G.C.BLUE,
                        no_juice = true}
                    end
                end

        if context.joker_main  then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}
