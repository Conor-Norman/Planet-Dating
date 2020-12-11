VAR player_name = "protag"
VAR character = ""
VAR pose = ""
VAR solAffection = 0

Cosmic Crush

==Intro
welcome {player_name} to our game

    ->SolWalksIn

==SolWalksIn
~character = "sol"
~pose = "neutral"
hey im sol, howa it going.

you must be new here. {player_name} right?

well welcome to my lounge, im going to have you work here as a bartender

are you ready to do that?

    +[Hell yeah!]
    ~solAffection++
    ~pose = "happy"
    
      wow {player_name}, you're confident in yourself.
        
        alright lets get you started
    
            -> FirstCustomer

    +[i'm not too sure]
        dont worry {player_name}, you'll get the hang of alright
    
        -> FirstCustomer
    
    +[no way]
    ~solAffection--
        -> PutInPlace
    

==PutInPlace
    ~pose = "stern"
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
    ->END

===function changeName(newName) ===
~ player_name = newName

===function changeCharacter===
~return character

===function getAffection===
~return solAffection