SMODS.Joker{ --MEWO
    key = "mewo",
    config = {
        extra = {
            remaining = 3,
            every = 3,
            mult = 15
        }
    },
    loc_txt = {
        ['name'] = 'MEWO',
        ['text'] = {
            [1] = '{C:red}+#1#{} Mult every',
            [2] = '{C:attention}#2#{} hands played',
            [3] = '{C:inactive}#3# remaining{}'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {
                card.ability.extra.mult,
                card.ability.extra.every + 1,
                card.ability.extra.remaining}}
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.remaining = (card.ability.extra.every - 1 - (G.GAME.hands_played - card.ability.hands_played_at_create)) %
                (card.ability.extra.every + 1)
            if not context.blueprint then
                if card.ability.extra.remaining == 0 then
                    local eval = function(card) return card.ability.extra.remaining == 0 and not G.RESET_JIGGLES end
                    juice_card_until(card, eval, true)
                end
            end
            if card.ability.extra.remaining == card.ability.extra.every then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end,
        add_to_deck = function(self, card, from_debuff)
            play_sound("omori_mewo")
        end
}