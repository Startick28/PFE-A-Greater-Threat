using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum SoundEmissionType 
{
    RandomSound,
    PlayerSound,
    ProjectileSound
}

public class EmittedSound
{
    public Vector3 position;
    public SoundEmissionType type;
    public float emissionTime;
    public float duration; //Time during which the sound can be remembered

    public EmittedSound(Vector3 pos, SoundEmissionType typ, float time, float dur)
    {
        position = pos;
        type = typ;
        emissionTime = time;
        duration = dur;
    }
}

public class SoundEmitter : MonoBehaviour
{
    
    
    [SerializeField] private SoundEmissionType emissionType = SoundEmissionType.RandomSound;

    /* 
        Base intensity of emitted sounds (if an other intensity isn't specified)
        Currently, it represents the distance at which one can hear the emitted sound
    */
    [SerializeField] private float emissionIntensity = 10f;    
    [SerializeField] private float emissionDuration = 10f;    

    private List<SensorToolkit.SoundSensor> soundListeners = new List<SensorToolkit.SoundSensor>();

    /* Adds a Sound sensor to the list of sound listeners that may be able to hear an emitted sound */
    public void AddListener(SensorToolkit.SoundSensor listener)
    {
        soundListeners.Add(listener);
    }

    /* Removes a Sound sensor from the list of sound listeners that may be able to hear an emitted sound */
    public void RemoveListener(SensorToolkit.SoundSensor listener)
    {
        if (soundListeners.Contains(listener)) soundListeners.Remove(listener);
    }

    /*
        Notifies all currently subscribed SoundListeners in range of the SoundEmitter
        that they are hearing a sound by giving them the current location of the Emitter
        and the time needed to forget the sound .
    */
    public void Emit()
    {
        Emit(emissionIntensity, emissionDuration, emissionType);
    }

    /* Emits the sound with specific intensity, duration and type */
    public void Emit(float baseIntensity, float duration, SoundEmissionType emissionType)
    {
        Emit(baseIntensity, duration, emissionType, transform.position);
    }

    /* Emits the sound at a certain position instead of that of the SoundEmitter */
    public void Emit(float baseIntensity, float duration, SoundEmissionType emissionType, Vector3 position)
    {
        foreach (SensorToolkit.SoundSensor listener in soundListeners)
        {
            if (CanHearSound(baseIntensity, listener.transform.position, position))
            {
                listener.Notify(new EmittedSound(position, emissionType, Time.time, duration));
            }
        }
    }

    /*
        Returns true if the sound emitted at emissionPosition can be heard by the listener at listenerPosition
        Currently the sound can be heard if the intensity is bigger than the distance between the listener and 
        the emitter.
    */
    public bool CanHearSound(float baseIntensity, Vector3 listenerPosition, Vector3 emissionPosition)
    {
        float distance = Vector3.Distance(listenerPosition, emissionPosition);
        return (baseIntensity >= distance);
    }

    public void OnDrawGizmosSelected()
        {
            Gizmos.color = new Color(51 / 255f, 255 / 255f, 255 / 255f);
            Gizmos.DrawWireSphere(transform.position, emissionIntensity);
        }
}
