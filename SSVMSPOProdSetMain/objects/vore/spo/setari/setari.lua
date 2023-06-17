animState = "blank"

victim = nil
health = nil

lock = true
--animator.setAnimationState("bodyState", "fed4")
--animator.playSound("digest")

eatenLines = {	"Woah. I like how you squirm up there.~",
				"Mmnh...~",
				"Oh, yes...~",
				"Wiggle as much as you want...~",
				"Mmh.~",
				"You slide in nicely.~",
				"No one's watching, luv...~"
}

idleLines = {	"People do go inside me to relax. You look a little stressed yourself.~",
				"Wanna relax inside my comforting womb?~",
				"I think you will fit just fine in here.~",
				"Up here. Come on. I am sure you will like it.~",
				"My womb can heal and comfort you if you're injured.~",
				"Open me up and we can get started.~"
}

bellyLines = {	"Want to add my tentacles to the mix?~",
				"Mnnh...~",
				"You're a real squirmer.~",
				"Take as much time as you want.~",
				"I won't mix you in. It's just a warm bath of my love juice.~",
				"You relaxed? I hope so.~",
				"Don't be alarmed if my womb fills up.~",
				"Mrmmrh...~",
				"You feel so good in there. Did anyone ever tell you that?~",
				"How's my juice treating you?~",
				"Warming up in there, luv?~",
				"SQUEEEEEEEEZE!!~"
}

releaseLines = {	"Ahh...~",
				"You feel better coming out rather than coming in.~",
				"Nmf...~",
				"You must be busy. I will let you off the hook.~",
				"Come back soon!~",
				"Alrighty, you can come out.~"
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
		
		if math.random(150) == 1 then
			object.say( bellyLines[ math.random( #bellyLines ) ] )
		elseif math.random(150) == 1 then
			animator.playSound("gurgle")

		end
		
		if health < 0.6 and animState == "full1" then
			animator.setAnimationState("bodyState", "digest1")
		elseif health < 0.45 and animState == "full2" then
			animator.setAnimationState("bodyState", "digest2")
		elseif health > 0.61 and animState == "full2" then
			animator.setAnimationState("bodyState", "reform3")
		elseif health > 0.46 and animState == "full3" then
			animator.setAnimationState("bodyState", "reform2")
		end
		
	else
		
		lock = true
		
		if animState == "full1" or animState == "full2" or animState == "full3" then
			animator.setAnimationState("bodyState", "release")
			object.say( releaseLines[ math.random( #releaseLines ) ] )
			animator.playSound("release")
		elseif animState == "after" then
			animator.setAnimationState("bodyState", "after2")
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