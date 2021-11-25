 using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SensorManager : MonoBehaviour
{
    [SerializeField] private List<SensorToolkit.TriggerSensor> visionConeSensors;
    [SerializeField] private List<SensorToolkit.SoundSensor> soundSensors;
    [SerializeField] private SensorToolkit.RangeSensor presenceSensor;
    [SerializeField] private float timeToDetectPlayer = 1f;
    [SerializeField] private float timeToForgetPlayer = 1f;

    private bool canSeePlayerLock = false; // If true, the player cannot be seen
    private bool canHearPlayerLock = false; // If true, the player cannot be heard
    private float playerDetectionTimer = 0f;
    private float playerForgetionTimer = 0f;
    private float playerDetectionDecreaseFactor = 2f; // To not reset the instant the player is not seen 

    private bool _playerDetected = false;
    public bool PlayerDetected { get {return _playerDetected;} private set{} }
    
    void Update()
    {
        if (CanSeePlayer()) // Refactoring : Use events to update "canSeePlayer" instead of calling the function every frame
        {
            if (!_playerDetected)
            {
                if (playerDetectionTimer < timeToDetectPlayer) playerDetectionTimer += Time.deltaTime;
                else _playerDetected = true;
            }
            playerForgetionTimer = 0f;
        }
        else
        {
            if (_playerDetected)
            {
                if (playerForgetionTimer < timeToForgetPlayer) playerForgetionTimer += Time.deltaTime;
                else _playerDetected = false;
            }
            if (playerDetectionTimer > 0) playerDetectionTimer -= Time.deltaTime * playerDetectionDecreaseFactor;
        } 
    }

    /*
        Returns true if a player has been seen by any sensor.
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
        Returns true if a player has been heard by any sensor and the sound is still remembered.
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
        Returns true if there is a player in range of the presence sensor and false otherwise
    */
    public bool IsPlayerPresent()
    {
        return (presenceSensor.DetectedObjects.Count > 0);
    }

    /*
        Returns the nearest player in the range of the presence sensor
    */
    public GameObject GetNearestPresentPlayer()
    {
        return presenceSensor.GetNearest();
    }


    /*
        Returns a player that has been seen by any sensor.
    */
    public GameObject GetSeenPlayer()
    {
        List<GameObject> seenEntities = GetSeenEntites();
        foreach (GameObject entity in seenEntities)
        {
            if (entity.CompareTag("Player")) return entity;
        }
        return null;
    }


    /*
        Returns a player that has been heard by any sensor.
    */
    public GameObject GetHeardPlayer()
    {
        List<EmittedSound> heardSounds = GetHeardEntites();
        foreach (EmittedSound sound in heardSounds)
        {
            if (sound.type == SoundEmissionType.PlayerSound) return sound.emitter.gameObject;
        }
        return null;
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
