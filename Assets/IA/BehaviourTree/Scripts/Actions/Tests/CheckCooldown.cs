using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class CheckCooldown : ActionNode
{
    public Blackboard.AttackType attackType = Blackboard.AttackType.NONE;

    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        switch (attackType)
        {
            case Blackboard.AttackType.clawAttack : 
                if (blackboard.clawAttackCD <= 0) return State.Success; 
                break;
            case Blackboard.AttackType.disengageJump : 
                if (blackboard.disengageJumpCD <= 0) return State.Success; 
                break;
            case Blackboard.AttackType.jumpBiteAttack : 
                if (blackboard.jumpBiteAttackCD <= 0) return State.Success; 
                break;
            case Blackboard.AttackType.GT_ComboHitAttack : 
                if (blackboard.GT_ComboHitAttackCD <= 0) return State.Success; 
                break;
            case Blackboard.AttackType.GT_HeavyClawAttack : 
                if (blackboard.GT_heavyClawAttackCD <= 0) return State.Success; 
                break;
            case Blackboard.AttackType.GT_JumpAttack : 
                if (blackboard.GT_JumpAttackCD <= 0) return State.Success; 
                break;
            default: break;
        }
        return State.Failure;
    }
}
