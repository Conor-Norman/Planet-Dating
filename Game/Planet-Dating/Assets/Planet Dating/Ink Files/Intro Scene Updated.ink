CONST he = "he"
CONST him = "him"
CONST his = "his"
CONST she = "she"
CONST her = "her"
CONST they = "they"
CONST them = "them"
CONST their = "their"

VAR playerPronoun1 = they
VAR playerPronoun2 = them
VAR playerPronoun3 = their
VAR playerName = "Protagonist"

VAR solAffection = 0
VAR mercuryAffection = 0
VAR venusAffection = 0
VAR earthAffection = 0

VAR character = ""
VAR characterVisible = 0
VAR pose = 0
VAR background = 0
VAR area = "FreeTime"

# character 0 = player, character 1 = sol, character 2 = mercury, character 3 = venus, character 4 = earth
# pose 0 = neutral, pose 1 = happy, pose -1 = annoyed/sad, pose -2 = angry
# background 0 = bar

~ background = 0
~ area = "FreeTime"

COSMIC CRUSH

~ characterVisible = 0
Hello, my name is {playerName}.
My preferred pronouns are
    +[He/Him]
        ~ playerPronoun1 = he
        ~ playerPronoun2 = him
        ~ playerPronoun3 = his
        -> JobIntro
    +[She/Her]
        ~ playerPronoun1 = she
        ~ playerPronoun2 = her
        ~ playerPronoun3 = her

        -> JobIntro
    +[They/Them]
        ~ playerPronoun1 = they
        ~ playerPronoun2 = them
        ~ playerPronoun3 = their
        -> JobIntro


== JobIntro
~ characterVisible = 0
Today is my first day bartending at the Lounge.
It's a quaint spot right in the center of this system.
It doesn't get a lot of foreign guests, but locals always seem to be orbiting the place.
It wasn't an easy decision, accepting a job millions of light-years away. But, I'm finally here.

    -> WhereIsSol


== WhereIsSol
~ characterVisible = 0
Doesn't look like anyone else is...
I'm supposed to be meeting my new boss Sol here for onboarding, but I'm not even sure what they look like.
They seemed nice during our Signal Calls, though. 
    -> SolIntro
    

== SolIntro
~ character = "sol"
~ characterVisible = 1
~ pose = 0
My apologies, stranger. The Lounge will be opening shortly.
Can I be of any assistance to you in the meantime?
    +[Wow, you're hot...]
        ~ solAffection--
        ~ characterVisible = 0
        I'm {playerName} and you're, uh...really hot. Like, *really* hot. Burning hot, actually.
        ~ characterVisible = 1
        ~ pose = -1
        Oh, {playerName}! You're even bolder in person. But, try to be a little more subtle when you talk to customers.
        The Lounge has some very important clientele.
        -> Onboarding
    +[Hi, I'm the new trainee?]
        ~ solAffection++
        ~ characterVisible = 0
        Hi, uh, I'm the new bartender trainee, {playerName}. I'm supposed to start today.
        Are you Sol?
        ~ characterVisible = 1
        ~ pose = 1
        Oh, yes, I've been expecting you, {playerName}. Welcome to the Lounge.
        -> Onboarding
    

== Onboarding
~ characterVisible = 1
~ pose = 0
We have a busy day ahead of us. But first, what do you think of the Lounge?
    +[It's beautiful!]
        ~ characterVisible = 0
        It's absolutely beautiful, and big! It's hard to believe I'm finally here.
        ~ characterVisible = 1
        ~ pose = 1
        I graciously accept your kind words. The Lounge is my pride and joy. 
        The energy is hard to beat.
        We're just about ready to open for the cycle.
        -> Instructions
    +[Hard to say without customers.]
        ~ characterVisible = 0
        Hmmm, it's hard to gauge the atmosphere without any customers.
        ~ characterVisible = 1
        ~ pose = 0
        I suppose you're right. Everything's better with company.
        Don't worry, the Lounge is just about ready to open. 
        -> Instructions
    +[I'm a little underwhelmed...]
        ~ characterVisible = 1
        ~ pose = -1
        That pains me to hear, but I admire your honesty. 
        I'm certain your mind will be changed once customers start filling the seats.
        Speaking of which, we're just about ready to open.
        -> Instructions

            
== Instructions
~ characterVisible = 1
~ pose = 0
Come behind the counter. We need to get started.
And bring your things, I'll take them to your room in a moment. 
Are you ready to make your first drink as the Lounge's newest bartender?
    +[I'm more than ready.]
        ~ characterVisible = 0
        More than ready, Sol! I've been dreaming of this moment for a long time. 
        -> ExplainBartending
    +[Already?]
        ~ characterVisible = 0
        Is it time already? I didn't even get a moment to rest.
        (Well, I'm sure I'll get used to it.)
        -> ExplainBartending
    +[Maybe later...]
        ~ characterVisible = 0
        Maybe in a little while. I'm pretty pooped.
        (I don't think Sol can hear me.)
        -> ExplainBartending
    

== ExplainBartending
~ characterVisible = 1
~ pose = 0
Most drinks are a combination of three things - a base, a modifier, and an accent.
We like keep our ingredient list short, but don't let that fool you.
There's a myriad of drinks you can make.
It's very important to pay attention to what a customer likes so that you can make them the right drink.
Our guests typically know exactly what they want, so there should be nothing to worry about for now.
Once they get comfortable with you bartending, they'll be more willing to let you surprise them.
Here comes our first customer now, I'll take you through the steps.
    -> EnterCustomer


== EnterCustomer
~ character = "mercury"
~ characterVisible = 1
~ pose = 1
Oh, a new face! How exciting.
Introduce us, Sol.
~ character = "sol"
~ pose = 1
{playerName}, meet Mercury. Mercury, meet {playerName} — the Lounge's newest bartender. 
You have the honor of being {playerPronoun3} first satisfied customer.
~ character = "mercury"
~ pose = 1
Well then, one "Fire and Ice,"please!
    -> Minigame
    

== Minigame
~ area = "Bartending"
    -> SolAgain


== SolAgain
~ character = "sol"
~ pose = 1
And there you have it, a perfect drink!
Go on and give it to your customer, try and break the ice with him too.
A good bartender should have great rapport with their guests.
~ character = "mercury"
~ pose = 1
Ahh, delicious.
~ characterVisible = 0
(I'm not really sure what to say. He's still a stranger, after all...)
    + [Howdy, stranger!] -> Howdy
    + [What's cookin', good lookin'?] -> WhatsCookin
    + [Do you come here often?] -> Often


    == Howdy
    ~ characterVisible = 0
    Howdy, stranger. I've never seen you around these parts before. What brings you to a place like this?
    ~ character = "mercury"
    ~ characterVisible = 1
    ~ pose = 0
    The booze here is good, and pretty cheap. What's up with the voice, though?
    I heard you talking to Sol, I know that's not your actual voice.
        + [I was trying to sound cool.]
            ~ mercuryAffection--
            ~ characterVisible = 0
            Oh...I thought it sounded cool and mysterious...
            ~ characterVisible = 1
            ~ pose = -1
            Well, it didn't sound *'cool and mysterious'*. It sounded dumb. You're not off to a good start, huh?
            I gotta head back, hopefully you sort things out next time.
                -> Disapproving
        + [I was nervous.]
            ~ mercuryAffection++
            ~ characterVisible = 0
            Ah...honestly, I was just a little nervous.
            This is my first shift, I kinda just said the first thing that came to mind.
            ~ characterVisible = 1
            ~ pose = 1
            Everyone gets nervous. It's fine. Just talk to me like a normal person. 
            I have to go, but I'll see you around, alright?
                -> Approving


    == WhatsCookin
    ~ characterVisible = 0
    What's cookin, good lookin'? You came here by yourself?
    ~ characterVisible = 1
    ~ pose = -1
    Wow, really? Could you *be* any creepier?
        + [I can]
            ~ mercuryAffection--
            ~ characterVisible = 0
            Oh, for sure, I could be way creepier. Why, are you into that?
            ~ characterVisible = 1
            ~ pose = -2
            Ugh, gross...
            I'm outta here. I'll come back when you've got a handle on yourself. 
                -> Disapproving
        + [Sorry, I panicked...]
            ~ mercuryAffection++
            ~ characterVisible = 0
            Ah...honestly, I was just a little nervous.
            This is my first shift, I kinda just said the first thing that came to mind.
            ~ characterVisible = 1
            ~ pose = 1
            Everyone gets nervous. It's fine. Just talk to me like a normal person. 
            I have to go, but I'll see you around, alright?
                -> Approving


    == Often
    ~ characterVisible = 0
    Hey, I don't think I've seen you around here before. Do you come here often?
    ~ characterVisible = 1
    ~ pose = 0
    Where else would I be? This is the only lounge worth visiting in the whole Solar System. It takes way to long to get anywhere else that's even half as decent. 
    You're the one who's new here.
        + [No, I'm cool, I've always been here.]
            ~ mercuryAffection--
            ~ characterVisible = 0
            What? No. I'm cool. I go to cool places. This is a cool place, so I go here. Definitely.
            Yeah, I'm here, like...all the time. Not because I'm an alcoholic, just because I'm so cool
            ~ characterVisible = 1
            ~ pose = -1
            Yikes...you're trying way too hard. You need to lighten up.
            You can come find me once you learn to take yourself less seriously. Otherwise, forget you even saw me.
            I'm leaving now...
            -> Disapproving
        + [You're right, I'm new.]
            ~ mercuryAffection++
            ~ characterVisible = 0
            Yeah, you got me. I only just arrived in this system. It's nice to meet you.
            ~ characterVisible = 1
            ~ pose = 1
            You too. You'll probably see me around here a lot. It's a great spot.
            I have to go, but we should chat later.
            -> Approving


== Disapproving
~ character = "sol"
~ characterVisible = 1
~ pose = -1
That's rough. You really have to pay attention to how you talk to guests if you want them win them over.
It's important to pay attention to their behaviour and interests."
You'll get it next time.
    -> TakeABreak


== Approving
~ character = "sol"
~ characterVisible = 1
~ pose = 1
"Not bad at all! You're off to a phenomenal start!
Remember, you really have to pay attention to how you talk to guests if you want them win them over.
It's important to pay attention to their behaviour and interests."
    -> TakeABreak


== TakeABreak
I can take over for a bit. Why don't you walk around, introduce yourself to a few of the patrons?
A word of advice - don't be a creep.
    -> FreeTime


== FreeTime
~area =  "FreeTime"
+ [Final Stats] -> Final


== Final
{ solAffection > 0:
    Sol respects you!
}
{ solAffection < 0:
    Sol doesn't respect you!
}
{ mercuryAffection > 0:
    Mercury respects you!
}
{ mercuryAffection < 0:
    Mercury doesn't respect you!
}



+ [Restart]
    # RESTART
    -> END

    
    
    
===function changeName(newName) ===
~ playerName = newName

===function changeCharacter===
~return character

===function getSolAffection===
~return solAffection

===function getArea===
~return area
