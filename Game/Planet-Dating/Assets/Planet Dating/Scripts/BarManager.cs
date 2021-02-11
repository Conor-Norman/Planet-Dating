using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BarManager : MonoBehaviour {
    #region Variables

    [Header("Variables")]
    int[] idealIngredients;
    int[] selectedIngredients;
    public int orbitIngredient1;
    public int orbitIngredient2;
    public int orbitIngredient3;
    public int minimalIngredients = 0;
    public int matchingIngredientsCount;

    [Header("Scripts")]
    public InkTest inkManagerScript;

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

        inkManagerScript.SetMatchingIngredientCount(matchingIngredientsCount);

        inkManagerScript.ContinueStory(); //continues the story in ink

        //send value to ink
        //if (matchingIngredientsCount == 3) {
        //    //give 2 affection
        //}
        //else if (matchingIngredientsCount >= minimalIngredients) {
        //    //give 1 affection
        //}
        //else {
        //    //give no affection
        //}
    }

    #endregion
}

#region pseudocode
/* get array of ideal ingredients from ink
 * get array of selected ingredients form orbit ring
 * get amount of correct ingredients needed from ink
 * compare the 2 arrays for matching ingredients
 * create variable to track amount of affection gained
 * check if it meets the minimum correct ingredient (award 1 affection point send to ink)
 * check if all 3 match (award 1 affection point send to ink)
 * send affection points to ink
 * 
 * 
 * for drink:
 * create array for storing necessary changes to drink
 * spawn in drink and change the look of it to meet what they mixed
 * when served (button click) continue story in ink
 */
#endregion