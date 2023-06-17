require "/scripts/vore/npcvore.lua"

isDigest	= true
effect		= "npcdigestvore"

playerLines = {		"How is it in there?~",
					"I am so gonna love to add ya to my body~",
					"^pink;*She kneads you about.*",
					"You asked for it.~"
}
rubLines = {		"Nope. Once in, there is no way out.~",
					"*purrs* Sorry if you think my hospitality isn't good enough.~",
					"Not gonna happen, bub.~",
					"Keep squirming for me.~",
					"Good try. But no...~",
					"Stay a while.~ *Churr*",
					"*HGK! GLK!* Close!~",
					"^pink;*You attempt to force your way back up, but she swallows you back down.*"
}
swallowLines = {	"*GLP*",
					"*GLK*",
					"*GLK GLP URP*",
					"Ahh... You hit the spot...~",
					"*Purrs*",
					"You taste wonderful...~",
					"*GLRK* Tasty.~"
}
releaseLines = {	"Where are you going?!",
					"Was it too much for you?~",
					"Wow, you're strong.~",
					"Out of me... but not for long.~",
					"Lemme give you good solid lick before I eat you again.~",
					"*HURK!*"
}

function initHook()

	index = npc.getItemSlot("legs").parameters.colorIndex

	legs[2] = {
		name = "samlegsbelly",
		parameters = {
					colorIndex = index
	}}
	index = npc.getItemSlot("head").parameters.colorIndex

	head[2] = {
		name = "samheadbelly",
		parameters = {
					colorIndex = index
	}}

end

function feedHook()
	world.spawnProjectile( "npcanimchomp" , world.entityPosition( tempTarget ), entity.id(), {0, 0}, false)
	world.spawnProjectile( "swallowprojectile" , world.entityPosition( tempTarget ), entity.id(), {0, 0}, false)
	sayLine( swallowLines )
end

function requestHook(args)
	world.spawnProjectile( "npcanimchomp" , world.entityPosition( victim[#victim] ), entity.id(), {0, 0}, false)
	world.spawnProjectile( "swallowprojectile" , world.entityPosition( victim[#victim] ), entity.id(), {0, 0}, false)
	sayLine( swallowLines )
end

function digestHook(id, time, dead)

	if containsPlayer() then
		npc.say("Hope you liked my hospitality this time.~")
	end

end

function updateHook()

	if  math.random(350) == 1 and containsPlayer() then
		sayLine( playerLines )
	end
	
end
function interact(args)

--    sb.logInfo("Interracted With")
    if isVictim(args.sourceId) then
--        sb.logInfo("Is a Victim")
        if squirmTimer >= 5 then
            squirmTimer = 0
            speaker = args.sourceId
            squirm(args)
        end
        
        if reqTimer >= 0.7 then
            reqTimer = 0
        else
            reqTimer = 0.7
            if math.random() < 0.3 then
              reqRelease(args)
		sayLine (releaseLines)
            else
              sayLine( rubLines )
            end
        end
    else
        if reqTimer >= 0.7 then
            reqTimer = 0
            oldInteract(args)
        elseif #victim >= capacity then
            rub(args)
        elseif isntEaten() then
            reqFeed(args)
        end
    end
    interactHook(args)
end