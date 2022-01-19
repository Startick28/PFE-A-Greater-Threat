namespace DEShaders
{
    public static class SchematicVersionControl
    {
        public static readonly string VERSION = "2.1.0";
        public static readonly string LASTMODIFIED = "04.13.2021";
        public static readonly string CHANGELOG =

            "2.1.0 - 04.13.2021\n" +
            "- Added FPS Controller for Demo Scene\n" +
            "- Added Fade Wind Distance to Global Controller\n" +
            "- Added TVE & DE Mask for Texture Combiner\n" +
            "- Added AO Target selection\n" +
            "- Added Show On Startup Popup\n" +
            "- Added Beep on finish Import toggle\n"+
            "- Added Unity Version Support for 2021.x cycle\n" +
            "- Bug fix\n\n" +
            
            "2.0.0 - 03.15.2021\n" +
            "- Updated scripts on all DE related assets, for better integration\n" +
            "- Bug fix\n\n" +
            
            "1.2.0 - 03.12.2021\n" +
            "- Updated Scripts working with Unity 2020.3\n" +
            "- Fixed Missing Logo in Preview Manager\n" +
            "- Mesh Tool added repair entire scene!\n" +
            "- Minor adjustments\n" +
            "- Fixed Vertex Color resetting AO to 0 instead to 1\n" +
            "- Added DE Environment links to Mesh Tool\n" +
            "- Added Logo from Menu Paths to Mesh Tool\n" +
            "- Fixed Vertex Color Bug when no Vertex Colors added\n" +
            "- Added Warning when AO or Vertex Colors are reseted\n" +
            "- Added Information to Menu Path ScrObj for 5 individual Tabs\n" +
            "- Added Rich Text support!\n" +
            "https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/StyledText.html \n\n" +

            "1.1.0 - 01.05.2021\n" +
            "- Fixed minor HDRP / URP Setup\n" +
            "- Fixed Open Scene not saving via DE Manager\n" +
            "- Limited packages/demos only to the corresponding Unity Editor Year\n" +
            "- Minor Changes\n" +
            "- changed MenuItem order\n" +
            "- fixed misspelling\n" +
            "- Moved AE Version Control\n" +
            "- Renamed MenuItem\n" +
            "- Created new cs for Version Control\n" +
            "- Created MenuItem => \"Window/DE Environment/Show Script Changelog\"\n" +
            "- Created Version Control\n" +
            "- Fixed Build Errors\n\n" +

            "1.0.0 - 12.01.2020\n" +
            "- Initial release\n";



#if UNITY_EDITOR
        [UnityEditor.MenuItem("Window/DE Environment/Tools/Show Script Version Control", priority = 41)]
        public static void ShowChangelog()
        {
            UnityEditor.EditorUtility.DisplayDialog(
                "DE Environment Script Version Control",
                "Current Version: " + VERSION + "\n\n" +
                "Last Modified: " + LASTMODIFIED + "\n\n" +
                "Changelog:\n" + CHANGELOG,
                "ok"
                );
        }
#endif
    }
}