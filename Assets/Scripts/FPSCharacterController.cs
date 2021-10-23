using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CMF;


public class FPSCharacterController : AdvancedWalkerController
{
	[SerializeField]
	CameraController cameraController;
	[SerializeField]
	FPS_CameraController fcameraController;

	FPS_Mover fMover;
	FPS_CharacterInput fcharacterInput;

	BasicGun gun;


	bool previousCrouch;
	bool previousRun;
	bool previousFire;

	void Awake()
	{
		mover = GetComponent<Mover>();
		fMover = GetComponent<FPS_Mover>();
		tr = transform;
		characterInput = GetComponent<CharacterInput>();
		fcharacterInput = GetComponent<FPS_CharacterInput>();
		ceilingDetector = GetComponent<CeilingDetector>();

		gun = GetComponentInChildren<BasicGun>();

		if (characterInput == null)
			Debug.LogWarning("No character input script has been attached to this gameobject", this.gameObject);
		previousCrouch = false;
		previousRun = false;
		Setup();

		

	}

	void Update()
	{
		HandleJumpKeyInput();

		if(fcharacterInput.isFireKeyPressed())
        {
			if(!previousFire)
            {
				//fire();
				gun.fire(cameraTransform.position,cameraController.GetAimingDirection());
				previousFire = true;
			}
            else
            {
				
            }
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
			if(previousRun)
            {
				movementSpeed /= 2;
				previousRun = false;
			}

		}

		//Debug.L


		if (fcharacterInput.isCrouchKeyPressed())
        {
			//Debug.Log("iuze");
			if(!previousCrouch)
            {
				mover.SetColliderHeight(1.0f);
				cameraController.transform.Translate(0, -1, 0);
				transform.Translate(0, -1, 0);
			}
			
			previousCrouch = true;
        }
        else
        {
			if(previousCrouch)
            {
				mover.SetColliderHeight(2.0f);
				cameraController.transform.Translate(0, 1, 0);
				transform.Translate(0, 1, 0);
				previousCrouch = false;
			}
			
		}

		if(fcharacterInput.isReloadKeyPressed())
        {
			gun.reload();
        }

		if(fcharacterInput.isZoomKeyPressed())
        {
			fcameraController.zoom();
        }
		else
        {
			fcameraController.unZoom();
        }
		
	}


	




	// Update is called once per frame

}
