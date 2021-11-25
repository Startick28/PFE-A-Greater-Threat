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

	//PhotonView view;

	bool previousCrouch;
	bool previousRun;
	bool previousFire;
	bool isInteracting;

	void Awake()
	{
		Cursor.visible = false;
		mover = GetComponent<Mover>();
		fMover = GetComponent<FPS_Mover>();
		tr = transform;
		characterInput = GetComponent<CharacterInput>();
		fcharacterInput = GetComponent<FPS_CharacterInput>();
		ceilingDetector = GetComponent<CeilingDetector>();

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
       // if (view.IsMine)
	//	{
			HandleJumpKeyInput();

		if(fcharacterInput.isInteractKeyPressed() && nearestInteractable != null)
		{
			
				if(nearestInteractable.canInteract)
                {
					switch(nearestInteractable.iType)
                    {
						case InteractionType.chest:
							nearestInteractable.interact();
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

	//	}
		
	}


	
	public Vector3 getAimingDirection()
    {
		return cameraController.GetAimingDirection();

	}



	// Update is called once per frame

}
