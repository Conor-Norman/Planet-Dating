VAR player_name = ""
VAR character = ""
VAR characterVisibility = 0
VAR pose = ""
VAR venusAffection = 0

VAR area = ""

VAR minimalIngredients = 0
VAR matchingIngredientCount = 0


~ area = "lounge"

well lets have a taste

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
~venusAffection+=2
~characterVisibility = 1
Ahhh, oh my stars, babe!
This is exactly what I was hoping for!
You're an absolute doll, love you!
I gotta run, but I'll see you around, sugar!

THANK YOU FOR PLAYING OUR DEMO! PRESS ESC TO EXIT

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

THANK YOU FOR PLAYING OUR DEMO! PRESS ESC TO EXIT

    ->END
    
==WayOff
~character = "Venus"
~pose = "neutral"
~venusAffection--
~characterVisibility = 1
Ugh...really?
This isn't what I asked for.
Nevermind. I guess I'll try a different bar.

THANK YOU FOR PLAYING OUR DEMO! PRESS ESC TO EXIT
    ->END
    
===function changeName(newName) ===
~ player_name = newName

===function changeCharacter===
~return character

===function getCharacterVisible===
~return characterVisibility

===function getAffection===
~return venusAffection

===function getArea===
~return area
    
===function setMatchingIngredients(amount)===
~matchingIngredientCount = amount

===function setMinimalIngredients(amount)===
~minimalIngredients = amount

