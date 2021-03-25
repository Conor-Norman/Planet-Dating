using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;

public class InkManager : MonoBehaviour {
    #region Variables

    public Story story;

    [Header("Ink JSON files")]
    public List<TextAsset> introFiles = new List<TextAsset>();
    public List<TextAsset> shiftStartFiles = new List<TextAsset>();
    public List<TextAsset> shiftEndFiles = new List<TextAsset>();
    public List<TextAsset> earthFreeTimeFiles = new List<TextAsset>();
    public List<TextAsset> mercuryFreeTimeFiles = new List<TextAsset>();
    public List<TextAsset> venusFreeTimeFiles = new List<TextAsset>();
    public List<TextAsset> earthLoungeFiles = new List<TextAsset>();
    public List<TextAsset> mercuryLoungeFiles = new List<TextAsset>();
    public List<TextAsset> venusLoungeFiles = new List<TextAsset>();
    public List<TextAsset> drinkReactionFiles = new List<TextAsset>();
    public List<TextAsset> overtimeFiles = new List<TextAsset>();
    public List<TextAsset> helpFiles = new List<TextAsset>();
    public List<TextAsset> dateFiles = new List<TextAsset>();
    List<TextAsset> dailyLounge = new List<TextAsset>();

    [Header("Canvas")]
    public TMP_Text dialogueBox;
    public TMP_Text characterNameText;
    public List<GameObject> choiceButtons = new List<GameObject>();
    public int buttonLoopCounter;

    [Header("On Screen")]
    //area, character, pose, background, 
    public string character = "";
    string characterTemp = "";
    public string area = "";
    string areaTemp = "";
    public int characterVisible = 1;
    int characterVisibleTemp;

    [Header("Scripts")]
    public SceneManager sceneManagerScript;

    [Header("Variables")]
    public bool pause;
    bool progressPressed = false;
    float textTypeOutSeconds;
    bool animatingText;
    bool animateText;
    string currentDialogue;
    int dayCount;
    string currentEvent;
    int conversationsHad;
    public bool demo;

    [Header("InkVariables")]
    int solAffection;
    int mercuryAffection;
    int venusAffection;
    int earthAffection;
    int bartendingPoints;

    #endregion

    #region Unity Functions
    // Start is called before the first frame update
    void Start() {

        //sceneNumber = 0; //start of game will be changed based on main menu selection

        textTypeOutSeconds = 0.02f;

        story = new Story(shiftStartFiles[dayCount].text);
        currentEvent = "ShiftStart";

        CheckForSceneChanges();

        dialogueBox.gameObject.SetActive(true); //enables the text box

        dialogueBox.text = LoadStory(); //shows first section of dialogue

        buttonLoopCounter = 0;
        DisableChoiceBox();
    }

    // Update is called once per frame
    void Update() {

        if (!pause) {
            InputCheck();
        }
        
    }
    #endregion

    #region Story Running Functions
    void InputCheck() {
        if ((Input.GetAxis("Progress") > 0 || Input.GetAxis("Progress") < 0) && !progressPressed && !animatingText) {
            progressPressed = true;

            CheckForSceneChanges();
        }
        else if ((Input.GetAxis("Progress") > 0 || Input.GetAxis("Progress") < 0) && !progressPressed && animatingText) {
            textTypeOutSeconds = 0;
        }
        else if (Input.GetAxis("Progress") == 0) {
            progressPressed = false;
        }
    }


    string LoadStory() {

        string text = "";

        if (story.currentChoices.Count > 0) {
            EnableButtons();
            animateText = false;
            //text = currentDialogue; //// take away comment when the new choice boxes are added in ======================================================================================================
        }
        else if (story.canContinue) {
            animateText = true;
            text = story.Continue();
        }
        else {
            
            CheckWhatsNextEvent();
            
        }
        return text;
    }

    void ChooseDialogueChoice(Choice choice) {

        story.ChooseChoiceIndex(choice.index);

        EnableButtons();
    }

    void EnableButtons() {

        foreach (Choice choice in story.currentChoices) {
            choiceButtons[buttonLoopCounter].SetActive(true);
            Button currentButton = choiceButtons[buttonLoopCounter].GetComponent<Button>(); //find amount of choices and enable buttons needed
            Text choiceText = currentButton.GetComponentInChildren<Text>(); //gets text element in button and changes text to match choices
            choiceText.text = choice.text;

            currentButton.onClick.AddListener(delegate {
                ChooseDialogueChoice(choice);
                buttonLoopCounter = 0;
                DisableChoiceBox();
            });

            if (story.currentChoices.Count - 1 > buttonLoopCounter) {
                buttonLoopCounter++;
            }
        }
    }


    void DisableChoiceBox() {

        foreach (GameObject choiceButton in choiceButtons) {
            choiceButton.SetActive(false);
        }

        dialogueBox.gameObject.SetActive(true);
    }
    #endregion

    #region Ink Functions

    void ChangeInkFile(TextAsset nextScene) {

        //save variables from previous scene here
        saveVariables();

        story = new Story(nextScene.text); //gets json file of scene

        loadVariables(); //add back in in full version ============================================================================================================================================================================================================

        pause = false;

        CheckForSceneChanges();

        story.EvaluateFunction("changeName", "Protag"); //changes the players name in ink (change protag to the actual name from fariables script)
    }



    public void CheckWhatsNextEvent() {

        //reaction events
        if (area == "bartending") {

            if (character == "Earth") {
                ChangeInkFile(drinkReactionFiles[0]);
                return;
            }
            else if (character == "Mercury") {
                ChangeInkFile(drinkReactionFiles[1]);
                return;
            }
            else if (character == "Venus") {
                ChangeInkFile(drinkReactionFiles[2]);
                return;
            }
            //sceneManagerScript.ChangeArea("lounge");
        }

        //for day 0 stuff
        if (currentEvent == "ShiftStart" && dayCount == 0) {

            currentEvent = "Intro";
            ChangeInkFile(introFiles[1]);
            conversationsHad++;
            return;
        }
        else if (currentEvent == "Intro" && dayCount == 0 && conversationsHad < 3) {
            ChangeInkFile(introFiles[conversationsHad+1]);
            conversationsHad++;
            return;
        }
        else if (currentEvent == "Intro" && dayCount == 0 && conversationsHad >= 3) {
            ChangeInkFile(shiftEndFiles[dayCount]);
            conversationsHad = 0;
            currentEvent = "ShiftEnd";
            return;
        }

        //add area to select what characters the player will want to talk to. change scenemanager area to free time to display choices



        //free time events
        if (currentEvent == "ShiftEnd" || (currentEvent == "FreeTime" && conversationsHad < 2)) {
            //change to free time
            if (character == "Earth") {
                currentEvent = "FreeTime";
                conversationsHad++;
                ChangeInkFile(earthFreeTimeFiles[dayCount]);
            }
            else if (character == "Mercury") {
                currentEvent = "FreeTime";
                conversationsHad++;
                ChangeInkFile(mercuryFreeTimeFiles[dayCount]);
            }
            else if (character == "Venus") {
                currentEvent = "FreeTime";
                conversationsHad++;
                ChangeInkFile(venusFreeTimeFiles[dayCount]);
            }
        }
        else if (currentEvent == "FreeTime" && conversationsHad >=2) {
            //next day

            if (!demo) {
                dayCount++;
                currentEvent = "ShiftStart";
                dailyLounge[0] = earthLoungeFiles[dayCount - 1];
                dailyLounge[1] = mercuryLoungeFiles[dayCount - 1];
                dailyLounge[2] = venusLoungeFiles[dayCount - 1];

                RandomizeList(dailyLounge);
                //randomize lounge list here
            }         
        }


        //shift start events
        if (currentEvent == "ShiftStart" && dayCount > 0 && conversationsHad < 3) {
            currentEvent = "Lounge";
            
        }
        else if (currentEvent == "Lounge" && dayCount > 0 && conversationsHad < 3) {
            //randomize order of character appearing all 3 will play
            //create a list referenceing earthLoungeFiles[dayCount-1] for each planet and randomize that array
            ChangeInkFile(dailyLounge[conversationsHad]);
            conversationsHad++;
        }

        //shift end events
        else if (currentEvent == "Lounge" && dayCount > 0 && conversationsHad >= 3) {

            currentEvent = "ShiftEnd";
            ChangeInkFile(shiftEndFiles[dayCount]);
            conversationsHad = 0;
        }
    }


    void RandomizeList(List<TextAsset> listToRandomize) {


    }



































    void saveVariables() {
        //affection, bartending points
        solAffection = (int)story.EvaluateFunction("getSolAffection");
        mercuryAffection = (int)story.EvaluateFunction("getMercuryAffection");
        venusAffection = (int)story.EvaluateFunction("getVenusAffection");
        earthAffection = (int)story.EvaluateFunction("getEarthAffection");
        bartendingPoints = (int)story.EvaluateFunction("getBartendingPoints");

    }

    void loadVariables() {
        story.EvaluateFunction("setSolAffection", solAffection);
        story.EvaluateFunction("setMercuryAffection", mercuryAffection);
        story.EvaluateFunction("setVenusAffection", venusAffection);
        story.EvaluateFunction("setEarthAffection", earthAffection);
        story.EvaluateFunction("setBartendingPoints", bartendingPoints);
    }

    void CheckForSceneChanges() {

        dialogueBox.text = LoadStory(); //displaying text after click

        areaTemp = (string)story.EvaluateFunction("getArea");
        if (areaTemp != area) {
            area = areaTemp;
            sceneManagerScript.ChangeArea(area); //changes the area the player is in
        }

        characterTemp = (string)story.EvaluateFunction("changeCharacter");
        if (characterTemp != character) {
            character = characterTemp;
            ChangeCharacterName(character);
            sceneManagerScript.ChangeCharacter(character);
        }

        characterVisibleTemp = (int)story.EvaluateFunction("getCharacterVisible");
        if (characterVisibleTemp != characterVisible) {
            characterVisible = characterVisibleTemp;
            sceneManagerScript.ChangeVisibility(characterVisible);
        }

        if (animateText) {
            StartCoroutine("PlayText");
        }
    }

    IEnumerator PlayText() {
        currentDialogue = dialogueBox.text;
        dialogueBox.text = "";
        animatingText = true;

        foreach (char c in currentDialogue) {
            dialogueBox.text += c;
            yield return new WaitForSeconds(textTypeOutSeconds);
        }

        yield return new WaitForSeconds(0.1f); //removes accidentaly progress for when the text completes fast
        animatingText = false;
        textTypeOutSeconds = 0.02f;
    }

    public int[] GetIdealDrink() {
        //List<int> ingredients = new List<int>();
        int[] ingredients = new int[4];

        ingredients[0] = (int)story.EvaluateFunction("getIdealIngredient1");
        ingredients[1] = (int)story.EvaluateFunction("getIdealIngredient2");
        ingredients[2] = (int)story.EvaluateFunction("getIdealIngredient3");
        ingredients[3] = (int)story.EvaluateFunction("getMinimalIngredients");

        return ingredients;
    }

    public void SetMatchingIngredientCount(int amount) {
        story.EvaluateFunction("setMatchingIngredients", amount);
    }

    public void SetMinimalIngredients(int amount) {
        story.EvaluateFunction("setMinimalIngredients", amount);
    }

    void ChangeCharacterName(string characterName) {
        if (characterName == "none") {
            characterNameText.text = "You";
        }
        else {
            characterNameText.text = characterName;
        }
    }

    #endregion
}

/* for choices
 * need to check when a choice is happening
 * disable dialogue box
 * check amount of choices there are
 * enable each button for the amount
 * put correct text for each button 
 * after choice disable each button and chack which choice was made
 * ensure correct path was gone down
 * enable dialogue box
 */