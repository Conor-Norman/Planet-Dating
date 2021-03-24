VAR player_name = ""
VAR character = ""
VAR characterVisible = 0
VAR pose = ""
VAR venusAffection = 0

VAR area = ""

VAR minimalIngredients = 0
VAR matchingIngredientCount = 0


~ area = "FreeTime"

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
~character = "venus"
~pose = "neutral"
~venusAffection+=2
Ahhh, oh my stars, babe!
This is exactly what I was hoping for!
You're an absolute doll, love you!
I gotta run, but I'll see you around, sugar!

    ->END


==Almost
~character = "venus"
~pose = "neutral"
~venusAffection++
Hm...okay.
Not quite what I was hoping for, but it works.
Thanks anyway, sweetie, I really appreciate the effort.
See you later!

    ->END
    
==WayOff
~character = "venus"
~pose = "neutral"
~venusAffection--
Ugh...really?
This isn't what I asked for.
Nevermind. I guess I'll try a different bar.

    ->END
    
===function changeName(newName) ===
~ player_name = newName

===function changeCharacter===
~return character

===function getAffection===
~return venusAffection

===function getArea===
~return area
    
===function setMatchingIngredients(amount)===
~matchingIngredientCount = amount

===function setMinimalIngredients(amount)===
~minimalIngredients = amount

