using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class TextTypeout : MonoBehaviour
{
	TMP_Text txt;
	string story;
	public float secondsToWait = 0.5f;

    void Awake() {
		txt = GetComponent<TMP_Text>();
	}

    public void GetTextElements() {

		story = txt.text;
		txt.text = "";//remove???

		// TODO: add optional delay when to start
		StartCoroutine("PlayText");
	}

	IEnumerator PlayText() {
		foreach (char c in story) {
			txt.text += c;
			yield return new WaitForSeconds(secondsToWait);
		}

		Debug.Log("finished typing");
	}

}
