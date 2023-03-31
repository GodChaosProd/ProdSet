animState = "blank"

victim = nil
health = nil

lock = true
--animator.setAnimationState("bodyState", "fed4")
--animator.playSound("digest")

eatenovLines = {	"*GLK*",
				"*GLP* Ahhh...~",
				"Enjoy your stay in my gut.~",
				"Mmnh... Tasty~",
				"*GLRK* Mmnh. That hit the spot.~",
				"Mph! You taste amazing!~",
				"^pink;*He forces you down his elastic gullet, your form defined and detailed through his taut skin as he swallows you down...*"
}

eatenavLines = {	"Right up... there... Yes!~",
				"Look at that! I sucked you in!~",
				"Enjoy your stay in my gut.~",
				"Oh my... oh my... Oh yes!~",
				"*SHLRK*",
				"*SHLRP*",
				"^pink;*He lifts his rump up in the air, his muscles massaging your body as they press tightly against it. He clenches, and you disappear behind the valve with a wet squelch.*"
}

idleLines = {	"I'll be gentle.~",
				"I bet you're going to love this.~",
				"So uh...wanna get in my belly?",
				"I have glowing internals, so I think you may be able to see where you are going.~",
				"I have a bath waiting for you down my throat... or up my tailhole...~",
				"^pink;*Licks lips* ^white;Give it a try.~",
				"^pink;*He opens his pale-violet, glowing maw, giving you a good look down his throat.*",
				"^pink;*He widens his tailhole, revealing a pale-violet, glowing, fleshy passage.*",
				"You look real tasty.~"
}

bellyLines = {	"Cozy in there?~",
				"I won't harm you.~",
				"You're a real squirmer.~",
				"Lemme know if you want out.~",
				"Can you see just fine in there?",
				"Give me the signal to fill my gut up if you want it.~",
				"You feel amazing in there.~"
}

releaseovLines = {	"ACK!~",
				"*HLRK*",
				"*URK!* Easy on the throat there!~",
				"Nmf!~",
				"Yikes! You wiggle too much!~",
				"*ULK*",
				"Don't leave me all alone! ;-;"
}

releaseavLines = {	"Gah!~",
				"OH... MY... GOD!!~",
				"Holy... Wow!!~",
				"That felt amazing!~",
				"No way this is true!~",
				"Do it again! Do it again!~",
				"Don't leave me all alone! ;-;"
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
				animator.setAnimationState("bodyState", "swallowov")
				object.say( eatenovLines[ math.random( #eatenovLines ) ] )
				animator.playSound("ovswallow")
			else
				animator.setAnimationState("bodyState", "swallowav")
				object.say( eatenavLines[ math.random( #eatenavLines ) ] )
				animator.playSound("avswallow")
			end
			lock = false
			
		end	
	
		if health == nil then
			health = 1
		end
	
		if math.random(200) == 1 then
			object.say( bellyLines[ math.random( #bellyLines ) ] )
		elseif math.random(200) == 1 then
			animator.playSound("gurgle")
		end
		
		if health < 0.8 and animState == "full1" then
			animator.setAnimationState("bodyState", "digest1")
		elseif health < 0.5 and animState == "full2" then
			animator.setAnimationState("bodyState", "digest2")
		elseif health < 0.3 and animState == "full3" then
			animator.setAnimationState("bodyState", "digest3")
			animator.playSound("digest")
		end
		
	else
		
		lock = true
	
		if animState == "full1" or animState == "full2" or animState == "full3" then
			if math.random() < 0.5 then
				animator.setAnimationState("bodyState", "releaseov")
				object.say( releaseovLines[ math.random( #releaseovLines ) ] )
			else
				animator.setAnimationState("bodyState", "releaseav")
				object.say( releaseavLines[ math.random( #releaseavLines ) ] )
			end
			animator.playSound("release")	
	
			if animState == "midle" or animState == "stomachidle" then
				animator.setAnimationState("bodyState", "standing")
			end
		end 
		if math.random(200) == 1 then
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