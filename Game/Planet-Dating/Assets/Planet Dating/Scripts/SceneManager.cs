using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SceneManager : MonoBehaviour {

    #region Variables
    [Header("Canvas Elements")]
    public GameObject textBox;
    public GameObject character;
    Image characterBodyImage;
    MeshRenderer characterHeadMeshRend;
    public SpriteRenderer background;
    public GameObject ingredientOrbit;
    public GameObject IngredientList;

    [Header("Art")]
    public List<Sprite> characterBodies = new List<Sprite>();
    public List<Material> characterHeads = new List<Material>();

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

        if (areaName == "Bartending") {
            ingredientOrbit.SetActive(true);
            IngredientList.SetActive(true);
            textBox.transform.localPosition = new Vector3(570, 283, 0); //move text box location
            character.transform.localPosition = new Vector3(511, -359, 0); //move character location
            //change image of text box
            inkManagerScript.pause = true;
        }
        else if (areaName == "FreeTime") {
            ingredientOrbit.SetActive(false);
            IngredientList.SetActive(false);
            textBox.transform.localPosition = new Vector3(308, -273, 0); //move text box location
            character.transform.localPosition = new Vector3(-611, -161, 0); //move character location
            //change text box image
        }
        else if (areaName == "Date") {
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
        else if (characterName == "player") {
            character.SetActive(true);
            characterBodyImage.color = new Color(100,100,100);
        }
        else if (characterName == "sol") {
            ChangeCharacterVariables(0);
        }
        else if (characterName == "mercury") {
            ChangeCharacterVariables(1);
        }
        else if (characterName == "venus") {
            ChangeCharacterVariables(2);

            // fade out character and fade in new one with LERP?
            //if current character != characterName. change it and make current character = it
        }
    }

    void ChangeCharacterVariables(int index) {
        character.SetActive(true);
        characterBodyImage.sprite = characterBodies[index];
        characterHeadMeshRend.material = characterHeads[index];
        characterBodyImage.color = new Color(255, 255, 255);
    }

    public void ChangeBackground(string backgroundName) {

        // fade out background and fade in new one with LERP?
        //if current background != backgroundName. change it and make current background = it
    }

    public void ChangeVisibility(int visible) {

        if (visible == 0) {
            //add black overlaw
            characterBodyImage.color = new Color(100, 100, 100);
        }
        else if (visible == 1) {
            //remove black overlay
            characterBodyImage.color = new Color(255, 255, 255);
        }
    }

    #endregion
}
