require "/scripts/vore/npcvore.lua"

isDigest	= true
effect		= "npcdigestvore"

playerLines = {		"Feels good in there, does it not?~",
					"I am so gonna love to add ya to my body.~",
					"^pink;*She kneads you about.*",
					"^pink;*She gives her full belly a good slap*",
					"You asked for it, and you shall give me something.~"
}
rubLines = {		"Nope. Once in, there is no way out.~",
					"*Purrs* Sorry if you think my hospitality isn't good enough.~",
					"Not gonna get out, bub. You're mine now. Forever.~",
					"Not so pleasuring to exit, right?~",
					"Good try, but no.~",
					"Stay a while.~ *Churr*",
					"*HGK! GLK!* Close! But not close enough.~",
					"^pink;*You attempt to force your way back up, but she swallows you back down.*",
					"Keep on putting up a fight until the very end. It feels great!~"
}
swallowLines = {	"*GLP*",
					"*GLK*",
					"*GLK GLP URP*",
					"Ahh... You hit the spot...~",
					"*Purrs*",
					"Mmnh, fantastic...~",
					"*GLRK* Mmnh. Tasty.~",
					"*GLK* Shame I can't eat you again and again.~"
}
releaseLines = {	"Oh, fine... Next time, I'll have ya.~",
					"Fiesty, aren't ya?~",
					"Wow, you're strong.~",
					"Did you not like my hospitality?~",
					"Out of me... but not for long.~",
					"Lemme give you good solid lick, hmm?~",
					"Maybe we can try a new place next time around.~"
}
function initHook()

	index = npc.getItemSlot("legs").parameters.colorIndex

	legs[2] = {
		name = "seilegsbelly",
		parameters = {
					colorIndex = index
	}}
	index = npc.getItemSlot("head").parameters.colorIndex

	head[2] = {
		name = "seiheadbelly",
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
            if math.random() < 0.15 then
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