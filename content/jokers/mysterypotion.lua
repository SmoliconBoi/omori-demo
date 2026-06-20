SMODS.Joker{ --Mystery Potion
    key = "mysterypotion",
    config = {
    },
    loc_txt = {
        ['name'] = 'Mystery Potion',
        ['text'] = {
            [1] = 'Sell this card to',
            [2] = 'add {C:dark_edition}Polychrome{}',
            [3] = 'to a random {C:attention}Joker{}'
        }
    },
    pos = {
        x = 0,
        y = 7
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
    end,
    
    calculate = function (self,card,context)
        if context.selling_self then
            local available_jokers = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card and not G.jokers.cards[i].edition then
                    table.insert(available_jokers, G.jokers.cards[i])
                end
            end
            local joker_to_edition = pseudorandom_element(available_jokers, "omori_mysterypotion")
            if joker_to_edition then
            joker_to_edition:set_edition('e_polychrome')
            end
            return nil, true
        end
    end
}