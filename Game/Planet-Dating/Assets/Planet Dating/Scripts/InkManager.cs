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
    int buttonLoopCounter;

    [Header("On Screen")]
    public string playerName = "";
    string character = "";
    string characterTemp = "";
    string area = "";
    string areaTemp = "";
    int characterVisible = 1;
    int characterVisibleTemp;
    public InputField playerNameText;
    public GameObject NameCreation;

    [Header("Scripts")]
    public SceneManager sceneManagerScript;

    [Header("Story Management")]
    public string currentEvent;
    string currentDialogue;
    int dayCount;
    int conversationsHad;
    bool freeTimeCharacterSelected;

    [Header("Variables")]
    public bool pause;
    bool progressPressed = false;
    float textTypeOutSeconds;
    bool animatingText;
    bool animateText;
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

        textTypeOutSeconds = 0.02f;

        dayCount = 0;
        freeTimeCharacterSelected = false;
        conversationsHad = 0;


        story = new Story(shiftStartFiles[0].text);
        currentEvent = "ShiftStart";
        RandomizeList(introFiles);

        CheckForSceneChanges();

        dialogueBox.gameObject.SetActive(true); //enables the text box

        //dialogueBox.text = LoadStory(); //shows first section of dialogue

        buttonLoopCounter = 0;
        DisableChoiceBox();

        pause = true;

        RandomizeList(earthFreeTimeFiles);
        RandomizeList(mercuryFreeTimeFiles);
        RandomizeList(venusFreeTimeFiles);
    }

    // Update is called once per frame
    void Update() {

        if (!pause) {
            InputCheck();
        }
        
    }
    #endregion

    #region Story Running Functions
    /// <summary>
    /// checks for player input
    /// </summary>
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

    /// <summary>
    /// checks if there is a choice to be made or another block of text
    ///checks if file is at end
    /// </summary>
    /// <returns>
    /// returns text to be printed to dialogue
    /// </returns>
    string LoadStory() {

        string text = "";

        if (story.currentChoices.Count > 0) { //checks if there choices to be made
            EnableButtons();
            animateText = false;
            text = currentDialogue; //displays text with choice boxes open
        }
        else if (story.canContinue) { //checks if theres remaining dialogue
            animateText = true;
            text = story.Continue();
        }
        else if (!animatingText){ //moves to next event
            
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

    /// <summary>
    /// changes ink file
    /// will save and load functions into scene
    /// </summary>
    /// <param name="nextScene">
    /// needs text asset of the next scene
    /// </param>
    void ChangeInkFile(TextAsset nextScene) {

        //save variables from previous scene here
        SaveVariables();

        story = new Story(nextScene.text); //gets json file of scene

        LoadVariables(); //add back in in full version ============================================================================================================================================================================================================

        pause = false;

        CheckForSceneChanges();
    }

    /// <summary>
    /// checks for what event is next in the day
    /// </summary>
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
        }

        //for day 0 stuff
        if (currentEvent == "ShiftStart" && dayCount == 0) {

            currentEvent = "Intro";
            ChangeInkFile(introFiles[conversationsHad]);
            conversationsHad++;
            return;
        }
        else if (currentEvent == "Intro" && dayCount == 0 && conversationsHad < 3) {
            ChangeInkFile(introFiles[conversationsHad]);
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

        if (currentEvent == "ShiftEnd") {
            currentEvent = "FreeTimeSelection";
        }

        //free time events
        if (currentEvent == "FreeTimeSelection" && conversationsHad < 2) {


            if (character == "Earth" && freeTimeCharacterSelected) {
                currentEvent = "FreeTime";
                conversationsHad++;
                sceneManagerScript.ChangeArea("lounge");
                freeTimeCharacterSelected = false;
                pause = false;
                ChangeInkFile(earthFreeTimeFiles[dayCount]);
            }
            else if (character == "Mercury" && freeTimeCharacterSelected) {
                currentEvent = "FreeTime";
                conversationsHad++;
                sceneManagerScript.ChangeArea("lounge");
                freeTimeCharacterSelected = false;
                pause = false;
                ChangeInkFile(mercuryFreeTimeFiles[dayCount]);
            }
            else if (character == "Venus" && freeTimeCharacterSelected) {
                currentEvent = "FreeTime";
                conversationsHad++;
                sceneManagerScript.ChangeArea("lounge");
                freeTimeCharacterSelected = false;
                pause = false;
                ChangeInkFile(venusFreeTimeFiles[dayCount]);
            }
        }
        else if (currentEvent == "FreeTime" && conversationsHad == 1) {
            currentEvent = "FreeTimeSelection";
        }
        else if (currentEvent == "FreeTime" && conversationsHad >=2) {
           
            //next day
            sceneManagerScript.ChangeArea("freetimereset"); //resets free time actives

            if (!demo) {
                dayCount++;
                sceneManagerScript.needTutorial = false;
                currentEvent = "ShiftStart";
                dailyLounge[0] = earthLoungeFiles[dayCount - 1];
                dailyLounge[1] = mercuryLoungeFiles[dayCount - 1];
                dailyLounge[2] = venusLoungeFiles[dayCount - 1];

                RandomizeList(dailyLounge);
                //randomize lounge list here
            }         
        }

        if (currentEvent == "FreeTimeSelection" && !freeTimeCharacterSelected) {

            sceneManagerScript.ChangeArea("freetime");
            dialogueBox.text = " Choose someone you want to talk to.";
            pause = true;
            StartCoroutine("PlayText");
            characterNameText.text = "You";
            return;
        }


        //shift start events
        if (currentEvent == "ShiftStart" && dayCount > 0) {
            ChangeInkFile(shiftStartFiles[dayCount]);

            currentEvent = "Lounge";
            return;
        }
        else if (currentEvent == "Lounge" && dayCount > 0 && conversationsHad < 3) {

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

    public void FreeTimeCharacter(string characterSelected) {

        character = characterSelected;
    }

    public void FreeTimeCharacterSelected(bool characterBeenSelected) {
        freeTimeCharacterSelected = characterBeenSelected;
    }

    /// <summary>
    /// randomizes a list of textAssets
    /// </summary>
    /// <param name="listToRandomize"></param>
    void RandomizeList(List<TextAsset> listToRandomize) {

        for (int i = 0; i < listToRandomize.Count; i++) {
            TextAsset temp = listToRandomize[i];
            int randomIndex = Random.Range(i, listToRandomize.Count);
            listToRandomize[i] = listToRandomize[randomIndex];
            listToRandomize[randomIndex] = temp;
        }
    }

    public void ChangePlayerName() {
        playerName = playerNameText.text;
        textTypeOutSeconds = 0.02f;
        pause = false;
        story.EvaluateFunction("changeName", playerName);
        CheckForSceneChanges();
        Destroy(NameCreation);
    }

    void SaveVariables() {
        //affection, bartending points
        solAffection = (int)story.EvaluateFunction("getSolAffection");
        mercuryAffection = (int)story.EvaluateFunction("getMercuryAffection");
        venusAffection = (int)story.EvaluateFunction("getVenusAffection");
        earthAffection = (int)story.EvaluateFunction("getEarthAffection");
        bartendingPoints = (int)story.EvaluateFunction("getBartendingPoints");

    }

    void LoadVariables() {
        story.EvaluateFunction("setSolAffection", solAffection);
        story.EvaluateFunction("setMercuryAffection", mercuryAffection);
        story.EvaluateFunction("setVenusAffection", venusAffection);
        story.EvaluateFunction("setEarthAffection", earthAffection);
        story.EvaluateFunction("setBartendingPoints", bartendingPoints);
        story.EvaluateFunction("changeName", playerName);
    }

    /// <summary>
    ///is checked after each click 
    ///checks if variables have been changed
    ///animates next block of text (should move)
    /// </summary>
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

        if (animateText && !animatingText) {
            StartCoroutine("PlayText");
        }
    }

    /// <summary>
    /// animates text going through each char fo the dialogue
    /// </summary>
    /// <returns></returns>
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
        if (characterName == "none" || characterVisible == 0) {
            if (playerName != null) {
                characterNameText.text = playerName;
            }
            else {
                characterNameText.text = "You";
            }
            
        }
        else {
            characterNameText.text = characterName;
        }
    }

    #endregion
}