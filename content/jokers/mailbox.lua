SMODS.Joker{ --MAILBOX
    key = "mailbox",
    loc_txt = {
        ['name'] = 'MAILBOX',
        ['text'] = {
            [1] = 'When {C:attention}Blind{} is selected,',
            [2] = 'create a {C:blue}Common{} or',
            [3] = '{C:green}Uncommon{} Joker',
            [4] = '{C:inactive}(Must have room){}'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    calculate = function(self, card, context)
        if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            local colour = nil
            local c_or_unc = nil

            if pseudorandom("cheers") < 1/2 then
                colour = G.C.BLUE
                c_or_unc = "Common"
            else
                colour = G.C.GREEN
                c_or_unc = "Uncommon"
            end
            
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({ set = 'Joker', rarity = c_or_unc, key_append = 'omori_cheers' })                        
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
            return {message = localize('k_plus_joker'), colour = colour}
        end
    end
}