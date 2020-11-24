using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;

public class InkTest : MonoBehaviour
{
    public TextAsset inkJSON;
    public Story story;


    // Start is called before the first frame update
    void Start() {

        story = new Story(inkJSON.text); //gets json file of scene

        Debug.Log(LoadStoryChunk()); //shows all dialogue up until next choice

        for (int i = 0; i < story.currentChoices.Count; i++) { //displaying all choice options
            Debug.Log(story.currentChoices[i].text);
        }

        story.ChooseChoiceIndex(0); //manually picking first option

        Debug.Log(LoadStoryChunk()); //displaying text after choice
    }

    // Update is called once per frame
    void Update() {
        
    }

    string LoadStoryChunk() {

        string text = "";

        if (story.canContinue) {
            text = story.ContinueMaximally(); //may want to remove maximally if player will click through
        }
        return text;
    }
}