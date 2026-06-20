SMODS.Joker{ --THE MAVERICK
    key = "themaverick",
    config = {
        extra = {
            dollars = 5,
            name = 'THE MAVERICK'
        }
    },
    loc_txt = {
        ['name'] = 'THE MAVERICK',
        ['text'] = {
            [1] = 'Bestows {C:money}$#1#{} if all cards',
            [2] = 'held in thee\'s hand are',
            [3] = 'of {C:hearts}Hearts{} or {C:diamonds}Diamonds{}'
        }
    },
    pos = {
        x = 1,
        y = 9
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

	loc_vars = function(self, info_queue, card)
		local light_suits = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:is_suit("Hearts", nil, true) and not playing_card:is_suit("Diamonds", nil, true) then light_suits = light_suits + 1 end
            end
        else
            light_suits = 1
        end
        if math.fmod(os.time(), 10) == 0 or light_suits <= 0 then
			return {
				key = "j_omori_mikhael",
                vars = {card.ability.extra.dollars}
			}
		end
        return {vars = {card.ability.extra.dollars}}
	end,
    
    calculate = function(self, card, context)
        if context.joker_main then
                local mav_check = true
            for _, playing_card in ipairs(G.hand.cards) do
                if not playing_card:is_suit("Hearts", nil, true) and not playing_card:is_suit("Diamonds", nil, true) then
                    mav_check = false
                    break
                end
            end
            if mav_check then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
            end
        end
    end
}
--Dummy Joker for easter egg (shamefully stolen from John Mantle)
SMODS.Joker{
    key = "mikhael",
    loc_txt = {
        ['name'] = 'Mikhael',
        ['text'] = {
            [1] = 'Bestows {C:money}$#1#{} if all cards',
            [2] = 'held in thee\'s hand are',
            [3] = 'of {C:hearts}Hearts{} or {C:diamonds}Diamonds{}'
        }
    },
    no_collection = true,
	in_pool = function(self, args)
		return false
	end,
}