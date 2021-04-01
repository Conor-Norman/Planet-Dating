VAR player_name = "protag"
VAR character = ""
VAR characterVisibility = 0
VAR pose = ""
VAR background = ""
VAR area = ""

VAR solAffection = 0
VAR mercuryAffection = 0
VAR venusAffection = 0
VAR earthAffection = 0

VAR bartendingPoints = 0
VAR idealIngredient1 = 0
VAR idealIngredient2 = 0
VAR idealIngredient3 = 0
VAR minimalIngredients = 0

->MercuryIntroduction
==MercuryIntroduction

~area = "lounge"
~character = "none"

~characterVisibility = 0
(Relax, relax, can't get too nervous befor—)
(Oh nonono, what's that?)
(Something just burst through the doors! It's loud and angry and...kind of smal—)

~character = "Mercury"
~characterVisibility = 1
~pose = "neutral"
Hello, hello, hello!
How's it hanging? Always a good time visiting my dearest, dearest pals!

~characterVisibility = 0
(Oh, ahem. Well then. It's just...the mechanic?)

    +[ What can I get you? ]
    
        ~characterVisibility = 0
        Welcome to the Lounge! What can I get for you?
        
        ~characterVisibility = 1
        Straight to the point, 'ppreciate that! But this customer wants to get to know the new bartender a little.
        I'm Mercury, I run maintenance for this joint and every other joint in the whole, wide Solar System.
        I know, I know, lotta work, but I'm good for it. I'm practically built for the job. 
        Observe.
        
        ~characterVisibility = 0
        (Don't remember asking him to flex for me, but he does look pretty good.)
        (...)
        (......)
        (Starting to get the feeling that this is more for him than it is for me.)
        Good to meet you! I'm {player_name}, and I'll be serving you on this fine cycle, and hopefully others in the future.
        
        ~characterVisibility = 1
        Sounds super!
        
        ~characterVisibility = 0
        (He's still flexing.)
        I sure hope so.
        
        ->AboutMercury
    
    +[ Here to fix something? ]
    
        ~characterVisibility = 0
        Umm...are you...here to fix something?
        I'm so sorry, Sol never never mentioned anything about maintenance — I'll go get them right away!
        
        ~mercuryAffection++
        ~characterVisibility = 1
        You that newbie? Oh, we're in for a great time!
        
        ~characterVisibility = 0
        (Uh oh.)
        I...take it you're not the maintenance guy, then. 
        
        ~characterVisibility = 1
        Nah, I am. Sol doesn't trust anyone but ol' Mercury to keep their precious home healthy!
        But I'm off the clock for the rest of the cycle, and there's no better way to unwind than a trip to Sol's.
        Was it my incredible physique that gave it away? No! It was my confident stride that screamed, "He gets things done!"
        Wait, wait, wait, lemme come in again and you tell me what caught your attention.
        
        ~characterVisibility = 0
        (He's not actually going to go—)
        ~character = "none"
        (Aaand he's out.)
        (Now he's back in, though I don't remember him flexing like that the first time.)
        
        ~character = "Mercury"
        ~pose = "neutral"
        ~characterVisibility = 1
        Oh yeah, how could you not be staring at this incredible composition. I'm just, out of this world!
        
        ~characterVisibility = 0
        Uh, yup. Anyway. sorry about earlier, I'm {player_name}.
        
        ->AboutMercury
        
    +[ Who are you, again? ]
    
        ~characterVisibility = 0
        Hello to you too! Who...are you, again? Have we met before?
        
        ~mercuryAffection--
        ~characterVisibility = 1
        M-me? Uh, I'm Mercury — I work maintenance 'round these parts. I was probably off somewhere, ya know, working.
        Sorry, you caught me a little off guard. It's nice to meet Sol's new shadow. 
        You've definitely never seen me. And if you did, I bet you'd remember. No one could forget a body like this!
        The universe really did bless me with all the right elements. 
        ...
        But you've seen me now, right? Was hoping for a better first impression...
        
        ~characterVisibility = 0
        You can call me {player_name}. Sorry, I didn't mean to come off any kind of way.
        
        ~characterVisibility = 1
        That's behind us now. I'm sure we'll be best buds soon! 
        
        ~characterVisibility = 0
        I'm counting on it, Mercury.
        
        ->AboutMercury
        
        
==AboutMercury

~characterVisibility = 1
Ah, been looking forward to a drink all cycle long.

~characterVisibility = 0
Work got you beat, huh?

~characterVisibility = 1
Me? Beat? I don't think so. Look at me — I could do another ten cycles of this stuff.
More issues over at the Kuiper Belt, though. That place would fall apart if it weren't for me.

~characterVisibility = 0
Well, I'll be sure to call when I inevitably break something.

~characterVisibility = 1
Ha! I'm always orbiting 'round Sol's spot. It's way more fun here, always some cool peeps. 

~characterVisibility = 0
Already looking forward to your next visit. 

~characterVisibility = 1
You can count on me. 
Might be a little tardy some cycles. Usually me and Mars hit up the gym right after our shifts end, but I just had to introduce myself to the new recruit!
Now I know what you're thinking: "Can he even get any bigger?"
The answer is "yes."
It has to be...

~characterVisibility = 0
Makes sense, get wider if you can't get tall—
Nevermind. I admire the dedication.

~characterVisibility = 1
Thank you, thank you. I'm always trying to be the best me I can be, ya know?

~characterVisibility = 0
For sure. Speaking of which, how can I be the best bartender for you?

~characterVisibility = 1
Whacha thinking? 

    +[ Something weak ]
    
        ~characterVisibility = 0
        You're pretty extreme already, so how about a change of pace? Something a little weaker, maybe?
        
        ~mercuryAffection--
        ~characterVisibility = 1
        You saying I can't handle the strong stuff? Just 'cause I might be a little smal—
        I mean, I'm no lightweight! Hit me with real drinks. 
        
        ~characterVisibility = 0
        Sorry, sorry, I wasn't implying anything at all!
        
        ~characterVisibility = 1
        No harm done, but let's try something that'll really wake me up. 
        
        ->ActualDrink
        
    +[ Something smooth ]
    
        ~characterVisibility = 0
        You're a hard worker, maybe something smooth to help you unwind?
        
        ~characterVisibility = 1
        Aww, that's mighty kind of you, but tired isn't in my vocabulary! 
        
        ~characterVisibility = 0
        How silly of me. What did you have in mind?
        
        ~characterVisibility = 1
        Hmmm, something to get the energy levels up. Something that'll really keep me in the moment. 
    
        ->ActualDrink
        
    +[ Something that packs a punch ] 
    
        ~characterVisibility = 0
        A tough guy like yourself might want to challenge himself with something a little strong, no?
        
        ~mercuryAffection++
        ~characterVisibility = 1
        Oooo, I like the way you think, newbie!
        
        ~characterVisibility = 0
        Let me see what we've got behind the counter. 
        
        ~characterVisibility = 1
        Wait, wait. Let's not make it too intense yet. Gotta work our way up, ya know? That'll be fun.
        
        ~characterVisibility = 0
        The customer's always right.
    
        ->ActualDrink
        
==ActualDrink

~characterVisibility = 1
Won't make it too hard on a newbie. 

~idealIngredient1 = 3
~idealIngredient2 = 3
~idealIngredient3 = 0
~minimalIngredients = 1
~area = "bartending"

Just throw in something spicy, just a bit though. Keep everything else neutral, I wanna enjoy the heat.

    ->END


===function changeName(newName) ===
~player_name = newName

===function changeCharacter===
~return character

===function getCharacterVisible===
~return characterVisibility

===function getSolAffection===
~return solAffection

===function getMercuryAffection===
~return mercuryAffection

===function getVenusAffection===
~return venusAffection

===function getEarthAffection===
~return earthAffection

===function getBartendingPoints===
~return bartendingPoints

===function getArea===
~return area

===function getIdealIngredient1===
~return idealIngredient1

===function getIdealIngredient2===
~return idealIngredient2

===function getIdealIngredient3===
~return idealIngredient3

===function getMinimalIngredients===
~return minimalIngredients

===function setSolAffection(amount)===
~solAffection = amount

===function setMercuryAffection(amount)===
~mercuryAffection = amount

===function setVenusAffection(amount)===
~venusAffection = amount

===function setEarthAffection(amount)===
~earthAffection = amount

===function setBartendingPoints(amount)===
~bartendingPoints = amount