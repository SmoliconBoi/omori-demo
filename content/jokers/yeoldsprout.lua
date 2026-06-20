SMODS.Joker{ --YE OLD SPROUT
    key = "yeoldsprout",
    config = {
        extra = {
            mult = 6
        }
    },
    loc_txt = {
        ['name'] = 'YE OLD SPROUT',
        ['text'] = {
            [1] = '{C:blue}Common{} Jokers',
            [2] = 'each give {C:red}+#1#{} Mult'
        },
    },
    pos = {
        x = 0,
        y = 2
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function (self,info_queue, card)
        return{vars={card.ability.extra.mult}}
    end,

    calculate = function(self,card,context)
        if context.other_joker and context.other_joker.config.center.rarity == 1 then
            return{
                mult = card.ability.extra.mult
            }
        end
    end
}