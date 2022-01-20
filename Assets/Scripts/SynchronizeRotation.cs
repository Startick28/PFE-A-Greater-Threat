using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
public class SynchronizeRotation : MonoBehaviour , IPunObservable
{
    public void OnPhotonSerializeView(PhotonStream stream, PhotonMessageInfo info)
    {
        if (stream.IsReading)
        {
            transform.rotation = (Quaternion)stream.ReceiveNext();
        }
        else if (stream.IsWriting )// && transform.parent.GetComponent<PhotonView>().IsMine)
        {
            stream.SendNext(transform.rotation);
        }
    }
}
