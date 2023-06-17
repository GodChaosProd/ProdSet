animState = "blank"

victim = nil
health = nil

lock = true

eatenLines = {	"*GLK*",
				"*GLP* You wanted this.~",
				"*GLK* You feel so good sliding down my gullet...~",
				"*GLRK* I don't need introductions.~",
				"Mmnh... Tasty.~",
				"^pink;*You end up in her slimy insides, coating you in a bunch of saliva.*",
				"I can't choke. Don't worry about me...~",
				"That hit the spot.~",
				"Mmnh...~ Alright, down you go.~",
				"Right down my gullet.~",
				"Should I help you along?~"
}

idleLines = {	"*GRLL* Ugh... I need something in my belly...~",
				"*URP* Think you can do something for me?~",
				"Hey, in here.~",
				"Can I ask you to be my belly snack?~",
				"I won't digest you. Honest.~",
				"Want me to be your sleeping bag?~",
				"^pink;*She widens her mouth, revealing her pale-violet, slimy gullet.*",
				"I know just how to keep you safe...~",
				"^pink;*Her stomach groans loudly, longing for something in it.*"
}

bellyLines = {	"You do make a good breakfast.~",
                                "Make yourself comfy.~",
				"*SQLCH*",
				"My gut is amazing, isn't it?~",
				"Don't mind the slime.~",
				"Want to take a full tour afterwards?~",
				"Is it a bit tight in there?~",
				"You were tasty. You know that, right?~",
				"*URP*",
				"That truly hit the spot.~",
				"*GRGL*",
				"Don't be so afraid. I won't digest you.~",
				"^pink;*The warm stomach kneads juices into your skin.*",
				"You really fill me up.~",
				"You must be quite injured... Good thing you came to me.~",
				"You got me worried, cutie!~",
				"Stay inside me until you are fully healed.~",
				"*BELCH* Woah! Excuse me...~"
}


regurgLines = {	"You healing nicely?~",
				"Wow... You heal quite fast...~",
				"*HLK!* Back up my throat...~",
				"Mmnh...~",
				"You are just so tempting to swallow back down...~",
				"^pink;*She presses you back up her throat.*",
				"*HMRK!*",
				"You not coming out just yet, cutie.~",
				"Good thing my juices have healing properties... Some of the time.~"
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
		elseif math.random(200) == 1 and animState == "full2" then
			animator.playSound("belly")
		end
		
	else
		
		lock = true
		
		if animState == "full" then
			animator.setAnimationState("bodyState", "exitmouth")
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