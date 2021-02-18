﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SceneManager : MonoBehaviour {

    #region Variables
    [Header("Canvas Elements Free Time")]
    public GameObject textBox;
    public GameObject character;
    Image characterBodyImage;
    public Material planetHeadOverlay;
    MeshRenderer characterHeadMeshRend;
    public Transform characterHeadPosition;
    public SpriteRenderer background;

    [Header("Canvas Elements Bar")]
    public GameObject ingredientOrbit;
    public GameObject IngredientList;

    [Header("Art")]
    public List<Sprite> characterBodies = new List<Sprite>();
    public List<Material> characterHeads = new List<Material>();
    public List<Sprite> backgrounds = new List<Sprite>();

    [Header("Scripts")]
    public InkTest inkManagerScript;

    #endregion

    #region UnityFunctions
    private void Start() {
        characterBodyImage = character.GetComponent<Image>();
        characterHeadMeshRend = character.GetComponentInChildren<MeshRenderer>();
    }
    #endregion

    #region User Functions
    public void ChangeArea(string areaName) {

        //fade to black

        if (areaName == "bartending") {
            ingredientOrbit.SetActive(true);
            IngredientList.SetActive(true);
            textBox.transform.localPosition = new Vector3(0, -400, 0); //move text box location
            character.transform.localPosition = new Vector3(721, -287, 0); //move character location
            character.transform.localScale = new Vector3(-0.75f,0.75f,0.75f);
            background.sprite = backgrounds[1];
            //change image of text box
            inkManagerScript.pause = true;
        }
        else if (areaName == "lounge") {
            ingredientOrbit.SetActive(false);
            IngredientList.SetActive(false);
            textBox.transform.localPosition = new Vector3(0, -290, 0); //move text box location
            character.transform.localPosition = new Vector3(0, -216, 0); //move character location
            character.transform.localScale = new Vector3(1, 1, 1);
            background.sprite = backgrounds[0];
            //change text box image
        }
        else if (areaName == "freetime") {
            ingredientOrbit.SetActive(false);
            IngredientList.SetActive(false);
            //show character list on screen with pictures
            //move text box location
            //move character location
            //change textbox image
        }
        else if (areaName == "date") {
            ingredientOrbit.SetActive(false);
            IngredientList.SetActive(false);
            //move text box location
            //move character location
            //change textbox image
        }

        //fade back in
    }

    public void ChangeCharacter(string characterName) {

        if (characterName == "none") {
            character.SetActive(false);
        }
        else if (characterName == "Sol") {
            ChangeCharacterVariables(0);
            characterHeadPosition.localPosition = new Vector3(60, 420, 10);
        }
        else if (characterName == "Mercury") {
            ChangeCharacterVariables(1);
        }
        else if (characterName == "Venus") {
            ChangeCharacterVariables(2);
            characterHeadPosition.localPosition = new Vector3(-14, 306, 10);

            // fade out character and fade in new one with LERP?
            //if current character != characterName. change it and make current character = it
        }
    }

    void ChangeCharacterVariables(int index) {
        character.SetActive(true);
        characterBodyImage.sprite = characterBodies[index];
        characterHeadMeshRend.material = characterHeads[index];
        //characterBodyImage.color = new Color(255, 255, 255);
    }

    public void ChangeBackground(string backgroundName) {

        // fade out background and fade in new one with LERP?
        //if current background != backgroundName. change it and make current background = it
    }

    public void ChangeVisibility(int visible) {

        if (visible == 0) {
            //add black overlaw
            characterBodyImage.color = new Color(0.3f, 0.3f, 0.3f);
            planetHeadOverlay.color = new Color(0, 0, 0,0.66f);
        }
        else if (visible == 1) {
            //remove black overlay
            characterBodyImage.color = new Color(1, 1, 1);
            planetHeadOverlay.color = new Color(0, 0, 0, 0);
        }
    }

    #endregion
}
