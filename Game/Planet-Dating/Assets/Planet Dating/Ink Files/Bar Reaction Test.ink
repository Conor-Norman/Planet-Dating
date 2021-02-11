VAR player_name = ""
VAR character = ""
VAR characterVisible = 0
VAR pose = ""
VAR solAffection = 0

VAR area = ""

VAR minimalIngredients = 0
VAR matchingIngredientCount = 0


~ area = "FreeTime"

well let me have a taste

{ 
    - matchingIngredientCount == 3:
        -> PerfectDrink
    
    - matchingIngredientCount >= minimalIngredients:
        -> Almost

    - matchingIngredientCount < minimalIngredients:
       -> WayOff
}


==PerfectDrink
my god you managed to make a perfect drink on your first try

you are going to be a really good fit

    ->END


==Almost
you got most of the ingredients right

with a bit more practice youll get pretty good at this

    ->END
    
==WayOff
well at least you managed to make a drink

    ->END
    
===function changeName(newName) ===
~ player_name = newName

===function changeCharacter===
~return character

===function getAffection===
~return solAffection

===function getArea===
~return area
    
===function setMatchingIngredients(amount)===
~matchingIngredientCount = amount

===function setMinimalIngredients(amount)===
~minimalIngredients = amount

