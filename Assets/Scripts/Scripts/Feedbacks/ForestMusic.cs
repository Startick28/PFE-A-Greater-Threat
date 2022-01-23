using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ForestMusic : MonoBehaviour
{
    [SerializeField] private AudioSource audioSource;
    [SerializeField] private AudioClip clip;

    // Start is called before the first frame update
    void Start()
    {
        audioSource.volume = 0;
    }

    private void Update()
    {
        
    }
    IEnumerator LaunchForestMusic()
    {
        while(audioSource.volume < 0.5)
        {
            audioSource.volume += 0.1f;
            Debug.Log("J'augmente le volume");
            yield return new WaitForSeconds(.3f);
        }

        audioSource.volume = 0.5f;
    }

    IEnumerator StopForestMusic()
    {
        while (audioSource.volume > 0.1)
        {
            audioSource.volume -= 0.1f;
            Debug.Log("Je baisse le volume");
            
            yield return new WaitForSeconds(.3f);
        }
        audioSource.volume = 0;
        audioSource.loop = false;
        audioSource.Stop();
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.name.StartsWith("FPS"))
        {
            if (other.GetComponent<PhotonView>() != null)
            {
                if (other.GetComponent<PhotonView>().IsMine)
                    audioSource = other.GetComponent<AudioSource>();
                    StartCoroutine(StopForestMusic());
            }
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.name.StartsWith("FPS"))
        {
            if (other.GetComponent<PhotonView>() != null)
            {
                if (other.GetComponent<PhotonView>().IsMine)
                {
                    audioSource = other.GetComponent<AudioSource>();
                    audioSource.clip = clip;
                    audioSource.spatialBlend = 0;
                    audioSource.volume = 0;
                    audioSource.loop = true;
                    audioSource.Play();
                    StartCoroutine(LaunchForestMusic());
                }
            }
        }
        
    }
}
