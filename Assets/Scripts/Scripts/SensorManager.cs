 using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class SensorManager : MonoBehaviour
{
    [SerializeField] private List<SensorToolkit.BaseVolumeSensor> visionConeSensors;
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
    private GameObject _focusedPlayer;
    public GameObject FocusedPlayer { get {return _focusedPlayer;} private set{} }

    private GameObject lastSeenPlayer;
    
    void Update()
    {
        /*
            Updating playerDetectionTimer and playerForgetionTimer so that the entity takes a certain time
            to detect and forget a player.
        */
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
            if (entity.CompareTag("Player"))
            {
                lastSeenPlayer = entity;
                return true;
            } 
        }
        return false;
    }

    /*
        Sets the player to focus
    */
    public void FocusPlayer(GameObject player)
    {
        _focusedPlayer = player;
    }

    /*
        Returns true if the focused player has been seen by any sensor.
    */
    public bool CanSeeFocusedPlayer()
    {
        if (canSeePlayerLock) return false;
        List<GameObject> seenEntities = GetSeenEntites();
        foreach (GameObject entity in seenEntities)
        {
            if (entity == _focusedPlayer) 
            {
                lastSeenPlayer = entity;
                return true;
            } 
        }
        return false;
    }

    /*
        Returns true if anything has been heard by any sensor and the sound is still remembered.
    */
    public bool HeardSomething()
    {
        List<EmittedSound> heardSounds = GetHeardSounds();
        foreach (EmittedSound sound in heardSounds)
        {
            if (sound.type == SoundEmissionType.PlayerSound) 
            {
                if (!canHearPlayerLock) return true;
            }
            else return true;
        }
        return false;
    }

    /*
        Returns the loudest sound heard by the entity (or most recent if sounds have the same intensity)
    */
    public EmittedSound GetLoudestHeardSound()
    {
        List<EmittedSound> heardSounds = GetHeardSounds();
        EmittedSound loudest = heardSounds[0];
        heardSounds.RemoveAt(0);
        float intensityOfLoudest = loudest.intensity;
        float emissionTime = loudest.emissionTime;
        foreach (EmittedSound sound in heardSounds)
        {
            if (sound.intensity >= intensityOfLoudest)
            {
                if (sound.intensity == intensityOfLoudest)
                {
                    if (sound.emissionTime > loudest.emissionTime)
                    {
                        loudest = sound;
                        intensityOfLoudest = loudest.intensity;
                        emissionTime = loudest.emissionTime;
                    }
                }
                else
                {
                    loudest = sound;
                    intensityOfLoudest = loudest.intensity;
                    emissionTime = loudest.emissionTime;
                }
            }
        }
        return loudest;
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
        Returns the last player that has been seen by any sensor.
    */
    public GameObject GetLastSeenPlayer()
    {
        List<GameObject> seenEntities = GetSeenEntites();
        foreach (GameObject entity in seenEntities)
        {
            if (entity.CompareTag("Player")) return entity;
        }
        return lastSeenPlayer;
    }

    /*
        Returns a player that has been heard by any sensor.
    */
    public GameObject GetHeardPlayer()
    {
        List<EmittedSound> heardSounds = GetHeardSounds();
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

        foreach (SensorToolkit.BaseVolumeSensor visionSensor in visionConeSensors)
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
    public List<EmittedSound> GetHeardSounds()
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
        If the path to reach the sound is much longer than the distance from the sound
        it is ignored
    */
    public bool CanActuallyHear(EmittedSound sound)
    {
        NavMeshPath path = new NavMeshPath();
        if (NavMesh.CalculatePath(transform.position, sound.position, NavMesh.AllAreas, path) == false) return true;
        float pathLength = 0f;
        for ( int i = 1; i < path.corners.Length; ++i )
        {
            pathLength += Vector3.Distance( path.corners[i-1], path.corners[i] );
        }
        if (pathLength > Vector3.Distance(transform.position, sound.position) * 2.5f) return false; 
        return true;
    }
}
