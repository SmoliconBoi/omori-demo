SMODS.Joker{ --Blacked Out Photograph
    key = "blackedoutphotograph",
    config = {
        extra = {
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = '__________',
        ['text'] = {
            [1] = 'Retrigger last',
            [2] = 'played {C:attention}face{} card',
            [3] = 'used in scoring'
        }
    },
    pos = {
        x = 7,
        y = 7
    },

    pixel_size = { h = 95 / 1.2 },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    set_ability = function(self, card, initial)
        if OMORI.config.easter_eggs and (pseudorandom("auby") < 1/6 and #SMODS.find_card("j_omori_aubreyrw") > 0)then
            card.children.center:set_sprite_pos({x = 9,y=12})
        end
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.repetitions}}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            local face = nil
                for i = #context.scoring_hand, 1, -1 do
                    if context.scoring_hand[i]:is_face() then
                        face = context.scoring_hand[i]
                        break
                    end
                end
            if context.other_card == face then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
    end
}