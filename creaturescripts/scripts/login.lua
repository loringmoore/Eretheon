local regenCondition = Condition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
regenCondition:setTicks(-1)
regenCondition:setParameter(CONDITION_PARAM_HEALTHTICKS, 500)
regenCondition:setParameter(CONDITION_PARAM_MANATICKS, 500)

function onLogin(cid)
	local player = Player(cid)

	local loginStr = "Welcome to " .. configManager.getString(configKeys.SERVER_NAME) .. "!"
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. " Please choose your outfit."
		player:sendOutfitWindow()
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format("Your last visit was on %s.", os.date("%a %b %d %X %Y", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	player:registerEvent("PlayerDeath")
	regenCondition:setParameter(CONDITION_PARAM_HEALTHGAIN, math.ceil(player:getMaxHealth() * 0.01))
    regenCondition:setParameter(CONDITION_PARAM_MANAGAIN, math.ceil(player:getMaxMana() * 0.01))
    player:addCondition(regenCondition)
	return true
end
