animState = "blank"

victim = nil
health = nil

lock = true
can_burp = true

eatenLines = { "Thanks for the meal...~",
	"You're so tasty.~",
	"Whew. You will put on weight.~",
	"*GLRK!* I'll keep you warm.~",
	"Mnh... Stay a while.",
	"Enjoy your stay, tasty one.~",
	"*GLK!* Mmnh...~"
}

aveatenLines = { "Thanks for the meal...~",
	"You're so filling.~",
	"Whew. You will put on weight.~",
	"*SHLRK!* I'll keep you warm.~",
	"Mnh... Stay a while.",
	"Enjoy your long stay.~",
	"*SHLK!* Mmnh...~"
}

idleLines = { "It's a big universe out there. Lemme keep you safe, forever.~",
	"Come here for a second.~",
	"I have a nice bed you can sleep in.~",
	"You can rest eternally cozy in my belly.~",
	"I've got a warm belly you can use for all of time.~",
	"Come on inside. You seem nice and tasty.~",
	"You got some time?~",
	"Gonna devour that cute little face.~"
}

bellyLines = { "You're so filling. Hope you're cozy in there.~",
	"Oooh, keep wriggling. Feels so good...~",
	"Enjoying yourself in there? I know I am...~",
	"So full...~",
	"Mmnh...~",
	"Stay as long as you want.~",
	"You're too cute to let out.~",
	"So full...~",
	"Mmnh...~",
	"You're going to make a nice addition to my body.~",
	"Mph. I'm going to even more chubby thanks to you.",
	"Thanks for adding to my chub.~"
}

digestLines = { "Mmngh...~",
	"Forever mine...~",
	"Yes...~",
	"Mmnh... So good...~",
	"Nothing but padding now...~"
}

digestedLines = { "*GRL* Hungry again...~",
	"Awe, still went to my gut.~",
	"Woah, gotta lay off the large prey.~",
	"*URP*",
	"I'm ready for seconds.~",
	"Too bad this new pudge isn't permanent...~"
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
  			if math.random() < 0.5 then
				animator.setAnimationState("bodyState", "swallow")
				object.say( eatenLines[ math.random( #eatenLines ) ] )
				animator.playSound("swallow")
			else
				animator.setAnimationState("bodyState", "avswallow")
				object.say( aveatenLines[ math.random( #aveatenLines ) ] )
				animator.playSound("swallowav")
			end
			lock = false
		end
		
		if health == nil then
			health = 1
		end
		
        	if math.random(300) == 1 and animState == "full1" then
            		object.say( bellyLines[ math.random( #bellyLines ) ] )
        	elseif math.random(300) == 1 and animState == "full2" then
            		object.say( bellyLines[ math.random( #bellyLines ) ] )
        	elseif math.random(300) == 1 and animState == "full3" then
            		object.say( bellyLines[ math.random( #bellyLines ) ] )
		elseif math.random(300) == 1 and animState == "padded" then
			object.say( digestedLines[ math.random( #digestedLines ) ] )
		elseif math.random(300) == 1 then
			animator.playSound("stomach")

		end
		
		if health < 0.6 and animState == "belly" then
			animator.setAnimationState("bodyState", "digest1")
			animator.playSound("stomach")
		elseif health < 0.4 and animState == "belly2" then
			animator.setAnimationState("bodyState", "digest2")
			animator.playSound("stomach")
		elseif health < 0.2 and animState == "belly3" then
			animator.setAnimationState("bodyState", "digest3")
			object.say( digestLines[ math.random( #digestLines ) ] )
			animator.playSound("digest")
		elseif health > 0.61 and animState == "belly2" then
			animator.setAnimationState("bodyState", "reform3")
		elseif health > 0.41 and animState == "belly3" then
			animator.setAnimationState("bodyState", "reform2")
		elseif health > 0.21 and animState == "padded" then
			animator.setAnimationState("bodyState", "reform1")
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
		
		if animState == "padded" then
			animator.setAnimationState("bodyState", "idle")
		end

		if animState == "belly" or animState == "belly2" or animState == "belly3" then
			if math.random() < 0.5 then
				animator.setAnimationState("bodyState", "avexit")
				animator.playSound("release")
			else
				animator.setAnimationState("bodyState", "regurg")
				animator.playSound("regurg")	
			end
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
	
	if animState == "idle" and math.random(300) == 1 then	
		animator.setAnimationState("bodyState", "idle1")
	elseif animState == "idle" and math.random(300) == 1 then	
		animator.setAnimationState("bodyState", "blink")
	elseif animState == "belly" and math.random(300) == 1 then	
		animator.setAnimationState("bodyState", "bellyalt1")
	elseif animState == "belly" and math.random(300) == 1 then	
		animator.setAnimationState("bodyState", "bellyalt2")
	elseif animState == "belly" and math.random(500) == 1 then	
		animator.setAnimationState("bodyState", "bellyalt3")
		animator.playSound("stomach")
	end
end

function onInteraction(args)

	victim = args.sourceId
	
end