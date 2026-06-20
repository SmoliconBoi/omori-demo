SMODS.Back { --White Deck
    key = 'white',
    pos = { x = 0, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'White Deck',
        text = {
            [1] = 'Start run with',
            [2] = '{C:attention,T:j_omori_lightbulb}Lightbulb{} and {C:attention,T:j_omori_mewo}MEWO{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'OMO_decks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    local lightbulb = SMODS.add_card({ set = 'Joker', key = 'j_omori_lightbulb' }):start_materialize()
                    local mewo = SMODS.add_card({ set = 'Joker', key = 'j_omori_mewo' }):start_materialize()
                    return true
                end
            end
        }))
    end
}

SMODS.Back { --Hooligan Deck (effect tweaks by Survivalaren)
    key = 'hooligan',
    pos = { x = 1, y = 0 },
    config = {
        vouchers = {'v_clearance_sale','v_reroll_surplus',},
        ante_scaling = 1.5
    },
    loc_vars = function(self, info_queue, back)
        return {vars = {self.config.ante_scaling}}
    end,
    loc_txt = {
        name = 'Hooligan Deck',
        text = {
            [1] = 'Start run with the',
            [2] = '{C:money,T:v_clearance_sale}Clearance Sale{} and',
            [3] = '{C:green,T:v_reroll_surplus}Reroll Surplus{} vouchers',
            [4] = '{C:red}X#1#{} base Blind size'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'OMO_decks',
    apply = function(self, back)
    --    G.GAME.bankrupt_at = G.GAME.bankrupt_at - self.config.bankrupt_at
    --    G.GAME.win_ante = self.config.ante_win
    end
}

--[[SMODS.Back { --Kel & Hero Deck
    key = '???',
    pos = { x = 2, y = 0 },
    config = {
    },
    loc_vars = function(self, info_queue, back)
    end,
    loc_txt = {
        name = '??? Deck',
        text = {
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'OMO_decks',
    apply = function(self, back)
    end
}]]--

SMODS.Back { --Floral Deck (effect idea by Codzilla)
    key = 'floral',
    pos = { x = 3, y = 0 },
    config = {
        hand_size = -1,
        hand_size_gain = 1
    },
    loc_vars = function(self, info_queue, back)
        return {vars = { self.config.hand_size, self.config.hand_size_gain}}
    end,
    loc_txt = {
        name = 'Floral Deck',
        text = {
            [1] = '{C:attention}+#2#{} hand size',
            [2] = 'per hand played',
            [3] = 'each round',
            [4] = '{C:red}#1#{} hand size'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'OMO_decks',
    calculate = function (self,back,context)
        if context.after then
            G.E_MANAGER:add_event(Event({
                func = function ()
                    G.hand:change_size(self.config.hand_size_gain)
                    G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + self.config.hand_size_gain
                    return true
                end
            }))
        elseif context.round_eval then
            G.hand:change_size(-G.GAME.current_round.hands_played*self.config.hand_size_gain)
            G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size - G.GAME.current_round.hands_played*self.config.hand_size_gain
        end
    end
}


SMODS.Back { --Waltz Deck
    key = 'waltz',
    pos = { x = 4, y = 0 },
    config = {
        discards = -1
    },
    loc_vars = function(self, info_queue, back)
        return {vars = { self.config.discards}}
    end,
    loc_txt = {
        name = 'Waltz Deck',
        text = {
            [1] = 'Start with a {C:attention}Eternal{}',
            [2] = '{C:dark_edition}Negative{} {C:attention,T:j_omori_picnicbasket}Picnic Basket{}',
            [3] = '{C:red}#1#{} discard every round'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'OMO_decks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    local picnicbasket = SMODS.add_card({ set = 'Joker', key = 'j_omori_picnicbasket', stickers = {'eternal'}, force_stickers = true, edition = 'e_negative' }):start_materialize()
                    return true
                end
            end
        }))
    end
}