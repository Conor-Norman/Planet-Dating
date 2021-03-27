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

~ area = "lounge"
~ background = "Lounge"

    ->SolWalksIn

==SolWalksIn
~characterVisibility = 1
~character = "Sol"
~pose = "neutral"

this is really long for testing reasons. this is really long for testing reasons. this is really long for testing reasons. this is really long for testing reasons. this is really long for testing reasons. this is really long for testing reasons. this is really long for testing reasons. this is really long for testing reasons.

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

