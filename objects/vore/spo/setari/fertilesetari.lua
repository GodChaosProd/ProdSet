animState = "blank"

victim = nil
health = nil

lock = true

eatenLines = {	"Mmph.~",
				"Hngah...~",
				"Eager are we?~",
				"You really wish to become a part of me?~",
				"Right up there... That's the ticket.~",
				"You slide in quite nicely. Hope you aren't afraid of getting wet.~",
				"No one's watching, luv.~"
}

idleLines = {	"Your last moments inside the comforting confines of my womb will be great! I am sure of it.~",
				"Wanna relax inside me?~",
				"I feel fertile today...~",
				"Think you can help me mix up my juices a little?~",
				"It's cozy and comfy.~",
				"Wish to become a part of me?~",
				"My juices will churn you up and the womb will absorb you. You won't feel pain.~",
				"Up here. Come on. I am sure you will like it.~",
				"Come on over here...~"
}

bellyLines = {	"Feels so good with you squirming inside me.~",
				"You're turning into a nice stew there.~",
				"Time for you to mix with my love juices.~",
				"Mmnh...~",
				"Relaxed, luv?~",
				"Hehe.~",
				"Want me to give you tentacle comfort?~",
				"I can feel you slowly getting softer.~",
				"This is all painless.~",
				"Mrrff...~",
				"Just for you, I will save the juice you become for a special occasion.~"
}

releaseLines = {	"Nnf!~",
				"*SHLK*",
				"You aren't juiced yet!~",
				"Oh, come on!",
				"Your choice... I guess...",
				"Nngh...~"
}

juicedLines = {	"NMF!~",
				"*SPLRCH*",
				"GYAH!~",
				"Ah... HAAH!~",
				"MPH!~",
				"NYAGH!~"
}

throatintroLines = {	"HRK!",
				"How did you find my throat hole?",
				"HLK!",
				"No, no. Don't go up that way!",
				"Hey!",
				"G-go back down!"
}

throatLines = {	"ACK!",
				"URK!",
				"*GLK* Yeesh! You didn't need to do that!",
				"Stop fighting it!",
				"*GLRK* Quit resisting!"
}

throatendLines = {	"*GLK*",
				"*GLP* Let this happen for both our sakes...",
				"*GLK* Ack... Don't do that!",
				"*GLRK*",
				"You strangely taste good...",
				"^pink;*You end up back in her womb*"
}
function init()

end

function update(dt)
		
	animState = animator.animationState("bodyState")
		
	if world.loungeableOccupied(entity.id()) then
	
		if victim ~= nil then
			health = world.entityHealth(victim)[1] / world.entityHealth(victim)[2]
		end
		
		if animState == "idle" and lock then
			animator.setAnimationState("bodyState", "swallow")
			lock = false
			object.say( eatenLines[ math.random( #eatenLines ) ] )
			animator.playSound("swallow")
		end
		
		if health == nil then
			health = 1
		end
		
		if math.random(200) == 1 and animState == "full1"then
			object.say( bellyLines[ math.random( #bellyLines ) ] )
		elseif math.random(200) == 1 and animState == "full2" then
			object.say( bellyLines[ math.random( #bellyLines ) ] )
		elseif math.random(200) == 1 and animState == "full3" then
			object.say( bellyLines[ math.random( #bellyLines ) ] )
		elseif math.random(200) == 1 and animState == "throat" then
			object.say( throatLines[ math.random( #throatLines ) ] )
		elseif math.random(150) == 1 then
			animator.playSound("gurgle")
		end
		
		if health < 0.6 and animState == "full1" then
			animator.setAnimationState("bodyState", "digest1")
		elseif health < 0.45 and animState == "full2" then
			animator.setAnimationState("bodyState", "digest2")
		elseif health < 0.3 and animState == "full3" then
			animator.setAnimationState("bodyState", "digest3")
			animator.playSound("digest")
			object.say( juicedLines[ math.random( #juicedLines ) ] )
		elseif health < 0.15 and animState == "after" then
			animator.setAnimationState("bodyState", "after2")
		elseif health < 0.998 and animState == "throat" then
			animator.setAnimationState("bodyState", "throatend")
			animator.playSound("gulp")
			object.say( throatendLines[ math.random( #throatendLines ) ] )
		elseif health > 0.61 and animState == "full2" then
			animator.setAnimationState("bodyState", "reform3")
		elseif health > 0.46 and animState == "full3" then
			animator.setAnimationState("bodyState", "reform2")
		elseif health > 0.31 and animState == "after" then
			animator.setAnimationState("bodyState", "reform1")
		elseif health > 0.998 and animState == "full1" then
			animator.setAnimationState("bodyState", "throatintro")
			animator.playSound("release")
			object.say( throatintroLines[ math.random( #throatintroLines ) ] )
		end
		
	else
		
		lock = true
		
		if animState == "full1" or animState == "full2" or animState == "full3" then
			animator.setAnimationState("bodyState", "release")
			object.say( releaseLines[ math.random( #releaseLines ) ] )
			animator.playSound("release")
		elseif animState == "after" then
			animator.setAnimationState("bodyState", "after2")
		elseif animState == "throat" then
			animator.setAnimationState("bodyState", "escape")
			object.say("HMLGK!")
			animator.playSound("escape")
		end
		
		if animState == "midle" or animState == "stomachidle" then
			animator.setAnimationState("bodyState", "standing")
		end
		
		if math.random(300) == 1 then
			local people = world.entityQuery( object.position(), 7, {
				withoutEntityId = entity.id(),
				includedTypes = {"player"},
				boundMode = "CollisionArea"
			})
			if #people > 0 then
				object.say( idleLines[ math.random( #idleLines ) ] )
			end
		end
	end
	
	if animState == "idle" and math.random(300) == 1 then	
		animator.setAnimationState("bodyState", "idle1")
	elseif animState == "idle" and math.random(300) == 1 then
		animator.setAnimationState("bodyState", "idle2")
	end
end

function onInteraction(args)

	victim = args.sourceId
	
end