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

    IEnumerator LaunchForestMusic()
    {
        while(audioSource.volume < 0.5)
        {
            audioSource.volume += 0.1f;
            yield return new WaitForSeconds(.3f);
        }

    }

    IEnumerator StopForestMusic()
    {
        while (audioSource.volume > 0.1)
        {
            audioSource.volume -= 0.1f;
            yield return new WaitForSeconds(.3f);
        }
        audioSource.volume = 0;
        audioSource.Stop();
    }

    private void OnTriggerEnter(Collider other)
    {
        StartCoroutine(StopForestMusic());
    }

    private void OnTriggerExit(Collider other)
    {
        audioSource.clip = clip;
        audioSource.spatialBlend = 0;
        audioSource.Play();
        StartCoroutine(LaunchForestMusic());
    }
}
