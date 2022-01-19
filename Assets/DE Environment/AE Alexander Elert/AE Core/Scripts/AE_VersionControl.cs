namespace AlexanderElert
{
    public static class SchematicVersionControl
    {
        public static readonly string VERSION = "3.0.0";
        public static readonly string LASTMODIFIED = "08.05.2021";
        public static readonly string CHANGELOG =

            "3.0.0 - 08.05.2021\n" +
            "- Updated information\n" +
            "- Bug Fix: AE Manager fails to import correct content Bug\n" +

            "2.0.1 - 03.16.2021\n" +
            "- Bug Fix\n" +
            
            "2.0.0 - 03.15.2021\n" +
            "- Updated scripts on all DE related assets, for better integration\n" +
            "- Add UnityEditor cases, so only relevant packages are shown in AE Manager" +
            
            "1.2.1 - 12.16.2020\n" +
            "- Fixed DE PathManager creation process\n" +
            "- Removed DE Environment related description\n" +
            "- Fixed AE Simplifier not showing up in GameObjects\n" +
            
            "1.2.0 - 12.16.2020\n" +
            "- AE Manager: CTRL + SHIFT + i => selection changes to DE Environment Path.asset\n" +
            "- AE Manager: Checked 2020.2 compability => OK\n" +
            
            "1.1.9 - 12.16.2020\n" +
            "- AE Manager: Initialized\n" +
            
            "1.1.3 - 12.01.2020\n" +
            "- Moved AE Version Control\n" +
            "- Renamed MenuItem\n" +
            
            "1.1.2 - 12.01.2020\n" +
            "- Created new cs for Version Control\n" +
            "- Created MenuItem => \"Window/Alexander Elert/Show Script Changelog\"\n" +
            
            "1.1.1 - 12.01.2020\n" +
            "- Created Version Control\n" +
            
            "1.1.0 - 12.01.2020\n" +
            "- Fixed Build Errors\n" +
            
            "1.0.0 - 12.01.2020\n" +
            "- Initial release";

#if UNITY_EDITOR
        [UnityEditor.MenuItem("Window/Alexander Elert/Show Script Version Control")]
        public static void ShowChangelog()
        {
            UnityEditor.EditorUtility.DisplayDialog(
                "Alexander Elert Script Version Control",
                "Current Version: " + VERSION + "\n\n" +
                "Last Modified: " + LASTMODIFIED + "\n\n" +
                "Changelog:\n" + CHANGELOG,
                "ok"
                );
        }
#endif
    }
}
