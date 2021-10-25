using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Menu : MonoBehaviour
{
    public string menuName;

    private bool open = false;
    public bool Open
    {
        get { return open; }
        set { open = value; }
    }

    public void OpenMenu()
    {
        open = true;
        gameObject.SetActive(true);
    }

    public void CloseMenu()
    {
        open = false;
        gameObject.SetActive(false);
    }
}
