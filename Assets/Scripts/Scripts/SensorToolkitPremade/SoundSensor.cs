using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

namespace SensorToolkit
{
    /*
     * A sensor that detects colliders within a specified range using Physics.OverlapSphere. Detects colliders or rigid
     * bodies on the chosen physics layers. Can be configured to pulse automatically at fixed intervals or manually. Has
     * optional support for line of sight testing.
     */
    [ExecuteInEditMode]
    public class SoundSensor : BaseVolumeSensor
    {
        // Should the sensor be pulsed automatically at fixed intervals or should it be pulsed manually.
        public enum UpdateMode { FixedInterval, Manual }

        [Tooltip("The radius in world units that the sensor detects colliders in.")]
        public float SensorRange = 10f;

        [Tooltip("The physics layer mask that the sensor detects colliders on.")]
        public LayerMask DetectsOnLayers;

        [Tooltip("Automatic or manually pulsing mode.")]
        public UpdateMode SensorUpdateMode;

        [Tooltip("If the chosen update mode is automatic then this is the interval in seconds between each automatic pulse.")]
        public float CheckInterval = 1f;

        [Tooltip("The initial size of the buffer used when calling Physics.OverlapSphereNoAlloc.")]
        public int InitialBufferSize = 20;

        [Tooltip("When set true the buffer used with Physics.OverlapSphereNoAlloc is expanded if its not sufficiently large.")]
        public bool DynamicallyIncreaseBufferSize = true;

        public int CurrentBufferSize { get; private set; }

        // Event that is called each time the sensor is pulsed. Used by the editor extensions, you shouldn't need to listen to it.
        public delegate void SensorUpdateHandler();
        public event SensorUpdateHandler OnSensorUpdate;

        // Pulses the sensor to update its list of detected objects
        public override void Pulse()
        {
            if (isActiveAndEnabled) testSensor();
            
        }

        HashSet<GameObject> previousDetectedObjects = new HashSet<GameObject>();
        Collider[] collidersBuffer;
        float timer = 0f;

        protected override void Awake() 
        {
            base.Awake();

            CurrentBufferSize = 0;
        }

        protected override void OnEnable()
        {
            base.OnEnable();
            previousDetectedObjects.Clear();
        }

        void Update() 
        {
            if (!Application.isPlaying) 
            {
                return;
            }

            if (SensorUpdateMode == UpdateMode.FixedInterval)
            {
                timer += Time.deltaTime;
                if (timer >= CheckInterval)
                {
                    testSensor();
                    timer = 0f;
                }
            }
            else
            {
                timer = 0f;
            }

            UpdateCurrentlyHeardSounds();
        }

        List<GameObject> newDetections = new List<GameObject>();
        void testSensor()
        {
            prepareCollidersBuffer();

            var numberDetected = Physics.OverlapSphereNonAlloc(transform.position, SensorRange, collidersBuffer, DetectsOnLayers);
            if (numberDetected == CurrentBufferSize)
            {
                if (DynamicallyIncreaseBufferSize) 
                {
                    CurrentBufferSize *= 2;
                    testSensor();
                    return;
                }
                else 
                {
                    logInsufficientBufferSize();
                }
            }

            clearColliders();
            newDetections.Clear();
            for (int i = 0; i < numberDetected; i++)
            {
                var newDetection = addCollider(collidersBuffer[i]);
                if (newDetection != null)
                {
                    if (previousDetectedObjects.Contains(newDetection))
                    {
                        previousDetectedObjects.Remove(newDetection);
                    }
                    else
                    {
                        newDetections.Add(newDetection);
                    }
                }
            }

            foreach (var newDetection in newDetections) 
            {
                OnDetected.Invoke(newDetection, this);

                SoundEmitter soundEmitter = newDetection.GetComponent<SoundEmitter>();
                if (soundEmitter == null) soundEmitter = newDetection.GetComponentInChildren<SoundEmitter>();
                if (soundEmitter == null) soundEmitter = newDetection.GetComponentInParent<SoundEmitter>();
                if (soundEmitter != null)
                {
                    soundEmitter.AddListener(this);
                }
            }

            // Any entries still in previousDetectedObjects are no longer detected
            var previousDetectedEnumerator = previousDetectedObjects.GetEnumerator();
            while (previousDetectedEnumerator.MoveNext())
            {
                var lostDetection = previousDetectedEnumerator.Current;
                OnLostDetection.Invoke(lostDetection, this);

                SoundEmitter soundEmitter = lostDetection.GetComponent<SoundEmitter>();
                if (soundEmitter == null) soundEmitter = lostDetection.GetComponentInChildren<SoundEmitter>();
                if (soundEmitter == null) soundEmitter = lostDetection.GetComponentInParent<SoundEmitter>();
                if (soundEmitter != null)
                {
                    // Unsubscribe the listener to the emitter;
                }
            }

            previousDetectedObjects.Clear();
            var detectedEnumerator = DetectedObjects.GetEnumerator();
            while (detectedEnumerator.MoveNext())
            {
                previousDetectedObjects.Add(detectedEnumerator.Current);
            }

            if (OnSensorUpdate != null) OnSensorUpdate();
        }

        void logInsufficientBufferSize()
        {
            Debug.LogWarning("A range sensor on " + name + " has an insufficient buffer size. Some objects may not be detected");
        }

        void prepareCollidersBuffer() 
        {
            if (CurrentBufferSize == 0)
            {
                InitialBufferSize = Math.Max(1, InitialBufferSize);
                CurrentBufferSize = InitialBufferSize;
            }
            if (collidersBuffer == null || collidersBuffer.Length != CurrentBufferSize)
            {
                collidersBuffer = new Collider[CurrentBufferSize];
            }
        }

        void reset()
        {
            clearColliders();
            CurrentBufferSize = 0;
        }

        public override void OnDrawGizmosSelected()
        {
            base.OnDrawGizmosSelected();

            if (!isActiveAndEnabled) return;
            Gizmos.color = GizmoColor;
            Gizmos.DrawWireSphere(transform.position, SensorRange);
        }


        /* List of the sounds currently heard by the sensor */
        List<EmittedSound> currentlyHeardSounds = new List<EmittedSound>(); 

        public void Notify(EmittedSound sound)
        {
            currentlyHeardSounds.Add(sound);
        }

        /*
            Keeps the list of currently heard sounds updated by removing the sounds 
            that have been heard longer ago than they lasted.
        */
        void UpdateCurrentlyHeardSounds()
        {   
            for (int i = currentlyHeardSounds.Count-1 ; i>=0 ; i--)
            {
                EmittedSound tmpSound = currentlyHeardSounds[i];
                if (Time.time - tmpSound.emissionTime > tmpSound.duration)
                {
                    currentlyHeardSounds.RemoveAt(i);
                }
            }
        }

        public List<EmittedSound> GetCurrentlyHeardSounds()
        {
            return currentlyHeardSounds;
        }

    }
}