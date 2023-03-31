require "/scripts/vore/ps-npcprey.lua"

function init()

	oldInit()
	
	if storage.names == nil then
		storage.names = {}
		storage.freq = {}
	end
	
	myProfile				= {}					
	myProfile["plead"]		= {}
	myProfile["consumed"]	= {}
	myProfile["death"] 		= {}
	myProfile["idle"] 		= {}
	myProfile["interact"]	= {}
	myProfile["release"]	= {}
	
	myProfile["plead"][1]		= {	"Hey, dude! Would it kill you to let me out for a small bit of cash?",
									"This whole fetish is still new to me. Let me out so I can think, and I will give you some cash.",
									"Yeesh. Okay. I had enough... Let me out, you get cash. Deal?"
	}
	myProfile["consumed"][1]	= {	"What the hell is this?!",
									"Hey! Cut that... Don't swallow me!",
									"What in the hell are you thinking?!",
									"Agh! How?!",
									"Knock that off! I am not your food!",
									"Not in your mouth, damnit!!"
	}
	myProfile["death"][1] 		= {	"You... Bastard...",
									"Some friend you... are...",
									"It's gonna take more... than that to... scare me..."
	}
	myProfile["idle"][1] 		= {	"It's so slimy in here...",
									"Are you sure I'm safe inside you? I feel... tingly.",
									"I expected you to eat me out, not eat me alive...",
									"Your culture never ceases to amaze me...",
									"I encountered many a person back in Dewdrop. None as weird as you, though.",
									"It's a little too weird for my taste...",
									"Being covered in all this slime is just... Eugh..."
	}
	myProfile["interact"][1]	= {	"Oh! Hi.",
									"You enjoying yourself?",
									"I don't wish to get into trouble with you.",
									"Crap! My dress is ruined with all this liquor!",
									"You mention vore? What is it?"
	}
	myProfile["release"][1] 	= {	"Eugh! Slime everywhere!",
									"I need a bath... A long one at that.",
									"Sheesh. It's all in my fur!",
									"Aw man... You got me all wet..."
	}	
	myProfile["plead"][2]		= {	"Me out, you cash... Ugh. You're gonna drain my bank account!",
									"You must really like me... Can I pay you to find someone else to consume?"
	}
	myProfile["consumed"][2]	= {	"Guh! Don't sneak up on me like that!",
									"Agh! Hey!",
									"It's too slick!",
									"Ngh...", 
									"It's getting a little too hot in here..."
	}
	myProfile["death"][2] 		= {	"I can accept this... I can respawn... Everything's... fine...",
									"You really pulled... a fast one...~"
	}
	myProfile["interact"][2] 	= {	"Looking to eat me again?",
									"I am actually starting to understand this whole vore thing...~",
									"I did a few tests, and I seem to taste like cotton candy.",
									"Just give me a good lick... on the cheek...~",
									"You're legit adamant about eating me, aren't you?"
	}
	myProfile["idle"][2]		= {	"It's a little tight in here.",
									"Past all the slime... I can imagine myself relaxing in here.",
									"This whole vore thing is rather interesting if it isn't pleasuring.~",
									"You're strangely comfy on the inside.~",
									"*Purrs quietly*",
									"I can hope you aren't gonna digest me... I'm still not ready.",
									"I gave up trying to resist at this point...~",
									"It’s pretty dark in here.",
									"I don't mind sleeping in here.~",
									"The sounds are quite pleasant in here...~"
	}
	myProfile["release"][2] 	= {	"That was surprisingly fun...~",
									"I think we can arrange this deal.~",
									"You feel up to doing it again, bud?",
									"*GASP* Fresh air..."
	}
	
	myProfile["plead"][3]		= {	"It's nice in here, but I could pay you to do the trip again... Just let me out first.~",
									"I have a call coming up. Can I pay you so we can do it again later?~"
	}
	myProfile["consumed"][3]	= {	"Ahh!~",
									"I never get tired of this...~",
									"Don't make me climax too early.~",
									"So... tight...~"
	}
	myProfile["death"][3] 		= {	"That... was... so worth it...~",
									"Not getting out... this... time...~",
									"Glad to satisfy... you...~"
	}
	myProfile["idle"][3] 		= {	"^pink;*She squirms around to get comfy.*",
									"The sensation is absolutely overwhelming!~",
									"Lemme have my fun in here...~",
									"Your choice, cutie.~",
									"This tingling is so arousing!~",
									"I can hear your visceral serenade.~",
									"It’s dark in here, but that doesn't matter.~",
									"You can keep me in here for as long as you need.~",
									"Nmph!~"
	}
	myProfile["interact"][3]	= {	"I feel so aroused just looking at you.~",
									"^pink;*She covers her crotch.*",
									"You're always welcome to my voluptuous curves.~",
									"I am always looking to do this vore thing again.~",
									"Lemme get myself ready, cutie.~"
	}
	myProfile["release"][3] 	= {	"*She climaxes as you force her up your throat.*",
									"That felt... great!!~",
									"*GASP* Agh! Climax!~"
	}
	
	initHook()
	
end
