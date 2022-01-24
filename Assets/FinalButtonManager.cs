using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.SceneManagement;
public class FinalButtonManager : MonoBehaviour
{
    static FinalButtonManager instance;
    [SerializeField]
    List<GameObject> finalButtons;
    [SerializeField]
    TextMeshProUGUI timeLeftText;

    private bool clicked = false;

    private float whenClickedTime;

    [SerializeField]
    private float timeLeftAfterClicking;

    public void InteractWithRedButtonWithID(int id)
    {
        foreach(GameObject button in finalButtons)
        {
            if(button.GetComponent<InteractRedButton>() != null)
            {
                button.GetComponent<InteractRedButton>().interactRedButton();
            }
        }
        whenClickedTime = Time.time;
        clicked = true;
    }

    static public FinalButtonManager Instance()
    {
        return instance;
    }

    public void Start()
    {
        instance = this;
        clicked = false;
    }
    private void Update()
    {

        if (timeLeftText)
        {
            if (clicked)
            {
                timeLeftText.text = "Time left : " + (timeLeftAfterClicking - (Time.time - whenClickedTime)).ToString("F2");
            }
            else
            {
                timeLeftText.text = "";
            }
            if (clicked && 0 >= (timeLeftAfterClicking - (Time.time - whenClickedTime)))
            {
                SceneManager.LoadScene("lost");
            }
        }
    }
}
