using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class RandomAmountOfRepeat : DecoratorNode
{
    public int minAmountOfRepeats = 1;
    public int maxAmountOfRepeats = 1;

    int amountOfRepeats;
    int alreadyRepeated = 0;

    protected override void OnStart() {
        amountOfRepeats = Random.Range(minAmountOfRepeats, maxAmountOfRepeats+1);
        alreadyRepeated = 0;
    }

    protected override void OnStop() {

    }

    protected override State OnUpdate() {
        switch (child.Update()) {
            case State.Running:
                break;
            case State.Failure:
                return State.Failure;
            case State.Success:
                alreadyRepeated++;
                if (alreadyRepeated == amountOfRepeats) return State.Success;
                break;
        }
        return State.Running;
    }
}
