using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
public class InteractRedButton : Interactable
{
    [SerializeField] public int id;
    [SerializeField] GameObject doubleDoor;
    [SerializeField] EndgameSpawner endgameSpawnerW;
    [SerializeField] EndgameSpawner endgameSpawnerE;


    public void interactRedButton()
    {
        canInteract = false;
        EnemiesManager.Instance.photonView.RPC("RemoveAllArrack", RpcTarget.All);
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
        canInteract = true;
        doubleDoor.GetComponent<DoorDoubleSlide>().enabled = false;
        doubleDoor.GetComponent<AudioSource>().enabled = false;
    }
}
