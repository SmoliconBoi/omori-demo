SMODS.Joker{ --White Tulip
    key = "whitetulip",
    config = {
        extra = {
            chips = 250
        }
    },
    loc_txt = {
        ['name'] = 'White Tulip',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips if all',
            [2] = 'played cards are',
            [3] = '{C:attention}not{} Enhanced'
        },
    },
    pos = {
        x = 2,
        y = 8
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
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local no_enhancement = true
            for _, played_card in ipairs(context.full_hand) do
                if played_card.config.center.key ~= "c_base" then
                    no_enhancement=false
                    break
                end
            end
            if no_enhancement then 
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}