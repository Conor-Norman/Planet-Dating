using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SceneManager : MonoBehaviour
{
    [Header("FreeTime Elements")]
    public GameObject textBox;
    public GameObject character;
    public SpriteRenderer background;

    [Header("Bar Elements")]
    public GameObject ingredientOrbit;

    
    public void ChangeArea(string areaName) {

        //fade to black

        if (areaName == "Bartending") {
            ingredientOrbit.SetActive(true);
            textBox.transform.localPosition = new Vector3(570, 283, 0); //move text box location
            character.transform.localPosition = new Vector3(511, -359, 0); //move character location
            //disable image of text box
        }
        else if (areaName == "FreeTime") {
            ingredientOrbit.SetActive(false);
            textBox.transform.localPosition = new Vector3 (308,-273,0); //move text box location
            character.transform.localPosition = new Vector3(-611, -161, 0); //move character location
            //enable text box image
        }
        else if (areaName == "Date") {
            ingredientOrbit.SetActive(false);
            //move text box location
            //move character location
            //enable textbox image
        }

        //fade back in
    }

    public void ChangeCharacter(string characterName) {

        if (characterName == "sol") {

        }

        // fade out character and fade in new one with LERP?
        //if current character != characterName. change it and make current character = it
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
}
