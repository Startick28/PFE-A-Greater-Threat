using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace BehaviourTreeAI {

    public class SubTree : Node {
        public Node child;

        protected override void OnStart() {

        }

        protected override void OnStop() {

        }

        protected override State OnUpdate() {
            return child.Update();
        }

        public override Node Clone() {
            SubTree node = Instantiate(this);
            node.child = child.Clone();
            return node;
        }
    }
}