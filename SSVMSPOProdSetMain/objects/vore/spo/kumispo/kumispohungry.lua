animState = "blank"

victim = nil
health = nil

lock = true

eatenovLines = {	"*GLP* Mmm... So filling.~",
				"Enjoy your slow digestion.~",
				"*GLK* Ahhh, went down nice and smooth...",
				"*GLRK* I don't need introductions.~",
				"Down my throat and into my gut.~",
				"^pink;*He forces you down his elastic gullet, your form defined and detailed through his taut skin as he swallows you down...*"
}

eatenavLines = {	"Right up... there... Yes!~",
				"Look at that! I sucked you in!~",
				"Up my butt and into my gut.~",
				"Oh my... oh my... Oh yes!~",
				"*SHLRK* In ya go!~",
				"I love the chance for erotics...~",
				"^pink;*He lifts his rump up in the air, his muscles massaging your body as they press tightly against it. He clenches, and you disappear behind the valve with a wet squelch.*"
}


idleLines = {	"Hey, you! I want you in my gut.",
				"*URP* Yeesh, must've been from my last meal.",
				"I promise to make your digestion slow but fun.~",
				"Ever wanted to be part of a sexy Avali such as myself?~",
				"Come get in my stomach. You seem very pleasing.~",
				"I'm hungry. Fill me up, please.~",
				"^pink;*He opens his pale-violet, glowing maw, giving you a good look down his throat.* ^white;Here is a sneak peek.~",
				"You look real tasty.~",
				"Mm... Do you want to be forced in, or do you want to feed yourself to me.~?",
				"Can I give you a comforting sendoff?~",
				"I have glowing internals, so I think you may be able to see where you are going.~",
				"^pink;*He widens his tailhole, revealing a pale-violet, glowing, fleshy passage.*",
				"Lemme shove you down my throat, or up my tailhole...~"
}

bellyLines = {	"Try not to digest too fast.~",
				"You were so good. You know that, right?~",
				"I am gonna enjoy every moment of this.~",
				"*URP*",
				"I wish I can consume you again and again!",
				"You will become part of a great space predator!~",
				"*GRGL*",
				"Cozy in there?~",
				"You're a real squirmer, aren't you?~",
				"You aren't coming out the same way.~",
				"Can you see in there? I want you to see yourself.~",
				"*SQLCH*",
				"I will let you out soon enough.~",
				"H-holy... Ah... S-so close...~",
				"*CHIRP* Ah... I could stay like this forever...~"
}

releaseovLines = {	"ACK!~",
				"*HLRK*",
				"*URK!* Easy on the throat there!~",
				"Nmf!~",
				"Yikes! You wiggle too much!~",
				"I am not done yet! Come back!",
				"Don't leave me all alone! ;-;"
}

releaseavLines = {	"Let me finish you up first!",
				"OH... MY... GOD!!~",
				"Holy... Wow!!~",
				"That felt amazing!~",
				"Awh... I miss that feeling of you inside me already!~",
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