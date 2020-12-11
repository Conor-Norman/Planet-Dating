﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;

public class InkTest : MonoBehaviour
{
    #region Variables

    [Header("ink JSON files")]
    public TextAsset inkJSON;
    public Story story;
    public List<TextAsset> inkFiles = new List<TextAsset>();
    public int sceneNumber;

    [Header ("Canvas")]
    public TMP_Text dialogueBox;
    public List<GameObject> choiceButtons = new List<GameObject>();
    public int buttonLoopCounter;

    [Header("On Screen")]
    public string character = "none";

    [Header("Stats")]
    public int affection;

    bool progressPressed = false;

    #endregion

    #region Unity Functions
    // Start is called before the first frame update
    void Start() {

        //sceneNumber = 0; //start of game will be changed based on main menu selection

        story = new Story(inkFiles[sceneNumber].text); //gets json file of scene

        story.EvaluateFunction("changeName", "Protag User"); //detects and changes the players name

        dialogueBox.gameObject.SetActive(true); //enables the text box

        dialogueBox.text = LoadStory(); //shows first section of dialogue

        buttonLoopCounter = 0;
        DisableChoiceBox();
    }

    // Update is called once per frame
    void Update() {

        InputCheck();
    }
    #endregion

    #region User Functions
    void InputCheck() {
        if ((Input.GetAxis("Progress") > 0 || Input.GetAxis("Progress") < 0) && !progressPressed) {
            progressPressed = true;
            dialogueBox.text = LoadStory(); //displaying text after choice

            character = (string)story.EvaluateFunction("changeCharacter"); //changes the character on screen
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
        else if (story.currentChoices.Count > 0) {
            EnableButtons();
        }
        else {
            //move to next scene or something by changing where the list is pointing
            dialogueBox.gameObject.SetActive(false);
            ChangeScene();
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
            Button currentButton = choiceButtons[buttonLoopCounter].GetComponent<Button>() ; //find amount of choices and enable buttons needed
            Text choiceText = currentButton.GetComponentInChildren<Text>(); //gets text element in button and changes text to match choices
            choiceText.text = choice.text;

            currentButton.onClick.AddListener(delegate {
                ChooseDialogueChoice(choice);
                buttonLoopCounter = 0;
                DisableChoiceBox();
            });

            if (story.currentChoices.Count-1 > buttonLoopCounter) {
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

    void ChangeScene() {

        affection = (int)story.EvaluateFunction("getAffection"); //gets the affection value fomr ink

        sceneNumber++;
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