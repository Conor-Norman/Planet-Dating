using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;

public class InkTest : MonoBehaviour {
    #region Variables

    [Header("ink JSON files")]
    //public TextAsset inkJSON;
    public Story story;
    public List<TextAsset> inkFiles = new List<TextAsset>();
    public int sceneNumber;

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

    [Header("Stats")]
    public int affection;

    [Header("Scripts")]
    public SceneManager sceneManagerScript;

    [Header("Variables")]
    public bool pause;
    bool progressPressed = false;
    public float textTypeOutSeconds;
    bool animatingText;

    #endregion

    #region Unity Functions
    // Start is called before the first frame update
    void Start() {

        //sceneNumber = 0; //start of game will be changed based on main menu selection

        story = new Story(inkFiles[sceneNumber].text);

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
        else if (Input.GetAxis("Progress") == 0) {
            progressPressed = false;
        }
    }


    string LoadStory() {

        string text = "";

        if (story.currentChoices.Count > 0) {
            EnableButtons();
        }
        else if (story.canContinue) {
            text = story.Continue();
        }
        else {

            ChangeInkFile();
            //move to next scene or something by changing where the list is pointing
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

    public void ChangeInkFile() {
        sceneNumber++;

        story = new Story(inkFiles[sceneNumber].text); //gets json file of scene

        pause = false;

        CheckForSceneChanges();

        //change all variables from saved file

        story.EvaluateFunction("changeName", "Protag"); //changes the players name in ink (change protag to the actual name from fariables script)
    }
    void CheckForSceneChanges() {

        dialogueBox.text = LoadStory(); //displaying text after click
        StartCoroutine("PlayText");

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
    }

    IEnumerator PlayText() {
        string story = dialogueBox.text;
        dialogueBox.text = "";
        animatingText = true;

        foreach (char c in story) {
            dialogueBox.text += c;
            yield return new WaitForSeconds(textTypeOutSeconds);
        }

        animatingText = false;
        Debug.Log("finished typing");
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