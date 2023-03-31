require "/scripts/vore/quicknpcprey.lua"

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
	
	myProfile["plead"][1]		= {	"P-please no! I have some pixels! You can have them!",
									"I-is a simple sum enough of a reward to let me out?",
									"P-please let me out. I-if you do, I'll give you something in return."
	}
	myProfile["consumed"][1]	= {	"H-hey, no! I'm not your food!",
									"S-stop that! I'm not food!",
									"Ahhhh noooo!",
									"Help! Anyone! S-somebody please help!",
									"Agh! H-help me!",
									"Stop please! N-no!"
	}
	myProfile["death"][1] 		= {	"Ngh... n-no... too... hot...",
									"I-I can't...",
									"*sob*",
									"Mngh..."
	}
	myProfile["idle"][1] 		= {	"It's t-t-too dark in here...!",
									"What... w-what is- what's gonna happen to me?",
									"It's s-slimy in here. I-it's slimy, and dark, and hot, and I want out!",
									"Bring me back out! Now! P-please!",
									"L-let me out! I-I beg of you!",
									"I-I can't handle this heat!",
									"I can b-barely move in here!"
	}
	myProfile["interact"][1]	= {	"Gah! Oh, you startled me. What do you need?",
									"W-why are you looking at me like that?",
									"I get the feeling I saw that look somewhere before...",
									"W-was that your stomach?",
									"You know that I hate getting eaten... R-right?"
	}
	myProfile["release"][1] 	= {	"*Gasp* I-I'm alive...",
									"Guh... I just got eaten...",
									"Agh! T-thank you...",
									"T-that was too scary... I-I didn't want t-to digest in such a dark place..."
	}	
	myProfile["plead"][2]		= {	"I will give you some money if you let me out. Are you actively trying to get every single pixel out of my account?",
									"Let me go now and you'll get something. "
	}
	myProfile["consumed"][2]	= {	"Crap! I thought you'd get tired of thiiiiis!!",
									"Ahhh!! Hey!",
									"Stop eating me again!",
									"It's so gross inside of you!", 
									"Gah! Okay, just this once."
	}
	myProfile["death"][2] 		= {	"It's not so... funny... any- *GGL*",
									"You got what... you... wanted...",
									"My soul will haunt you forever- *GRGL*",
									"Too melty to... move..."
	}
	myProfile["interact"][2] 	= {	"You're lucky I am just starting to like what you are doing...",
									"Hello again.",
									"I hope you aren't planning to eat me again.",
									"Want a Kirikiri Pie?",
									"I think we can arrange something.~"
	}
	myProfile["idle"][2]		= {	"I was quite busy earlier, so you may want to let me out soon.",
									"Is it that fun to you to eat everyone you see?",
									"Other than the slime, it is somewhat comfy in here...~",
									"I better stop thinking such lustful things when you arrive to eat me alive.",
									"Hey. Think you can let me out soon?",
									"Will you let me out?",
									"Why am I so turned on by this?",
									"It's all pitch black in here. I can't see a thing.",
									"Yikes. I thought I felt acid there... no, wait...",
									"I feel tingly..."
	}
	myProfile["release"][2] 	= {	"Next time you try that, at least arrange a time.",
									"*Gasp* Fresh air...",
									"That took much longer than it should have.",
									"Don't catch me behind my back again."
	}
	
	myProfile["plead"][3]		= {	"I hate to be the bearer of bad news, but I just got called in. Can I give you a small sum so you can get something at the Infinity Express?~",
									"Cutie, as much as I enjoy this, I have to do something important. I will give you something if ya let me go.~"
	}
	myProfile["consumed"][3]	= {	"Mmnh.~",
									"I love the trip in...~",
									"You're like a waterslide...~",
									"It feels so good...~",
									"Wasn't expecting stomach hugs from ya so soon, cutie!~",
									"What are you do- Oh, nmf... Go ahead and swallow me...~",
									"This always feels so, so nice...~",
									">w<",
									"You're so gentle with your throat!~",
									"Aaahhh...~"

	}
	myProfile["death"][3] 		= {	"-.-~",
									"I don't think I will wake up from... this...~",
									"*GRGL*",
									"See you in a... bit...~"
	}
	myProfile["idle"][3] 		= {	"^pink;She curls up in your stomach, rubbing the walls as she does so.",
									"*Churrr*",
									"Mmnh... I could take a nap in here.~",
									"Look, I am sorry about my attitude earlier. Your belly's actually quite nice.~",
									"Hugs! Gimme a big ol' belly hug!~",
									"Mmm~",
									"It’s so cozy in here.~",
									"Thank you, by the way. I was getting cold.~",
									"Have I ever mentioned how warm you are?~",
									"*Chirp*",
									"Thank you for the nice, warm bed.~",
									"Do I have permission to pleasure myself in here?~",
									"I am getting embraced all over!~",
									"I don't mind the slime one bit.~",
									"Best used when in winter, but... heh.~",
									"An Avali like me doesn't need standards to feel this good.~",
									"Mmngh...~"
	}
	myProfile["interact"][3]	= {	"Hello there.~",
									"Welcome back, friend.~",
									"Sounds like you're hungry again.~",
									"My feathers are nice and lathered...~",
									"You have that hungry look again...~",
									"You're a nice guy, inside and out.~",
									"How's it going?~",
									"I am real tired. Can I sleep in your belly?~",
									"Is there room for me in there?~",
									"I did meet this pair of Avali that get pleasure out of eating each other. I get why.~",
									"^pink;*She pokes your belly* ^white;Looking good there. Want to add me to it?~",
									"It really is nice inside of you. Some people just don't understand it.~"
	}
	myProfile["release"][3] 	= {	"Aww...~",
									"I was actually getting comfortable in there.~",
									"Can I have a few more minutes inside of you, pweaaaaase? Pwease-pwease-pwease! Pwetty pwease?~",
									"Hey! Put me back in! Wahh! ;-;",
									"Aww...~ I am really liking us bonding together..."
	}
	
	initHook()
	
end
