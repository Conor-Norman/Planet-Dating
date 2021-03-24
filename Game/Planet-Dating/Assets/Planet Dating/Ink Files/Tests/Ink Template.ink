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

~idealIngredient1 = 0
~idealIngredient2 = 0
~idealIngredient3 = 0
~minimalIngredients = 0
~ area = "Bartending"

im looking for something sweet

 -> END

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





