VAR players_name = "Protagonist"
VAR SolAffection = 0
VAR MercuryAffection = 0



COSMIC CRUSH

THE PLAYER IS ALLOWED TO ENTER THEIR NAME.

My name is {players_name}.
    -> JobIntro


== JobIntro
Today is my first day of work as a bartender at the lounge. It's a quaint spot right in the center of the Solar System. It doesn't get a lot of foreign guests, but locals always seem to be orbiting the place.
    -> WhereIsBoss


== WhereIsBoss
I look around as I enter. I'm supposed to be meeting my new boss here to show me the ropes. I'm not actually sure what they look like. I applied online, and during our interview, their camera was off. They'd said to just head to the bar, and I'd know them when I see them. So I do, and they were right.
    -> DescribeSol
    

== DescribeSol
They're impossible to miss. They're impossibly big, or maybe that's just the presence they seem to emit. They radiate warmth, and I'm immediately drawn to them, yet I feel like I shouldn't stare for too long. They're dressed in black and white, with accents of gold, yet it doesn't look garrish on them, just sophisticated and elegant. They turn to me as I approach, expectant.
    +[Wow, you're hot...]
        ~ SolAffection--
        -> Compliment
    +[Hi, I'm the new trainee?]
        ~ SolAffection++
        -> Introduce
    

    == Introduce
    "Hi, uh, I'm the new bartender trainee, Protagonist. I'm supposed to start today. Are you Sol?"
        -> IntroduceSol
    
    
        == IntroduceSol
        "Oh, yes, I've been expecting you. Come on behind the bar, you can leave your things in the back for now."
            -> GoBehindBar
        
    
    == Compliment
    "Oh, wow. You're, uh...really hot. Like, *really* hot."
        -> Disapproving
        
        == Disapproving
        "I see I didn't hire you for your cleverness. Try to be a little more subtle when you talk to customers. We can get some very important planets in here."
            -> Instructions


== Instructions
"For now, just get behind the bar. You can leave your things in the back, we need to get started."
    -> GoBehindBar
    

== GoBehindBar
"It's pretty slow right now, so we don't need to rush your training. Let me show you."
    -> ExplainBartending
    

== ExplainBartending
"Most drinks are a combination of three things - a base, a modifier, and an accent. Different combinations will result in different drinks. It's very important to pay attention to what a customer likes so that you can make them the right drink."
    -> EnterCustomer


== EnterCustomer
Before I know it, my first customer is on the other side of the counter.
"Hello? Can I get a drink? I'd like something sweet."
    -> SomethingSweet


== SomethingSweet
"Perfect timing, your first customer! Here, I'll show you how to make his drink."
    -> Minigame
    

== Minigame
THE BARTENDING MINIGAME WOULD BE PLAYED HERE.
    -> SolAgain


== SolAgain
"And there you have it, a perfect drink. Go on and give it to your customer, try to get to know him a little while you're there."
    -> GiveDrink


== GiveDrink
I hand him his drink. I'm not really sure what to say to him. He's a complete stranger, after all...
    + [Howdy, stranger!] -> Howdy
    + [What's cookin', good lookin'?] -> WhatsCookin
    + [Do you come here often?] -> Often


    == Howdy
    "Howdy, stranger. I've never seen you around these parts before. What brings you to a place like this?"
        -> WhyYouHere


        == WhyYouHere
        "The booze here is good, and pretty cheap. What's up with the cowboy accent, though? I heard you talking to Sol, I know that's not your actual voice."
            + [I was trying to sound cool.]
                ~ MercuryAffection--
                -> Cool
            + [I was nervous.]
                ~ MercuryAffection++
                -> Nervous
                
            
            == Cool
            "Oh...I thought it sounded cool and mysterious..."
                -> NotCool
                
            
                == NotCool
                "Well, it didn't sound *'cool and mysterious'*. It sounded dumb. Don't you have drinks to make?"
                    He leaves.
                    -> BackToSol
            
            
            == Nervous
            "Ah...honestly, I was just a little nervous. This is my first shift, I kinda just said the first thing that came to mind."
                -> Understanding 
            
            
                == Understanding
                "Everyone gets nervous. It's fine. Just talk to me like a normal person. My name's Mercury. I have to go, but I'll see you around, alright?"
                Mercury leaves.
                    -> Approving


    == WhatsCookin
    "What's cookin, good lookin'? You came here by yourself?"
        -> Alone


        == Alone
        "Wow, really? Could you *be* any creepier?"
            + [I can]
                ~ MercuryAffection--
                -> BeCreepy
            + [Sorry, I panicked...]
                ~ MercuryAffection++
                -> Nervous
    
    
            == BeCreepy
            "Oh, for sure, I could be way creepier. Why, are you into that?"
                -> Yikes
            
            
                == Yikes
                "Ugh, gross..."
                He leaves.
                    -> BackToSol


    == Often
    "Hey, I don't think I've seen you around here before. Do you come here often?"
        -> Unfamiliar


        == Unfamiliar
        "Where else would I be? This is the only lounge worth visiting in the whole Solar System, and it takes way too long to try and go any further than that. The next nearest galaxy is, like, over 4 million lightyears away. You're the one who's new here."
            + [No, I'm cool, I've always been here.]
                ~ MercuryAffection--
                -> CoolDude
            + [You're right, I'm new.]
                ~ MercuryAffection++
                -> NewHire
    

            == CoolDude
            "What? No. I'm cool. I go to cool places. This is a cool place, so I go here. Definitely. Yeah, I'm here, like...all the time. Not because I'm an alcoholic, just because I'm so cool."
                -> Tryhard
                

                == Tryhard
                "Yikes...you're trying way too hard. You need to lighten up. You can come find me once you learn to take yourself less seriously. Otherwise, forget you even saw me."
                He leaves.
                    -> BackToSol
            
            
            == NewHire
            "Yeah, you got me. I'm a new bartender trainee, I just started working here today. My name's {players_name}, it's nice to meet you."
                -> Nice
            
            
                == Nice
                "You too. I'm Mercury, you'll probably see me around from time to time. I have to go, but you can come chat with me later."
                Mercury leaves.
                    -> Approving

== BackToSol
"Yikes...that's rough. You really have to pay attention to how you talk to guests if you want them to like you. It's important to pay attention to their behaviour and what they seem into."
    -> TakeABreak


== Approving
"Not bad! It seems you're off to a good start with him. Remember, you really have to pay attention to how you talk to guests if you want them to like you. It's important to pay attention to their behaviour and what they seem into."
    -> TakeABreak


== TakeABreak
"I can take over for a bit. Why don't you walk around, introduce yourself to a few of the partons? A word of advice - don't be a creep."
    -> FreeTime


== FreeTime
AND THEN IT GOES INTO THE FREE TIME PORTION WHERE YOU WALK AROUND AND MEET HOT PLANETS.
+ [Final Stats] -> Final


== Final
{ SolAffection > 0:
    Sol respects you!
}
{ SolAffection < 0:
    Sol doesn't respect you!
}
{ MercuryAffection > 0:
    Mercury respects you!
}
{ MercuryAffection < 0:
    Mercury doesn't respect you!
}



+ [Restart]
    # RESTART
    -> END

    
    
    
    
    ===function changeName(newName) ===
~ players_name = newName
