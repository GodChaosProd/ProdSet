animState = "blank"

victim = nil
health = nil

lock = true
can_burp = true

eatenovLines = {	"*GLRK*",
				"*MNLK* I've had a lot of practice throating prey, darling.~",
				"Oooh... Right there!~",
				"Ah... You feel so good sliding down my gullet.~",
				"*GLK*~",
				"Welcome to the dragon's den, darling!~",
				"Release costs extra. No emeralds? Ah that's a damn shame, darling... Down you go!~ *GLK!*",
				"Let's give my fans a REAL show, darling!~",
				"You know the rules, darling. No touching unless I let you.~",
				"Stop begging, darling. You're mine now.~",
				"Ahhh! Simply divine, darling.~",
				"Was that some wetness I just felt brush against my tongue?~",
				"*GLRK* Another patron, another pound...~",
				"*GLK* Only one way in. No other way out.~"
}

eatentailLines = {	"*SHLRK*",
				"Oooh... Right there!~",
				"Ah... You feel so good sliding down my tail.~",
				"Mnph!~",
				"Welcome to the dragon's den, darling!~",
				"Release costs extra. No emeralds? Ah that's a damn shame, darling... In you go!~",
				"Let's give my fans a REAL show, darling!~",
				"You know the rules, darling. No touching unless I let you.~",
				"Stop begging, darling. You're mine now.~",
				"Ah...~",
				"I can taste you, darling. Don't worry!~",
				"Such an obscene bulge you make!~",
				"You thought you were safe behind me?~",
				"Don't worry, darling. There's taste buds all the way through! I could taste and feel every movement.~"
}

eatenavLines = {	"*SHLRK*",
				"I've had a lot of practice, darling.~",
				"Oooh... Right there!~",
				"Ah... You feel so good sliding into my ass.~",
				"Mnph!~",
				"Welcome to the dragon's den, darling!~",
				"Release costs extra. No emeralds? Ah that's a damn shame, darling... Up my ass you go!~",
				"Let's give my fans a REAL show, darling!~",
				"You know the rules, darling. No touching unless I let you.~",
				"Stop begging, darling. You're mine now.~",
				"Rare to use my ass to get in.~",
				"Ah...~",
				"Mnf...!",
				"Ah...! So good...!~",
				"Up my ass you go.~"
}

idleLines = {		"Hey, I want you to be in my show.~",
				"Think you can be part of a good show, darling?~",
				"Welcome to the show, darling!~",
				"I want you to help me out. Think you can do it?~",
				"You don't mind being dominated here on stage for everyone to see, do you darling?~",
				"You there. Are you here to join me on my show?~",
				"Ah, it's lunch time...~",
				"Mind helping me with my next show, dear?~",
				"Aww, you look so tas- erm... sexy!~",
				"Don't be shy, I won't bite! ...Much...~"
}

bellyLines = {		"Mm...~",
				"Ah... Keep squirming, darling!~",
				"Ah ah ah, no escaping!~",
				"This is a one-way trip, darling!~",
				"Just relax and give yourself to me.~",
				"Just let ol' Samira take care of you.~",
				"Mm... You're going to make my fans happy!~",
				"Consider this a private show.~",
				"Are you warm enough, darling?~",
				"You feel so good in there, darling!~",
				"Don't stop squirming...~",
				"A-ah... You're making me all wet!~",
				"I'll try not to burn you off too quickly... But no promises.~",
				"Mmh... You feel so good in there... You'll feel even better when you're just soup.~"
}

belly2Lines = {		"Mmnn...~",
				"Ah... Keep squirming in there, darling!~",
				"You should've known this was a one-way trip, darling!~",
				"Consider this a private show.~",
				"Are you warm enough, darling?~",
				"You feel so good in there, darling!~",
				"A-ah... You're making me all wet!~",
				"Aww, darling. You're going soft. I thought you'd last longer.~",
				"You feel like stew already...~",
				"Resting comfy in my gut...~"
}

belly3Lines = {	"Mm...~",
				"Ah... You are really squishy now.~",
				"Oh, darling...~",
				"Oh! So close!~",
				"Just a bit more...~",
				"You feel so good in there, darling!~",
				"Don't stop squirming...~",				
				"Mmh... You feel so, so good in there...~",
				"Very hot and soupy in there...~",
				"Keep squirming until the very end...~"
}

releaseLines = {	"*SHLRK*",
				"Hey! I said no escaping!~",
				"You're pretty strong if you can escape like that.~",
				"I wasn't done!",
				"I will let you out... For a least a bit, dear.~",
				"Get yourself cleaned up, darling.~",
				"Right through my gut.~",
				"You felt good in there, darling!~",
				"I can't wait for you to slide down my gullet sometime, just like how you slid through my gut.~",
				"I wasn't really done, but my stomach will be waiting for you when you come back.~",
				"Thank you for the deep clean and delicious meal, darling.~"
}

releasemouthLines = {	"*HRK*",
				"Hey! I said no escaping!~",
				"You're pretty strong if you can escape like that.~",
				"I wasn't done!~",
				"I will let you out... For a least a bit, dear.~",
				"Get yourself cleaned up, darling.~",
				"Woah! Right up my gullet!~",
				"You felt good in there, darling!~",
				"I can't wait for you to slide down my gullet sometime, just like how you slid back up it.~",
				"I wasn't really done, but my stomach will be waiting for you when you come back.~",
				"Thank you for the delicious meal, darling.~"
}

digestLines = {		"*GRGL*",
				"Nmf...~",
				"Come back soon!~",
				"Aww, come back darling!~",
				"The next show is free!~",
				"Thank you for making yourself a meal for me.~",
				"Nothing but padding on my ass.~",
				"A layer of fat to burn later.~",
				"Ready for seconds?~",
                                "Pumping away all that soup.~"
}

digestedLines = {		"*GRL* Hungry again...~",
				"You went to all the right places.~",
				"You look so much better on my waistline.~",
				"Even you can't escape from being part of my ass.~",
				"*URP*",
				"Really, thank you for making yourself a meal for me.~",
				"Too bad this new look isn't permanent...~",
				"I wonder what I should devour next...~"
}

eatenubLines = {	"*SHLRK*",
				"I've had a lot of practice, darling.~",
				"Oooh... Right there!~",
				"Ah... You feel so good sliding inside my nethers.~",
				"Mnph!~",
				"Welcome to the dragon's den, darling!~",
				"Release costs extra. No emeralds? Ah that's a damn shame, darling... Up you go!~",
				"Let's give my fans a REAL show, darling!~",
				"You know the rules, darling. No touching unless I let you.~",
				"Stop begging, darling. You're mine now.~",
				"Mnf...!",
				"Ah...! So good...!",
				"A-ah... Don't cum before I do darling~!",
				"Haah...~",
				"M-mnf... So eager!~",
				"Welcome to my womb, my little sex toy...~"
}

idleubLines = {	"Hey, I want you to be in my show.~",
				"Think you can be part of a good show, darling?~",
				"Welcome to the show, darling!~",
				"I want you to help me out. Think you can do it?~",
				"You don't mind being dominated here on stage for everyone to see, do you darling?~",
				"You there. Are you here to join me on my show?~",
				"Come here, darling. I need your help...~",
				"Don't you want to ride a dragon?~",
				"It's mating season, dear!~",
				"I just got done digesting someone into padding and I'd like to test this out.~"
}

bellyubLines = {	"Mm...~",
				"Ah... Keep squirming, darling!~",
				"Ah ah ah, no escaping!~",
				"You should've known this was a one-way trip, darling!~",
				"Just relax and give yourself to me.~",
				"Just let Samira take care of you.~",
				"Mm... You're going to make my fans happy!~",
				"Consider this a private show.~",
				"Are you warm enough, darling?~",
				"You feel so good in there, darling!~",
				"Don't stop squirming...~",
				"A-ah... You're making me all wet... So wet!!~",
				"I'll try not to burn you off too quickly... No promises.~",
				"Mmh... You feel so good in there... You'll feel even better when you're just juice.~",
				"Aww, darling. You're going soft. I thought you'd last longer.~",
				"You can't slay this dragon, dear.~"

}

bellyubLines2 = {	"Mm...~",
				"Ah... You are really squishy now.~",
				"Oh, darling...~",
				"Oh! So close!~",
				"Just a bit more and I will let you out...~",
				"You feel so good in there, darling!~",
				"Don't stop squirming...~",				
				"Mmh... You feel so, so good in there...~",
				"Very hot and wet down there...~",
				"Keep squirming until the very end...~"
}

releaseubLines = {	"*SHLRK*",
				"Hey! I said no escaping!~",
				"You're pretty strong if you can escape like that.~",
				"I wasn't done!",
				"I will let you out... For a least a bit, dear.~",
				"Get yourself cleaned up, darling.~",
				"AGH! Naughty!~",
				"Oh... my... god! Wow!!~",
				"You're... so naughty... I like it...~",
				"You're coated in juice!~",
				"You did good, darling...~"
}

digestubLines = {	"*SLSH*",
				"Nmf...~",
				"A-ah!~",	
				"Ah...~",
				"Mm... Darling!~",
				"Agh... Nmf.~",
				"Thank you for making yourself a sex toy for me.~",
				"Mmnh... No more than a cumstain now...~"
}

digestedubLines = {		"Urgh... Still not satisfied...~",
				"You made good use for me...~",
				"You look so much better as a puddle.~",
				"Even you can't escape from being melted into a cumstain.~",
				"*SHLRK*",
				"Really, thank you for making yourself a sex toy for me.~",
				"Too bad this afterglow doesn't last long...~",
				"I wonder who I should melt next...~",
				"You became what you wanted...~"
}

function init()

end

function update(dt)
		
	animState = animator.animationState("bodyState")
		
	if world.loungeableOccupied(entity.id()) then
	
		if victim ~= nil then
			health = world.entityHealth(victim)[1] / world.entityHealth(victim)[2]
		end
		
		if animState == "idle" or animState == "openmouth" and lock then
  			if math.random() < 0.5 then
				animator.setAnimationState("bodyState", "swallowov")
				lock = false
				object.say( eatenovLines[ math.random( #eatenovLines ) ] )
				animator.playSound("swallowov")
			elseif math.random() < 0.25 then
				animator.setAnimationState("bodyState", "swallowtail")
				lock = false
				object.say( eatentailLines[ math.random( #eatentailLines ) ] )
				animator.playSound("swallowtail")
			elseif math.random() < 0.25 then
				animator.setAnimationState("bodyState", "swallowav")
				lock = false
				object.say( eatenavLines[ math.random( #eatenavLines ) ] )
				animator.playSound("swallowub")
			end
		end

		if animState == "idleub" and lock then
			animator.setAnimationState("bodyState", "swallowub")
			lock = false
			object.say( eatenubLines[ math.random( #eatenubLines ) ] )
			animator.playSound("swallowub")
		end

		if health == nil then
			health = 1
		end
		
        	if math.random(300) == 1 then
			if animState == "full1" then
            			object.say( bellyLines[ math.random( #bellyLines ) ] )
			elseif animState == "full2" or animState == "full3" then
            			object.say( belly2Lines[ math.random( #belly2Lines ) ] )
        		elseif animState == "full4" or animState == "full5" then
            			object.say( belly3Lines[ math.random( #belly3Lines ) ] )
			end

		elseif math.random(200) == 1 and animState == "full1" then
			animator.setAnimationState("bodyState", "clench")
			animator.playSound("clench")
        	elseif math.random(200) == 1 then
			if animState == "full1" or animState == "full2" or animState == "full3" or animState == "full4" or animState == "full5" then
            			animator.playSound("gurgle")
			end

		elseif math.random(300) == 1 and animState == "digested" then
			object.say( digestedLines[ math.random( #digestedLines ) ] )
                end

		if math.random(300) == 1 then
                        if animState == "full1ub" or animState == "full2ub" or animState == "full3ub" then
				object.say( bellyubLines[ math.random( #bellyubLines ) ] )
                        elseif animState == "full4ub" or animState == "full5ub" then
                        	object.say( bellyubLines2[ math.random( #bellyubLines2 ) ] )
                        end

        	elseif math.random(200) == 1 then
			if animState == "full1ub" or animState == "full2ub" or animState == "full3ub" or "full4ub" or animState == "full5ub" then
            			animator.playSound("ubgurgle")
			end

		elseif math.random(300) == 1 and animState == "digestedub" then
			object.say( digestedubLines[ math.random( #digestedubLines ) ] )
        	end
		
		if health < 0.6 and animState == "full1" then
			animator.setAnimationState("bodyState", "digest1")
			object.say( "It begins...~" )
		elseif health < 0.48 and animState == "full2" then
			animator.setAnimationState("bodyState", "digest2")
		elseif health < 0.36 and animState == "full3" then
			animator.setAnimationState("bodyState", "digest3")
		elseif health < 0.24 and animState == "full4" then
			animator.setAnimationState("bodyState", "digest4")
		elseif health < 0.12 and animState == "full5" then
			animator.setAnimationState("bodyState", "digest5")
			object.say( digestLines[ math.random( #digestLines ) ] )
			animator.playSound("digest")
		elseif health < 0.6 and animState == "full1ub" then
			animator.setAnimationState("bodyState", "digest1ub")
			object.say( "It begins...~" )
		elseif health < 0.48 and animState == "full2ub" then
			animator.setAnimationState("bodyState", "digest2ub")
		elseif health < 0.36 and animState == "full3ub" then
			animator.setAnimationState("bodyState", "digest3ub")
		elseif health < 0.24 and animState == "full4ub" then
			animator.setAnimationState("bodyState", "digest4ub")
		elseif health < 0.12 and animState == "full5ub" then
			animator.setAnimationState("bodyState", "digest5ub")
			object.say( digestubLines[ math.random( #digestubLines ) ] )
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
		
		if animState == "digested" then
			animator.setAnimationState("bodyState", "idleub")
		elseif animState == "digestedub" then
			animator.setAnimationState("bodyState", "idle")
		end

		if animState == "full1" or animState == "full2" or animState == "full3" or animState == "full4" or animState == "full5" then
			if math.random() < 0.5 then
				animator.setAnimationState("bodyState", "release")
				object.say( releaseLines[ math.random( #releaseLines ) ] )
				animator.playSound("release")
			else
				animator.setAnimationState("bodyState", "releasemouth")
				object.say( releasemouthLines[ math.random( #releasemouthLines ) ] )
				animator.playSound("ovrelease")	
			end
		end

		if animState == "full1ub" or animState == "full2ub" or animState == "full3ub" or animState == "full4ub" or animState == "full5ub" then
			animator.setAnimationState("bodyState", "releaseub")
			object.say( releaseubLines[ math.random( #releaseubLines ) ] )
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
  				if animState == "idle" then
    				object.say( idleLines[ math.random( #idleLines ) ] )
  				elseif animState == "idleub" then
    				object.say( idleubLines[ math.random( #idleubLines ) ] )
 				end
			end
		end
	end

	if animState == "idle" and math.random(400) == 1 then	
		animator.setAnimationState("bodyState", "idle1")
	elseif animState == "idle" and math.random(400) == 1 then
		animator.setAnimationState("bodyState", "idle2")
	elseif animState == "idle" and math.random(400) == 1 then
		animator.setAnimationState("bodyState", "seducetail")
	elseif animState == "idle" and math.random(400) == 1 then
		animator.setAnimationState("bodyState", "blink")
	elseif animState == "digested" and math.random(400) == 1 then
		animator.setAnimationState("bodyState", "digestedbounce")
	elseif animState == "idleub" and math.random(400) == 1 then	
		animator.setAnimationState("bodyState", "idle1ub")
	elseif animState == "idleub" and math.random(400) == 1 then
		animator.setAnimationState("bodyState", "idle2ub")
	elseif animState == "idleub" and math.random(400) == 1 then
		animator.setAnimationState("bodyState", "seduceub")
	elseif animState == "idleub" and math.random(400) == 1 then
		animator.setAnimationState("bodyState", "blinkub")
	end
end

function onInteraction(args)

	victim = args.sourceId
end