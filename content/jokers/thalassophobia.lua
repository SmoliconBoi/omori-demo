SMODS.Joker{ --Thalassophobia
    key = "thalassophobia",
    config = {
        extra = {
            mult = 8,
            appeared = false
        }
    },
    loc_txt = {
        ['name'] = 'Thalassophobia',
        ['text'] = {
            [1] = '{C:red}+#1#{} Mult for each',
            [2] = 'remaining {C:attention}hand{}'
        }
    },
    pos = {
        x = 7,
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
        return {vars = {card.ability.extra.mult}}
    end,
    add_to_deck = function (self,card,from_debuff)
        card.ability.extra.appeared = true
    end,
    calculate = function (self,card,context)
        if context.joker_main then
            return{mult = G.GAME.current_round.hands_left * card.ability.extra.mult}
        end
    end,
    update = function (self,card,dt) 
        if card.ability.extra.appeared then
            G.PITCH_MOD = 0.5
        end
    end,
    remove_from_deck = function (self,card,from_debuff)
        card.ability.extra.appeared = false
    end
}