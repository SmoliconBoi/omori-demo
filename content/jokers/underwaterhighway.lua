SMODS.Joker{ --Underwater Highway
    key = "underwaterhighway",
    config = {
        extra ={
        }
    },
    loc_txt = {
        ['name'] = 'Underwater Highway',
        ['text'] = {
            [1] = 'Allows {C:attention}Straights{} to',
            [2] = 'be made in a loop',
            [3] = '{C:inactive}(ex:{} {C:attention}3 2 A K Q{C:inactive}){}'
        }
    },
    pos = {
        x = 5,
        y = 5
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',
}

SMODS.PokerHandPart:take_ownership('_straight',
    {
        func = function(hand)
            return get_straight(hand,
                next(SMODS.find_card('j_four_fingers')) and 4 or 5,
                not not next(SMODS.find_card('j_shortcut')),
                next(SMODS.find_card('j_omori_underwaterhighway'))
            )
        end,
    },
    true
)