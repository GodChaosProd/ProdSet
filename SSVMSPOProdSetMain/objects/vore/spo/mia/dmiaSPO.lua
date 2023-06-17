animState = "blank"

victim = nil
health = nil

lock = true

eatenLines = {	"*GLK*",
				"*GLP* Thanks. I was hungry.",
				"*GLK* Right down my gullet...",
				"*GLRK* I don't need introductions.",
				"Tasty.",
				"^pink;*You end up in her slimy insides, coating you in a bunch of saliva.*",
				"I can't choke. Don't worry about me...",
				"I hope you like getting wet.",
				"Into my belly you go.",
				"Right down...",
				"You aren't coming back out."
}

idleLines = {	"*GRLL* Ugh... I am starving!",
				"*URP* Even my stomach is acting up...",
				"Lemme make it quick...",
				"Can I ask you to be my snack?",
				"You heard I can eat almost anything, right? Let's find out how.~",
				"Come on! Get in my stomach, please!",
				"^pink;*She widens her mouth, revealing her pale-violet, slimy gullet.*",
				"You look like the ideal snack...",
				"^pink;*Her stomach groans loudly, longing for a big meal.*"
}

bellyLines = {	"Nice and easy meal. Gonna store you for later.",
				"You were tasty. You know that, right?",
				"I am gonna make this quick for ya.",
				"*SQLCH*",
				"I mean it when I said I can eat anything.~",
				"Is it a bit tight in there?~",
				"You were tasty. Did anyone ever tell you that?~",
				"*URP*",
				"That hit the spot, but it won't be long before I get hungry again...",
				"*GRGL*",
				"^pink;*The hot stomach kneads strong acids into your skin.*",
				"Even if you are half-digested, you still fill me up.~",
				"That'll keep my belly busy for a bit.",
				"This is how I am able to eat anything I see.",
				"Already almost digested...",
				"*BRRP*"
}

digestLines = {	"Forever a part of my body.",
				"Agh... I am already hungry again. Guess it's time for seconds.~",
				"*BWUURP*",
				"Let's go search for another meal...",
				"*GRGL*",
				"^pink;*Whatever is left of you sinks into her intestine to be absorbed.*",
				"That filled me up.",
				"Yeesh, you digested quick.",
				"A predator like me needs nourishment. You did fit the bill perfectly.~",
				"Forever on my hips and belly..."
}


regurgLines = {	"ACK!",
				"*GLK GLP GLRK!*",
				"Hey!!",
				"Stop making this difficult!",
				"Very clever..."
}

gulletLines = {	"ACK!",
				"URK!",
				"*GLK* Yeesh! You're so stubborn!!",
				"I can't let you get out.",
				"You little..."
}

exitmouthLines = {	"*HLRK*",
				"Hey! I said no escaping!",
				"Come back! I wasn't done!",
				"Woah! Right up my gullet!~",
				"Come back! You felt good in there!~",
				"I wasn't done digesting you!"
}

backdownLines = {	"*GLK*",
				"*GLP* That'll teach ya.",
				"*GLK* Right back down my gullet...",
				"*GLRK*",
				"Tasty. Especially a second time.~",
				"^pink;*You end up back in her slimy insides.~*",
				"I hope you like getting more wet.~",
				"Down my gullet you go... Again.",
				"Right back down...",
				"I already told you that you aren't coming back out.~"
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
			animator.setAnimationState("bodyState", "gulp")
			lock = false
			object.say( eatenLines[ math.random( #eatenLines ) ] )
			animator.playSound("swallow")
		end
		
		if health == nil then
			health = 1
		end
		
		if math.random(200) == 1 and animState == "full" then
			object.say( bellyLines[ math.random( #bellyLines ) ] )
		elseif math.random(200) == 1 and animState == "full" then
			animator.playSound("belly")
		elseif math.random(200) == 1 and animState == "gullet" then
			object.say( gulletLines[ math.random( #gulletLines ) ] )
		elseif math.random(200) == 1 and animState == "gullet" then
			animator.playSound("belly")
		end
		
		if health < 0.2 and animState == "full" then
			animator.setAnimationState("bodyState", "digest")
			animator.playSound("digest")
			object.say( digestLines[ math.random( #digestLines ) ] )
		elseif health < 0.98 and animState == "gullet" then
			animator.setAnimationState("bodyState", "backdown")
			animator.playSound("swallow")
			object.say( backdownLines[ math.random( #backdownLines ) ] )
		elseif health > 0.99 and animState == "full" then
			animator.setAnimationState("bodyState", "regurg")
			object.say( regurgLines[ math.random( #regurgLines ) ] )
		end
		
	else
		
		lock = true
		
		if animState == "full" then
			animator.setAnimationState("bodyState", "exitmouth")
			object.say( exitmouthLines[ math.random( #exitmouthLines ) ] )
			animator.playSound("release")
		elseif animState == "gullet" then
			animator.setAnimationState("bodyState", "gulletexit")
			animator.playSound("release")
		end
		
		if animState == "midle" or animState == "stomachidle" then
			animator.setAnimationState("bodyState", "standing")
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
	
	if animState == "idle" and math.random(700) == 1 then	
		animator.setAnimationState("bodyState", "idle1")
		animator.playSound("idle")

	end
end

function onInteraction(args)

	victim = args.sourceId
	
end