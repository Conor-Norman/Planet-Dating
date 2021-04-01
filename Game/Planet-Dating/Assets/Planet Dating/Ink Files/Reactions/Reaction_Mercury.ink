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
VAR matchingIngredientCount = 0


~area = "lounge"
~character = "Mercury"
~characterVisibility = 1
~pose = "neutral"
Okay, let's try this out.

{ 
    - matchingIngredientCount == 3:
        -> PerfectDrink
    
    - matchingIngredientCount >= minimalIngredients:
        -> Almost

    - matchingIngredientCount < minimalIngredients:
       -> WayOff
}


==PerfectDrink
~character = "Mercury"
~pose = "neutral"
~mercuryAffection += 2
~characterVisibility = 1
Heeey, I think we're onto something here!
Just what the doctor ordered! Super tasty!
And it's going down real smoo—
Ow, that's hot — I mean, it's not, it's not hot.
...
Uhhh, know what, I think I was supposed be somewhere. Yeah, catch ya later!

    ->END


==Almost
~character = "Mercury"
~pose = "neutral"
~mercuryAffection++
~characterVisibility = 1
Alright, not bad buddy!
Off to a pretty decent start!
The flavours, the pizzazz — it's all there.
I gotta bounce for now, but we'll cook up something even better next time.

    ->END
    
==WayOff
~character = "Mercury"
~pose = "neutral"
~mercuryAffection--
~characterVisibility = 1
Okay, woah, that's kinda funky.
And not in the good way...
Did you mix up my order with someone else's?
Ah, don't worry 'bout it, you'll kill it next time. I'm out for now.

    ->END
    
===function setMatchingIngredients(amount)===
~matchingIngredientCount = amount

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



