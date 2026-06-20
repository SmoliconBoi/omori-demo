SMODS.Joker{ --BOSS
    key = "boss",
    config = {
        extra = {
            mult = 20
        }
    },
    loc_txt = {
        ['name'] = 'BOSS',
        ['text'] = {
            [1] = '{C:red}+#1#{} Mult',
            [2] = '{C:red,E:2}self destructs{}',
            [3] = 'when {C:attention}Boss Blind{}',
            [4] = 'is defeated'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.joker_main  then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss and not context.blueprint then
            G.GAME.pool_flags.omori_boss_rush = true
            SMODS.destroy_cards(card, nil, nil, true)
            return {
                message = "Hidden!"
            }
        end
    end
}