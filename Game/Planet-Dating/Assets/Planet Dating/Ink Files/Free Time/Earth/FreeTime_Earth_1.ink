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

->LookAround

==LookAround

~area = "lounge"
~character = "none"

(Finally some time off. I can step away from the bar and stretch my legs, take a walk.)
(But where to...I don't know.) 
(This is a new area, a new place. I'm not sure where to start exploring.) 
(Turning the corner, I almost bump into Earth. She looks startled.) 

~character = "Earth"
~pose = "neutral"
~characterVisibility = 1

Oh {player_name}! You scared me. 

~characterVisibility = 0
Sorry Earth! I didn't see you there, you okay?

~characterVisibility = 1
Yes yes I'm fine. And you? I didn't rough you up or anything?


    +[ I am clearly wounded ]
    
        ~characterVisibility = 0
        No I am wounded. Scorned. I will never recover from this and even if I do I shall never be the same. 
        
        ~characterVisibility = 1
        ~earthAffection++
        My dear, how could I ever make it up to you? 
        Perhaps a simple coffee will do?
        
        ~characterVisibility = 0
        Are you asking me on a date? 
        
        ~characterVisibility = 1
        I am asking to treat you and your terribly wounded self, on a well deserved break with a sobbering beverage.
        
        ~characterVisibility = 0
        Then I accept only on the grounds that I get a large. 
        
        ~characterVisibility = 1
        (She shakes her head and laughs a bit.) 
        
        ->SmallTalk
        
    +[ I'm fine ]
    
        ~characterVisibility = 0
        Yeah, no worries I'm fine.
        
        ~characterVisibility = 1
        Good good. 
        
        ~characterVisibility = 0
        (The silence is a little awkward now.)
        
        ->SmallTalk
        
    +[ Watch where you're going]
    
        ~characterVisibility = 0
        Yeah, just watch where you're going next time. 
        
        ~characterVisibility = 1
        ~earthAffection--
        Same to you. 
        
         ~characterVisibility = 0
        I'm pretty sure I wasn't the one who crashed into me.
        
        ~characterVisibility = 1
        I...I do not have the time for this. 
        
        ->SmallTalk
        
==SmallTalk


~characterVisibility = 0
So where are you off to in such a hurry? 

~characterVisibility = 1
I just got off on my lunch break actually so I thought why not grab something here. 

~characterVisibility = 0
Oh cool, I'm actually on my break too. Do you wanna maybe go grab something together?

~characterVisibility = 1
I'd love to actually, its more fun eating with others. 
Did you have anywhere in mind? 

    +[ Not really ]
    
        ~characterVisibility = 0
        No not realy. I kinda was just going to wander around and see whats good.
        
        ~characterVisibility = 1
        Going with the flow then? Thats valid. Personally, I was in the mood for something I could grab quickly. 
        
        ->MoreTalk
        
    +[ Something quick and delicious ]
    
        ~characterVisibility = 0
        I was looking for something I could just grab fast, but also enjoy. 
        Like a quick stir fry or maybe something from a food truck. 
        
        ~characterVisibility = 1
        ~venusAffection++
        Its like you read my mind. 
        
        ~characterVisibility = 0
        Yeah, I just wanna enjoy as much of my free time as I can.
        
        ~characterVisibility = 1
        The feeling is very mutual. 
        
        ->MoreTalk
        
    +[ Something fancy and highend ]
    
        ~characterVisibility = 0
        Theres this really fancy restuarant around the corner I wanna try out. 
        Have a glass of wine, maybe some dessert after the meal. 
        
        ~characterVisibility = 1
        ~venusAffection--
        Darn, you'll have to count me out then. 
        I was aiming for something quick. 
        
        ~characterVisibility = 0
        Damn, maybe next time then. 
        
        ~characterVisibility = 1
        Maybe.
        
        ->MoreTalk

==MoreTalk

~characterVisibility = 0
Do you mind if I say something?

~characterVisibility = 1
No? What's on your mind?

~characterVisibility = 0
I hope this isn't rude or anything but I uh thought that maybe you were more..."high maintainence". 

~characterVisibility = 1
High maintainence? Do I strike you as someone "high maintainence?"



    +[ You look very professional ]
        ~characterVisibility = 0
        You just have a very professional air about you. 
        You're so strong and hardworking, I just kind of assumed that you would like things that were similar.
        Fancier.
        I...I will stop talking now. 
        
        ~characterVisibility = 1
        ~venusAffection++
        Oh well thank you I think. I mean for the uh strong and hardworking parts. 
        It feels nice to be recognized every now and then. 
        
        ~characterVisibility = 0
        Yeah. I'm sorry though for assuming. High maintainence is pretty harsh now that I realize it. 
        
        ~characterVisibility = 1
        Yes I was ready to verbally decimate you, but well unfortunately you're very sweet. 
        
        
        ~characterVisibility = 0
        (I smile and laugh but on the inside I'm scared and horny.)
        
        ->PostSecret
    +[ You are a bit intimidating ]
        ~characterVisibility = 0
        Well, if I'm being totally honest, you're kinda intimdating. 
        
        ~characterVisibility = 1
        Oh? How so?
        
        ~characterVisibility = 0
        Well you have this air of professionalism.
        Even when we talk its just very...well...professional.
        
        ~characterVisibility = 1
        I see. 
        
        ~characterVisibility = 0
        I'm really sorry, I didn't mean to make you uncomfortable.
        
        ->PostSecret
        
    +[ You act very high and mighty]
        ~characterVisibility = 0
        If I have to be honest, you kinda act really high and mighty whenever we hang out. 
        
        ~characterVisibility = 1
        ~venusAffection--
        High and mighty? Why because I treat you, a stranger, like an employee? 
        
        ~characterVisibility = 0
        Wow ok thats pretty harsh. 
        
        ~characterVisibility = 1
        So is calling someone "high maintainence" or "high and mighty". 
        
        ~characterVisibility = 0
        Well sorry...geez. 
        
        
        ->PostSecret
    
==PostSecret

~characterVisibility = 1
I must say that I'm sorry if I ever made you feel...uncomfortable. Or made myself unaprochable. 
I'm just so used to always being like this, its hard to remember that around friends and family, I can...relax.

~characterVisibility = 0
Yeah I get it. Sometimes its hard to separate work from personal life. Especially if you're working so often. 

~characterVisibility = 1
Its pretty much all I know. I've been working since I was fifthteen. 
My entire life all I've known was this and now well...its hard.

~characterVisibility = 0
Hey I get it, don't worry. 
I'm also sorry for well...assuming. 

~characterVisibility = 1
No worries. I assumed traits about you as well, its only natural. 
But well, you've more than likely proved me wrong. 

    +[ Thanks? ]
        ~characterVisibility = 0
        Um...thanks I guess?
        
        ~characterVisibility = 1
        ~earthAffection--
        Oh don't take it like that, I mean nothing by it. 
        You just seemed so nervous at first, I thought you might quit or drop out. 
        
        ~characterVisibility = 0
        Is this suppose to a compliment? 
        
        ~characterVisibility = 1
        Take as you will. 
        
        ~characterVisibility = 0
        You really suck at this. 
        
        ~characterVisibility = 1
        Well everyone needs a bit of practice {player_name}. 
        You do well to remember that next time you make me a drink. 
        
        ->Goodbye
    +[ Thank you ]
        ~characterVisibility = 0
        Thanks you, that means a lot. 
        
        ~characterVisibility = 1
        You're doing good work {player_name}, just remember to take a breather every now and then.
        Or else you'll burn out hard. 
        
        ~characterVisibility = 0
        Duly noted. 
        
        
        ->Goodbye
    +[ I have nothing to prove to you ]
        ~characterVisibility = 0
        No offense, but I don't think I have to prove anything to anyone besides myself. 
        What matters is if I'm happy with myself AND if I'm not an asshole. 
        
        ~characterVisibility = 1
        ~earthAffection++
        That...is a very brave answer. And an admirable one. 
        You're just full of surprises, teaching me something new cycle. 
        
        ~characterVisibility = 0
        I, wow, thank you. I was kinda worried for a second.
        I didn't want to offend you, you're someone I really admire.
        
        ~characterVisibility = 1
        Why is that? 
        
        ~characterVisibility = 0
        You work hard, you look amazing, you're confident. Just an absolute package, honestly.
        How could I not look up to you? 
        
        ~characterVisibility = 1
        Why aren't you just the sweetest. 
        
        ->Goodbye
    
==Goodbye

~characterVisibility = 1
(Her phone buzzes loudly in her purse.)
(She checks her phone quicklyand sighs.)
Looks like lunch will have to wait, there's been an "emergency"and well, my lunch break has been cut short. 
You better hurry now if you want to enjoy the rest of your break.

{earthAffection > 3:
    ~characterVisibility = 1
    Not to say that I didn't enjoy spending time chatting with you.
    You're a breath of fresh air {player_name}. 
    I'll see you later then. 
}

~characterVisibility = 1
I'll be taking my leave now. 

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