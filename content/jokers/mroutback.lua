SMODS.Joker{ --MR. OUTBACK
    key = "mroutback",
    config = {
        extra = {
            
        }
    },
    loc_txt = {
        ['name'] = 'MR. OUTBACK',
        ['text'] = {
            [1] = '{C:inactive,E:1}(Creator pls give me organs){}'
        }
    },
    pos = {
        x = 0,
        y = 4
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
    end,
    calculate = function (self,card,context)
    end
}