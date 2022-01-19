#if UNITY_EDITOR
using UnityEngine;
using UnityEngine.Rendering;

[ExecuteInEditMode, AddComponentMenu("Alexander Elert/Æ - G.O Simplifiers")]
public class AE_GO_Simplifiers : MonoBehaviour
{
    #region [Properties]
    /// <summary>
    /// Transform List
    /// </summary>
    public Transform[] AEObjects;
    /// <summary>
    /// Modification Selector
    /// </summary>
    public int AEObjectsModType = 0;
    /// <summary>
    /// Modification Selector Content
    /// </summary>
    public readonly string[] AEObjectsModContent = new string[] { "Objects only", "Include Children" };
   
    /// <summary>
    /// Shadow Casting Mode
    /// </summary>
    public ShadowCastingMode shadowCastingMode = ShadowCastingMode.On;
    /// <summary>
    /// Receive Shadows toggle
    /// </summary>
    public bool receiveShadows = true;

    /// <summary>
    /// Script Version
    /// </summary>
    public string version => AlexanderElert.SchematicVersionControl.VERSION;
    /// <summary>
    /// Documentation Path
    /// </summary>
    public string documentationPath
    {
        get
        {
            return System.IO.Path.Combine("Assets", "DE Environment", "AE Alexander Elert", "AE Core", "AE_Core_Documentation.pdf");
        }
    }
    #endregion
    #region [Actions]
    /// <summary>
    /// Refresh Renderer Settings
    /// </summary>
    public void RefreshRendererSettings()
    {
        for(int i = 0; i < AEObjects.Length; i++)
        {
            if (!AEObjects[i])
                return;
            if (AEObjectsModType == 0)
            {
                var rend = AEObjects[i].GetComponent<Renderer>();
                if (!rend)
                    return;
                rend.shadowCastingMode = shadowCastingMode;
                rend.receiveShadows = receiveShadows;
            }
            else {
                var rend = AEObjects[i].GetComponentsInChildren<Renderer>();
                if (rend == null)
                    return;
                for (int j = 0; j < rend.Length; j++)
                {
                    rend[j].shadowCastingMode = shadowCastingMode;
                    rend[j].receiveShadows = receiveShadows;
                }
            }
        }
    }
    
    /// <summary>
    /// Remove any Collider Component
    /// </summary>
    public void RemoveColliders()
    {

        for (int i = 0; i < AEObjects.Length; i++)
        {
            if (!AEObjects[i])
                return;
            if (AEObjectsModType == 0)
            {
                var collider = AEObjects[i].GetComponent<Collider>();
                if (!collider)
                    return;
                DestroyImmediate(collider);
            }
            else
            {
                var collider = AEObjects[i].GetComponentsInChildren<Collider>();
                if (collider == null)
                    return;
                for (int j = collider.Length - 1; j >= 0; j--)
                    DestroyImmediate(collider[j]);
            }
        }
    }
    /// <summary>
    /// Remove Rigidbody Component
    /// </summary>
    public void RemoveRigidbody()
    {
        for (int i = 0; i < AEObjects.Length; i++)
        {
            if (!AEObjects[i])
                return;
            if (AEObjectsModType == 0)
            {
                var rb = AEObjects[i].GetComponent<Rigidbody>();
                if (!rb)
                    return;
                DestroyImmediate(rb);
            }
            else
            {
                var rb = AEObjects[i].GetComponentsInChildren<Rigidbody>();
                if (rb == null)
                    return;
                for (int j = rb.Length - 1; j >= 0; j--)
                    DestroyImmediate(rb[j]);
            }
        }
    }
    /// <summary>
    /// Remove Cloth Component
    /// </summary>
    public void RemoveCloth()
    {
        for (int i = 0; i < AEObjects.Length; i++)
        {
            if (!AEObjects[i])
                return;
            if (AEObjectsModType == 0)
            {
                var cloth = AEObjects[i].GetComponent<Cloth>();
                if (!cloth)
                    return;
                DestroyImmediate(cloth);
            }
            else
            {
                var cloth = AEObjects[i].GetComponentsInChildren<Cloth>();
                if (cloth == null)
                    return;
                for (int j = cloth.Length - 1; j >= 0; j--)
                    DestroyImmediate(cloth[j]);
            }
        }
    }
    /// <summary>
    /// Reset Component
    /// </summary>
    public void Reset()
    {
        AEObjects = new Transform[0];
        AEObjectsModType = 0;

        shadowCastingMode = ShadowCastingMode.On;
        receiveShadows = true;
    }
    [UnityEditor.MenuItem("GameObject/3D Object/Alexander Elert/Æ - G.O Simplifiers")]
    public static void CreateAEGOObject()
    {
        new GameObject("Æ - G.O Simplifiers").AddComponent<AE_GO_Simplifiers>();
    }
    #endregion
}
#endif
