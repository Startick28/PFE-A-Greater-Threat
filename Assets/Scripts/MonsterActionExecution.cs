using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterActionExecution : MonoBehaviour
{
    static int nextID = 0;


    private int _monsterID;
    public int MonsterID { get {return _monsterID;} private set{} }


    void Start()
    {
        _monsterID = nextID;
        nextID++;
    }

    public void MoveToPosition(Vector3 position, bool isRunning = false) {}

    public void BiteAttack() {}

    public void ClawsAttack() {}

    public void ClawsAttackRight() {}

    public void ClawsAttackLeft() {}

    public void JumpBiteAttack() {}

    public void SpitAttack() {}

    // side : side towards which the monster is jumping. Back 0, Front 1, Left 2, Right 3
    public void Jump(int side) {}

    public void Idle(int idleType) {}

    
     // side : side from which the monster got hit. Back 0, Front 1, Left 2, Right 3
    public void GetHit(int side) {} 

    public void Die() {}
}
