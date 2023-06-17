animState = "blank"

victim = nil
health = nil

lock = true
can_burp = true

eatenLines = {	"*GLK* Sit back and enjoy the ride.~",
				"You are one lucky individual.~",
				"*GLP* Here we are! Let's ride!~",
				"Down you go!~",
				"You feel so good sliding down my gullet.~",
				"*GLK*~"
}

idleLines = {	"Hey, you. Wanna be part of a different show?~",
				"Step right up for the best ride of your life!",
				"Let's add a bit of a twist.~",
				"Bring yourself up here! I wanna show you something!"
}

bellyLines = {	"I am so enjoying this.~",
				"*URP* You are really making me gassy.~",
				"My ass is a good exit if you want to come out.~"
}

danceLines = {	"No regrets, buddy!~",
				"Hold on to your ass now!~",
				"Damn, you're heavy!~"
}

dancesmallLines = {	"Oh yeah!~",
				"Mmnh...~",
				"Lighter this time.~"
}

exitLines = {	"*SHLK* Come again!~",
				"Leaving already? That's a damn shame...~",
				"Come back soon!~",
				"Let's do this again sometime.~"
}

exit2Lines = {	"*SHLK* Come again!~",
				"My gut nearly had ya there.~",
				"Heal on up so we can do this again.~",
				"My goodness. A little melted. Glad you held yourself together.~",
				"Got out before my gut can claim ya. Nice work.~"
}

digestLines = {	"Whoops! You waited way too long!~",
				"You had enough time to come out.~",
				"Forever as padding on my ass.~",
				"It's your own fault for letting me digest you.~",
				"You decided to become my meal, so I will make you my meal.",
				"Whoops. You just became my dinner.~",
				"Ahh... You were delicious...~",
				"Now my body has claimed yours.~",
				"And melt!~"

}

tosmallLines = {	"Were you this light?~",
				"Unless you're willing to be my meal, you have to come out.~",
				"You stopped moving.~",
				"Content with becoming my lunch?~",
				"The party won't stop then!",
				"I am not gonna hold back from here.~"
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
		
		if math.random(300) == 1 then
			object.say( bellyLines[ math.random( #bellyLines ) ] ) 
		end

		if health < 0.5 and animState == "bellyidle" then
			animator.setAnimationState("bodyState", "digest")
			object.say( tosmallLines[ math.random( #tosmallLines ) ] )
		elseif health < 0.15 and animState == "bellyidlesmall" then
			animator.setAnimationState("bodyState", "digest2")
			object.say( digestLines[ math.random( #digestLines ) ] )
			animator.playSound("digest")
		end

		if animState == "burp" then
    			if can_burp then
        			animator.playSound("burp")
        			can_burp = false
    			end
		else
    			can_burp = true
		end
		
	else
		
		lock = true
		
		if animState == "bellyidle" then
			animator.setAnimationState("bodyState", "exit")
			object.say( exitLines[ math.random( #exitLines ) ] )
			animator.playSound("release")
		elseif animState == "bellyidlesmall" then
			animator.setAnimationState("bodyState", "digest2")
			object.say( exit2Lines[ math.random( #exit2Lines ) ] )
			animator.playSound("release")

		end
		
		if animState == "midle" or animState == "stomachidle" then
			animator.setAnimationState("bodyState", "standing")
		end
		
		if math.random(700) == 1 then
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
	
	if animState == "idle" and math.random(50) == 1 then	
		animator.setAnimationState("bodyState", "dance")
	elseif animState == "idle" and math.random(200) == 1 then	
		animator.setAnimationState("bodyState", "blink")
	elseif animState == "bellyidle" and math.random(100) == 1 then
		animator.setAnimationState("bodyState", "bellydance")
		object.say( danceLines[ math.random( #danceLines ) ] )
	elseif animState == "bellyidle" and math.random(100) == 1 then
		animator.setAnimationState("bodyState", "clench")
		animator.playSound("clench")
	elseif animState == "bellyidle" and math.random(100) == 1 then
		animator.setAnimationState("bodyState", "struggle")
		animator.playSound("clench")
	elseif animState == "bellyidlesmall" and math.random(100) == 1 then
		animator.setAnimationState("bodyState", "bellydancesmall")
		object.say( dancesmallLines[ math.random( #dancesmallLines ) ] )
	elseif animState == "bellyidlesmall" and math.random(100) == 1 then
		animator.setAnimationState("bodyState", "clench2")
		animator.playSound("clench")
	elseif animState == "bellyidle" and math.random(300) == 1 then
		animator.playSound("gurgle")
	end
end

function onInteraction(args)

	victim = args.sourceId
	
end