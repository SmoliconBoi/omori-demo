SMODS.Joker{ --Hero
    key = "herorw",
    config = {
        extra = {
            mult = 4
        }
    },
    loc_txt = {
        ['name'] = 'Hero',
        ['text'] = {
            [1] = '{C:red}+4{} Mult for each {C:attention}Ace{}',
            [2] = 'in your full deck',
            [3] = '{C:inactive}(Currently{} {C:red}+#2#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        local ace_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:get_id() == 14 then ace_tally = ace_tally + 1 end
            end
        end
        return { vars = { card.ability.extra.mult, card.ability.extra.mult * ace_tally } }
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            local ace_tally = 0
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:get_id() == 14 then ace_tally = ace_tally + 1 end
                end
            end
            return {
            mult = card.ability.extra.mult * ace_tally
            }
        end
    end
}