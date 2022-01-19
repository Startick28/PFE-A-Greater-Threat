/*  
    © by Daniel Wipf, 09 November 2020
    support: daniel@twigly.ch
    https://www.youtube.com/watch?v=4nC8WjPFnGU
*/
using UnityEngine;
[ExecuteInEditMode]
[AddComponentMenu("DE Shaders/Preview Manager")]
public class DE_PreviewManager : MonoBehaviour
{
    [HideInInspector] public Material[] materials;
    public void OnDestroy()
    {
        LoadDefaultShaders();
    }
    public void LoadDefaultShaders()
    {
        var r = GetComponent<MeshRenderer>();
        if (r)
            r.sharedMaterials = materials;
    }
}