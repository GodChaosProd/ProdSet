talkLines = {	"You looking at me?",
				"Why are you so big?",
				"Woah. Who are you calling little?",
				"I could eat you anytime I wish.~",
				"Feel free to snuggle with me.~",
				"I'm so FLUFFY!!",
				"Take me with you!",
				"I'm a floofball.~"
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
