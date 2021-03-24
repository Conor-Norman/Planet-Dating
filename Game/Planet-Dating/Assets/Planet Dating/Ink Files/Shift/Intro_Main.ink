CONST he = "he"
CONST him = "him"
CONST his = "his"
CONST she = "she"
CONST her = "her"
CONST they = "they"
CONST them = "them"
CONST their = "their"
VAR pronoun1 = they
VAR pronoun2 = them
VAR pronoun3 = their

VAR bartendingPoints = 0
VAR player_name = "protag"

VAR solAffection = 0
VAR mercuryAffection = 0
VAR venusAffection = 0
VAR earthAffection = 0

VAR character = ""
VAR characterVisibility = 0
VAR pose = ""
VAR background = ""
VAR area = ""

# START

~area = "lounge"
~character = "none"
-Hello, my name is {player_name}.

My preferred pronouns are:
    +[He/Him]
        ~pronoun1 = he
        ~pronoun2 = him
        ~pronoun3 = his
        -> JobIntro
    +[She/Her]
        ~pronoun1 = she
        ~pronoun2 = her
        ~pronoun3 = her

        -> JobIntro
    +[They/Them]
        ~pronoun1 = they
        ~pronoun2 = them
        ~pronoun3 = their
        -> JobIntro


== JobIntro
(Today is my first day bartending at the Lounge.)
(It's a quaint spot right in the center of this system.)
(It doesn't get a lot of foreign guests, but locals always seem to be orbiting the place.)
(It wasn't an easy decision, travelling millions of light-years for the chance to be a hotshot bartender. But, I'm finally here.)

    -> WhereIsSol


== WhereIsSol
(Doesn't look like anyone else is...)
(I'm supposed to be meeting my new boss Sol here for my evaluation, but I'm not even sure what they look like.)
(They seemed nice during our Signal Calls, though.)
    -> SolIntro
    

== SolIntro
~character = "Sol"
~pose = "neutral"
~characterVisibility = 1
My apologies, stranger. The Lounge will be opening shortly.
Can I be of any assistance to you in the meantime?
    +[Wow, you're hot...]
        ~solAffection--
        ~characterVisibility = 0
        I'm {player_name} and you're, uh...really hot. Like, really hot. Burning hot, actually.
        ~characterVisibility = 1
        Oh, {player_name}! You're even bolder in person. But, try to be a little more subtle when you talk to customers.
        The Lounge has some very important clientele.
        -> Onboarding
    +[Hi, I'm the new trainee?]
        ~solAffection++
        ~characterVisibility = 0
        Hi, uh, I'm the new bartender trainee, {player_name}. I'm supposed to start today.
        Are you Sol?
        ~characterVisibility = 1
        Oh, yes, I've been expecting you, {player_name}. Welcome to the Lounge.
        -> Onboarding
    

== Onboarding
~characterVisibility = 1
~ pose = "neutral"
We have a busy day ahead of us. But first, what do you think of the Lounge?
    +[It's beautiful!]
        ~characterVisibility = 0
        It's absolutely beautiful, and big! It's hard to believe I'm finally here.
        ~characterVisibility = 1
        I graciously accept your kind words. The Lounge is my pride and joy. 
        The energy is hard to beat.
        We're just about ready to open for the cycle.
        -> Instructions
    +[Hard to say without customers.]
        ~characterVisibility = 0
        Hmmm, it's hard to gauge the atmosphere without any customers.
        ~characterVisibility = 1
        I suppose you're right. Everything's better with company.
        Don't worry, the Lounge is just about ready to open. 
        -> Instructions
    +[I'm a little underwhelmed...]
        ~characterVisibility = 1
        That pains me to hear, but I admire your honesty. 
        I'm certain your mind will be changed once customers start filling the seats.
        Speaking of which, we're just about ready to open.
        -> Instructions

            
== Instructions
~characterVisibility = 1
~pose = "neutral"
Come behind the counter. We need to get started.
As we discussed, you're signing on for a four-cycle test run.
I'll be evaluating your performance over these next four shifts.
The Lounge is a galaxy-renowned hotspot, and more importantly, my home — this process is crucial.

 ~characterVisibility = 0
I understand, and I'm ready to exceed all your expectations!

~characterVisibility = 1
Love to hear the enthusiasm!
Are you ready to make your first drink as the Lounge's newest bartender?
    +[I'm more than ready.]
        ~characterVisibility = 0
        More than ready, Sol! I've been dreaming of this moment for a long time. 
        -> ExplainBartending
    +[Already?]
        ~characterVisibility = 0
        Is it time already? I didn't even get a moment to rest.
        (Well, I'm sure I'll get used to it.)
        -> ExplainBartending
    +[Maybe later...]
        ~characterVisibility = 0
        Maybe in a little while. I'm pretty pooped.
        (I don't think Sol can hear me.)
        -> ExplainBartending
    

== ExplainBartending
~characterVisibility = 1
~pose = "neutral"
Most drinks are a combination of three things - a base, a flavour, and an accent.
We like keep our ingredient list short, but don't let that fool you.
There's a myriad of drinks you can make.
It's very important to pay attention to what a customer likes so that you can make them the right drink.
This is the Lounge, they'll be expecting us to surprise them with something special.
Some customers are chasing specific flavour profiles, others might just be after an aesthetic. Keep everything in mind while you're behind the counter.
I wish you good luck. I'll be nearby if you need me.

    -> END
    


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