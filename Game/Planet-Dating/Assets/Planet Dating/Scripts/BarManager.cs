using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BarManager : MonoBehaviour {
    #region Variables

    [Header("Variables")]
    int[] idealIngredients;
    public int[] selectedIngredients;
    public int orbitIngredient1;
    public int orbitIngredient2;
    public int orbitIngredient3;
    public int minimalIngredients = 0;
    public int matchingIngredientsCount;

    [Header("Scripts")]
    public InkManager inkManagerScript;

    #endregion

    #region Unity Functions
    void Start() {
        idealIngredients = new int[4];
        selectedIngredients = new int[3];
    }

    #endregion

    #region User Functions
    public void getIngredients() {
        idealIngredients = inkManagerScript.GetIdealDrink();

        minimalIngredients = idealIngredients[3];

        selectedIngredients[0] = orbitIngredient1;
        selectedIngredients[1] = orbitIngredient2;
        selectedIngredients[2] = orbitIngredient3;

        CompareIngredients();
    }

    void CompareIngredients() {

        matchingIngredientsCount = 0;

        for (int i = 0; i < 3; i++) {
            if (idealIngredients[i] == selectedIngredients[i]) {
                matchingIngredientsCount++;
            }
        }

        inkManagerScript.CheckWhatsNextEvent(); //move to correct scene based on customer in scene and check what scene comes after reaction

        inkManagerScript.SetMatchingIngredientCount(matchingIngredientsCount);

        inkManagerScript.SetMinimalIngredients(idealIngredients[3]);

    }

    #endregion
}