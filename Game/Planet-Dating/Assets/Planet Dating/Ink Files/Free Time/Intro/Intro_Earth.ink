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

->EarthIntroduction

==EarthIntroduction

~area = "lounge"
~character = "none"

(The Lounge is quiet, the music is low. Customers come and go with little to no problems at all. Not bad for my first shift.)
(I'm wiping down the counter like Sol told me to when I see a figure take a seat by the bar, waving her hand for my attention.) 

~character = "Earth"
~characterVisibility = 1
~pose = "neutral"
Excuse me Sol, I'd like my usual, nice and strong please. 

~characterVisibility = 0
(She pauses for a bit, properly sizing me up and down.) 

~characterVisibility = 1
Oh whats this? You look new, did they finally find an assistant? 

    +[ Yes, I'm new ]
        ~characterVisibility = 0
        They did, yes. Or uh I'm...I'm new. How can I help you tonight? 
        
        ~characterVisibility = 1
        Well I'd appreciate knowning who's serving me tonight.
        
        ~characterVisibility = 0
        Oh yes! I'm {player_name}, and you are? 
        
        ~characterVisibility = 1 
        Earth, its nice to meet you {player_name}.
        
        ->AboutEarth
        
        
    +[ You seem to know Sol well ]
        ~characterVisibility = 0
        Yeah I just started tonight. I didn't think they'd mention that to anyone else, you must be a valued customer then. 
        
        ~earthAffection++
        ~characterVisibility = 1
        With how often I come here, it would be incredibly rude of me not to talk to the owner. They're a hard worker that Sol, you better work hard too...I'm sorry, your name is?
        
        ~characterVisibility = 0
        {player_name}. And yours?
        
        ~characterVisibility = 1
        Earth, its a pleasure to meet you {player_name}.
        
        ->AboutEarth
        
    +[ Ok, need something? ]
        ~characterVisibility = 0
        Is there anything I can help you with...who are you? 
        
        ~earthAffection--
        ~characterVisibility = 1
        Is this how you speak to customers? With such a lack of basic manners?
        
        ~characterVisibility = 0
        I, no. I'm sorry its been a rough night. I'm {player_name}, is there anything I can help you with miss?
        
        ~characterVisibility = 1
        Earth, and yes {player_name} I believe there is. 
        
        ->AboutEarth
        
 ==AboutEarth
 ~characterVisibility = 1
You see {player_name}, I've had a long, stressful day. 

~characterVisibility = 0
And you could use something strong.

~characterVisibility = 1
Looks like someone's been paying attention. 

~characterVisibility = 0
 Well I'd like to keep my job. The work is nice, the pay isn't bad and the people are pretty interesting.

~characterVisibility = 1
Then here's to seeing more of you. 

~characterVisibility = 0
Thank you. Now if I remember, you mentioned you had a drink you preferred. 

~characterVisibility = 1
I do, yes. But I think I'd like to try something else, give you something to practice. 

~characterVisibility = 0
Really? I mean uh...are you sure? 

~characterVisibility = 1
Of course. Naturally I'd prefer not to be poisoned or anything, but you have to learn somewhere. 
People can be fickle and picky over the smallest of details and being a bartender you can only imagine the kind of crowds you'll be getting. 

~characterVisibility = 0
More hardworking professionals who'd like to unwind?

~characterVisibility = 1
Precisely. Now, tell me your specials. 

    +[ Something light ]
        ~characterVisibility = 0
        Well we've got a few drinks on the lighter side. More fruity and tropical, maybe more your "style". 
        
        ~characterVisibility = 1
        My style? What's that suppose to mean?  
        
        ~characterVisibility = 0
        O-oh uh... 
        
        ~earthAffection--
        ~characterVisibility = 1
        Do I look "fruity" to you {player_name}? Do you find me "exotic" or "tropical?"
        
        ~characterVisibility = 0
        N-no, not at all! I'm very sorry. I meant no offense it just...
        
        ~characterVisibility = 1
        Came out wrong, yes? Do be careful next time. Now please, I'd like that drink now.  
        
        ->ActualDrink
        
    +[ Something powerful ]
        ~characterVisibility = 0
        Well you said you wanted something strong so why not be bold with it. Lets get you something that'll really knock your socks off!
        
        ~characterVisibility = 1
        There you go, selling it right to me, a smart move.  
        
        ~characterVisibility = 0
        You did say you wanted something strong, why would I question your judgement?
        
        ~characterVisibility = 1
        Well I appreciate the enthusiasm. Go on now, knock my socks off.  
    
        ->ActualDrink
        
    +[ Something balanced ] 
        ~characterVisibility = 0
        Now I know you wanted something stronger, but how about we dial that down a bit. 
        
        
        ~characterVisibility = 1
        Are you saying I can't handle my liquor {player_name}?
        
        ~characterVisibility = 0
        Not at all. But you are a valued patron and its my responsibility to keep you safe so you can get home alright.
        
        ~earthAffection++
        ~characterVisibility = 1
        I...how sweet, thank you {player_name}. I think I'd really love to try it. 
    
        ->ActualDrink
        
==ActualDrink

~characterVisibility = 1
Lets take this nice and easy now, alright? 

~idealIngredient1 = 0
~idealIngredient2 = 0
~idealIngredient3 = 0
~minimalIngredients = 1
~area = "bartending"

Come on now, you've got this. There's a nice tip waiting for you if it looks nice.

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




