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
	SoundEmitter soundEmitter;

	public Interactable nearestInteractable;

	BasicGun gun;

	[SerializeField]
	Avatar gunHandsAvatar;
	[SerializeField]
	Avatar machineGunHandsAvatar;

	[SerializeField]
	float maxHealth = 100;
	float health;

	//PhotonView view;

	bool previousCrouch;
	bool previousRun;
	bool previousFire;
	bool isInteracting;
	bool previousReload;
	bool isFastReloading;
	bool isFullReloading;

	float soundEmissionTime = 2;
	float timeSinceSoundEmission;
	[SerializeField]
	float timeToFullReload = 0.75f;
	float timeSincePressedReloadKey;
	[SerializeField]
	int pistolBullets = 100; //Nombre de balles qu'il a dans son inventaire

	[SerializeField]
	Animator modelAnimator;

	[SerializeField]
	Animator weaponAnimator;

	bool currentWeaponEquipped;
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
		soundEmitter = GetComponent<SoundEmitter>();

		health = maxHealth;
		gun = GetComponentInChildren<BasicGun>();

		nearestInteractable = null;

		if (characterInput == null)
			Debug.LogWarning("No character input script has been attached to this gameobject", this.gameObject);
		previousCrouch = false;
		previousRun = false;
		currentWeaponEquipped = false;
		previousReload = false;
		isFastReloading = false;
		isFullReloading = false;
		timeSincePressedReloadKey = 0;
		//weaponAnimator.gameObject.SetActive(false);
		Debug.Log(pistolBullets);
		//weaponAnimator.avatar = gunHandsAvatar;
		Setup();
		
		//view = GetComponent<PhotonView>();

	}

	void Update()
	{
		
		
		
        if (GetComponent<PhotonView>().IsMine)
		{
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

							//nearestInteractable.interact();
							break;

						default:

							break;
                    }
                }
			
		}
			if (Input.GetKeyDown(fcharacterInput.equipKey))
			{
				if (currentWeaponEquipped)
				{
					//currentWeaponEquipped = false;
					weaponAnimator.SetTrigger("unequip");
				}
				else
				{
					//weaponAnimator.gameObject.SetActive(true);
					weaponAnimator.SetTrigger("equip");

					//currentWeaponEquipped = true;
				}

			}

			if (fcharacterInput.isFireKeyPressed() && currentWeaponEquipped)
			{

				if (gun.isReadyToFire)
				{
					if (gun.fire(cameraTransform.position, cameraController.GetAimingDirection()))
					{
						weaponAnimator.SetTrigger("fire");
					}

				}

				weaponAnimator.SetBool("isFiring", true);
				//gun.fire(cameraTransform.position, cameraController.GetAimingDirection());


			}
			else
			{
				if(currentWeaponEquipped)
                {
					weaponAnimator.SetBool("isFiring", false);
                }
				
			}
			if (fcharacterInput.isReloadKeyPressed() && currentWeaponEquipped )
			{
				if(previousReload && (!isFastReloading && !isFullReloading) && timeSincePressedReloadKey >=timeToFullReload && gun.canReload)
                {
					weaponAnimator.SetFloat("reloadSpeed", 1);
					weaponAnimator.SetTrigger("reload");
					isFullReloading = true;
					timeSincePressedReloadKey = 0;
					
				}
				else if(!previousReload && !isFastReloading)
                {
					
				}

				timeSincePressedReloadKey += Time.deltaTime;
				//gun.reload();


				previousReload = true;
			}
			else if(!fcharacterInput.isReloadKeyPressed() && currentWeaponEquipped )
            {
				if(previousReload && (!isFastReloading && !isFullReloading) && timeSincePressedReloadKey != 0 && gun.canReload)
                {
					weaponAnimator.SetFloat("reloadSpeed", 1);
					weaponAnimator.SetTrigger("reload");
					isFastReloading = true;
					//weaponAnimator.get
					timeSincePressedReloadKey = 0;
				}
				else if(previousReload && isFullReloading)
                {
					//weaponAnimator.SetFloat("reloadSpeed", 2);
					weaponAnimator.SetTrigger("aim");
					isFullReloading = false;
				}

				previousReload = false;
            }

			if (fcharacterInput.isZoomKeyPressed())
			{
				fcameraController.zoom();
			}
			else
			{
				fcameraController.unZoom();
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
			//Debug.Log("Player emitted running sound");
			soundEmitter.Emit(30f, 10f, SoundEmissionType.PlayerSound);
        }
		else if(fcharacterInput.isCrouchKeyPressed())
        {
			//Debug.Log("Player emitted crouching sound");
			soundEmitter.Emit(5f, 10f, SoundEmissionType.PlayerSound);
		}
        else
        {
			//Debug.Log("Player emitted walking sound");
			soundEmitter.Emit(15f, 10f, SoundEmissionType.PlayerSound);
		}
    }

	public void takeDamage(float damage)
    {
		health -= damage;
		PhotonNetwork.LocalPlayer.CustomProperties["HP"] = health;
		PhotonNetwork.SetPlayerCustomProperties(PhotonNetwork.LocalPlayer.CustomProperties);
		if (health<=0)
        {
			die();
        }
    }

	void die()
    {
		Debug.Log("Died");
    }
	// Update is called once per frame


	public void addRecoilToCamera(float verticalAngle,float horizontalAngle)
    {
		fcameraController.addRecoil(verticalAngle,horizontalAngle);
	}

	public void onEquip()
	{
		//Debug.Log("equipped");
		currentWeaponEquipped = true;
		weaponAnimator.ResetTrigger("equip");
		weaponAnimator.ResetTrigger("reload");
		isFullReloading = false;
		isFastReloading = false;
	}

	public void onUnEquip()
	{
		//Debug.Log("");
		//Debug.Log("Unequipped");
		currentWeaponEquipped = false;
		weaponAnimator.ResetTrigger("unequip");
		weaponAnimator.ResetTrigger("reload");
		isFullReloading = false;
		isFastReloading = false;
		//weaponAnimator.gameObject.SetActive(false);
	}

	public void onFire()
	{

		weaponAnimator.ResetTrigger("fire");
		weaponAnimator.ResetTrigger("reload");

		isFullReloading = false;
		isFastReloading = false;
	}
	public void onReloadComplete()
	{
		// A complèter quand on aura plusieurs types d'armes
		int difference = gun.MagSize - gun.LoadedBullets;
		int fastDifference = pistolBullets - gun.MagSize;
		int fullDifference = pistolBullets - difference;
		Debug.Log(fastDifference);
		Debug.Log(fullDifference);
		if (isFastReloading)
		{
			if (fastDifference >= 0)
			{
				gun.reload(difference);
				pistolBullets -= gun.MagSize;
			}
			else
			{
				gun.reload(pistolBullets);
				pistolBullets = 0;
			}

			//gun.reload()
		}
		else if (isFullReloading)
		{
			if (fullDifference >= 0)
			{
				gun.reload(difference);
				pistolBullets -= difference;
			}
			else
			{
				gun.reload(pistolBullets);
				pistolBullets = 0;
			}
		}
		//	Debug.Log(pistolBullets);
		//gun.reload();
		weaponAnimator.ResetTrigger("reload");
		isFullReloading = false;
		isFastReloading = false;

	}

	public void onSlowDownReload()
	{
		if (isFastReloading)
		{
			weaponAnimator.SetFloat("reloadSpeed", 0.02f);

		}
		else if (isFullReloading)
		{
			weaponAnimator.SetFloat("reloadSpeed", 0.01f);
		}

	}

	public void onSpeedUpReload()
	{
		if (isFastReloading)
		{
			weaponAnimator.SetFloat("reloadSpeed", 1);

		}
		else if (isFullReloading)
		{
			weaponAnimator.SetFloat("reloadSpeed", 1);
		}
	}
}
