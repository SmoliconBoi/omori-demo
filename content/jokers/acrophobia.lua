SMODS.Joker{ --Acrophobia
    key = "acrophobia",
    config = {
        extra = {
            chips = 143,
            appeared = false
        }
    },
    loc_txt = {
        ['name'] = 'Acrophobia',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips on {C:attention}final{}',
            [2] = '{C:attention}hand{} of round'
        }
    },
    pos = {
        x = 5,
        y = 9
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',
    
    loc_vars = function (self,info_queue,card)
        return {vars = {card.ability.extra.chips}}
    end,
    add_to_deck = function (self,card,from_debuff)
        card.ability.extra.appeared = true
    end,
    calculate = function (self,card,context)
        if context.joker_main and G.GAME.current_round.hands_left == 0 then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    update = function (self,card,dt) --yoinked from thorn ring
        if card.ability.extra.appeared then
            G.PITCH_MOD = 0.5
        end
    end,
    remove_from_deck = function (self,card,from_debuff)
        card.ability.extra.appeared = false
    end
}