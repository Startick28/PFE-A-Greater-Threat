using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SensorManager : MonoBehaviour
{
    [SerializeField] private List<SensorToolkit.TriggerSensor> visionConeSensors;
    [SerializeField] private List<SensorToolkit.SoundSensor> soundSensors;

    private bool canSeePlayerLock = false; // If true, the player cannot be seen
    private bool canHearPlayerLock = false; // If true, the player cannot be heard

    /*
        Returns true if the player has been seen by any sensor.
    */
    public bool CanSeePlayer()
    {
        if (canSeePlayerLock) return false;
        List<GameObject> seenEntities = GetSeenEntites();
        foreach (GameObject entity in seenEntities)
        {
            if (entity.CompareTag("Player")) return true;
        }
        return false;
    }

    /*
        Returns true if the player has been heard by any sensor and the sound is still remembered.
    */
    public bool HeardPlayer()
    {
        if (canHearPlayerLock) return false;
        List<EmittedSound> heardSounds = GetHeardEntites();
        foreach (EmittedSound sound in heardSounds)
        {
            if (sound.type == SoundEmissionType.PlayerSound) return true;
        }
        return false;
    }

    /*
        Return the list of all gameObjects that can be seen by the different vision sensors
    */
    public List<GameObject> GetSeenEntites()
    {
        List<GameObject> seenEntities = new List<GameObject>();

        foreach (SensorToolkit.TriggerSensor visionSensor in visionConeSensors)
        {
            foreach (GameObject entity in visionSensor.GetDetected())
            {
                if (CanActuallySee(entity))
                {
                    seenEntities.Add(entity);
                }
            }
        }

        return seenEntities;
    }

    /*
        Final test to evaluate if we actually want to count the seen entity as is.
    */
    public bool CanActuallySee(GameObject entity)
    {
        return true;
    }


    /*
        Return the list of all sounds that can be heard by the different vision sensors
    */
    public List<EmittedSound> GetHeardEntites()
    {
        List<EmittedSound> heardSounds = new List<EmittedSound>();

        foreach (SensorToolkit.SoundSensor soundSensor in soundSensors)
        {
            foreach (EmittedSound sound in soundSensor.GetCurrentlyHeardSounds())
            {
                if (CanActuallyHear(sound))
                {
                    heardSounds.Add(sound);
                }
            }
        }

        return heardSounds;
    }

    /*
        Final test to evaluate if we actually want to count the heard sound as is.
    */
    public bool CanActuallyHear(EmittedSound sound)
    {
        return true;
    }
}
