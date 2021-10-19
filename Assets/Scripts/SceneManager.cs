using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
using Photon.Realtime;
public class SceneManager : MonoBehaviourPunCallbacks
{
    static int i = 0;
    public override void OnPlayerPropertiesUpdate(Player targetPlayer, ExitGames.Client.Photon.Hashtable changedProps)
    {
        foreach(var element in changedProps )
        {
            if(!targetPlayer.CustomProperties.ContainsKey(element.Key))
            {
                targetPlayer.CustomProperties.Add(element.Key, element.Value);
            }
            else
            {
                targetPlayer.CustomProperties[element.Key] = element.Value;
            }
            Debug.LogError(element.Key + " " + element.Value);
        }
    }
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
