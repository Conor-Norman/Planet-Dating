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

->Intro

==Intro

~ area = "FreeTime"
~ background = "Lounge"

Cosmic Crush

welcome {player_name} to our game

    ->SolWalksIn

==SolWalksIn
~ characterVisibility = 1
~character = "sol"
~pose = "neutral"

hey im sol, hows it going.

you must be new here. {player_name} right?

well welcome to my lounge, im going to have you work here as a bartender

are you ready to do that?

~ characterVisibility = 0

    +[Hell yeah!]
    ~solAffection++
    ~pose = "happy"
    ~ characterVisibility = 1
    
      wow {player_name}, you're confident in yourself.
        
        alright lets get you started
    
            -> FirstCustomer

    +[i'm not too sure]
    ~ characterVisibility = 1
        dont worry {player_name}, you'll get the hang of alright
    
        -> FirstCustomer
    
    +[no way]
    ~solAffection--
        -> PutInPlace
    

==PutInPlace
    ~pose = "stern"
    ~ characterVisibility = 1
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

