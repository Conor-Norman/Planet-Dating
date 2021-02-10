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

    [Header("Art")]
    public List<Sprite> characterBodies = new List<Sprite>();
    public List<Material> characterHeads = new List<Material>();

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
            textBox.transform.localPosition = new Vector3(570, 283, 0); //move text box location
            character.transform.localPosition = new Vector3(511, -359, 0); //move character location
            //change image of text box
        }
        else if (areaName == "FreeTime") {
            ingredientOrbit.SetActive(false);
            textBox.transform.localPosition = new Vector3(308, -273, 0); //move text box location
            character.transform.localPosition = new Vector3(-611, -161, 0); //move character location
            //change text box image
        }
        else if (areaName == "Date") {
            ingredientOrbit.SetActive(false);
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
        else if (characterName == "sol") {
            character.SetActive(true);
            characterBodyImage.sprite = characterBodies[0];
            characterHeadMeshRend.material = characterHeads[0];
        }
        else if (characterName == "mercury") {
            character.SetActive(true);
            characterBodyImage.sprite = characterBodies[1];
            characterHeadMeshRend.material = characterHeads[1];
        }
        else if (characterName == "earth") {
            character.SetActive(true);

            // fade out character and fade in new one with LERP?
            //if current character != characterName. change it and make current character = it
        }
    }

    public void ChangeBackground(string backgroundName) {

        // fade out background and fade in new one with LERP?
        //if current background != backgroundName. change it and make current background = it
    }

    public void ChangeVisibility(int visible) {

        if (visible == 0) {
            //add black overlaw
        }
        else if (visible == 1) {
            //remove black overlay
        }
    }

    #endregion
}
