VAR player_name = "protag"
VAR character = ""
VAR characterVisibility = 0
VAR pose = ""
VAR background = ""
VAR area = ""
VAR mercuryAffection = 0
VAR bartendingPoints = 0

->LookAround

==LookAround

~area = "lounge"
~character = "none"

(The Solar System is too damn big for no good reason...)
(When they told me they had a small, tight-knit community here, I was hoping that meant less travel time.)
(Where even am I right now? The Asteroid Belt? the Kuiper Belt?)
(I might as well be in Andromeda, ugh. Some directions would be helpful, but I guess they don't get enough visitors for that.)
(Think I heard someone around the corner, actually. Maybe they can tell me where I am.)
...
(Weird...I don't think I see anyone...)

~character = "Mercury"
~pose = "neutral"
~characterVisibility = 1
Woah, hey!
You distracted? Almost bumped in to me!

~characterVisibility = 0
(Oh, woops. He's so small I almost didn't see him.)
Sorry, my bad. Yeah, I was totally distracted by something.
That's what it was...

~characterVisibility = 1
Hey, no need to be embarassed, you're not the first. This perfect bod of mine is a shock to everyone!
Hell, even I'm not immune to its effects. Sometimes I wake up in the morning and I'm just like, wow. 
It's no biggie or anything.

~characterVisibility = 0
Oh, yeah, right. Anyway, weird running into someone here, wherever "here" is.
But I'm glad I caught you, because I could really use some directions.

~characterVisibility = 1
Ha! You're at the Asteroid Belt, home of big business and even bigger repair jobs.
Well, I say "bigger," but not like, too big for me to handle, ya know? Everything's light work when you're this good.

~characterVisibility = 0
You're still working? I guess I just thought everyone got off around the same time as me.

~characterVisibility = 1
No I'm off, buuuuut Jupiter asked me to make some repairs real quick, and I never say no to someone in need!
I'm all done — hit the gym earlier with Mars too. Now I'm free as a comet. 
I was just gonna chill alone, but then you popped up and I'm obligated to show the newcomer a good time!

~characterVisibility = 0
You don't have to if you don't want to, I'd be fine just scoping the system out and whatnot. 

~characterVisibility = 1
Nah, c'mon, I gotta!
You need to know that your new pal Mercury's always gonna be there to support. That's just how it is 'round here.  
So what's the schedule looking like? How does {player_name} spend their free time?

    +[ Being alone ]
    
        ~characterVisibility = 0
        After spending so much energy at work, I just want to relax and unwind by myself most of the time. 
        Like I was just wandering around, thinking about stuff, doing things at my own pace. It's nice. 
        I know I should be going around getting to know everyone, but I'm just not always in that mood. 
        
        ~characterVisibility = 1
        ~mercuryAffection--
        Oh, uh, I had no idea I was being so annoying...
        Stupid, Mercury, stupid.
        I'll get out of your space if you really don't want me orbiting around you like that. 
        
        ~characterVisibility = 0
        Wait no, I came to you for directions! It's not you, I promise.
        I don't mind hanging out for a bit, I've already had plenty of alone time.
        
        ~characterVisibility = 1
        If ya say so. 
        
        ->SmallTalk
        
    +[ Hanging with friends ]
    
        ~characterVisibility = 0
        Normally, I'd just hit up a few friends and just hang out to pass the time, but I can't really do that now.
        I was going around looking for people to talk to so I guess I bumped into you at the perfect time.
        
        ~characterVisibility = 1
        I'm definitely all 'bout making new friends! Everyone needs people to support and uplift them, ya know?
        Being alone's the worse, feeling like you're not appreciated and stuff. Sucks. 
        But now that I'm here, you got nothing to worry about!
        
        ~characterVisibility = 0
        Pretty good to hear, honestly. You have anyone else you'd want to round up for some fun?
        I don't know what there is to do around here; it'd be nice to have a group of friends to show me around. 
        
        ~characterVisibility = 1
        Uhhhh, not right now. Everyone's super busy all the time. 
        I don't really mind, but sometimes it gets kinda lonely. 
        
        ->SmallTalk
        
    +[ Trying new things ]
    
        ~characterVisibility = 0
        I'm in a new system filled with all kinds of new things I want to try! I want to do something I've never done before.
        You don't get opportunities like this that often, so I'm definitely going to make the most out of every cycle. 
        
        ~characterVisibility = 1
        ~mercuryAffection++
        That's what I'm talking about!
        The more experiences under your belt the better! Getting out of your comfort zone helps you grow.
        You already know I'm big on growing — can't get enough of it!
        
        ~characterVisibility = 0
        (I, uh, don't think it's working.)
        (I salute your effort, though.)
        
        ~characterVisibility = 1
        Speechless, huh? What can I say? I got a way with words. 
        
        ->SmallTalk
        
==SmallTalk

~characterVisibility = 1
But yeah, going down the list, there's all kinds of stuff to do — if you want.
We could drop by the Lounge, but I think you got enough of that for now.
Uhhhhhhhhhhhh...I guess we're already talking — that's a big thing 'round here. 
Oh! We could check the gym out! I know I said I already went and all, but by the looks of it, you could realllyyyy use it!

~characterVisibility = 0
(Ouch, but I guess I deserve it.)
I'll consider it, but I'm feeling pretty beat after my shift...

~characterVisibility = 1
Ahem, I, Mercury, humbly extend you a once-in-a-lifetime offer to join the Buff Boys Club. 
Right now, it's me, Mars, aaaannndddddd that's it. And maybe you! Not everyone's serious about their health, I guess. 
We meet most cycles to pump iron and hype each other up, 'cause that's what real homies do. You could be a homie too!
What do ya say? You in?

    +[ I'm totally in ]
    
        ~characterVisibility = 0
        For sure, I'm totally in! 
        I came all the way here to turn my life around, so why stop now. What time do you meet?
        
        ~characterVisibility = 1
        ~mercuryAffection++
        Wow, cool! No one's ever actually agreed before, I don't really know what to do. But you can definitely join!
        Of course, I'm gonna hafta talk this over with Mars. You gotta understand, we take our applications real seriously.
        But I'm sure that determination of yours'll win the club over!
        
        ->MoreTalk
        
    +[ Absolutely not ]
    
        ~characterVisibility = 0
        I don't know, I have a lot on my plate right now as it is, sooo no. Absolutely not.
        Don't worry about me, I do enough to keep myself healthy. 
        Keep going your thing though, I'm know the Buff Boys Club will thrive without me.
        
        ~characterVisibility = 1
        ~mercuryAffection--
        Awww, guess I can't force you to join.
        I was looking forward to working out with someone new for once, but it's whatever. Me and Mars are doing good already. 
        If you ever change your mind, we'd love to have ya! Unless it's 'cause we're not cool enough for you...
        
        ->MoreTalk
        
    +[ Let me think about it ]
    
        ~characterVisibility = 0
        Let me have some time to think about, it's been busy, busy, busy for me with the Lounge and my new place. 
        I want to start going to the gym, I really do, but now's not the best time. 
        
        ~characterVisibility = 1
        I guess later is better than never...
        No problem, just give me or Mars a call when you're ready to level up your physique! 
        Taking that first step is super important so the quicker you take it, the better. 
        Also, it means we can get to hanging out more often! That'll be funnnn.
        
        ->MoreTalk

==MoreTalk

~characterVisibility = 1
There's all kinds of benefits that come with the Buff Boy lifestyle.
For starters, everyone's gotta find a way to form good habits, and hitting the gym with the homies is the best way to start.
Before you know it, you'll have yourself a healthy routine that goes beyond just lifting weights, with benefits beyond just a nice body.
You'll be moving better, working faster, playing harder — your whole life changes and all it takes is some time every cycle with your new best friends.
Actually, I read this really cool book that—

~characterVisibility = 0
Okay, okay, I got it, don't worry. 
Sounds awesome and all, but, like I said, not right now. 

~characterVisibility = 1
What if I flex for you a little, would that change anything? Once you see what's possible with just a little bit of—

~characterVisibility = 0
No! I'm good — we're good. I will think about what you've said. 

~characterVisibility = 1
Oh, alright, super. 
Still gonna flex a bit, though. 

~characterVisibility = 0
It's fine—
(He's really doing it. Really straining himself, huh?)
(Oh? Oooo. Well, I guess he is making some...pretty good arguments there.)
(Uh...)

~characterVisibility = 1
Anyway, It's all cool. I don't really plan on hopping back into the gym this cycle.
It's not that I'm, like, tired or anything, but, ya know, can't overdo it. Sometimes I gotta remind myself that I'm still only a planet.

~characterVisibility = 0
I mean, well, thanks for all the help, and all that other stuff. 
I didn't really mean to bother you for that long, so if you're tired then we can end it here. You already helped me a lot, so don't worry.

~characterVisibility = 1
Not tired, I'm not tired.
Okay, maybe I'm a teensy weensy bit tired, if you can even call it that. I wouldn't, but I can see how it might look like that.
Sometimes it sneaks up on ya, but there's no way that's happening any time soon. I still got a lotta energy, especially to entertain a buddy.

~characterVisibility = 0
No really, we've talked plenty. We should both get some rest after a long cycle at work.  

~characterVisibility = 1
Naaahhhhh, I'm saying it's all good.
So...um...how's theeeee Solar System been treating ya?

    +[ It's the best ]
    
        ~characterVisibility = 0
        What can I say? It's the best. Nothing like what I'm used to back in my old system. 
        I'm working towards this sweet job serving drinks to really nice customers, who also happen to be my neighbours. What do I really have to complain about?
        And it's only getting better from here. I'm learning all this stuff about the system and where I fit into it.
        
        ~characterVisibility = 1
        ~mercuryAffection++
        Yeah that's great to hear. Was worried you weren't feeling it here...
        This is an awesome system to live in, no doubt. Especially when you got planets like me showing you the ropes.
        I got so much more to show you and talk to you about, but we should save that for...some other time.
        Can't be having too much excitement in one cycle...
        
        ~characterVisibility = 0
        True, this cycle's been pretty hectic for me. The next few are probably going to be a little rough, but I'm still hyped. 
        
        ->PostSecret
        
    +[ I don't know yet ]
        ~characterVisibility = 0
        
        I think I'll have a better answer for you after a few more cycles. I'm still feeling everything out. 
        The potential of a new job, a new community, new...everything? It's going to take a bit to digest how I'm feeling.
        No bad vibes, though. You've all been great so far.
        
        ~characterVisibility = 1
        Me being great isn't changing any time soon, count on that!
        Don't let things like that trouble you too much...you're gonna see how awesome things are in this system. 
        And if something kinda bothers you, just lemme know and I'll do whateverrrr it takes to make you feel at home.
        
        ~characterVisibility = 0
        Aw, thanks! It really means a lot to know I have people I can talk to out here.
        
        ->PostSecret
        
    +[ Nothing different ]
    
        ~characterVisibility = 0
        Eh, it's honestly nothing different. This system, my last one, it's all the same. I guess they're all kind of the same.
        There's a star, some planets, some comets, some asteroids, and a whole bunch of nothing. I don't know what I expected, honestly.
        The new career path is different, but that's about it I'd say. 
        
        ~characterVisibility = 1
        ~mercuryAffection--
        Just some planet, huh? So I really did leave a bad impression on you...
        I-I know you'll warm up to us eventually, I just...know it.
        I really hope so...
        
        ~characterVisibility = 0
        I didn't mean I found you to be boring! I was talking about just how things work around here.
        There's cool folks everywhere, and I know you're one of them. 
        It's just that things are just the same no matter where you go. My expectations were just too high.
        
        ->PostSecret
    
==PostSecret

~characterVisibility = 1
It's a cool place, ya know? Everyone's gotta do their part and be kind to one another or everything falls apart.
Sometimes...people forget about that last part. Or at least I think they do.
I don't know...sometimes I just feel like everyone's mad at me...

~characterVisibility = 0
What could they be mad about? You're super kind and really helpful!

~characterVisibility = 1
Oh? Yeah, you're right. I am!
I'm kind, helpful, and insanely good-looking, just like you said!
Still...it always feels like you can do more. I want everyone to be happy...

~characterVisibility = 0
I feel that, all we can do is try our best. 

~characterVisibility = 1
Oh, I am. And part of being a good friend is giving your friend some space...soooo...
Jeez, I'm really beat...ugh...this cycle...

~characterVisibility = 0
(He admitted it? He must be extra tuckered out.)

    +[ Let's talk a little longer ]
        ~characterVisibility = 0
        We should both probably get going, but I want to talk just a little longer.
        I'm really curious about all the stuff the system hasn't shown me yet. 
        
        ~characterVisibility = 1
        ~mercuryAffection--
        Oh? Uh? Yeah...soooo...
        There's a lot of...
        I'm sorry, I actually have some other, uh, duties to take care of. I'll make it up to you, promise.
        Work, to the gym, to the Jupiter stuff...just a busy day, ya know?
        
        ~characterVisibility = 0
        No worries there. I don't want to keep you from living your life.
        We'll definitely continue where we left off next time.
        
        ->Goodbye
        
    +[ Let's do whatever you want ]
    
        ~characterVisibility = 0
        We can do whatever you want; you're the captain and I'm the inexperienced newbie after all. 
        I know you have plenty of neat things in mind, right?
        
        ~characterVisibility = 1
        If it's up to me...then...
        How about we try out this new game, yeah! Basically, we both head out and reconvene later to talk more...
        
        ~characterVisibility = 0
        You mean like, calling it here and going home?
        
        ~characterVisibility = 1
        Uhhh...I mean if you say so. Actually, that's what we should totally do.
        Ugh, sorry...I'm actually kinda out of it right now. Between work and all the extra stuff I was doing for Jupiter...
        
        ~characterVisibility = 0
        Oh no I totally get it. It's no big deal — we'll talk more next time.
        
        ->Goodbye
        
    +[ Let him rest ]
    
        ~characterVisibility = 0
        You know what? I think I'm going to head out now. I have some other stuff I need to take care of before the cycle ends.
        I'm sure you have lots of important things to handle on your end as well, so I shouldn't be keeping you from them.
        
        ~characterVisibility = 1
        ~mercuryAffection++
        Oh, yeah? Yeah! Totally, you're right.
        I got lots of stuff to take care of just like you said.
        I could go for waaaaaaay longer, obviously, but we are busy folks here in the Solar System, so...
        
        ~characterVisibility = 0
        No problem here. Rest up, Mercury.
        
        ~characterVisibility = 1
        Thanks, {player_name}.

        ->Goodbye
    
==Goodbye

    ~characterVisibility = 1
    See ya...sorry again.

    ->END


===function changeName(newName) ===
~ player_name = newName

===function changeCharacter===
~return character

===function getCharacterVisible===
~return characterVisibility

===function getArea===
~return area

===function getAffection===
~return mercuryAffection