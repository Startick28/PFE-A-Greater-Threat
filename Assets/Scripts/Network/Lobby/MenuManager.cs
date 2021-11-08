using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MenuManager : MonoBehaviour
{
    public static MenuManager Instance;

    private void Awake()
    {
        Instance = this;
    }

    [SerializeField] Menu[] menus;

    public void OpenMenu(string menuName)
    {
        for (int i = 0; i  < menus.Length;i++)
        {
            if(menus[i].menuName == menuName)
            {
                menus[i].OpenMenu();
            }
            else if(menus[i].Open)
            {
                CloseMenu(menus[i]);
            }  
        }
    }

    public void OpenMenu(Menu menu)
    {
        CloseAllMenuOpened();
        menu.OpenMenu();
    }
    public void CloseMenu(Menu menu)
    {
        menu.CloseMenu();
    }

    public void CloseAllMenuOpened()
    {
        for (int i = 0; i < menus.Length; i++)
        {
            if (menus[i].Open)
            {
                CloseMenu(menus[i]);
            }
        }
    }

}
