using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class SetCooldown : ActionNode
{
    public Blackboard.AttackType attackType = Blackboard.AttackType.NONE;
    public float cooldown;

    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        switch (attackType)
        {
            case Blackboard.AttackType.clawAttack : blackboard.clawAttackCD = cooldown; break;
            case Blackboard.AttackType.disengageJump : blackboard.disengageJumpCD = cooldown; break;
            case Blackboard.AttackType.jumpBiteAttack : blackboard.jumpBiteAttackCD = cooldown; break;
            case Blackboard.AttackType.GT_ComboHitAttack : blackboard.GT_ComboHitAttackCD = cooldown; break;
            case Blackboard.AttackType.GT_HeavyClawAttack : blackboard.GT_heavyClawAttackCD = cooldown; break;
            case Blackboard.AttackType.GT_JumpAttack : blackboard.GT_JumpAttackCD = cooldown; break;
            default: break;
        }
        return State.Success;
    }
}
