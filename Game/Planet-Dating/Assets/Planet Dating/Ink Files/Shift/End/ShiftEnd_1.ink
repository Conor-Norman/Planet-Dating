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

~area = "lounge"
~character = "none"

{ bartendingPoints >= 8:

    ~character = "Sol"
    ~pose = "neutral"
    ~characterVisibility = 1
    A stellar first shift if I've ever seen one!
    I knew I hired you for a reason, but still, I've never seen anyone pick up bartending this quickly!
    I expect great things from you, {player_name}!
    
    ~characterVisibility = 0
    I won't let you down!
}

{ bartendingPoints >= 5 && bartendingPoints <= 7:
    
    (Not too shabby, if I say so myself.)
    
    ~character = "Sol"
    ~pose = "neutral"
    ~characterVisibility = 1
    Good work today. You're a fast learner. 
    A few rough edges, but nothing you can't polish out.
    I have high hopes for you, {player_name}!
    
    ~characterVisibility = 0
    I'll do my best to deliver!
}

{ bartendingPoints <= 4:

    (That...could have gone a little better.)

    ~character = "Sol"
    ~pose = "neutral"
    ~characterVisibility = 1
    Don't beat yourself up too much.
    A lot goes into this job — no one's going to get it on the first shift.
    I have a lot of faith of you, {player_name}!
    
    ~characterVisibility = 0
    I'll throw everything I've got at it!
}

~characterVisibility = 1
One shift down, three more to go! 
We have an amazing thing going on here, but there's plenty more to see out in the system.
Visit some planets, they could use the company. 
Perhaps you'll even pick up a few hints to help you on your next shift.

~characterVisibility = 0
Then it looks like I'm off for the cycle. I'll be heading out now.  

~characterVisibility = 1
Oh! I've arranged for your things to be dropped off at your new residence. Consider it home for the duration of your evaluation.
Go have a look once you're done making merry. Rest is important and all that.

~characterVisibility = 0
Noted. Be seeing you!

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