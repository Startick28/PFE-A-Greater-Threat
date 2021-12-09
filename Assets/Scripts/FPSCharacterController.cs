using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CMF;
using Photon.Pun;
using Photon.Realtime;
using Photon.Pun.Demo.PunBasics;

public class FPSCharacterController : AdvancedWalkerController
{
	[SerializeField]
	CameraController cameraController;
	[SerializeField]
	FPS_CameraController fcameraController;

	FPS_Mover fMover;
	FPS_CharacterInput fcharacterInput;

	public Interactable nearestInteractable;

	BasicGun gun;

	[SerializeField]
	float maxHealth = 100;
	float health;

	//PhotonView view;

	bool previousCrouch;
	bool previousRun;
	bool previousFire;
	bool isInteracting;

	float soundEmissionTime = 2;
	float timeSinceSoundEmission;

	void Awake()
	{
		timeSinceSoundEmission = soundEmissionTime + 1;
		Cursor.visible = false;
		mover = GetComponent<Mover>();
		fMover = GetComponent<FPS_Mover>();
		tr = transform;
		characterInput = GetComponent<CharacterInput>();
		fcharacterInput = GetComponent<FPS_CharacterInput>();
		ceilingDetector = GetComponent<CeilingDetector>();

		health = maxHealth;
		gun = GetComponentInChildren<BasicGun>();

		nearestInteractable = null;

		if (characterInput == null)
			Debug.LogWarning("No character input script has been attached to this gameobject", this.gameObject);
		previousCrouch = false;
		previousRun = false;
		Setup();
		
		//view = GetComponent<PhotonView>();

	}

	void Update()
	{
        if (GetComponent<PhotonView>().IsMine)
		{
            if (Input.GetKeyDown(KeyCode.P))
            {
				UIManager ui = UnityEngine.Object.FindObjectsOfType<UIManager>()[0];
				ui.LoseHealth();
			}
		if(fcharacterInput.GetHorizontalMovementInput() != 0 || fcharacterInput.GetVerticalMovementInput() != 0)
        {
			if(timeSinceSoundEmission> soundEmissionTime)
            {
				emitSound();
				timeSinceSoundEmission = 0;
            }
            else
            {

            }


        }
		timeSinceSoundEmission += Time.deltaTime;
       

			HandleJumpKeyInput();

		if(fcharacterInput.isInteractKeyPressed() && nearestInteractable != null)
		{
			
				if(nearestInteractable.canInteract)
                {
					switch(nearestInteractable.iType)
                    {
						case InteractionType.chest:
							GetComponent<PhotonView>().RPC("InteractWithInteractable", RpcTarget.All);
							Debug.Log("Je peux interargir avec le coffre");
							//nearestInteractable.interact();
							break;
						case InteractionType.gun:
							GetComponent<PhotonView>().RPC("InteractWithInteractable", RpcTarget.All);
							Debug.Log("Je peux interargir avec le gun");
							//nearestInteractable.interact();
							break;
						default:

							break;
                    }
                }
			
		}

			if (fcharacterInput.isFireKeyPressed())
			{
			/*if (!previousFire)
			{
				//fire();
				gun.fire(cameraTransform.position, cameraController.GetAimingDirection());
				previousFire = true;
			}
			else
			{

			}*/
			gun.fire(cameraTransform.position, cameraController.GetAimingDirection());
			//Debug.Log("Pan");

		}
			else
			{
				previousFire = false;
			}


			if (fcharacterInput.isRunKeyPressed())
			{
				if (!previousRun)
				{
					movementSpeed *= 2;
					previousRun = true;

					//movementSpeed
				}
				//Debug.Log("is running");
			}
			else
			{
				if (previousRun)
				{
					movementSpeed /= 2;
					previousRun = false;
				}

			}

			//Debug.L


			if (fcharacterInput.isCrouchKeyPressed())
			{
				//Debug.Log("iuze");
				if (!previousCrouch)
				{
					mover.SetColliderHeight(1.0f);
					cameraController.transform.Translate(0, -1, 0);
					transform.Translate(0, -1, 0);
				}

				previousCrouch = true;
			}
			else
			{
				if (previousCrouch)
				{
					mover.SetColliderHeight(2.0f);
					cameraController.transform.Translate(0, 1, 0);
					transform.Translate(0, 1, 0);
					previousCrouch = false;
				}

			}

			if (fcharacterInput.isReloadKeyPressed())
			{
			
				gun.reload();
			}

			if (fcharacterInput.isZoomKeyPressed())
			{
				fcameraController.zoom();
			}
			else
			{
				fcameraController.unZoom();
			}

		}
		
	}

	[PunRPC]
	public void InteractWithInteractable()
    {
		nearestInteractable.interact();
	}
	
	public Vector3 getAimingDirection()
    {
		return cameraController.GetAimingDirection();

	}

	public void emitSound()
    {
		if(fcharacterInput.isRunKeyPressed())
        {
			Debug.Log("Player emitted running sound");
        }
		else if(fcharacterInput.isCrouchKeyPressed())
        {
			Debug.Log("Player emitted crouching sound");
		}
        else
        {
			Debug.Log("Player emitted walking sound");
		}
    }

	public void takeDamage(float damage)
    {
		health -= damage;
		if(health<=0)
        {
			die();
        }
    }

	void die()
    {
		Debug.Log("Died");
    }
	// Update is called once per frame

	public void changeGun(BasicGun newGun)
    {
		BasicGun playerGun = GetComponentInChildren<BasicGun>();
		Vector3 oldPos = newGun.transform.position;
		// On met le nouveau gun sur le joueur
		newGun.transform.position = playerGun.transform.position;
		newGun.transform.parent = playerGun.transform.parent;
		newGun.transform.rotation = playerGun.transform.rotation;
		newGun.GetComponent<BoxCollider>().enabled = false;
		// Player layer
		newGun.gameObject.layer = 3;
		newGun.View = transform.gameObject.GetComponent<PhotonView>();

		// On enlève l'ancien gun du joueur
		playerGun.transform.parent = null;
		playerGun.transform.position = oldPos;
		playerGun.canInteract = true;
		playerGun.gameObject.layer = 0;
		playerGun.GetComponent<BoxCollider>().enabled = true;
	}
}
