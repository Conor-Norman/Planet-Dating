using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;

public class InkTest : MonoBehaviour
{
    #region Variables

    [Header("ink JSON files")]
    public TextAsset inkJSON;
    public Story story;
    public List<TextAsset> inkFiles = new List<TextAsset>();
    public int sceneNumber;

    [Header ("Canvas")]
    public Text dialogueBox;
    public Button choice1Button;
    public Button choice2Button;
    public Button choice3Button;


    bool progressPressed = false;

    #endregion

    #region Unity Functions
    // Start is called before the first frame update
    void Start() {

        sceneNumber = 0; //start of game will be changed based on main menu selection

        story = new Story(inkFiles[sceneNumber].text); //gets json file of scene

        story.EvaluateFunction("changeName", "Conor"); //detects and changes the players name

        dialogueBox.enabled = true; //enables the text box

        LoadStory(); //shows first section of dialogue
    }

    // Update is called once per frame
    void Update() {

        ButtonCheck();
        
    }
    #endregion

    #region User Functions
    void ButtonCheck() {
        if ((Input.GetAxis("Progress") > 0 || Input.GetAxis("Progress") < 0) && !progressPressed) {
            progressPressed = true;
            dialogueBox.text = LoadStory(); //displaying text after choice
        }
        else if (Input.GetAxis("Progress") == 0) {
            progressPressed = false;
        }
    }


    string LoadStory() {

        string text = "";

        if (story.canContinue) {
            text = story.Continue(); //may want to remove maximally if player will click through
        }
        else {
            //move to next scene or something by changing where the list is pointing
            dialogueBox.enabled = false;
            sceneNumber++;
        }
        return text;
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