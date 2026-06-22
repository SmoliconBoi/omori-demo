SMODS.Joker{ --Orange Joe
    key = "orangejoe",
    config = {
        extra = {
            chips = 150,
            chip_loss = 30
        }
    },
    loc_txt = {
        ['name'] = 'Orange Joe',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips',
            [2] = '{C:blue}-#2#{} Chips per',
            [3] = 'round played'
        }
    },
    pos = {
        x = 0,
        y = 8
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips,card.ability.extra.chip_loss}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.chips - card.ability.extra.chip_loss <= 0 then
                SMODS.destroy_cards(card,nil,nil,true)
                return{
                    message = localize('k_drank_ex'),
                    colour = G.C.CHIPS
                }
            else
            card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chip_loss
            return{
                message = localize{type = 'variable', key = 'a_chips_minus', vars = {card.ability.extra.chip_loss} },
                colour = G.C.CHIPS
                }
            end
        end
        if context.joker_main  then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
}