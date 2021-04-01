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

->WaitAtBar

==WaitAtBar

~area = "lounge"
~character = "none"

(It's fairly slow right now. Not many customers seem to be coming by the bar, and Sol's handling the few who do.)
(A single planet lingers across the room, completely glued to their phone.)
(I'm certain I've never met them before — I'd definitely remember them — but I feel like I must have at least seen them before, somewhere...)
(Before I can figure out where that 'somewhere' is, they look up.)
(I push off of the counter and scramble to make myself look busy, hoping they hadn't noticed me staring.)
(After a moment, I risk peaking up. My core heats up as I see them approaching the bar.)

    ->VenusIntroduction
    
==VenusIntroduction

~character = "Venus"
~pose = "neutral"
~characterVisibility = 1

Hiii sweety. Be a doll and fix my usual for me, m'kay? Thanksss.

~characterVisibility = 0
(They immediately turn their attention to their phone.)

    +[ I'm new, what's your usual? ]
    
        ~characterVisibility = 0
        Oh, um...I'm really sorry, I actually just started here. What's your usual...?
        
        ~characterVisibility = 1
        Oooo, a newbie? We love to see it. What's your name, hun?
        
        ~characterVisibility = 0
        I'm {player_name}. And you are...?
        
        ->AboutVenus
        
        
    +[ Why not try something different? ]
    
        ~characterVisibility = 0
        Variety's the spice of life, you know. Why not try something a little different?
        
        ~venusAffection++
        ~characterVisibility = 1
        Oh yeah...? Well, what would you recommend, um...what's your name, again?
        
        ~characterVisibility = 0
        We've never met, actually. I'm {player_name}. I just started working here.
        
        ~characterVisibility = 1
        Ohhhh, no wonder! I'm usually, like, super good with names. Kinda.
        
        ~characterVisibility = 0
        Speaking of names...what's yours?
        
        ->AboutVenus
        
    +[ Uhhhhhh ]
    
        ~characterVisibility = 0
        Uhhhhhh...
        
        ~venusAffection--
        ~characterVisibility = 1
        What's the matter, babe? Starstruck? Guess I can't blame you. Go on, ask for a selfie or whatever, get it over with.
        
        ~characterVisibility = 0
        Oh, no, sorry, I'm just...a little overwhelmed?
        
        ~characterVisibility = 1
        Oh yeah, I can have that effect on people. I don't recognize you...are you new?
        
        ~characterVisibility = 0
        Yes! Yeah. Um...I'm {player_name}. And you...?
        
        ->AboutVenus
        
==AboutVenus

~characterVisibility = 1
You are so adorable, like you don't already know who I am.

~characterVisibility = 0
...

~characterVisibility = 1
...No way. You're serious? I'm Venus, duh!

~characterVisibility = 0
Venus...like the intergalactic celebrity, Venus?

~characterVisibility = 1
Obviously, yeah. How could anyone forget someone who looks like this?

~characterVisibility = 0
I knew you looked familiar! I guess I've been too busy job hunting to keep up with what's hot.

~characterVisibility = 1
Oh my stars, you regular people have it sooooo hard. I don't know what I'd do if I couldn't check social media at least three times a cycle. Sad face.

~characterVisibility = 0
So, what's a big time celebrity like you doing hanging around a place like this? 

~characterVisibility = 1
I actually just find it, like, super refreshing to be around you common people for a while. Keeps me humble, you know? 
Plus, this lounge has the perfect aesthetic for my feed, it makes such a cute background for my pics, lmao.

~characterVisibility = 0
Huh. Well, it's really cool to meet you, Venus.

~characterVisibility = 1
Yeah, I know. You're welcome.

~characterVisibility = 0
...Anyway. Really, what can I get for you?

~characterVisibility = 1
Hmm...what would you recommend, hun?

    +[ Something sweet ]
    
        ~characterVisibility = 0
        Hmm...you seem like the type who'd enjoy a sweet drink. Is that right?
        
        ~venusAffection--
        ~characterVisibility = 1
        Ugh, are you for real? No way.
        
        ~characterVisibility = 0
        Huh? What's wrong with sweet drinks?
        
        ~characterVisibility = 1
        I can't just go stuffing myself with sweets. An icon like me has to watch their figure, you know. I'm not like you common people.
        
        ~characterVisibility = 0
        Oh um...I'm sorry?
        
        ~characterVisibility = 1
        Hm...you should be. I'll look past it this time, since you're new, but use your head next time, babe.
        
        ->ActualDrink
        
    +[ Something spicy ]
    
        ~characterVisibility = 0
        Let's see...maybe something with a little spice to shake up your night?
        
        ~characterVisibility = 1
        What's that saying, again? Sugar, spice, and everything nice?
        Well, I'm definitely not scared of getting a little spicy, babe.
        
        ~characterVisibility = 0
        I figured as much. You seem pretty out there, after all.
        
        ~characterVisibility = 1
        Hmmm...I'll take that as a compliment. So, thank you!
        Still...that's pretty different than the kind of drink I'd normally go for...
    
        ->ActualDrink
        
    +[ Something aesthetic ] 
    
        ~characterVisibility = 0
        Let me guess...you want a drink as eye-catching as you are?
        
        ~venusAffection++
        ~characterVisibility = 1
        Awww, babe...! Are you actually a fan? You know me so well already...!
        
        ~characterVisibility = 0
        I guess I'm just good at reading people, haha.
        
        ~characterVisibility = 1
        Orrr maybe we're just kindred spirits? Oh my stars, I can see the headlines now: "Superstar Venus seen vibing with nobody bartender."
        No offense...
        
        ~characterVisibility = 0
        Uh...none taken, I guess?
        
        ~characterVisibility = 1
        Okay, good, just making sure. You're a doll, really.
    
        ->ActualDrink
        
==ActualDrink

Look, I'll just make this nice and easy for you, since you're new.

~idealIngredient1 = 2
~idealIngredient2 = 0
~idealIngredient3 = 0
~minimalIngredients = 1
~area = "bartending"

#Can you just get me anything that shines, sweetie? The more glamourous, the better for me. Thanks, hun.
Can you just get me anything that looks good, sweetie? The more glamourous, the better for my pics. Thanks, hun.

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


