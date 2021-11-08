using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.Linq;

namespace SensorToolkit
{
    [CustomEditor(typeof(SoundSensor))]
    [CanEditMultipleObjects]
    public class SoundSensorEditor : Editor
    {
        SerializedProperty detectionRange;
        SerializedProperty ignoreList;
        SerializedProperty tagFilterEnabled;
        SerializedProperty tagFilter;
        SerializedProperty detectsOnLayers;
        SerializedProperty sensorUpdateMode;
        SerializedProperty checkInterval;
        SerializedProperty detectionMode;
        SerializedProperty requiresLineOfSight;
        SerializedProperty blocksLineOfSight;
        SerializedProperty testLOSTargetsOnly;
        SerializedProperty numberOfRays;
        SerializedProperty minimumVisibility;
        SerializedProperty initialBufferSize;
        SerializedProperty dynamicallyIncreaseBufferSize;
        SerializedProperty onDetected;
        SerializedProperty onLostDetection;

        SoundSensor soundSensor;
        bool isTesting = false;
        bool showEvents = false;

        void OnEnable()
        {
            if (serializedObject == null) return;

            soundSensor = serializedObject.targetObject as SoundSensor;
            detectionRange = serializedObject.FindProperty("SensorRange");
            ignoreList = serializedObject.FindProperty("IgnoreList");
            tagFilterEnabled = serializedObject.FindProperty("EnableTagFilter");
            tagFilter = serializedObject.FindProperty("AllowedTags");
            detectsOnLayers = serializedObject.FindProperty("DetectsOnLayers");
            sensorUpdateMode = serializedObject.FindProperty("SensorUpdateMode");
            checkInterval = serializedObject.FindProperty("CheckInterval");
            detectionMode = serializedObject.FindProperty("DetectionMode");
            requiresLineOfSight = serializedObject.FindProperty("RequiresLineOfSight");
            blocksLineOfSight = serializedObject.FindProperty("BlocksLineOfSight");
            testLOSTargetsOnly = serializedObject.FindProperty("TestLOSTargetsOnly");
            numberOfRays = serializedObject.FindProperty("NumberOfRays");
            minimumVisibility = serializedObject.FindProperty("MinimumVisibility");
            initialBufferSize = serializedObject.FindProperty("InitialBufferSize");
            dynamicallyIncreaseBufferSize = serializedObject.FindProperty("DynamicallyIncreaseBufferSize");
            onDetected = serializedObject.FindProperty("OnDetected");
            onLostDetection = serializedObject.FindProperty("OnLostDetection");
            soundSensor.OnSensorUpdate += onSensorUpdate;

            soundSensor.ShowRayCastDebug = new HashSet<GameObject>();
        }

        void OnDisable()
        {
            stopTesting();
            soundSensor.OnSensorUpdate -= onSensorUpdate;
            soundSensor.ShowRayCastDebug = null;
        }

        public override void OnInspectorGUI()
        {
            if (soundSensor.transform.hasChanged)
            {
                stopTesting();
                soundSensor.transform.hasChanged = false;
            }

            serializedObject.Update();
            EditorGUI.BeginChangeCheck();
            EditorGUILayout.PropertyField(detectionRange);

            EditorGUILayout.Space();

            EditorGUILayout.PropertyField(ignoreList, true);
            tagFilterEditor();
            EditorGUILayout.PropertyField(detectsOnLayers);
            EditorGUILayout.PropertyField(detectionMode);
            EditorGUILayout.PropertyField(sensorUpdateMode);
            if ((SoundSensor.UpdateMode)sensorUpdateMode.enumValueIndex == SoundSensor.UpdateMode.FixedInterval)
            {
                EditorGUILayout.PropertyField(checkInterval);
            }

            EditorGUILayout.Space();

            EditorGUILayout.PropertyField(requiresLineOfSight);
            if (requiresLineOfSight.boolValue)
            {
                EditorGUILayout.PropertyField(blocksLineOfSight);
                EditorGUILayout.PropertyField(testLOSTargetsOnly);
                if (!testLOSTargetsOnly.boolValue)
                {
                    EditorGUILayout.PropertyField(numberOfRays);
                }
                EditorGUILayout.PropertyField(minimumVisibility);
            }

            EditorGUILayout.Space();

            if (showEvents = EditorGUILayout.Foldout(showEvents, "Events")) {
                EditorGUILayout.PropertyField(onDetected);
                EditorGUILayout.PropertyField(onLostDetection);
            }

            EditorGUILayout.Space();

            EditorGUILayout.PropertyField(initialBufferSize);
            EditorGUILayout.PropertyField(dynamicallyIncreaseBufferSize);
            if (soundSensor.CurrentBufferSize != 0 && soundSensor.CurrentBufferSize != soundSensor.InitialBufferSize) {
                EditorGUILayout.HelpBox("Buffer size expanded to: " + soundSensor.CurrentBufferSize, MessageType.Info);
            }

            if (EditorGUI.EndChangeCheck()) {
                stopTesting();
            }

            EditorGUILayout.Space();

            if (!isTesting && !Application.isPlaying)
            {
                if (GUILayout.Button("Test", GUILayout.Width(100)))
                {
                    startTesting();
                }
            }

            if (EditorApplication.isPlaying || EditorApplication.isPaused || isTesting)
            {
                if (soundSensor.RequiresLineOfSight)
                    displayDetectedObjectsRaycast();
                else
                    displayDetectedObjects();
            }

            serializedObject.ApplyModifiedProperties();
        }

        void tagFilterEditor()
        {
            EditorGUILayout.PropertyField(tagFilterEnabled);
            if (tagFilterEnabled.boolValue)
            {
                EditorGUILayout.PropertyField(tagFilter, true);
            }
        }

        void displayDetectedObjects()
        {
            EditorGUILayout.Space();
            EditorGUILayout.LabelField("*** Objects Detected ***");
            foreach (GameObject go in soundSensor.DetectedObjects)
            {
                EditorGUILayout.ObjectField(go, typeof(GameObject), true);
            }
        }

        void displayDetectedObjectsRaycast()
        {
            var detected = soundSensor.DetectedObjects;
            var undetected = soundSensor.ObjectVisibilities.Keys.Where(go => !detected.Contains(go)).ToList();

            EditorGUILayout.Space();
            EditorGUILayout.LabelField("*** Objects Detected ***");
            foreach (GameObject go in detected)
            {
                EditorGUILayout.BeginHorizontal();
                var debug = soundSensor.ShowRayCastDebug.Contains(go);
                if (debug = EditorGUILayout.Toggle(debug))
                {
                    soundSensor.ShowRayCastDebug.Add(go);
                }
                else
                {
                    soundSensor.ShowRayCastDebug.Remove(go);
                }
                EditorGUILayout.PrefixLabel(string.Format("{0:P}", soundSensor.GetVisibility(go)));
                EditorGUILayout.ObjectField(go, typeof(GameObject), true);
                EditorGUILayout.EndHorizontal();
            }

            EditorGUILayout.Space();
            GUIStyle redText = new GUIStyle(EditorStyles.label);
            redText.normal.textColor = Color.red;
            EditorGUILayout.LabelField("*** Not Detected ***", redText);
            foreach (GameObject go in undetected)
            {
                EditorGUILayout.BeginHorizontal();
                var debug = soundSensor.ShowRayCastDebug.Contains(go);
                if (debug = EditorGUILayout.Toggle(debug))
                {
                    soundSensor.ShowRayCastDebug.Add(go);
                }
                else
                {
                    soundSensor.ShowRayCastDebug.Remove(go);
                }
                EditorGUILayout.PrefixLabel(string.Format("{0:P}", soundSensor.GetVisibility(go)), redText);
                EditorGUILayout.ObjectField(go, typeof(GameObject), true);
                EditorGUILayout.EndHorizontal();
            }

            if (EditorApplication.isPaused || isTesting)
            {
                SceneView.RepaintAll();
            }
        }

        void onSensorUpdate()
        {
            Repaint();
        }

        void startTesting()
        {
            if (isTesting || Application.isPlaying || soundSensor == null) return;

            isTesting = true;
            soundSensor.SendMessage("testSensor");
            SceneView.RepaintAll();
        }

        void stopTesting()
        {
            if (!isTesting || Application.isPlaying || soundSensor == null) return;

            isTesting = false;
            soundSensor.SendMessage("reset");
            SceneView.RepaintAll();
        }
    }
}