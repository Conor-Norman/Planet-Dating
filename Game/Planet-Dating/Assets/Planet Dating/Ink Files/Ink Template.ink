VAR player_name = ""
VAR character = ""
VAR characterVisible = 0
VAR pose = ""
VAR solAffection = 0

VAR area = ""
VAR background = ""

VAR idealIngredient1 = 0
VAR idealIngredient2 = 0
VAR idealIngredient3 = 0
VAR minimalIngredients = 0
VAR matchingIngredientCount = 0
VAR continueStory = false

->Intro

==Intro

~ area = "FreeTime"
~ background = "Lounge"

Cosmic Crush

welcome {player_name} to our game

    ->SolWalksIn

==SolWalksIn
~ characterVisible = 1
~character = "sol"
~pose = "neutral"

hey im sol, hows it going.

you must be new here. {player_name} right?

well welcome to my lounge, im going to have you work here as a bartender

are you ready to do that?

~ characterVisible = 0

    +[Hell yeah!]
    ~solAffection++
    ~pose = "happy"
    ~ characterVisible = 1
    
      wow {player_name}, you're confident in yourself.
        
        alright lets get you started
    
            -> FirstCustomer

    +[i'm not too sure]
    ~ characterVisible = 1
        dont worry {player_name}, you'll get the hang of alright
    
        -> FirstCustomer
    
    +[no way]
    ~solAffection--
        -> PutInPlace
    

==PutInPlace
    ~pose = "stern"
    ~ characterVisible = 1
        listen here, there isnt any place other then the bar to work
        
        you desperatly needed this job and i helped you out
        
        so you get behind that bar and do your job right
        
        no if, and, or but.
        
        -> FirstCustomer

==FirstCustomer
~pose = "neutral"
oh, here comes your first customer

~character = "mercury"
mercury walks up

hey, im {character} im told your new here so ill go easy.

im looking for something sweet

START BARTENDING SECTION

~ area = "Bartending"
~idealIngredient1 = 2
~idealIngredient2 = 1
~idealIngredient3 = 0
~minimalIngredients = 1

{ continueStory == true:
    { 
    - matchingIngredientCount == 3:
        -> PerfectDrink
    
    - matchingIngredientCount >= minimalIngredients:
        -> Almost

    - matchingIngredientCount < minimalIngredients:
       -> WayOff
    }
    ~ continueStory = false
    - else:
    ->END
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

===function getIdealIngredient1===
~return idealIngredient1

===function getIdealIngredient2===
~return idealIngredient2

===function getIdealIngredient3===
~return idealIngredient3

===function getMinimalIngredients===
~return minimalIngredients

===function setMatchingIngredients(amount)===
~matchingIngredientCount = amount

===function setContinueStory===
~continueStory = true





