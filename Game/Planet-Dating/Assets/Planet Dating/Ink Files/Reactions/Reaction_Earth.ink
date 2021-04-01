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
~character = "Earth"
~characterVisibility = 1
~pose = "neutral"
Well now, lets have a taste shall we.

{ 
    - matchingIngredientCount == 3:
        -> PerfectDrink
    
    - matchingIngredientCount >= minimalIngredients:
        -> Almost

    - matchingIngredientCount < minimalIngredients:
       -> WayOff
}


==PerfectDrink
~character = "Earth"
~pose = "neutral"
~earthAffection += 2
~characterVisibility = 1
Oh, now thats not half bad. 
You sure you haven't done this before? Excellent work. 
I'll let you get back to work, but thanks for the drink. Keep the change.

    ->END


==Almost
~character = "Earth"
~pose = "neutral"
~earthAffection++
~characterVisibility = 1
Not bad, not bad.
Could use a little more...zest to it, but the taste is there. 
I've got a call to take, but thank you again for this. You did good today. 

    ->END
    
==WayOff
~character = "Earth"
~pose = "neutral"
~earthAffection--
~characterVisibility = 1
Are you sure this is my drink?
Oh...oh that's...a unique flavour.
Okay, no it's bad, but I'm sure you'll get it next time. These things take practice. 

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


