/*  
    © by Daniel Wipf, 09 November 2020
    support: daniel@twigly.ch
    https://www.youtube.com/watch?v=4nC8WjPFnGU
*/

using UnityEngine;

#if UNITY_EDITOR

using UnityEditor;
using UnityEditor.Rendering;
using UnityEditor.SceneManagement;
using Object = UnityEngine.Object;
using Debug = UnityEngine.Debug;
using UnityEngine.Rendering;

using Unity.Collections;

using System;
using System.IO;
using System.Linq;
using System.Diagnostics;
using System.Collections.Generic;
using System.Threading.Tasks;

using DEShaders.Utils;
using DEShaders.Containers;

namespace DEShaders.Containers
{
    #region [Enums]
    public enum SubmeshOption { Surface, Cutout, Billboard };
    public enum MenuPathsRenderPipeline
    {
        Standard, HDRP, URP
    }
    #endregion
    #region [Classes]
    [Serializable]
    public class MeshSet
    {
        public Vector2 uv;
        public int triangles;
        public Vector3 vertices;
    }
    [Serializable]
    public class MenuPaths
    {
        public string name = "";
        public MenuPathsRenderPipeline renderPipeline;
        public List<string> packagePaths = new List<string>();
        public List<string> scenePaths2018 = new List<string>();
        public List<string> names2018 = new List<string>();
        public List<string> scenePaths2019 = new List<string>();
        public List<string> names2019 = new List<string>();
    }
    [Serializable]
    public class ManagerInfo
    {
        public bool enabled;
        public string tabName;
        public List<string> strings = new List<string>() { "" };
        public int Count => strings.Count;
        private Vector2 scrollbar = Vector2.zero;
        public void Remove(int i)
        {
            strings.RemoveAt(i);
        }
        public void Add()
        {
            strings.Add("");
        }
        public void OnGUI()
        {
            var gs = new GUIStyle(GUI.skin.label)
            {
                richText = true,
                alignment = TextAnchor.UpperLeft,
                fontSize = 11
            };
            scrollbar = EditorGUILayout.BeginScrollView(scrollbar);
            for (int i = 0; i < Count; i++)
            {
                EditorGUILayout.LabelField(strings[i], gs);
            }
            EditorGUILayout.EndScrollView();
        }
    }
    #endregion
}

namespace DEShaders.Lights
{
    public enum DE_RenderingPath { Deferred, DeferredLegacy, Forward }
    public enum DE_ColorSpace { Gamma, Linear }
    public static class DE_Lights
    {
        public static void UseColorTemperature(GUIStyle style = null) 
        {
            EditorGUI.BeginDisabledGroup(!DE_Lights.IsLinearIntensity());
            if (style == null)
                style = EditorStyles.label;
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(new GUIContent("Use Unity Color Temperature:", "Requires Linear Intensity"), style, GUILayout.Width(170));
            GUILayout.FlexibleSpace();
            EditorGUI.BeginChangeCheck();
            GraphicsSettings.lightsUseColorTemperature = EditorGUILayout.Toggle(GUIContent.none, GraphicsSettings.lightsUseColorTemperature);
            if (EditorGUI.EndChangeCheck())
            {
#if UNITY_2019_3_OR_NEWER
                if (GraphicsSettings.lightsUseColorTemperature) {
                    var lights = UnityEngine.Object.FindObjectsOfType<Light>();
                    for (int i = 0; i < lights.Length; i++)
                        lights[i].useColorTemperature = true;
                }
#endif
            }
            GUILayout.Space(3);
            EditorGUILayout.EndHorizontal();
            EditorGUI.EndDisabledGroup();
        }
        public static void UseLinearIntensity(GUIStyle style = null)
        {
            if (style == null)
                style = EditorStyles.label;
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(new GUIContent("Use Unity Linear Intensity:"), style, GUILayout.Width(170));
            GUILayout.FlexibleSpace();
            GraphicsSettings.lightsUseLinearIntensity = EditorGUILayout.Toggle(GUIContent.none, GraphicsSettings.lightsUseLinearIntensity);
            GUILayout.Space(3);
            EditorGUILayout.EndHorizontal();
        }
        public static bool IsLinearIntensity()
        {
            return GraphicsSettings.lightsUseLinearIntensity;
        }
        public static void BakeLight(int popupWidth = 0, GUIStyle style = null, GUIStyle buttonStyle = null)
        {
            if (style == null)
                style = EditorStyles.label;
            if (buttonStyle == null)
                buttonStyle = new GUIStyle(GUI.skin.button);
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Bake Lighting:", style, GUILayout.Width(170));
            GUILayout.FlexibleSpace();
            if (popupWidth == 0)
            {
                if (GUILayout.Button(new GUIContent("Open", "Open Lighting Window"), buttonStyle))
                {
                    var window = "LightingWindow".GetEditorWindowType();
                    if (window != null)
                        EditorWindow.GetWindow(window);
                }
            }
            else
            {
                if (GUILayout.Button(new GUIContent("Open", "Open Lighting Window"), buttonStyle, GUILayout.Width(popupWidth)))
                {
                    var window = "LightingWindow".GetEditorWindowType();
                    if (window != null)
                        EditorWindow.GetWindow(window);
                }
            }
            GUILayout.Space(3);
            EditorGUILayout.EndHorizontal();
        }
        public static void SetRenderPath(this ref DE_RenderingPath renderingPath, int popupWidth)
        {
            EditorGUILayout.BeginHorizontal( );
            EditorGUILayout.LabelField("Rendering Path:", GUILayout.Width(170));
            GUILayout.FlexibleSpace();
            EditorGUI.BeginChangeCheck();
            renderingPath = (DE_RenderingPath)EditorGUILayout.EnumPopup(renderingPath, GUILayout.Width(popupWidth));
            if (EditorGUI.EndChangeCheck())
                renderingPath.SetRenderingPath();
            EditorGUILayout.EndHorizontal();
        }
        public static void SetColorSpace(this ref DE_ColorSpace colorSpace, int popupWidth)
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Color Space:", GUILayout.Width(170));
            GUILayout.FlexibleSpace();
            EditorGUI.BeginChangeCheck();
            colorSpace = (DE_ColorSpace)EditorGUILayout.EnumPopup(colorSpace, GUILayout.Width(popupWidth));

            if (EditorGUI.EndChangeCheck())
                colorSpace.SetColorSpace();
            EditorGUILayout.EndHorizontal();

        }
        public static void SetColorSpace(this DE_ColorSpace colorSpace)
        {
            switch (colorSpace)
            {
                case DE_ColorSpace.Gamma:
                    PlayerSettings.colorSpace = ColorSpace.Gamma;
                    break;
                case DE_ColorSpace.Linear:
                    PlayerSettings.colorSpace = ColorSpace.Linear;
                    break;
            }
        }
        public static void SetRenderingPath(this DE_RenderingPath renderingPath)
        {
            List<GraphicsTier> tiers = new List<GraphicsTier>() { GraphicsTier.Tier1, GraphicsTier.Tier2, GraphicsTier.Tier3 };
            var currentBuildTargetGroup = BuildPipeline.GetBuildTargetGroup(EditorUserBuildSettings.activeBuildTarget);
            for (int i = 0; i < tiers.Count; i++)
            {
                var tiersettings = EditorGraphicsSettings.GetTierSettings(currentBuildTargetGroup, tiers[i]);
                switch (renderingPath)
                {
                    case DE_RenderingPath.Deferred:
                        tiersettings.renderingPath = RenderingPath.DeferredShading;
                        break;
                    case DE_RenderingPath.DeferredLegacy:
                        tiersettings.renderingPath = RenderingPath.DeferredLighting;
                        break;
                    case DE_RenderingPath.Forward:
                        tiersettings.renderingPath = RenderingPath.Forward;
                        break;
                }
                EditorGraphicsSettings.SetTierSettings(currentBuildTargetGroup, tiers[i], tiersettings);
            }
        }
        public static DE_RenderingPath GetRenderingPath()
        {
            DE_RenderingPath renderingPath = new DE_RenderingPath();
            List<GraphicsTier> tiers = new List<GraphicsTier>() { GraphicsTier.Tier1, GraphicsTier.Tier2, GraphicsTier.Tier3 };
            var currentBuildTargetGroup = BuildPipeline.GetBuildTargetGroup(EditorUserBuildSettings.activeBuildTarget);
            for (int i = 0; i < tiers.Count; i++)
            {
                var tiersettings = EditorGraphicsSettings.GetTierSettings(currentBuildTargetGroup, tiers[i]);
                switch (tiersettings.renderingPath)
                {
                    case RenderingPath.DeferredShading:
                        return DE_RenderingPath.Deferred;

                    case RenderingPath.DeferredLighting:
                        return DE_RenderingPath.DeferredLegacy;

                    case RenderingPath.Forward:
                        return DE_RenderingPath.Forward;
                }
            }
            return renderingPath;
        }
        public static DE_ColorSpace GetColorSpace()
        {
            DE_ColorSpace colorSpace = new DE_ColorSpace();
            switch (PlayerSettings.colorSpace)
            {
                case ColorSpace.Gamma:
                    return DE_ColorSpace.Gamma;

                case ColorSpace.Linear:
                    return DE_ColorSpace.Linear;
            }
            return colorSpace;
        }
        public static void SetAPICompabilityLevel()
        {
            var currentBuildTargetGroup = BuildPipeline.GetBuildTargetGroup(EditorUserBuildSettings.activeBuildTarget);
            PlayerSettings.SetApiCompatibilityLevel(currentBuildTargetGroup, ApiCompatibilityLevel.NET_4_6);
        }
        public static ApiCompatibilityLevel GetApiCompatibilityLevel()
        {
            var currentBuildTargetGroup = BuildPipeline.GetBuildTargetGroup(EditorUserBuildSettings.activeBuildTarget);
            return PlayerSettings.GetApiCompatibilityLevel(currentBuildTargetGroup);
        }
    }
}

namespace DEShaders.Utils
{
    #region [DE MeshUtils]
    public static class DE_MeshUtils
    {
        #region [Mesh Connections]
        public class MeshConnection
        {
            public List<int> triangles;
        }
        public static MeshConnection[] GetConnections(Mesh mesh)
        {
            var vert = mesh.vertices;
            var tris = mesh.triangles;
            int c = 0;
            List<MeshConnection> connections = new List<MeshConnection>();
            connections.Add(new MeshConnection());
            connections[c].triangles = new List<int>();
            connections[c].triangles.AddRange(new List<int>() { tris[0], tris[1], tris[2] });
            for (int i = 3; i < tris.Length; i += 3)
            {
                var temp = new List<int>() { tris[i], tris[i + 1], tris[i + 2] };
                if (IsConnected(temp, connections[c].triangles))
                {
                    connections[c].triangles.AddRange(temp);
                }
                else
                {
                    c++;
                    connections.Add(new MeshConnection());
                    connections[c].triangles = new List<int>();
                    connections[c].triangles.AddRange(temp);
                }
            }
            return connections.ToArray();
        }
        private static bool IsConnected(List<int> faceA, List<int> faceB)
        {
            for (int i = 0; i < faceA.Count; i++)
                for (int j = 0; j < faceB.Count; j++)
                    if (faceA[i] == faceB[j])
                        return true;
            return false;
        }
        #endregion
        #region [Submesh]
        public static SubmeshOption[] RecalculateSubmeshOption(GameObject obj, SubmeshOption[] submeshOptions)
        {
            if (obj != null)
            {
                var filters = obj.GetComponentsInChildren<MeshFilter>();
                var temp = new List<SubmeshOption>();
                for (int c = 0; c < filters.Length; c++)
                {
                    var f = filters[c];
                    var submeshCount = f.sharedMesh.subMeshCount;

                    for (int i = 0; i < submeshCount; i++)
                    {


                        if (c == filters.Length - 1 && submeshCount == 1)
                            temp.Add(SubmeshOption.Billboard);
                        else
                        {
                            if (i == 0)
                                temp.Add(SubmeshOption.Surface);
                            if (i > 0)
                                temp.Add(SubmeshOption.Cutout);
                        }
                    }
                }
                return temp.ToArray();
            }
            return new SubmeshOption[0];
        }

        public static Mesh GetSubmesh(Mesh aMesh, int aSubMeshIndex)
        {
            if (aSubMeshIndex < 0 || aSubMeshIndex >= aMesh.subMeshCount)
                return null;
            int[] indices = aMesh.GetTriangles(aSubMeshIndex);
            Submesh source = new Submesh(aMesh);
            Submesh dest = new Submesh();
            Dictionary<int, int> map = new Dictionary<int, int>();
            int[] newIndices = new int[indices.Length];
            for (int i = 0; i < indices.Length; i++)
            {
                int o = indices[i];
                int n;
                if (!map.TryGetValue(o, out n))
                {
                    n = dest.Add(source, o);
                    map.Add(o, n);
                }
                newIndices[i] = n;
            }
            Mesh m = new Mesh();
            dest.AssignTo(m);
            m.triangles = newIndices;
            return m;
        }
        private class Submesh
        {
            List<Vector3> verts = null;
            List<Vector2> uv1 = null;
            List<Vector2> uv2 = null;
            List<Vector2> uv3 = null;
            List<Vector2> uv4 = null;
            List<Vector3> normals = null;
            List<Vector4> tangents = null;
            List<Color32> colors = null;
            List<BoneWeight> boneWeights = null;
            public Submesh()
            {
                verts = new List<Vector3>();
            }
            public Submesh(Mesh aMesh)
            {
                verts = CreateList(aMesh.vertices);
                uv1 = CreateList(aMesh.uv);
                uv2 = CreateList(aMesh.uv2);
                uv3 = CreateList(aMesh.uv3);
                uv4 = CreateList(aMesh.uv4);
                normals = CreateList(aMesh.normals);
                tangents = CreateList(aMesh.tangents);
                colors = CreateList(aMesh.colors32);
                boneWeights = CreateList(aMesh.boneWeights);
            }
            private static List<T> CreateList<T>(T[] aSource)
            {
                if (aSource == null || aSource.Length == 0)
                    return null;
                return new List<T>(aSource);
            }
            private void Copy<T>(ref List<T> aDest, List<T> aSource, int aIndex)
            {
                if (aSource == null)
                    return;
                if (aDest == null)
                    aDest = new List<T>();
                aDest.Add(aSource[aIndex]);
            }
            public int Add(Submesh aOther, int aIndex)
            {
                int i = verts.Count;
                Copy(ref verts, aOther.verts, aIndex);
                Copy(ref uv1, aOther.uv1, aIndex);
                Copy(ref uv2, aOther.uv2, aIndex);
                Copy(ref uv3, aOther.uv3, aIndex);
                Copy(ref uv4, aOther.uv4, aIndex);
                Copy(ref normals, aOther.normals, aIndex);
                Copy(ref tangents, aOther.tangents, aIndex);
                Copy(ref colors, aOther.colors, aIndex);
                Copy(ref boneWeights, aOther.boneWeights, aIndex);
                return i;
            }
            public void AssignTo(Mesh aTarget)
            {
                if (verts.Count > 65535)
                    aTarget.indexFormat = UnityEngine.Rendering.IndexFormat.UInt32;
                aTarget.SetVertices(verts);
                if (uv1 != null) aTarget.SetUVs(0, uv1);
                if (uv2 != null) aTarget.SetUVs(1, uv2);
                if (uv3 != null) aTarget.SetUVs(2, uv3);
                if (uv4 != null) aTarget.SetUVs(3, uv4);
                if (normals != null) aTarget.SetNormals(normals);
                if (tangents != null) aTarget.SetTangents(tangents);
                if (colors != null) aTarget.SetColors(colors);
                if (boneWeights != null) aTarget.boneWeights = boneWeights.ToArray();
            }
        }

        #endregion
        #region [Tangengt Recalculation]
        public static void RecalculateTangents(GameObject[] obj)
        {
            foreach (var m in obj)
            {
                if (m == null)
                    return;
                var filters = m.GetComponentsInChildren<MeshFilter>();
                for (int i = 0; i < filters.Length; i++)
                {
                    var mesh = filters[i].sharedMesh;
                    mesh.DE_RecalculateTangents();

                    EditorUtility.DisplayProgressBar(
                        "Recalculate Tangents",
                        filters[i].gameObject.name + " " + (int)Mathf.Lerp(0, 100, (float)i / (float)filters.Length) + "%",
                        (float)i / (float)filters.Length
                    );

                }

            }
            EditorUtility.ClearProgressBar();
        }
        private static void DE_RecalculateTangents(this Mesh mesh)
        {

            int vertexCount = mesh.vertexCount;
            Vector3[] vertices = mesh.vertices;
            Vector3[] normals = mesh.normals;
            Vector2[] texcoords = mesh.uv;
            int[] triangles = mesh.triangles;
            int triangleCount = triangles.Length / 3;

            Vector4[] tangents = new Vector4[vertexCount];
            Vector3[] tan1 = new Vector3[vertexCount];
            Vector3[] tan2 = new Vector3[vertexCount];

            int tri = 0;

            for (int i = 0; i < (triangleCount); i++)
            {

                int i1 = triangles[tri];
                int i2 = triangles[tri + 1];
                int i3 = triangles[tri + 2];

                Vector3 v1 = vertices[i1];
                Vector3 v2 = vertices[i2];
                Vector3 v3 = vertices[i3];

                Vector2 w1 = texcoords[i1];
                Vector2 w2 = texcoords[i2];
                Vector2 w3 = texcoords[i3];

                float x1 = v2.x - v1.x;
                float x2 = v3.x - v1.x;
                float y1 = v2.y - v1.y;
                float y2 = v3.y - v1.y;
                float z1 = v2.z - v1.z;
                float z2 = v3.z - v1.z;

                float s1 = w2.x - w1.x;
                float s2 = w3.x - w1.x;
                float t1 = w2.y - w1.y;
                float t2 = w3.y - w1.y;

                float r = 1.0f / (s1 * t2 - s2 * t1);
                Vector3 sdir = new Vector3((t2 * x1 - t1 * x2) * r, (t2 * y1 - t1 * y2) * r, (t2 * z1 - t1 * z2) * r);
                Vector3 tdir = new Vector3((s1 * x2 - s2 * x1) * r, (s1 * y2 - s2 * y1) * r, (s1 * z2 - s2 * z1) * r);

                tan1[i1] += sdir;
                tan1[i2] += sdir;
                tan1[i3] += sdir;

                tan2[i1] += tdir;
                tan2[i2] += tdir;
                tan2[i3] += tdir;

                tri += 3;

            }



            for (int i = 0; i < (vertexCount); i++)
            {

                Vector3 n = normals[i];
                Vector3 t = tan1[i];

                // Gram-Schmidt orthogonalize
                Vector3.OrthoNormalize(ref n, ref t);

                tangents[i].x = t.x;
                tangents[i].y = t.y;
                tangents[i].z = t.z;

                // Calculate handedness
                tangents[i].w = (Vector3.Dot(Vector3.Cross(n, t), tan2[i]) < 0.0f) ? -1.0f : 1.0f;

            }
            mesh.tangents = tangents;
        }
        #endregion
        #region [Normal Recalculation]
        public static void RecalculateNormals(GameObject[] obj, float smoothingAngle)
        {
            foreach (var m in obj)
            {
                if (m == null)
                    return;
                var filters = m.GetComponentsInChildren<MeshFilter>();
                for (int i = 0; i < filters.Length; i++)
                {
                    var mesh = filters[i].sharedMesh;
                    mesh.DE_RecalculateNormals(smoothingAngle);
                    EditorUtility.DisplayProgressBar(
                        "Recalculate Normals",
                        filters[i].gameObject.name + " " + (int)Mathf.Lerp(0, 100, (float)i / (float)filters.Length) + "%",
                        (float)i / (float)filters.Length
                    );
                }
            }

            EditorUtility.ClearProgressBar();
        }
        private static void DE_RecalculateNormals(this Mesh mesh, float angle)
        {
            var cosineThreshold = Mathf.Cos(angle * Mathf.Deg2Rad);

            var vertices = mesh.vertices;
            var normals = new Vector3[vertices.Length];

            var triNormals = new Vector3[mesh.subMeshCount][];

            var dictionary = new Dictionary<VertexKey, List<VertexEntry>>(vertices.Length);

            for (var subMeshIndex = 0; subMeshIndex < mesh.subMeshCount; ++subMeshIndex)
            {

                var triangles = mesh.GetTriangles(subMeshIndex);

                triNormals[subMeshIndex] = new Vector3[triangles.Length / 3];

                for (var i = 0; i < triangles.Length; i += 3)
                {
                    int i1 = triangles[i];
                    int i2 = triangles[i + 1];
                    int i3 = triangles[i + 2];

                    Vector3 p1 = vertices[i2] - vertices[i1];
                    Vector3 p2 = vertices[i3] - vertices[i1];
                    Vector3 normal = Vector3.Cross(p1, p2).normalized;
                    int triIndex = i / 3;
                    triNormals[subMeshIndex][triIndex] = normal;

                    List<VertexEntry> entry;
                    VertexKey key;

                    if (!dictionary.TryGetValue(key = new VertexKey(vertices[i1]), out entry))
                    {
                        entry = new List<VertexEntry>(4);
                        dictionary.Add(key, entry);
                    }
                    entry.Add(new VertexEntry(subMeshIndex, triIndex, i1));

                    if (!dictionary.TryGetValue(key = new VertexKey(vertices[i2]), out entry))
                    {
                        entry = new List<VertexEntry>();
                        dictionary.Add(key, entry);
                    }
                    entry.Add(new VertexEntry(subMeshIndex, triIndex, i2));

                    if (!dictionary.TryGetValue(key = new VertexKey(vertices[i3]), out entry))
                    {
                        entry = new List<VertexEntry>();
                        dictionary.Add(key, entry);
                    }
                    entry.Add(new VertexEntry(subMeshIndex, triIndex, i3));
                }
            }


            foreach (var vertList in dictionary.Values)
            {
                for (var i = 0; i < vertList.Count; ++i)
                {

                    var sum = new Vector3();
                    var lhsEntry = vertList[i];

                    for (var j = 0; j < vertList.Count; ++j)
                    {
                        var rhsEntry = vertList[j];

                        if (lhsEntry.VertexIndex == rhsEntry.VertexIndex)
                        {
                            sum += triNormals[rhsEntry.MeshIndex][rhsEntry.TriangleIndex];
                        }
                        else
                        {
                            var dot = Vector3.Dot(
                                triNormals[lhsEntry.MeshIndex][lhsEntry.TriangleIndex],
                                triNormals[rhsEntry.MeshIndex][rhsEntry.TriangleIndex]);
                            if (dot >= cosineThreshold)
                            {
                                sum += triNormals[rhsEntry.MeshIndex][rhsEntry.TriangleIndex];
                            }
                        }
                    }

                    normals[lhsEntry.VertexIndex] = sum.normalized;
                }
            }

            mesh.normals = normals;
        }

        private struct VertexKey
        {
            private readonly long _x;
            private readonly long _y;
            private readonly long _z;

            private const int Tolerance = 100000;

            private const long FNV32Init = 0x811c9dc5;
            private const long FNV32Prime = 0x01000193;

            public VertexKey(Vector3 position)
            {
                _x = (long)(Mathf.Round(position.x * Tolerance));
                _y = (long)(Mathf.Round(position.y * Tolerance));
                _z = (long)(Mathf.Round(position.z * Tolerance));
            }

            public override bool Equals(object obj)
            {
                var key = (VertexKey)obj;
                return _x == key._x && _y == key._y && _z == key._z;
            }

            public override int GetHashCode()
            {
                long rv = FNV32Init;
                rv ^= _x;
                rv *= FNV32Prime;
                rv ^= _y;
                rv *= FNV32Prime;
                rv ^= _z;
                rv *= FNV32Prime;

                return rv.GetHashCode();
            }
        }

        private struct VertexEntry
        {
            public int MeshIndex;
            public int TriangleIndex;
            public int VertexIndex;

            public VertexEntry(int meshIndex, int triIndex, int vertIndex)
            {
                MeshIndex = meshIndex;
                TriangleIndex = triIndex;
                VertexIndex = vertIndex;
            }
        }
        #endregion
        #region [General Mesh Operators]
        public static void RecalculateTangentsAndNormals(GameObject[] obj, float smoothingAngle)
        {
            RecalculateNormals(obj, smoothingAngle);
            RecalculateTangents(obj);
        }
        #endregion
    }
    #endregion
    #region [DE Vertex Color]
    public static class DE_VertexColor
    {
        private static int c = 0;

        public static void Recalculate(GameObject[] obj, SubmeshOption[] submeshOption, Vector3 colorModifier, int submeshTarget = -1)
        {
            if (obj.Length != 1)
                return;
            if (obj[0] != null)
            {
                var filters = obj[0].GetComponentsInChildren<MeshFilter>();
                int progress = 0;
                int steps = filters.Length;
                for (int filtersIndex = 0; filtersIndex < filters.Length; filtersIndex++)
                {
                    steps += filters[filtersIndex].sharedMesh.subMeshCount;
                    EditorUtility.DisplayProgressBar("Adjusting Vertex Colors", "Submesh Done: " + progress + " / " + steps, (float)progress / (float)steps);
                }
                c = 0;
                foreach (var FilterIndex in filters)
                {
                    Debug.Log(submeshTarget);
                    var mesh = FilterIndex.sharedMesh;
                    if (mesh != null)
                    {
                        int SubMeshCount = mesh.subMeshCount;
                        CombineInstance[] instance = new CombineInstance[SubMeshCount];
                        for (int SubMeshIndex = 0; SubMeshIndex < SubMeshCount; SubMeshIndex++)
                        {

                            Mesh SubMesh = DE_MeshUtils.GetSubmesh(mesh, SubMeshIndex);
                            Vector3 BoundSize = mesh.bounds.size;
                            Color[] colors = SubMesh.colors;
                            bool newColor = false;
                            if (colors.Length != SubMesh.vertexCount)
                            {
                                colors = new Color[SubMesh.vertices.Length];
                                newColor = true;
                                UnityEngine.Debug.LogWarning("Mesh Tool:Vertex Color reseted!");
                            }

                            Vector3[] MeshVertices = SubMesh.vertices;

                            Vector3 distancePos = Vector3.zero;

                            Vector3 distancePosMax = SubMesh.bounds.max;

                            if (submeshOption[c] == SubmeshOption.Surface)
                            {
                                Parallel.For(0, SubMesh.vertices.Length, i =>
                                {
                                    float distPivot = Vector3.Distance(distancePos, MeshVertices[i]);
                                    float alpha = colors[i].a;
                                    if (newColor)
                                        alpha = 1;
                                    colors[i] = new Color
                                    {
                                        r = (distPivot / 10) * colorModifier.x,
                                        g = 0,
                                        b = 0,
                                        a = alpha
                                    };
                                });
                            }

                            if (submeshOption[c] == SubmeshOption.Cutout)
                            {

                                var uv = SubMesh.uv;
                                var vertices = SubMesh.vertices;
                                var connections = DE_MeshUtils.GetConnections(SubMesh);
                                var randomValue = new float[connections.Length];
                                for (int i = 0; i < randomValue.Length; i++)
                                    randomValue[i] = UnityEngine.Random.value;

                                Parallel.For(0, connections.Length, j =>
                                {
                                    var c = connections[j];

                                    var tempMeshSet = new List<MeshSet>();
                                    if (c.triangles == null)
                                        return;
                                    for (int i = 0; i < c.triangles.Count; i++)
                                    {
                                        var t = new MeshSet();
                                        t.triangles = c.triangles[i];
                                        t.uv = uv[t.triangles];
                                        t.vertices = vertices[t.triangles];
                                        tempMeshSet.Add(t);
                                    }

                                    tempMeshSet = tempMeshSet.OrderBy(y => y.uv.y).ToList();
                                    var min = tempMeshSet[0].uv.y;
                                    var max = tempMeshSet[tempMeshSet.Count - 1].uv.y;

                                    float minDistance = Mathf.Infinity;

                                    Parallel.For(0, tempMeshSet.Count, i =>
                                    {
                                        float dist = Vector3.Distance(
                                            Vector3.Lerp(tempMeshSet[0].vertices, tempMeshSet[1].vertices, 0.5f),
                                            tempMeshSet[i].vertices);
                                        minDistance = Mathf.Min(minDistance, dist);

                                        float distPivot = Vector3.Distance(distancePos, tempMeshSet[i].vertices);

                                        var pos = tempMeshSet[i].vertices.y / BoundSize.y;
                                        var alpha = colors[tempMeshSet[i].triangles].a;
                                        colors[tempMeshSet[i].triangles] = new Color
                                        {
                                            r = (distPivot / 10) * colorModifier.x,
                                            g = randomValue[j] * colorModifier.y,
                                            b = (dist - minDistance) * colorModifier.y,
                                            a = alpha
                                        };
                                    });
                                });
                            }

                            if (submeshOption[c] == SubmeshOption.Billboard)
                            {
                                Parallel.For(0, SubMesh.vertices.Length, i =>
                                {
                                    float distPivot = Vector3.Distance(distancePos, MeshVertices[i]);
                                    var alpha = colors[i].a;
                                    colors[i] = new Color
                                    {
                                        r = Mathf.Lerp(0, 1, MeshVertices[i].y / distancePosMax.y) *
                                            colorModifier.x,
                                        g = 0,
                                        b = 0,
                                        a = alpha
                                    };
                                });
                            }
                            if (submeshTarget == -1 || submeshTarget == c)
                                SubMesh.colors = colors;
                            
                            instance[SubMeshIndex].mesh = SubMesh;
                            progress += 1;
                            EditorUtility.DisplayProgressBar(
                                "Recalculate Vertex Colors",
                                "Submesh : " + progress + " / " + steps,
                                (float) progress / (float) steps
                            );
                            c++;
                        }

                        FilterIndex.sharedMesh.CombineMeshes(instance, false, false);
                        progress += 1;
                        EditorUtility.DisplayProgressBar(
                            "Recalculate Vertex Colors",
                            "Submesh : " + progress + " / " + steps,
                            (float) progress / (float) steps
                        );

                    }
                }
                EditorUtility.ClearProgressBar();
            }
        }
        public static void Reset(GameObject[] obj, int submeshTarget = -1)
        {
            if (obj.Length != 1)
                return;
            if (obj[0] != null)
            {
                var filters = obj[0].GetComponentsInChildren<MeshFilter>();
                c = 0;
                foreach (var FilterIndex in filters)
                {
                    var mesh = FilterIndex.sharedMesh;
                    if (mesh != null)
                    {
                        int SubMeshCount = mesh.subMeshCount;
                        CombineInstance[] instance = new CombineInstance[SubMeshCount];
                        for (int SubMeshIndex = 0; SubMeshIndex < SubMeshCount; SubMeshIndex++)
                        {
                            Mesh SubMesh = DE_MeshUtils.GetSubmesh(mesh, SubMeshIndex);
                            Color[] colors = SubMesh.colors;
                            bool newColor = false;
                            if (colors.Length != SubMesh.vertexCount)
                            {
                                colors = new Color[SubMesh.vertices.Length];
                                UnityEngine.Debug.LogWarning("Mesh Tool:Vertex Color reseted!");
                            }
                            
                            Parallel.For(0, SubMesh.vertices.Length, i =>
                            {
                                colors[i] = new Color
                                {
                                    r = 1,
                                    g = 1,
                                    b = 1
                                };
                            });
                            
                            if (submeshTarget == -1 || submeshTarget == c)
                                SubMesh.colors = colors;
                            
                            instance[SubMeshIndex].mesh = SubMesh;
                            
                            c++;
                        }

                        FilterIndex.sharedMesh.CombineMeshes(instance, false, false);
                    }
                }
                EditorUtility.ClearProgressBar();
            }
        }
    }
    #endregion
    #region [DE Ambient Occlusion]
    public static class DE_AmbientOcclusion
    {
        public static void Recalculate(GameObject obj, int samples = 512, float minRange = 0.0000000001f, float maxRange = 1.5f, float intensity = 5.0f, int target = 0)
        {


            MeshFilter[] mfs = obj.GetComponentsInChildren<MeshFilter>();
            int numVerts = 0;
            foreach (MeshFilter mf in mfs)
                numVerts += mf.sharedMesh.vertices.Length;
            int numSamples = numVerts * samples;
            
            foreach (MeshFilter mf in mfs)
            {
                var collider = mf.gameObject.AddComponent<MeshCollider>();
                Mesh mesh = mf.sharedMesh;

                Vector3[] verts = mesh.vertices;
                float[] result = new float[verts.Length];
                

                Vector3[] normals = new Vector3[mesh.normals.Length];
                if (normals.Length == 0)
                    mesh.RecalculateNormals();

                normals = mesh.normals;

                int l = verts.Length;


                var random = new float[samples * 3 * l];

                for (int g = 0; g < random.Length; g++)
                    random[g] = UnityEngine.Random.value;

                var matrix = obj.transform.localToWorldMatrix;

                float occlusion = 0;
                var commands = new NativeArray<RaycastCommand>(samples * l, Allocator.Persistent);
                var hits = new NativeArray<RaycastHit>(samples * l, Allocator.Persistent);
                Parallel.For(0, l, i =>
                {
                    Vector3 nrm = normals[i];
                    Vector3 v = matrix * (verts[i]);
                    Vector3 n = matrix * (verts[i] + nrm);
                    Vector3 wnrm = (n - v);
                    wnrm.Normalize();

                    Parallel.For(0, samples, g =>
                    {
                        float rotation_0 = 180.0f;
                        float rotation_1 = rotation_0 / 2.0f;

                        float rotation_x = ((rotation_0 * random[g * l]) - rotation_1);
                        float rotation_y = ((rotation_0 * random[g * l + samples]) - rotation_1);
                        float rotation_z = ((rotation_0 * random[g * l + (samples * 2)]) - rotation_1);

                        Vector3 direction = Quaternion.FromToRotation(Vector3.up, wnrm) * Quaternion.Euler(rotation_x, rotation_y, rotation_z) * Vector3.up;
                        Vector3 offset = Vector3.Reflect(direction, wnrm);

                        var start = v - (offset * 0.1f);
                        var length = Vector3.Distance(start, v + direction * (maxRange / direction.magnitude));

                        commands[g * i] = new RaycastCommand(start, direction, length);
                    });
                });

                var handle = RaycastCommand.ScheduleBatch(commands, hits, 1);
                handle.Complete();
                commands.Dispose();
                var allHits = hits.ToArray();
                hits.Dispose();

                for (int i = 0; i < l; i++)
                {
                    Parallel.For(0, samples, f =>
                    {
                        if (allHits[f * i].distance > minRange)
                            occlusion += Mathf.Clamp01(1 - (allHits[f * i].distance / maxRange));
                    });
                    result[i] = Mathf.Clamp01(1 - ((occlusion * intensity) / samples));
                    occlusion = 0;
                    if (i % 500 == 0)
                    {
                        EditorUtility.DisplayProgressBar(
                            "Ambient Occlusion",
                            mf.gameObject.name + " " + (int)Mathf.Lerp(0, 100, (float)i / (float)l) + "%",
                            (float)i / (float)l
                        );
                    }
                }

                if (target < 4)
                {
                    var colors = mesh.colors;
                    if (mesh.colors == null || mesh.colors.Length == 0)
                    {
                        colors = new Color[verts.Length];
                        UnityEngine.Debug.LogWarning("Mesh Tool: Vertex Colors reseted!");
                    }

                    for (var i = 0; i < result.Length; i++)
                    {
                        switch (target)
                        {
                            case 0:
                                colors[i].r = result[i];
                                break;
                            case 1:
                                colors[i].g = result[i];
                                break;
                            case 2:
                                colors[i].b = result[i];
                                break;
                            case 3:
                                colors[i].a = result[i];
                                break;
                        }
                    }
                    mesh.colors = colors;
                }
                else
                {
                    Vector2[] uvs = new Vector2[verts.Length];

                    switch (target)
                    {
                        case 4:
                            uvs = mesh.uv2;
                            break;
                        case 5:
                            uvs = mesh.uv2;
                            break;
                        case 6:
                            uvs = mesh.uv3;
                            break;
                        case 7:
                            uvs = mesh.uv3;
                            break;
                        case 8:
                            uvs = mesh.uv4;
                            break;
                        case 9:
                            uvs = mesh.uv4;
                            break;
                    }
                    if (uvs == null || uvs.Length == 0)
                    {
                        uvs = new Vector2[verts.Length];
                        UnityEngine.Debug.LogWarning("Mesh Tool: UVs reseted!");
                    }
                    for (var i = 0; i < result.Length; i++)
                    {
                        if(target == 4 || target == 6 || target == 8)
                            uvs[i].x = result[i];
                        else
                            uvs[i].y = result[i];
                    }
                    
                    switch (target)
                    {
                        case 4:
                            mesh.uv2 = uvs;
                            break;
                        case 5:
                            mesh.uv2 = uvs;
                            break;
                        case 6:
                            mesh.uv3 = uvs;
                            break;
                        case 7:
                            mesh.uv3 = uvs;
                            break;
                        case 8:
                            mesh.uv4 = uvs;
                            break;
                        case 9:
                            mesh.uv4 = uvs;
                            break;
                    }
                }

                UnityEngine.Object.DestroyImmediate(collider);
            }
            EditorUtility.ClearProgressBar();
        }
        public static void Reset(GameObject obj, int target)
        {
            var filters = obj.GetComponentsInChildren<MeshFilter>();
            foreach (var f in filters)
            {
                var mesh = f.sharedMesh;
                var colors = mesh.colors;
                var uvs = new Vector2[0];

                switch (target)
                {
                    case 4:
                        uvs = mesh.uv2;
                        break;
                    case 5:
                        uvs = mesh.uv2;
                        break;
                    case 6:
                        uvs = mesh.uv3;
                        break;
                    case 7:
                        uvs = mesh.uv3;
                        break;
                    case 8:
                        uvs = mesh.uv4;
                        break;
                    case 9:
                        uvs = mesh.uv4;
                        break;
                }


                for (int i = 0; i < mesh.vertices.Length; i++)
                {
                    switch (target)
                    {
                        case 0:
                            colors[i].a = 1f;
                            break;
                        case 1:
                            colors[i].a = 1f;
                            break;
                        case 2:
                            colors[i].a = 1f;
                            break;
                        case 3:
                            colors[i].a = 1f;
                            break;
                    }

                    if (target == 4 || target == 6 || target == 8)
                        uvs[i].x = 1f;
                    if (target == 5 || target == 7 || target == 9)
                        uvs[i].y = 1f;
                }

                if (target < 4)
                    mesh.colors = colors;
                switch (target)
                {
                    case 4:
                        mesh.uv2 = uvs;
                        break;
                    case 5:
                        mesh.uv2 = uvs;
                        break;
                    case 6:
                        mesh.uv3 = uvs;
                        break;
                    case 7:
                        mesh.uv3 = uvs;
                        break;
                    case 8:
                        mesh.uv4 = uvs;
                        break;
                    case 9:
                        mesh.uv4 = uvs;
                        break;
                }
                f.sharedMesh = mesh;
            }
        }
    }
    #endregion
    #region [DE Extentions]
    public static class EditorExtentions
    {
        public static Texture2D GetTexture2D(this string name, bool isButton = false)
        {
            string[] filePaths = Directory.GetFiles(@Application.dataPath, "*.png", SearchOption.AllDirectories);

            foreach (var f in filePaths)
            {
                if (!f.Contains(".meta"))
                {
                    if (f.Contains(name) && !isButton)
                    {
                        var dataPath = Application.dataPath.Remove(Application.dataPath.Length - 6);
                        return (Texture2D)AssetDatabase.LoadAssetAtPath(f.Replace(dataPath, ""), typeof(Texture2D));
                    }
                    if (f.Contains(name) && isButton && f.Contains("Active"))
                    {
                        var dataPath = Application.dataPath.Remove(Application.dataPath.Length - 6);
                        return (Texture2D)AssetDatabase.LoadAssetAtPath(f.Replace(dataPath, ""), typeof(Texture2D));
                    }
                }
            }
            return null;
        }
    }
    public static class MenuExtention
    {
        public static void LoadScene(this string name)
        {
            EditorSceneManager.SaveCurrentModifiedScenesIfUserWantsTo();
            EditorSceneManager.OpenScene(name, OpenSceneMode.Single);
        }
        public static Object[] GetAssetsOfType(this System.Type type, string fileExtension)
        {
            List<Object> tempObjects = new List<Object>();
            DirectoryInfo directory = new DirectoryInfo(Application.dataPath);
            FileInfo[] goFileInfo = directory.GetFiles("*" + fileExtension, SearchOption.AllDirectories);

            int i = 0; int goFileInfoLength = goFileInfo.Length;
            FileInfo tempGoFileInfo; string tempFilePath;
            Object tempGO;
            for (; i < goFileInfoLength; i++)
            {
                tempGoFileInfo = goFileInfo[i];
                if (tempGoFileInfo == null)
                    continue;

                tempFilePath = tempGoFileInfo.FullName;
                tempFilePath = tempFilePath.Replace(@"\", "/").Replace(Application.dataPath, "Assets");

                Debug.Log(tempFilePath + "\n" + Application.dataPath);

                tempGO = AssetDatabase.LoadAssetAtPath(tempFilePath, typeof(Object)) as Object;
                if (tempGO == null)
                {
                    Debug.LogWarning("Skipping Null");
                    continue;
                }
                else if (tempGO.GetType() != type)
                {
                    Debug.LogWarning("Skipping " + tempGO.GetType().ToString());
                    continue;
                }

                tempObjects.Add(tempGO);
            }

            return tempObjects.ToArray();
        }
    }
    public static class ReflectionExtentions
    {
        public static System.Type GetEditorWindowType(this string filter)
        {
            Type result = null;

            System.Reflection.Assembly[] AS = System.AppDomain.CurrentDomain.GetAssemblies();
            System.Type editorWindow = typeof(EditorWindow);

            foreach (var A in AS)
            {
                System.Type[] types = A.GetTypes();
                foreach (var T in types)
                {
                    if (T.IsSubclassOf(editorWindow) && T.ToString().Contains(filter))
                        result = T;
                }
            }
            return result;
        }
    }
    public static class PathExtentions
    {
        /// <summary>
        /// Convert Path to target Platform
        /// </summary>
        /// <param name="path">Path</param>
        /// <returns></returns>
        public static string GetPath(this string path)
        {
            return path.Replace("\"", "/").Replace("/", Path.PathSeparator.ToString());
        }
        /// <summary>
        /// Add Space to Text
        /// </summary>
        /// <param name="text">Text</param>
        /// <returns></returns>
        public static string AddSpacesToSentence(this string text)
        {
            if (string.IsNullOrWhiteSpace(text))
                return "";
            System.Text.StringBuilder newText = new System.Text.StringBuilder(text.Length * 2);
            newText.Append(text[0]);
            for (int i = 1; i < text.Length; i++)
            {

                if (!char.IsDigit(text[i - 1]) &&
                    text[i].ToString() == "_")
                {
                    newText.Append(' ');
                }
                else
                {

                    if (char.IsUpper(text[i]) && text[i - 1] != ' ' && !char.IsUpper(text[i - 1]))
                        newText.Append(' ');
                    newText.Append(text[i]);
                }
            }
            return newText.ToString();
        }
        /// <summary>
        /// Move member in string List
        /// </summary>
        /// <param name="list">string list</param>
        /// <param name="oldIndex">current index</param>
        /// <param name="newIndex">new index</param>
        /// <returns></returns>
        public static List<string> Move(this List<string> list, int oldIndex, int newIndex)
        {
            string old = list[oldIndex];
            list.Remove(old);
            list.Insert(newIndex, old);
            return list;
        }
        /// <summary>
        /// Move meber in MenuPaths List
        /// </summary>
        /// <param name="list">string list</param>
        /// <param name="oldIndex">current index</param>
        /// <param name="newIndex">new index</param>
        /// <returns></returns>
        public static List<MenuPaths> Move(this List<MenuPaths> list, int oldIndex, int newIndex)
        {
            MenuPaths old = list[oldIndex];
            list.Remove(old);
            list.Insert(newIndex, old);
            return list;
        }
    }
    #endregion
}
namespace DEShaders.GraphicalUserInterface
{
    public static class DEShadersGUI
    {
        /// <summary>
        /// Main GUI Class
        /// </summary>
        public class MainGUI
        {
            private int mainToolbar;
            private string[] toolbarNames;
            private Action[] actions;
            private string name;
            private string version;
            private Vector2 editorWindowSize;

            private string publisherLink;
            private string discordLink;
            private string websiteLink;
            private string mailLink;
            private string publisher;

            private Texture2D icon_logo;
            private readonly float iconSize = 120f;

            private SocialGUI socialGUI;

            private int ShowAtStartupSelector = 0;
            public readonly string DE_ENVIRONMENT_SHOWATSTARTUP_KEY = "DE_ENVIRONMENT_SHOWATSTARTUP";
            
            private bool PlaySoundOnFinish = false;
            public readonly string DE_ENVIRONMENT_PLAYSOUND_KEY = "DE_ENVIRONMENT_PLAYSOUND";
            
            /// <summary>
            /// Main EditorWindow GUI
            /// </summary>
            /// <param name="toolbarNames"> Array of Names which are shown in Editor Window => Needs to be same size as actions</param>
            /// <param name="actions">Array of GUI Actions => Needs to be same size as toolbarNames</param>
            /// <param name="name">Editor Window Name</param>
            /// <param name="version">Tool Version</param>
            /// <param name="editorWindowSize">Size of Editor Window</param>
            /// <param name="logofileName">Main Logo Icon (powered by Environments)</param>
            /// <param name="publisherLink">Asset Store Publisher Site link</param
            /// <param name="discordLink">Publisher Discord Channel Link</param>
            /// <param name="websiteLink">Publisher Website Link => https://www.twigly.ch</param>
            /// <param name="mailLink">Publisher Support Mail</param>
            /// <param name="publisher">Publisher Name</param>
            public MainGUI(ref int mainToolbar, string[] toolbarNames, Action[] actions, string name, string version, Vector2 editorWindowSize, string logofileName, string publisherLink = "", string discordLink = "", string websiteLink = "", string mailLink = "", string publisher = "")
            {
                if (!icon_logo)
                    icon_logo = logofileName.GetTexture2D();

                this.mainToolbar = mainToolbar;

                this.toolbarNames = toolbarNames;
                this.actions = actions;

                this.name = name;
                this.version = version;

                this.editorWindowSize = editorWindowSize;

                this.publisherLink = publisherLink;
                this.discordLink = discordLink;
                this.websiteLink = websiteLink;
                this.mailLink = mailLink;

                this.publisher = publisher;
                

                if (EditorPrefs.HasKey(DE_ENVIRONMENT_SHOWATSTARTUP_KEY))
                    ShowAtStartupSelector = EditorPrefs.GetInt(DE_ENVIRONMENT_SHOWATSTARTUP_KEY);
                
                if (EditorPrefs.HasKey(DE_ENVIRONMENT_PLAYSOUND_KEY))
                    PlaySoundOnFinish = EditorPrefs.GetBool(DE_ENVIRONMENT_PLAYSOUND_KEY);
            }
            /// <summary>
            /// On GUI
            /// </summary>
            public void OnGUI()
            {
                var toolbarSize = GUILayout.Width(iconSize);

                // Separator Lines

                Handles.BeginGUI();
                Handles.color = Color.black;
                var xStart = 127;
                // Vertical Line
                Handles.DrawLine(
                new Vector3(xStart, 0),
                new Vector3(xStart, editorWindowSize.y));

                // Horizontal Line 1
                Handles.DrawLine(
                new Vector3(xStart, xStart / 2),
                new Vector3(editorWindowSize.x, xStart / 2));

                // Horizontal Line 2
                Handles.DrawLine(
                new Vector3(xStart, xStart),
                new Vector3(editorWindowSize.x, xStart));
                Handles.EndGUI();
                
                // Horizontal Line 3
                Handles.DrawLine(
                    new Vector3(xStart, editorWindowSize.y - 20),
                    new Vector3(editorWindowSize.x, editorWindowSize.y - 20));
                Handles.EndGUI();
                
                EditorGUILayout.BeginHorizontal();

                // Powered by DE Environments Texture2D
                EditorGUILayout.LabelField(new GUIContent(icon_logo), GUILayout.Width(iconSize), GUILayout.Height(iconSize));
                GUILayout.Space(10);
                EditorGUILayout.BeginVertical();

                // Mesh Tool Label
                EditorGUILayout.LabelField("<b>" + name + "</b> <size=9>" + version + "</size>", DEShadersStyles.LabelStyle(bold: true, size: 24, richText: true), GUILayout.Height(iconSize / 2));

                // Selected Menu Label
                EditorGUILayout.LabelField(toolbarNames[mainToolbar], DEShadersStyles.LabelStyle(bold: false, size: 18, richText: true, alignment: TextAnchor.MiddleLeft), GUILayout.Height(iconSize / 2));

                EditorGUILayout.EndVertical();
                EditorGUILayout.EndHorizontal();


                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.BeginVertical(toolbarSize);
                EditorGUILayout.Space();

                if (socialGUI == null)
                    socialGUI = new SocialGUI(
                        name,
                        version,
                        publisherLink,
                        discordLink,
                        websiteLink,
                        mailLink,
                        publisher
                    );
                socialGUI.OnGUI();

                GUILayout.Space(10);
                mainToolbar = GUILayout.SelectionGrid(mainToolbar, toolbarNames, 1, DEShadersStyles.ButtonStyle(), toolbarSize);
                EditorGUILayout.EndVertical();
                GUILayout.Space(10);

                EditorGUILayout.BeginVertical();
                GUILayout.Space(10);
                for (int i = 0; i < actions.Length; i++)
                {
                    if (mainToolbar == i)
                        actions[i]();
                }
                EditorGUILayout.EndVertical();

                EditorGUILayout.EndHorizontal();
                GUILayout.Space(30);
                var labelSoundRect = new Rect(iconSize * 1.07f, editorWindowSize.y - 17.5f, 150,12);
                var labelStartUpRect = new Rect(editorWindowSize.x - 205, editorWindowSize.y - 17.5f, 100,12);
                var toggleSoundRect = new Rect(iconSize + 155, editorWindowSize.y - 16.5f, 20,12);
                var popupRect = new Rect(editorWindowSize.x - 101, editorWindowSize.y - 19.5f, 100,12);
                
                EditorGUI.LabelField(labelSoundRect,"Beep on Finish Import:");
                EditorGUI.BeginChangeCheck();
                PlaySoundOnFinish = EditorGUI.Toggle(toggleSoundRect, PlaySoundOnFinish);
                if (EditorGUI.EndChangeCheck())
                {
                    EditorPrefs.SetBool(DE_ENVIRONMENT_PLAYSOUND_KEY, PlaySoundOnFinish);
                }
                
                EditorGUI.LabelField(labelStartUpRect,"Show At Startup:");
                EditorGUI.BeginChangeCheck();
                ShowAtStartupSelector =
                    EditorGUI.IntPopup(popupRect, ShowAtStartupSelector, new string[] {"Always", "Never"}, new int[]{0,1});
                if (EditorGUI.EndChangeCheck())
                {
                    EditorPrefs.SetInt(DE_ENVIRONMENT_SHOWATSTARTUP_KEY, ShowAtStartupSelector);
                }
                
            }
        }
        /// <summary>
        /// Social GUI Class
        /// </summary>
        public class SocialGUI
        {
            private string name;
            private string version;
            private string publisherLink;
            private string discordLink;
            private string websiteLink;
            private string mailLink;
            private string publisher;

            private Texture2D icon_Store, icon_Store_active;
            private Texture2D icon_Discord, icon_Discord_active;
            private Texture2D icon_Website, icon_Website_active;
            private Texture2D icon_Mail, icon_Mail_active;
            /// <summary>
            /// Social GUI
            /// </summary>
            /// <param name="name">Editor Window Name</param>
            /// <param name="version">Tool Version</param>
            /// <param name="publisherLink">Asset Store Publisher Site link</param
            /// <param name="discordLink">Publisher Discord Channel Link</param>
            /// <param name="websiteLink">Publisher Website Link</param>
            /// <param name="mailLink">Publisher Support Mail</param>
            /// <param name="publisher">Publisher Name</param>
            public SocialGUI(string name, string version, string publisherLink = "", string discordLink = "", string websiteLink = "", string mailLink = "", string publisher = "")
            {
                icon_Store = "T_LogoStore".GetTexture2D();
                icon_Store_active = "T_LogoStore".GetTexture2D(true);
                icon_Discord = "T_LogoDiscord".GetTexture2D();
                icon_Discord_active = "T_LogoDiscord".GetTexture2D(true);
                icon_Website = "T_LogoWWW".GetTexture2D();
                icon_Website_active = "T_LogoWWW".GetTexture2D(true);
                icon_Mail = "T_LogoMail".GetTexture2D();
                icon_Mail_active = "T_LogoMail".GetTexture2D(true);

                this.name = name;
                this.version = version;
                this.publisherLink = publisherLink;
                this.discordLink = discordLink;
                this.websiteLink = websiteLink;
                this.mailLink = mailLink;
                this.publisher = publisher;
            }
            public void OnGUI()
            {


                EditorGUILayout.BeginVertical();

                var gs_SocialButton = new GUIStyle(GUI.skin.label);
                var gsMaxWidth = GUILayout.MaxWidth(120);
                var gsMaxHeight = GUILayout.MaxHeight(17);
                if (publisherLink != "")
                {
                    gs_SocialButton.normal.background = icon_Store;
                    gs_SocialButton.active.background = icon_Store_active;
                    if (GUILayout.Button(new GUIContent("", publisher + " Assetstore Page: \n " + publisherLink), gs_SocialButton, gsMaxWidth, gsMaxHeight))
                        Application.OpenURL(publisherLink);
                }

                if (discordLink != "")
                {
                    gs_SocialButton.normal.background = icon_Discord;
                    gs_SocialButton.active.background = icon_Discord_active;
                    if (GUILayout.Button(new GUIContent("", "Publisher Discord Channel: \n" + discordLink), gs_SocialButton, gsMaxWidth, gsMaxHeight))
                        Application.OpenURL(discordLink);
                }

                if (websiteLink != "")
                {
                    gs_SocialButton.normal.background = icon_Website;
                    gs_SocialButton.active.background = icon_Website_active;
                    if (GUILayout.Button(new GUIContent("", "Publisher Website: \n" + websiteLink), gs_SocialButton, gsMaxWidth, gsMaxHeight))
                        Application.OpenURL(websiteLink);
                }

                if (mailLink != "")
                {
                    gs_SocialButton.normal.background = icon_Mail;
                    gs_SocialButton.active.background = icon_Mail_active;
                    if (GUILayout.Button(new GUIContent("", "Publisher Mail Support: \n" + mailLink), gs_SocialButton, gsMaxWidth, gsMaxHeight))
                    {
                        var n = "\n";
                        var body0 = "Publisher: " + publisher;
                        var body1 = "Tool Name: " + name;
                        var body2 = "Version: " + version;
                        var body3 = "Date: " + System.DateTime.Now.Date.ToString().Replace("00:00:00", "");
                        var body4 = "Time: " + System.DateTime.Now.TimeOfDay.ToString().Remove(5);

                        string mailto = string.Format(
                            "mailto:{0}?Subject={1}&Body={2}",
                            mailLink,
                            "Support " + name,
                            body0 + n +
                            body1 + n + n +
                            body2 + n +
                            body3 + n +
                            body4 + n + n + n
                        );

                        Process.Start(mailto);
                    }
                }
                EditorGUILayout.EndVertical();
            }
        }
        /// <summary>
        /// About GUI Class
        /// </summary>
        public class AboutGUI
        {
            private string toolName;
            private string publisher;
            private string version;
            private string[] creator;
            private string[] writer;
            private string[] adress;
            private string htmlWebsite;
            private string mail;

            private GUIStyle gs_Label;
            private GUIStyle gs_Button;
            private readonly int width = 200;

            /// <summary>
            /// About GUI Information Container
            /// </summary>
            /// <param name="toolName">Name of tool</param>
            /// <param name="publisher">Publishers Name</param>
            /// <param name="version">Tool Version</param>
            /// <param name="creator">Creators Name (Array)></param>
            /// <param name="writer">Tool Writers Name (Array)</param>
            /// <param name="adress">Tool Writers Adress (Array)</param>
            /// <param name="htmlWebsite">Tool Writers Website in => http://www.examplestudio.com</param>
            /// <param name="mail">Tool Writers Mail support => writer@examplestudio.com</param>
            public AboutGUI(string toolName, string publisher, string version, string[] creator, string[] writer, string[] adress = null, string htmlWebsite = "", string mail = "")
            {
                this.toolName = toolName;
                this.publisher = publisher;
                this.version = version;
                this.creator = creator;
                this.writer = writer;
                this.adress = adress;
                this.htmlWebsite = htmlWebsite;
                this.mail = mail;

                ColorUtility.TryParseHtmlString("#18a19f", out Color col);
                gs_Label = DEShadersStyles.LabelStyle(size: 10);
                gs_Button = DEShadersStyles.TextButtonStyle(col, false, 10);

            }

            public void OnGUI()
            {
                GetCreator();
                EditorGUILayout.Space();
                GetWriter();
            }
            private void GetCreator()
            {
                int height = (creator.Length + 2) * 14;
                string creatorField = "";
                for (int i = 0; i < creator.Length; i++)
                {
                    creatorField += creator[i] + "\n";
                }

                EditorGUILayout.BeginHorizontal();
                GUILayout.FlexibleSpace();

                EditorGUILayout.BeginVertical("tooltip", GUILayout.Width(width * 1.5f));
                EditorGUILayout.LabelField
                        (
                        toolName + " created by\n" +
                        creatorField,
                        gs_Label, GUILayout.Height(height), GUILayout.Width(width)
                );
                EditorGUILayout.EndVertical();

                GUILayout.FlexibleSpace();
                EditorGUILayout.EndHorizontal();
            }
            private void GetWriter()
            {

                int height = (adress.Length + 2) * 14;
                string adressField = "";
                for (int i = 0; i < adress.Length; i++)
                {
                    adressField += adress[i] + "\n";
                }
                string writerField = "";
                for (int i = 0; i < writer.Length; i++)
                {
                    writerField += writer[i];
                    if (i < writer.Length - 1)
                        writerField += ", ";
                }
                EditorGUILayout.BeginHorizontal();
                GUILayout.FlexibleSpace();

                EditorGUILayout.BeginVertical("tooltip", GUILayout.Width(width * 1.5f));
                EditorGUILayout.LabelField
                        (
                        toolName + " written by " + writerField + "\n\n" +
                        adressField,
                        gs_Label, GUILayout.Height(height), GUILayout.Width(width)
                );

                EditorGUILayout.Space();

                GetHTMLWebsite();
                GetMail();

                EditorGUILayout.EndVertical();
                GUILayout.FlexibleSpace();
                EditorGUILayout.EndHorizontal();
            }
            private void GetHTMLWebsite()
            {
                if (htmlWebsite != "")
                {
                    ColorUtility.TryParseHtmlString("#18a19f", out Color col);
                    string htmlName = htmlWebsite.Replace("https://", "").Replace("http://", "");

                    if (htmlName[htmlName.Length - 1].ToString() == "/")
                    {
                        htmlName = htmlName.Remove(htmlName.Length - 1, 1);
                    }
                    if (!htmlName.Contains("www."))
                        htmlName.Insert(0, "www.");

                    if (GUILayout.Button(new GUIContent(htmlName, "go to " + htmlName), gs_Button))
                        Application.OpenURL(htmlWebsite);
                }
            }
            private void GetMail()
            {
                if (mail != "")
                {


                    if (GUILayout.Button(new GUIContent(mail, toolName + " mail support"), gs_Button))
                    {
                        var n = "\n";
                        var body0 = "Publisher: " + publisher;
                        var body1 = "Tool Name: " + toolName;
                        var body2 = "Version: " + version;
                        var body3 = "Date: " + DateTime.Now.Date.ToString().Replace("00:00:00", "");
                        var body4 = "Time: " + DateTime.Now.TimeOfDay.ToString().Remove(5);

                        string mailto = string.Format(
                            "mailto:{0}?Subject={1}&Body={2}",
                            mail,
                            "Support " + toolName,
                            body0 + n +
                            body1 + n + n +
                            body2 + n +
                            body3 + n +
                            body4 + n + n + n
                        );
                        Process.Start(mailto);
                    }
                }
            }
        }       
    }
    public class DEShadersStyles
    {
        public static GUIStyle LabelStyle(bool bold = false, int size = 12, bool richText = false, TextAnchor alignment = TextAnchor.MiddleLeft)
        {
            var guistyle = new GUIStyle(GUI.skin.label);

            if (bold)
                guistyle.fontStyle = FontStyle.Bold;
            else
                guistyle.fontStyle = FontStyle.Normal;

            guistyle.fontSize = size;
            guistyle.richText = richText;
            guistyle.alignment = alignment;

            return guistyle;
        }
        public static GUIStyle ButtonStyle(bool bold = false, int size = 12, bool richText = false, TextAnchor alignment = TextAnchor.MiddleLeft)
        {
            var guistyle = new GUIStyle(GUI.skin.button);

            if (bold)
                guistyle.fontStyle = FontStyle.Bold;
            else
                guistyle.fontStyle = FontStyle.Normal;

            guistyle.fontSize = size;
            guistyle.richText = richText;
            guistyle.alignment = alignment;

            return guistyle;
        }
        public static GUIStyle TextureButtonStyle(Texture2D normalTexture, Texture2D activeTexture, Texture2D hoverTexture)
        {
            var guistyle = new GUIStyle(GUI.skin.label);
            guistyle.normal.background = normalTexture;
            guistyle.active.background = activeTexture;
            guistyle.hover.background = hoverTexture;
            return guistyle;
        }
        public static GUIStyle TextButtonStyle(Color normal, bool bold = false, int size = 12, bool richText = false, TextAnchor alignment = TextAnchor.MiddleLeft)
        {
            Color hover;
            Color active;
            ColorUtility.TryParseHtmlString("#363636", out active);
            ColorUtility.TryParseHtmlString("#696969", out hover);

            var guistyle = new GUIStyle(GUI.skin.label);

            if (bold)
                guistyle.fontStyle = FontStyle.Bold;
            else
                guistyle.fontStyle = FontStyle.Normal;

            guistyle.fontSize = size;
            guistyle.richText = richText;
            guistyle.alignment = alignment;

            guistyle.normal.textColor = normal;
            guistyle.hover.textColor = hover;
            guistyle.active.textColor = active;

            return guistyle;
        }
        /// <summary>
        /// Text Button GUIStyle
        /// </summary>
        /// <param name="normal">Normal Color</param>
        /// <param name="bold">is Bold?</param>
        /// <param name="size">Text Size</param>
        /// <param name="richText">use RichText?</param>
        /// <param name="alignment">Text Position</param>
        /// <returns></returns>
        public static GUIStyle LinkStyle(Color normal, bool bold = false, int size = 12, bool richText = false, TextAnchor alignment = TextAnchor.MiddleLeft)
        {
            ColorUtility.TryParseHtmlString("#0a5756", out Color active);
            ColorUtility.TryParseHtmlString("#696969", out Color hover);

            var guistyle = new GUIStyle(GUI.skin.label);

            if (bold)
                guistyle.fontStyle = FontStyle.Bold;
            else
                guistyle.fontStyle = FontStyle.Normal;

            guistyle.fontSize = size;
            guistyle.richText = richText;
            guistyle.alignment = alignment;

            guistyle.normal.textColor = normal;
            guistyle.hover.textColor = hover;
            guistyle.active.textColor = active;

            return guistyle;
        }
    }
    public static class GUIExtentions
    {
        /// <summary>
        /// Editor GUI Custom Foldout Field
        /// </summary>
        /// <param name="property">Bool Value</param>
        /// <param name="name">Displayed Name</param>
        /// <param name="tooltip">Tool Tip</param>
        /// <param name="style">Default GUI Style is EditorStyles.boldLabel</param>
        /// <returns></returns>
        public static bool FoldoutField(this bool property, GUIContent content, GUIStyle style = null, bool isLastInRow = false)
        {
            if (style == null)
                style = EditorStyles.boldLabel;
            var ButtonGS = new GUIStyle(GUI.skin.label);
            ButtonGS.fontSize = 20;
            ButtonGS.alignment = TextAnchor.UpperCenter;
            string foldoutState;
            if (!property)
                foldoutState = "▹";
            else
                foldoutState = "▿";
            EditorGUILayout.Space();

            EditorGUILayout.BeginHorizontal();
            if (GUILayout.Button(foldoutState, ButtonGS, GUILayout.Width(25), GUILayout.Height(25)))
            {
                property = !property;
            }
            EditorGUILayout.LabelField(content, style, GUILayout.Height(25));
            var rect = GUILayoutUtility.GetLastRect();
            //rect.size = new Vector2(20, 20);
            //rect.y += 120;
            rect.x -= 80;
            rect.y -= 5;
            rect.height = 30;

            EditorGUILayout.EndHorizontal();

            rect.y += 5;
            if (!isLastInRow)
            {

                Handles.BeginGUI();
                Handles.DrawLine(
                    new Vector3(0, rect.y + rect.height),
                    new Vector3(Screen.width, rect.y + rect.height));
                Handles.EndGUI();

            }

            if (isLastInRow && property)
            {
                Handles.BeginGUI();
                Handles.DrawLine(
                    new Vector3(0, rect.y + rect.height),
                    new Vector3(Screen.width, rect.y + rect.height));
                Handles.EndGUI();
            }
            GUILayout.Space(15);

            return property;
        }
        /// <summary>
        /// Editor GUI Property Field
        /// </summary>
        /// <param name="property">SerializedProperty Value</param>
        /// <param name="name">Displayed Name</param>
        /// <param name="tooltip">Tool Tip</param>
        /// <param name="style">Default GUI Style is EditorStyles.miniLabel</param>
        /// <returns></returns>
        public static void PropertyField(this SerializedProperty property, string name, string tooltip = "", GUIStyle style = null)
        {
            if (style == null)
                style = EditorStyles.label;
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(new GUIContent(name, tooltip), style, GUILayout.Width(Screen.width / 4));
            EditorGUILayout.PropertyField(property, GUIContent.none);
            GUILayout.Space(3);
            EditorGUILayout.EndHorizontal();
        }
        /// <summary>
        /// Editor GUI Float Slider Field
        /// </summary>
        /// <param name="property">SerializedProperty Value</param>
        /// <param name="min">Min Float Value</param>
        /// <param name="max">Max Float Value</param>
        /// <param name="name">Displayed Name</param>
        /// <param name="tooltip">Tool Tip</param>
        /// <param name="style">Default GUI Style is EditorStyles.miniLabel</param>
        /// <returns></returns>
        public static void SliderField(this SerializedProperty property, float min, float max, string name, string tooltip = "", GUIStyle style = null)
        {
            if (style == null)
                style = EditorStyles.label;
            property.floatValue = EditorGUILayout.Slider(new GUIContent(name, tooltip), property.floatValue, min, max);
        }
        /// <summary>
        /// Logo Field
        /// </summary>
        /// <param name="logo">Texture 2D Logo</param>
        /// <param name="size">Logo displayed size</param>
        public static void DisplayLogo(this Texture2D logo, string tooltip = "", float division = 1)
        {
            EditorGUILayout.LabelField(new GUIContent(logo, tooltip), GUILayout.Height(logo.height / division));
        }
        public static void DrawPipelineGUI(this MenuPathsRenderPipeline pipeline, int position = 0)
        {
            if (position != 0)
                GUILayout.Space(10);
            EditorGUILayout.LabelField(pipeline.ToString() + " Render Pipeline", DEShadersStyles.LabelStyle(true));
            //var rect = GUILayoutUtility.GetLastRect();
            //Handles.BeginGUI();
            //Handles.DrawLine(new Vector3(0, rect.y + rect.height), new Vector3(375, rect.y + rect.height));
            //Handles.EndGUI();
            //GUILayout.Space(2);
            GUILayout.Space(5);
        }
    }
}
#endif
namespace DEShaders.Utils
{
    #region [DE Shader Extentions]
    public static class ShaderExtentions
    {
        /// <summary>
        /// Get Global float Shader Value
        /// </summary>
        /// <param name="property">Shader property name</param>
        /// <returns></returns>
        public static float GetGlobalFloat(this string property)
        {
            return Shader.GetGlobalFloat(property);
        }
        /// <summary>
        /// Set Global float Shader Value
        /// </summary>
        /// <param name="property">Shader property name</param>
        /// /// <param name="value">float value</param>
        /// <returns></returns>
        public static void SetGlobalFloat(this string property, float value)
        {
            Shader.SetGlobalFloat(property, value);
        }
        /// <summary>
        /// Set Global int Shader Value
        /// </summary>
        /// <param name="property">Shader property name</param>
        /// <param name="value">int value</param>
        /// <returns></returns>
        public static void SetGlobalInt(this string property, int value)
        {
            Shader.SetGlobalInt(property, value);
        }
    }
    #endregion
}