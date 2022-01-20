using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioManager : MonoBehaviour
{

    private AudioSource source;
    [SerializeField] private GameObject AudioPrefab;

    [SerializeField] private List<AudioClip> listAudios;

    [SerializeField] private float volumeChangeMultiplier = 0.2f;
    [SerializeField] private float pitchChangeMultiplier = 0.2f;

    [SerializeField] private float randomRangeX = 100f;
    [SerializeField] private float randomRangeY = 3f;
    [SerializeField] private float randomRangeZ = 100f;

    [SerializeField] private float timeToPlay = 200f;
    private float timeRemaining = 0f;
    // Start is called before the first frame update

    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        if (timeRemaining < timeToPlay)
        {
            timeRemaining += Time.deltaTime;
        }
        else
        {
            StartCoroutine(PlayRandomSound());
            timeRemaining = 0f;
        }
    }

    IEnumerator PlayRandomSound()
    {
        Vector3 randomPos = new Vector3(Random.Range(-randomRangeX, randomRangeX), Random.Range(-randomRangeY, randomRangeY), Random.Range(-randomRangeZ, randomRangeZ));
        GameObject tempObject = Instantiate(AudioPrefab, transform.position + randomPos, Quaternion.identity);
        AudioSource source = tempObject.GetComponent<AudioSource>();
        source.clip = listAudios[Random.Range(0, listAudios.Count - 1)];
        source.volume = Random.Range(1 - volumeChangeMultiplier, 1);
        source.pitch = Random.Range(1 - pitchChangeMultiplier, 1 + pitchChangeMultiplier);
        source.Play();
        Debug.Log("Je joue un son : "+source.clip.length);
        yield return new WaitForSeconds(source.clip.length * 4);
        source.Stop();
        Destroy(tempObject);

    }

    IEnumerator PlaySpecificSound(AudioClip audio)
    {
        Vector3 randomPos = new Vector3(Random.Range(-randomRangeX, randomRangeX), Random.Range(-randomRangeY, randomRangeY), Random.Range(-randomRangeZ, randomRangeZ));
        GameObject tempObject = Instantiate(AudioPrefab, transform.position + randomPos, Quaternion.identity);
        AudioSource source = tempObject.GetComponent<AudioSource>();
        source.clip = audio;
        source.volume = Random.Range(1 - volumeChangeMultiplier, 1);
        source.pitch = Random.Range(1 - pitchChangeMultiplier, 1 + pitchChangeMultiplier);
        source.Play();
        yield return new WaitForSeconds(source.clip.length * 4);
        source.Stop();
        Destroy(tempObject);
    }
}
