talkLines = {	"Why are you looking at me like that?!",
				"I take offense to being called little!",
				"Woah! Who are you calling small?",
				"Don't be fooled by my size. I could swallow you whole.~",
				"Feel free to snuggle with me.~",
				"I'm so FLUFFY!!",
				"Gimme a cuddle hug you cuddlebug!",
				"I'm a fluffybutt!~"
}

function update(dt)
	
	temp = math.random(5)

	if temp < 3 then
		local people = world.entityQuery( object.position(), 20, {
			includedTypes = {"player"},
			boundMode = "CollisionArea"
		})
		
		if #people > 0 then
			object.say( talkLines[ math.random( #talkLines ) ] )
		end
	end

end
