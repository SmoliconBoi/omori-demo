SMODS.Joker{ --CAPTAIN SPACEBOY
    key = "captspaceboy",
    config = {
        extra = {
            odds = 3,
            poker_hand = "Pair"
        }
    },
    loc_txt = {
        ['name'] = 'CAPTAIN SPACEBOY',
        ['text'] = {
            [1] = 'All {C:planet}Planet{} cards have a',
            [2] = '{C:green}#1# in #2#{} chance to also',
            [3] = 'upgrade level of {C:attention}#3#{}'
        }
    },
    pos = {
        x = 4,
        y = 3
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    set_ability = function(self, card, initial)
        if OMORI.config.easter_eggs and ((pseudorandom("spaceboy") <1/3)) then
            card.children.center:set_sprite_pos({x = 8,y=12})
        end
    end,
    
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_omori_captspaceboy')
        return {vars = {numerator, denominator,localize(card.ability.extra.poker_hand, 'poker_hands')}}
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == "Planet" and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'mercury', 1, card.ability.extra.odds, 'j_omori_captspaceboy', false) then
                return{
                --    message = localize('k_level_up_ex'),
                    SMODS.upgrade_poker_hands({hands={card.ability.extra.poker_hand},level_up=1,from=context.consumeable})
                }
            end
        end
    end

}