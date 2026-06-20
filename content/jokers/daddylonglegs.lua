SMODS.Joker{ --DADDY LONGLEGS
    key = "daddylonglegs",
    config = {
        extra = {
            size_increase = 2,
            in_build = false,
            hand_count = 0
        }
    },
    loc_txt = {
        ['name'] = 'DADDY LONGLEGS',
        ['text'] = {
            [1] = '{C:attention}+#1#{} hand size per',
            [2] = 'unique {C:attention}secret hand{}',
            [3] = 'discovered this run',
            [4] = '{C:inactive}(Currently{} {C:attention}+#2#{}{C:inactive}){}'
        }
    },
    pos = {
        x = 8,
        y = 3
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars=function(self,info_queue,card)
        local secrets_found = 0
        for k, v in pairs(G.GAME.hand_usage) do
            for i = 1, #secret_hand_list do
                if v.order == secret_hand_list[i] then
                    secrets_found = secrets_found + 1
                end
            end
        end
        return{vars={card.ability.extra.size_increase,secrets_found * card.ability.extra.size_increase}}
    end,

    add_to_deck = function (self,card)
        local secrets_found = 0
        for k, v in pairs(G.GAME.hand_usage) do
            for i = 1, #secret_hand_list do
                if v.order == secret_hand_list[i] then
                    secrets_found = secrets_found + 1
                end
            end
        end
        G.hand:change_size(secrets_found*card.ability.extra.size_increase)
        card.ability.extra.hand_count=secrets_found
        card.ability.extra.in_build = true
    end,
    update = function (self,card,dt)
        local secrets_found = 0
        for k, v in pairs(G.GAME.hand_usage) do
            for i = 1, #secret_hand_list do
                if v.order == secret_hand_list[i] then
                    secrets_found = secrets_found + 1
                end
            end
        end
        if card.ability.extra.in_build then
            if card.ability.extra.hand_count ~= secrets_found then
            G.hand:change_size((secrets_found-card.ability.extra.hand_count)*card.ability.extra.size_increase)
            card.ability.extra.hand_count=secrets_found
            end
        end
    end,
    remove_from_deck = function (self,card)
        local secrets_found = 0
        for k, v in pairs(G.GAME.hand_usage) do
            for i = 1, #secret_hand_list do
                if v.order == secret_hand_list[i] then
                    secrets_found = secrets_found + 1
                end
            end
        end
        G.hand:change_size(-secrets_found*card.ability.extra.size_increase)
        card.ability.extra.in_build = false
    end
}