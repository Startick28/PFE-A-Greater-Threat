using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ForestMusic : MonoBehaviour
{
    [SerializeField] private AudioSource audioSource;
    [SerializeField] private AudioClip clip;
    [SerializeField] private float maxVolume;
    [SerializeField] private float timeTransition;
    public static ForestMusic Instance;

    private void Awake()
    {
        Instance = this;
    }
    public AudioSource AudioSource
    {
        get { return AudioSource; }
        set { audioSource = value;
            audioSource.clip = clip;
            audioSource.spatialBlend = 0;
            audioSource.loop = true;
            audioSource.Play();
            StopCoroutine("StopForestMusic");
            StartCoroutine(LaunchForestMusic());
        }
    }
    // Start is called before the first frame update
    void Start()
    {
        if(audioSource)
            audioSource.volume = 0;
    }

    IEnumerator LaunchForestMusic()
    {
        float volume = audioSource.volume;
        for (float d = 0; d < timeTransition; d += Time.deltaTime)
        {
            
            audioSource.volume = Mathf.Lerp(volume, maxVolume,d/ timeTransition);
            yield return null;
        }
        audioSource.volume = maxVolume;
    }

    IEnumerator StopForestMusic()
    {
        float volume = audioSource.volume;
        for(float d = 0; d < timeTransition; d += Time.deltaTime)
        {
            audioSource.volume = Mathf.Lerp(volume, 0, d / timeTransition);
            yield return null;
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
                {
                    Debug.Log("Enter du collider");
                    audioSource = other.GetComponentInChildren<AudioSource>();
                    StopCoroutine("LaunchForestMusic");
                    StartCoroutine(StopForestMusic());
                }
                    
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
                    Debug.Log("Exit du collider");
                    audioSource = other.GetComponentInChildren<AudioSource>();
                    audioSource.clip = clip;
                    audioSource.spatialBlend = 0;
                    audioSource.loop = true;
                    audioSource.Play();
                    StopCoroutine("StopForestMusic");
                    StartCoroutine(LaunchForestMusic());
                }
            }
        }
        
    }
}
