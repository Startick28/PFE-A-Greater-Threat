using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GoalManager : MonoBehaviour
{
    public enum GoalType
    {
        Dome,
        StationOpening,
        CenterRoomOpening,
        LegendaryLoot,
        Other
    }

    [System.Serializable]
    public struct Goal
    {
        public Transform goalTransform;
        public GoalType type;
        public float priorityMultiplier;
        public float currentPriority;
    }

    public List<Goal> goals;

    [SerializeField] private float maxDangerPlayerDistance = 50f;
    [SerializeField] private float minDangerPlayerDistance = 700f;
    [SerializeField] private float maxDangerMonsterDistance = 300f;
    [SerializeField] private float minDangerMonsterDistance = 1000f;

    [SerializeField] private float playerAsCloseDistance = 100f; //Distance gap at which you considere that two players are about as close as the same objective
    [SerializeField] private float playerTooFarDistance = 350; //Distance above which a player isn't considered to be bothered by the GT for the chosen goal

    private Vector2 playerModifiers = new Vector2(0.25f,4f);
    private Vector2 monsterDistanceModifiers = new Vector2(0.8f,1.2f);
    
    [SerializeField] private float updateFrequency = 1f;
    private float updateTimer;

    private List<Transform> players;
    private List<int> lastVisitedOrder;

    public float monsterProximityDistance = 200; // How close do you considere the monster is near a player?
    public float maxIrruptionTime = 60f;
    private Vector3 currentGoal;
    private float currentGoalTime;


    void Start()
    {
        players = new List<Transform>();
        lastVisitedOrder = new List<int>();
        InitPlayers();
        updateTimer = updateFrequency;
    }

    void Update()
    {
        updateTimer -= Time.deltaTime;
        if (updateTimer <= 0)
        {
            updateTimer += updateFrequency;
            UpdateGoals();
        }
    }

    private void UpdateGoals()
    {
        for (int i = 0; i < goals.Count; i++)
        {
            goals[i] = ComputePriority(goals[i]);
        }
    }

    // Computes the priority of a goal : the current priority will depend on the proximity of the players to that goal
    // and on the goal type.
    // The last visited players are ignored, and the probability of visiting recently visited players is lowered by up to 60%
    public Goal ComputePriority(Goal goal)
    {
        float playerModifier = 1;
        foreach (Transform player in players)
        {
            playerModifier *= Mathf.Lerp(playerModifiers[1], playerModifiers[0], (Vector3.Distance(goal.goalTransform.position, player.position) - maxDangerPlayerDistance) / (minDangerPlayerDistance - maxDangerPlayerDistance) );
        }
        float distanceModifier = Mathf.Lerp(monsterDistanceModifiers[1], monsterDistanceModifiers[0], (Vector3.Distance(goal.goalTransform.position, transform.position) - maxDangerMonsterDistance) / (minDangerMonsterDistance - maxDangerMonsterDistance) );
        goal.currentPriority = goal.priorityMultiplier * distanceModifier * playerModifier; 
        

        float closestPlayerDistance = Vector3.Distance(players[0].position, goal.goalTransform.position);
        int closestPlayer = 0;
        for (int i = 1; i < players.Count; i++)
        {
            if (Vector3.Distance(players[i].position, goal.goalTransform.position) < closestPlayerDistance)
            {
                closestPlayerDistance = Vector3.Distance(players[i].position, goal.goalTransform.position);
                closestPlayer = i;
            }
        }
        
        switch (lastVisitedOrder[closestPlayer])
        {
            case 0: goal.currentPriority *= 0f; break;
            case 1: goal.currentPriority *= 0.6f; break;
            case 2: goal.currentPriority *= 0.8f; break;
            default: break;
        }
        return goal;
    }

    // Selects a goal randomly (depending on the priorities) and set it as the current goal.
    // When a goal is chosen, we update the list of last visited players by determining the closest player from the objective and 
    // other players that are about as close as him.
    public void ChoseNewGoal()
    {
        if (players.Count == 0f)
        {
            InitPlayers();
        }
        float totalPriority = 0f;
        foreach (Goal goal in goals)
        {
            totalPriority += goal.currentPriority;
        }

        float chosenGoal = Random.Range(0f,totalPriority);

        float tmp = 0;
        foreach (Goal goal in goals)
        {
            tmp += goal.currentPriority;
            if (tmp >= chosenGoal)
            {
                float closestPlayerDistance = Vector3.Distance(players[0].position, goal.goalTransform.position);
                for (int i = 1; i < players.Count; i++)
                {
                    if (Vector3.Distance(players[i].position, goal.goalTransform.position) < closestPlayerDistance)
                    {
                        closestPlayerDistance = Vector3.Distance(players[i].position, goal.goalTransform.position);
                    }
                }
                float playersBothered = 0;
                for (int i = 0; i < players.Count; i++)
                {
                    // The closest players from the chosen objective are set as the last visited players
                    if (closestPlayerDistance <= Vector3.Distance(players[i].position, goal.goalTransform.position) + playerAsCloseDistance && Vector3.Distance(players[i].position, goal.goalTransform.position) < playerTooFarDistance && playersBothered < players.Count - 1)
                    {
                        lastVisitedOrder[i] = 0;
                        playersBothered++;
                    }
                    else
                    {
                        lastVisitedOrder[i] = Mathf.Clamp(lastVisitedOrder[i] + 1, 0, 3);
                    }
                }

                currentGoal = goal.goalTransform.position;
                return;
            } 
        }
    }

    public Vector3 GetCurrentGoal()
    {
        //Debug.Log(currentGoal);
        return currentGoal;
    }

    public bool IsGoalTimerUp()
    {
        return (Time.time - currentGoalTime) >= maxIrruptionTime;
    }

    public void ResetGoalTimer()
    {
        currentGoalTime = Time.time;
    }

    public bool IsAnyPlayerClose()
    {
        foreach (Transform playerT in players)
        {
            if (Vector3.Distance(playerT.position, transform.position) <= monsterProximityDistance) return true;
        }
        return false;
    }

    private void InitPlayers()
    {
        foreach (GameObject obj in GameObject.FindGameObjectsWithTag("Player"))
        {
            players.Add(obj.transform);
            lastVisitedOrder.Add(3);
        }
    }
}
