/*  
    © by Daniel Wipf, 09 November 2020
    support: daniel@twigly.ch
    https://www.youtube.com/watch?v=4nC8WjPFnGU
*/
#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;
using System;

/// <summary>
/// Single Line Texture Property Drawer
/// </summary>
public class SingleLineTexture : MaterialPropertyDrawer
{
	public override void OnGUI(Rect position, MaterialProperty prop, String label, MaterialEditor editor)
	{
		EditorGUI.BeginChangeCheck();
		EditorGUI.showMixedValue = prop.hasMixedValue;

		Texture value = editor.TexturePropertyMiniThumbnail(position, prop, label, string.Empty);

		EditorGUI.showMixedValue = false;
		if (EditorGUI.EndChangeCheck())
		{
			prop.textureValue = value;
		}
	}
}
#endif