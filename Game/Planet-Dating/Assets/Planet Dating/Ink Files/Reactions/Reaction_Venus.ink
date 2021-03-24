VAR player_name = ""
VAR character = ""
VAR characterVisibility = 0
VAR pose = ""

VAR solAffection = 0
VAR mercuryAffection = 0
VAR venusAffection = 0
VAR earthAffection = 0
VAR bartendingPoints = 0

VAR background = ""
VAR area = ""

VAR minimalIngredients = 0
VAR matchingIngredientCount = 0


~area = "lounge"
~character = "Venus"
~characterVisibility = 1
~pose = "neutral"
Well, lets have a taste.

{ 
    - matchingIngredientCount == 3:
        -> PerfectDrink
    
    - matchingIngredientCount >= minimalIngredients:
        -> Almost

    - matchingIngredientCount < minimalIngredients:
       -> WayOff
}


==PerfectDrink
~character = "Venus"
~pose = "neutral"
~venusAffection += 2
~characterVisibility = 1
Ahhh, oh my stars, babe!
This is exactly what I was hoping for!
You're an absolute doll, love you!
I gotta run, but I'll see you around, sugar!

    ->END


==Almost
~character = "Venus"
~pose = "neutral"
~venusAffection++
~characterVisibility = 1
Hm...okay.
Not quite what I was hoping for, but it works.
Thanks anyway, sweetie, I really appreciate the effort.
See you later!

    ->END
    
==WayOff
~character = "Venus"
~pose = "neutral"
~venusAffection--
~characterVisibility = 1
Ugh...really?
This isn't what I asked for.
Nevermind. I guess I'll try a different bar.

    ->END
    
===function changeName(newName) ===
~ player_name = newName

===function changeCharacter===
~return character

===function getCharacterVisible===
~return characterVisibility

===function getArea===
~return area

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
    
===function setMatchingIngredients(amount)===
~matchingIngredientCount = amount

===function setMinimalIngredients(amount)===
~minimalIngredients = amount

