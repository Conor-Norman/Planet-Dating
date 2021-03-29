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

(Now that I can officially step away from the bar and enjoy some free time...well. Honestly, I'm not sure what to do.)
(I'm still new here, it's not like I know the folks around here well enough to just insert myself into their conversations.)
(I look around the room for something to distract myself with so that I don't look too awkward just standing around, when I spot Venus.)
(They're kinda hard to miss. They're standing across the room, taking selfies with their drink.)
(They notice me looking and break into a grin, waving me over. I guess I'll be spending my free time with them, for today.)
(They barely wait until I'm within earshot to start talking.)

~character = "Venus"
~pose = "neutral"
~characterVisibility = 1

Oh my stars, hey babe! Perfect timing. Can you take a quick pic for me? K, thanks, you're an absolute icon.

~characterVisibility = 0
(It doesn't seem like I actually have much of a choice. I take their phone as they strike a pose, snapping a couple of pictures for them.)
(They snatch their phone back once they figure I've taken enough and look through the pictures.)

~characterVisibility = 1
Oh, cute! I love these. Thanks a ton, hun.

~characterVisibility = 0
(They fiddle with their phone for a bit before looking back at me.)

~characterVisibility = 1
What do you think I should caption this?

    +[ Make them stop and stare ]
    
        ~characterVisibility = 0
        I think something like "Make them stop and stare" might be cool?
        It suits you. I know I can't help but stare for a bit whenever I see you. You really demand attention.
        
        ~characterVisibility = 1
        ~venusAffection++
        Awww! You are just so cute, sugar! I'm flattered.
        Plus, that caption would be totally perfect.
        Maybe add, like, that nail painting emoji and a sparkle emoji after it, too.
        Ugh, I love it, so gonna use that one.
        
        ~characterVisibility = 0
        (They immediately start fiddling with their phone again. After a minute, the slip it back into their pocket.)
        
        ->SmallTalk
        
    +[ Trouble never looked so fine ]
    
        ~characterVisibility = 0
        A caption like "Trouble never looked so fine" could work?
        Maybe with a sunglasses emoji, too.
        You just seem, like, an absolute bad bitch, right? So maybe play on that?
        
        ~characterVisibility = 1
        Oh my god, stooop.
        I mean, yeah, I'm for sure the baddest bitch, and I know that, but I've got an image to maintain, you know?
        I can't exactly go branding myself as being "trouble". 
        Besides, the sunglasses emoji? That's so tacky.
        It's not terrible, though...I can workshop it a bit.
        
        ~characterVisibility = 0
        (They type away on their phone for a minute before putting it away.)
        
        ->SmallTalk
        
    +[ You don't have to like me. Can't force you to have good taste ]
    
        ~characterVisibility = 0
        You should definitely try something about being true to you. 
        Like... "You don't have to like me. Can't force you to have good taste."
        
        ~characterVisibility = 1
        ~venusAffection--
        Oh...honey.
        I mean, don't get me wrong, I'm all about being me.
        But doesn't that come across as kinda snobby? I don't want people to think I think I'm better than them.
        I'm just like anyone else, just with more money, fame, and a way better sense of style.
        You tried your best, I guess...I'll figure something else out later.
        
        (They put their phone away.)
        
        ->SmallTalk
        
==SmallTalk

~characterVisibility = 1
So! Enough of that for now. What are you up to? I thought you were supposed to be behind the bar?

~characterVisibility = 0
Oh, I'm just taking a little break right now. Sol said it's fine to walk around for a bit.

~characterVisibility = 1
Aww, and you're choosing to spend your free time with me? I'm flattered...but not surprised. I'd spend my time with me, too.
On a serious note, I know I called you over here, but if you'd rather go do something else, you can. 
Don't worry! I won't be offended. I know I can be a lot to  take in all at once. 
I wouldn't be surprised if you were too intimidated by my glory to stick around for too long.

    +[ You ARE intimidating ]
    
        ~characterVisibility = 0
        I mean...if I'm being honest, you are kind of intimidating.
        You really have a lot to say and don't seem like you hold back anything, ever.
        It's not necessarily a bad thing, just...like you said, it's a lot to take in all at once.
        
        ~characterVisibility = 1
        Haha, I get that all the time, trust me.
        It's just kinda how I've always been. Sorry, not sorry, lmao.
        
        ->MoreTalk
        
    +[ I like being around you ]
    
        ~characterVisibility = 0
        What? No way. I like hanging out with you.
        I mean, granted, I haven't known you for very long, but I appreciate how open and honest you are.
        I never have to wonder what your thinking or worry about if I said something you didn't like, because I know you'll tell me.
        Not to mention, I think your whole glamorous, larger than life attitude is just really cool and charming.
        
        ~characterVisibility = 1
        ~venusAffection++
        Awww, oh my stars, baaaabeeee...!
        Quit it, you're gonna make me blush! You're so sweet.
        I bet you're just trying to butter me up, huh?
        
        ~characterVisibility = 0
        No way! 
        I really mean it, Venus.
        
        ~characterVisibility = 1
        Oh, you are just too precious, hun.
        Am I dreaming? Quick, pinch me and let's see if this cutie in front of me disappears.
        
        ->MoreTalk
        
    +[ I don't have anything better to do ]
    
        ~characterVisibility = 0
        I guess I can stick around for a while.
        It's not like I have anything better to do. Everyone else seems busy.
        
        ~characterVisibility = 1
        ~venusAffection--
        Ouch. Be a little more blunt, would you?
        I'm offering to hang out, if you want, but since you'd clearly rather be somewhere else, you can just go.
        I don't deserve to be anyone's back up choice.
        
        ~characterVisibility = 0
        Sorry? I wasn't trying to be rude. I was just being honest, like you.
        You're pretty blunt yourself, you know. You never hold anything back.
        
        ->MoreTalk

==MoreTalk

~characterVisibility = 1
Tbh, I used to be pretty self conscious about how, like..."loud and proud" I am, I guess.
People literally point that out to me all the time.
But that's just me. And it's not something I can change, so, you know.
Besides, the internet loves it!
Oops, I'm totally rambling, huh? Super embarrassing, lol.

~characterVisibility = 0
I get why that's embarrassing, but I'm glad that you shared that with me.
It makes me feel like I know you a little better.

~characterVisibility = 1
I do love talking about me, so I'm sure you'll get to know a lot about me over time!
But I wanna get to know you too, sweetie! Tell me something about yourself. Anything! I promise I can keep a secret, believe it or not.

    +[ Bartending is my dream job ]
        ~characterVisibility = 0
        This might be kind of lame, but bartending is actually my dream job.
        I know it's not a conventional, respectable job like a doctor, or something glamorous and attention grabbing, like your job.
        But mixing all sorts of different drinks is really cool to me.
        And even better, I love getting to meet and talk to all sorts of new, different people.
        Like, if I wasn't here, where else would I have met someone like you?
        
        ~characterVisibility = 1
        ~venusAffection++
        Oh, honey, there is no one else like me out there.
        I'm so glad that you have a dream that you're passionate about, and that you're actively persuing it!
        I think it's like, super important to do what you love.
        Even if it's a gamble sometimes, it's better to at least try to live your fantasy and fail, than to be too scared to even attempti it and risk totally losing any chance you have.
        Maybe that's a little obvious, though, given what I do, haha!
        Really, though, babe, good for you. I'm proud of you for going for this!
        
        ~characterVisibility = 0
        You're...proud of me?
        
        ~characterVisibility = 1
        I really am. Is that weird?
        
        ~characterVisibility = 0
        No, no...!
        It's actually...really nice.
        Thank you.
        
        ->PostSecret
    +[ If I had enough money to affort it, I'd never work again ]
        ~characterVisibility = 0
        Well, if I'm being totally honest, I don't love the grind of working to make ends meet.
        If I had the option to just live my normal life and not working while someone just paid my expenses for me, I'd take it.
        I'd never do any kind of work again. I'd just...hang out.
        
        ~characterVisibility = 1
        Oh...really? 
        Wouldn't it be better to use those finances as a safety blanket so you can safely risk chasing your dreams?
        
        ~characterVisibility = 0
        My dreams involve staying in bed all day and playing video games.
        
        ~characterVisibility = 1
        Oh.
        I mean, I totally get not liking the grind of, like, some normie job like yours - no offense.
        Even I don't always feel like dolling myself up and posting cute pics for my adoring fans, if you can believe that.
        Sometimes it's nice to just take a break and relax, focus on yourself and all.
        But I don't think I could live like that every day, you know?
        I think It's like, super important to have ambition, drive, and passion, don't you?
        
        ~characterVisibility = 0
        But all that is so much work.
        I just want to sleep. 
        
        ->PostSecret
        
    +[ When I'm not here I just wear the same swetpants every day]
        ~characterVisibility = 0
        Well...when I'm not working and I can just stay home, I just wear the same sweatpants every day.
        I really only take them off to wash them, or to shower.
        They've got a few holes in them at this point, and more than a few stains.
        But they're just so warm and comfy, I can't stand the thought of wearing anything else if I don't absolutely have to.
        
        ~characterVisibility = 1
        ~venusAffection--
        Oh my stars...please tell me you're joking.
        
        ~characterVisibility = 0
        Nope. You wanted to know something about me, so...there's the truth.
        
        ~characterVisibility = 1
        Oh my stars...gag me.
        Sweetie, that's gross.
        Like, I can respect a cute, casual fit sometimes, but the same sweats every day? That's kinda nasty. And not good nasty, either, if that wasn't clear.
        It's mondo important to take care of yourself and be put together and stuff.
        Dressing like that absolutely won't cut it.
        
        ~characterVisibility = 0
        Oh. Sorry, I guess?
        
        ~characterVisibility = 1
        No, I mean...I guess I'm the one who asked?
        Just...try and be better to yourself than that. You have the potential to slay, just put a little work in.
        
        
        ->PostSecret
    
==PostSecret

~characterVisibility = 1
Either way, thanks for telling me that abot yourself.
Now we both know a little more about each other, yeah?
I love getting to know you normal people a bit better, makes you feel more real, almost like we could be equals in some ways, you know?

~characterVisibility = 0
Uh...I don't know if I'd put it that way, but sure.
It's been cool getting to know more about you, too.

~characterVisibility = 1
Haha, I know!
But really, I'm a total open book, babe.
Thanks for being open with me too!

~characterVisibility = 0
Yeah, of course.
It's part of my job to build that connection with customers so I can cater to them better, after all.

~characterVisibility = 1
Oh my stars, I totally never thought of it like that...!
If you put it that way, our jobs are kinda similar, huh?
After all, I have to connect with my fans if I want them to like me and keep coming back for more.

    +[ Seems like hard work ]
        ~characterVisibility = 0
        Seems like it's pretty hard work, trying to make people like you all the time.
        
        ~characterVisibility = 1
        Aww, what, you think I have to try that hard?
        
        ~characterVisibility = 0
        Oh, no, that's not what I meant! I just-
        
        ~characterVisibility = 1
        Ahaha, relax, babe! I was totally just messing you.
        You're so totes adorbs when you get all flustered and worked up like that, {player_name}!
        It totally is hard work.
        Like, keeping up with all these different social medias, managing my image 24/7, reaching out to fans to make sure they feel heard and appreciated - it can be a lot.
        But at the end of the day, it's still totally worth it.
        
        ~characterVisibility = 0
        You seem like you really love what you do.
        
        ~characterVisibility = 1
        I so do!
        I wouldn't rather do anything else.
        
        ->Goodbye
    +[ I don't think it's that similar ]
        ~characterVisibility = 0
        I don't know...I don't think our jobs are that similar.
        I mean, I have to clean the bar and have all this knowledge of different drinks and how to make them.
        You just have to look good and take a few pictures every now and then.
        
        ~characterVisibility = 1
        ~venusAffection--
        Excuse me?
        There's way more that goes into it than that!
        That would be like me saying all you have to do is pour a couple of liquids into a glass.
        Doesn't feel fery good to be judged or have your work underappreciated, does it?
        
        ~characterVisibility = 0
        ...No. It doesn't.
        I guess I was being kind of insensitive.
        
        ~characterVisibility = 1
        Um, try super insensitive???
        I love my job, and believe it or not, it's not easy, so I really don't appreciate you belittling me for it.
        You should never talk down to someone for what they do. You don't know what it's like.
        Being in the public eye constantly isn't alsways as fun and glamorous as it seems, you know?
        Think before you speak next time.
        
        ~characterVisibility = 0
        Yeah...you're right. That was rude of me.
        
        ->Goodbye
    +[ You're pretty likable ]
        ~characterVisibility = 0
        Seems like the perfect job for you, then.
        I mean, who wouldn't like you and want to be connected to you in some way?
        
        ~characterVisibility = 1
        ~venusAffection++
        Oh my stars, you are just the sweetest thing ever...!
        You're totally right, though.
        My fans totally adore me.
        
        ~characterVisibility = 0
        Of course they do. I mean, look at you!
        Not to mention how sincere and open you are.
        You're just the type of person I think everyone would want to be like, or want attention from.
        
        ~characterVisibility = 1
        Stop, you're gonna get me all flustered!
        What a doll, really, you're a total babe.
        Do you talk to everyone that way, or am I just special?
        Actually, don't answer that. Obviously I'm special. I'm Venus, after all.
        
        ~characterVisibility = 0
        How could I forget to mention how admirable your confidence is?
        
        ~characterVisibility = 1
        Oh my stars, I'm blushing.
        You're so adorable, I can't even.
        
        ->Goodbye
    
==Goodbye

~characterVisibility = 1
I'd totes love to stay and chat, but it's getting late, and my fans are expecting a cute goodnight selfie from me.
I should probably get going.

{ venusAffection > 3:
    ~characterVisibility = 1
    You should come say hi again next time I come by!
    It's actually, like, super nice to talk to you!
}

~characterVisibility = 1
I'm heading out now.
Later, babe!
Tell Sol bye for me!

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