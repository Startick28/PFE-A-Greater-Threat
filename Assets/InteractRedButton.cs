using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
public class InteractRedButton : Interactable
{
    [SerializeField] public int id;
    [SerializeField] TextMeshProUGUI timeLeftText;
    [SerializeField] GameObject doubleDoor;
    [SerializeField] EndgameSpawner endgameSpawnerW;
    [SerializeField] EndgameSpawner endgameSpawnerE;

    private bool clicked = false;

    private float whenClickedTime;

    [SerializeField]
    private float timeLeftAfterClicking;

    public void interactRedButton()
    {
        clicked = true;
        canInteract = false;
        whenClickedTime = Time.time;
        doubleDoor.GetComponent<DoorDoubleSlide>().enabled = true;
        doubleDoor.GetComponent<AudioSource>().enabled = true;
        AudioManager.Instance.PlayAlarmSoundRPC();
        endgameSpawnerW.StartEndgame();
        endgameSpawnerE.StartEndgame();
    }
    public override void finishInteraction()
    {
        throw new System.NotImplementedException();
    }

    public override void interact(FPSCharacterController player)
    {
        doubleDoor.GetComponent<DoorDoubleSlide>().enabled = true;
        doubleDoor.GetComponent<AudioSource>().enabled = true;
    }

    // Start is called before the first frame update
    void Start()
    {
        clicked = false;
        canInteract = true;
        doubleDoor.GetComponent<DoorDoubleSlide>().enabled = false;
        doubleDoor.GetComponent<AudioSource>().enabled = false;
    }

    // Update is called once per frame
    void Update()
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
