using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CMF;
using Photon.Pun;
using Photon.Realtime;
using Photon.Pun.Demo.PunBasics;
using System;

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

	//BasicGun gun;

	[SerializeField]
	Avatar gunHandsAvatar;
	[SerializeField]
	Avatar machineGunHandsAvatar;

	[SerializeField]
	float maxHealth = 100;
	[SerializeField]
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
	bool Died;

	
	Animator weaponAnimator = null;

	bool currentWeaponEquipped;

	bool currentlyWalking = false;
	bool previouslyWalking = false;
	bool previousJump;


	List<BasicGun> weapons = new List<BasicGun>();
	[SerializeField]
	TP_Model_Monitor tpMonitor;

	[SerializeField]
	GameObject[] fpsModels;

	int currentWeaponIndex;

	int[] ammunitions = new int[2];

	Transform targetDied;

	void Awake()
	{
        if (GetComponent<PhotonView>().IsMine)
        {
			Died = false;
			gameObject.AddComponent<AudioListener>();
        }
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
		//gun = GetComponentInChildren<BasicGun>();
		
		//weapons.Add(GetComponentInChildren<BasicGun>());
		//weapons.Add(GetComponentsInChildren<BasicGun>()[1]);

		nearestInteractable = null;
		currentWeaponIndex = 0;
		if (characterInput == null)
			Debug.LogWarning("No character input script has been attached to this gameobject", this.gameObject);
		previousCrouch = false;
		previousRun = false;
		currentWeaponEquipped = false;
		previousReload = false;
		isFastReloading = false;
		isFullReloading = false;
		previousJump = false;
		timeSincePressedReloadKey = 0;
		modelAnimator.SetLayerWeight(1, 0);

		if(weapons.Count != 0)
        {
		
			weaponAnimator = fpsModels[0].GetComponent<Animator>();
			SetChildrenActive(weaponAnimator.gameObject, true);

			SetChildrenActive(fpsModels[1], false);
		}
		else
        {
			SetChildrenActive(fpsModels[0], false);

			SetChildrenActive(fpsModels[1], false);
		}



		//Do this for first person
		//SetRendererInChildrenActive(modelAnimator.gameObject, false);
		//Do this for the view of other player
		/*foreach(GameObject go in fpsModels)
        {
			SetRendererInChildrenActive(modelAnimator.gameObject, false);
		}*/
		


		//weaponAnimator.gameObject.SetActive(false);
		Debug.Log(pistolBullets);
		//weaponAnimator.avatar = gunHandsAvatar;

		modelAnimator.SetTrigger("idle");
		Setup();
		
		//view = GetComponent<PhotonView>();

	}

	void Update()
	{
		float scroll = fcharacterInput.getCurrentMouseScroll();
        if (!Died)
		{
			if (scroll != 0)
			{
				switchWeapon(scroll);
			}

			if (fcharacterInput.GetHorizontalMovementInput() != 0 || fcharacterInput.GetVerticalMovementInput() != 0)
			{
				currentlyWalking = true;
			}
			else
			{
				currentlyWalking = false;

			}

			if (currentlyWalking)
			{
				if (!previouslyWalking)
				{
					modelAnimator.SetBool("walking", true);
				}
			}
			else
			{
				if (previouslyWalking)
				{
					modelAnimator.SetBool("walking", false);
				}
			}



			if (GetComponent<PhotonView>().IsMine)
			{
				if (Input.GetKeyDown(KeyCode.N))
				{
					gameObject.GetComponent<PhotonView>().RPC("TestDeath", RpcTarget.All);
					PhotonNetwork.LocalPlayer.CustomProperties["HP"] = health;
					PhotonNetwork.SetPlayerCustomProperties(PhotonNetwork.LocalPlayer.CustomProperties);
				}
				if (fcharacterInput.GetHorizontalMovementInput() != 0 || fcharacterInput.GetVerticalMovementInput() != 0)
				{
					if (timeSinceSoundEmission > soundEmissionTime)
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

				if (fcharacterInput.isInteractKeyPressed() && nearestInteractable != null)
				{

					if (nearestInteractable.canInteract)
					{
						switch (nearestInteractable.iType)
						{
							case InteractionType.chest:
								// Cette ligne permet d'executer la fonction
								GetComponent<PhotonView>().RPC("InteractWithChest", RpcTarget.All, nearestInteractable.GetComponent<Chest>().Id);
								Debug.Log("Je peux interargir avec le coffre");
								//nearestInteractable.interact();
								break;
							case InteractionType.gun:
								GetComponent<PhotonView>().RPC("InteractWithInteractable", RpcTarget.All);
								Debug.Log("Je peux interargir avec le gun");
								//nearestInteractable.interact();
								break;
							case InteractionType.ammunition:
								Debug.Log("Je peux interargir avec les munitions");
								//GetComponent<PhotonView>().RPC("InteractWithInteractable", RpcTarget.All);
								nearestInteractable.interact(this);
								break;
							case InteractionType.player:
								Debug.Log("Je peux interargir avec le player");
								GetComponent<PhotonView>().RPC("InteractWithInteractable", RpcTarget.All);
								//nearestInteractable.interact(this);
								break;

							case InteractionType.button:
								// Cette ligne permet d'executer la fonction
								// TODO : InteractWithChest a changer
								GetComponent<PhotonView>().RPC("InteractWithButton", RpcTarget.All, nearestInteractable.GetComponent<ButtonForceField>().Id);
								Debug.Log("Je peux interargir avec le coffre");
								//nearestInteractable.interact();
								break;


							case InteractionType.handle:
								GetComponent<PhotonView>().RPC("InteractWithHandle", RpcTarget.All, nearestInteractable.GetComponent<handleInteraction>().id);
								Debug.Log("Je peux interargir avec le coffre");
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
						modelAnimator.SetInteger("weaponIndex", 0);
						modelAnimator.SetTrigger("unequip");

						//modelAnimator.SetTrigger("idle");
					}
					else
					{
						//weaponAnimator.gameObject.SetActive(true);
						if (weapons.Count != 0)
						{
							SetChildrenActive(weaponAnimator.gameObject, true);
							weaponAnimator.SetTrigger("equip");
							modelAnimator.SetInteger("weaponIndex", weapons[currentWeaponIndex].type);
							modelAnimator.SetTrigger("idle");
							modelAnimator.SetLayerWeight(1, 1);
							modelAnimator.SetTrigger("equip");
						}




						//currentWeaponEquipped = true;
					}

				}
				else
				{
					if (!currentWeaponEquipped)
					{
						//modelAnimator.SetTrigger("idle");
					}
					else
					{
						//modelAnimator.ResetTrigger("idle");
					}

				}

				if (fcharacterInput.isFireKeyPressed() && currentWeaponEquipped)
				{

					if (weapons[currentWeaponIndex].isReadyToFire)
					{
						if (weapons[currentWeaponIndex].fire(cameraTransform.position, cameraController.GetAimingDirection()))
						{
							weaponAnimator.SetTrigger("fire");
							modelAnimator.SetTrigger("fire");
						}

					}

					weaponAnimator.SetBool("isFiring", true);
					//gun.fire(cameraTransform.position, cameraController.GetAimingDirection());


				}
				else
				{
					if (currentWeaponEquipped)
					{
						weaponAnimator.SetBool("isFiring", false);
					}

				}
				if (fcharacterInput.isReloadKeyPressed() && currentWeaponEquipped)
				{
					if (previousReload && (!isFastReloading && !isFullReloading) && timeSincePressedReloadKey >= timeToFullReload && weapons[currentWeaponIndex].canReload)
					{
						weaponAnimator.SetFloat("reloadSpeed", 1);
						weaponAnimator.SetTrigger("reload");

						modelAnimator.SetTrigger("reload");

						isFullReloading = true;
						timeSincePressedReloadKey = 0;

					}
					else if (!previousReload && !isFastReloading)
					{

					}

					timeSincePressedReloadKey += Time.deltaTime;
					//gun.reload();


					previousReload = true;
				}
				else if (!fcharacterInput.isReloadKeyPressed() && currentWeaponEquipped)
				{
					if (previousReload && (!isFastReloading && !isFullReloading) && timeSincePressedReloadKey != 0 && weapons[currentWeaponIndex].canReload)
					{
						weaponAnimator.SetFloat("reloadSpeed", 1);
						weaponAnimator.SetTrigger("reload");

						modelAnimator.SetTrigger("reload");

						isFastReloading = true;
						//weaponAnimator.get
						timeSincePressedReloadKey = 0;
					}
					else if (previousReload && isFullReloading)
					{
						//weaponAnimator.SetFloat("reloadSpeed", 2);
						weaponAnimator.SetTrigger("idle");
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
						modelAnimator.SetBool("running", true);

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
						modelAnimator.SetBool("running", false);

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
						modelAnimator.SetBool("crouching", true);
						modelAnimator.SetTrigger("crouch");
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
						modelAnimator.SetBool("crouching", false);
						//modelAnimator.ResetTrigger("crouch");
					}

				}



			}

			if (fcharacterInput.IsJumpKeyPressed())
			{
				if (!previousJump)
				{
					modelAnimator.SetTrigger("jump");
					previousJump = true;
				}
			}
			else
			{
				if (previousJump)
				{
					//modelAnimator.ResetTrigger("jump");
					previousJump = false;
				}
			}
			previouslyWalking = currentlyWalking;
		}
        else
		{
            if (GetComponent<PhotonView>().IsMine)
			{
				var cameras = FindObjectsOfType<Camera>();
				foreach (var camera in cameras)
				{
					if (!camera.transform.parent.parent.parent.GetComponent<PhotonView>().IsMine)
					{
						camera.gameObject.transform.parent.parent.GetComponent<SmoothPosition>().target = camera.transform.parent.parent.parent;
						camera.gameObject.transform.parent.parent.GetComponent<SmoothRotation>().target = camera.transform.parent.parent.parent;
						camera.enabled = true;
					}
				}
				foreach (var camera in cameras)
				{
					if (camera.transform.parent.parent.parent.GetComponent<PhotonView>().IsMine)
					{
						camera.gameObject.transform.parent.parent.GetComponent<SmoothPosition>().target = camera.transform.parent.parent.parent;
						camera.gameObject.transform.parent.parent.GetComponent<SmoothRotation>().target = camera.transform.parent.parent.parent;
						camera.enabled = false;
					}
				}
			}
		}
	}
	Camera[] findCameras()
	{
		return FindObjectsOfType<Camera>();
	}

	[PunRPC]
	private void TestDeath()
    {
		//GetComponent<PhotonView>().RPC("takeDamage", RpcTarget.All,100.0f);
		health -= 100;
		Died = true;
		GetComponentInChildren<Reanimate>().died();
    }

    [PunRPC]
	public void InteractWithInteractable()
    {
		nearestInteractable.interact(this);
	}

	[PunRPC]
	public void InteractWithHandle(int id)
	{
		HandleManager.Instance().interactWithID(id);
		//handle.GetComponent<handleInteraction>().interact(this);
	}
	[PunRPC]
	public void InteractWithChest(int id)
	{
		ChestManager.Instance.OpenChest(id, this);
	}

	[PunRPC]
	public void InteractWithButton(int id)
	{
		ChestManager.Instance.OpenButton(id, this);
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

	[PunRPC]
	public void takeDamage(float damage)
    {
		health -= damage;
		PhotonNetwork.LocalPlayer.CustomProperties["HP"] = health;
		PhotonNetwork.SetPlayerCustomProperties(PhotonNetwork.LocalPlayer.CustomProperties);
		if (health<=0)
        {
			//die();
        }
    }

	void die()
    {
		Debug.Log("Died");
    }
	// Update is called once per frame


	public void addWeapon(BasicGun weapon)
    {
		int listSize = weapons.Count;
		if(listSize == 0)
        {
			weapons.Add(weapon);
			weaponAnimator = fpsModels[weapon.type - 1].GetComponent<Animator>();
        }
		else
        {
			bool sortingLoop = false;
			int i = 0;
			do
			{
				if(weapon.type<weapons[i].type)
                {
					weapons.Insert(i, weapon);
					sortingLoop = true;
                }
				else if(i == listSize-1)
                {
					sortingLoop = true;
                }	
				else
                {
					i++;
                }
			} while (!sortingLoop);

			if(listSize == weapons.Count)
            {
				weapons.Add(weapon);
            }

		}

		//Maintentant on met en place les models nécessaire
		tpMonitor.setUpModels(weapon.type);





    }

	public void switchWeapon(float delta)
    {
		int formerIndex = currentWeaponIndex;
		if(weapons.Count == 0)
        {
			
			return;
        }
		if(delta > 0)
        {
			currentWeaponIndex++;
			if(currentWeaponIndex >= weapons.Count)
            {
				currentWeaponIndex = 0;
            }
        }
		else
        {
			currentWeaponIndex--;
			if(currentWeaponIndex<0)
            {
				currentWeaponIndex = weapons.Count - 1;
            }
        }
		//weaponAnimator.gameObject.SetActive(false);
		if(weapons.Count != 0)
        {
			if(weaponAnimator != null)
            {
				SetChildrenActive(weaponAnimator.gameObject, false);
			}
			
			weaponAnimator = fpsModels[weapons[currentWeaponIndex].type - 1].GetComponent<Animator>();
		}
		
		//weaponAnimator.gameObject.SetActive(true);
		

		// On s'assure qu'on utilise le bon model d'arme
		if (currentWeaponEquipped)
        {
			SetChildrenActive(weaponAnimator.gameObject, true);
			weaponAnimator.SetTrigger("equip");
			tpMonitor.onWeaponPutBack(weapons[formerIndex].type-1);
			modelAnimator.SetInteger("weaponIndex", weapons[currentWeaponIndex].type);
			modelAnimator.SetTrigger("idle");
			modelAnimator.SetTrigger("equip");
		}
		
		


    }
	

	public void addRecoilToCamera(float verticalAngle,float horizontalAngle)
    {
		fcameraController.addRecoil(verticalAngle,horizontalAngle);
	}

	public void onEquip()
	{
		//Debug.Log("equipped");
		currentWeaponEquipped = true;
		//weaponAnimator.ResetTrigger("equip");
		//weaponAnimator.ResetTrigger("reload");
		isFullReloading = false;
		isFastReloading = false;
	}

	public void onUnEquip()
	{
		//Debug.Log("");
		//Debug.Log("Unequipped");
		currentWeaponEquipped = false;
		//weaponAnimator.ResetTrigger("unequip");
		//weaponAnimator.ResetTrigger("reload");
		isFullReloading = false;
		isFastReloading = false;
		SetChildrenActive(weaponAnimator.gameObject, false);
		//weaponAnimator.gameObject.SetActive(false);
	}

	public void onFire()
	{

		//weaponAnimator.ResetTrigger("fire");
		//weaponAnimator.ResetTrigger("reload");

		isFullReloading = false;
		isFastReloading = false;
	}
	public void onReloadComplete()
	{
		// A complèter quand on aura plusieurs types d'armes


		int typeIndex = weapons[currentWeaponIndex].type - 1;

		int difference = weapons[currentWeaponIndex].MagSize - weapons[currentWeaponIndex].LoadedBullets;
		int fastDifference = ammunitions[typeIndex] - weapons[currentWeaponIndex].MagSize;
		int fullDifference = ammunitions[typeIndex] - difference;
		Debug.Log(fastDifference);
		Debug.Log(fullDifference);
		if (isFastReloading)
		{
			if (fastDifference >= 0)
			{
				weapons[currentWeaponIndex].reload(difference);
				ammunitions[typeIndex] -= weapons[currentWeaponIndex].MagSize;
			}
			else
			{
				weapons[currentWeaponIndex].reload(ammunitions[typeIndex]);
				ammunitions[typeIndex] = 0;
			}

			//gun.reload()
		}
		else if (isFullReloading)
		{
			if (fullDifference >= 0)
			{
				weapons[currentWeaponIndex].reload(difference);
				ammunitions[typeIndex] -= difference;
			}
			else
			{
				weapons[currentWeaponIndex].reload(ammunitions[typeIndex]);
				ammunitions[typeIndex] = 0;
			}
		}
		//	Debug.Log(pistolBullets);
		//gun.reload();
		//weaponAnimator.ResetTrigger("reload");
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
	public void changeGun(BasicGun newGun)
    {
		GameObject playerGun = getCurrentWeapon(newGun.type);
		Vector3 oldPos = newGun.transform.position;
		// On met le nouveau gun sur le joueur
		if(playerGun != null)
        {
			newGun.transform.position = playerGun.transform.position;
			newGun.transform.parent = playerGun.transform.parent;
			newGun.transform.rotation = playerGun.transform.rotation;
			newGun.GetComponentInChildren<MeshRenderer>().enabled = false;
			newGun.GetComponent<BoxCollider>().enabled = false;
			// Player layer
			newGun.gameObject.layer = 3;
			newGun.View = transform.gameObject.GetComponent<PhotonView>();

			// On enl�ve l'ancien gun du joueur
			playerGun.transform.parent = null;
			playerGun.transform.position = oldPos;
			playerGun.GetComponentInChildren<MeshRenderer>().enabled = true;
			playerGun.GetComponent<BasicGun>().canInteract = true;
			playerGun.gameObject.layer = 0;
			playerGun.GetComponent<BoxCollider>().enabled = true;
			weapons.Remove(playerGun.GetComponent<BasicGun>());
		}
        else
        {
			newGun.transform.position = transform.position;
			newGun.transform.parent = transform;
			newGun.transform.rotation = transform.rotation;
			newGun.GetComponentInChildren<MeshRenderer>().enabled = false;
			newGun.GetComponent<BoxCollider>().enabled = false;
			// Player layer
			newGun.gameObject.layer = 3;
			newGun.View = transform.gameObject.GetComponent<PhotonView>();
		}

		addWeapon(newGun);

		
	}


	public void SetChildrenActive(GameObject target,bool active)
	{
		foreach (Transform child in target.transform)
		{
			child.gameObject.SetActiveRecursively(active);
		}
	}


	public void SetRendererInChildrenActive(GameObject target, bool active)
	{
		Renderer[] rs = GetComponentsInChildren<Renderer>();
		foreach (Renderer r in rs)
        {
			r.enabled = active;
		}
			
	}

	public GameObject getCurrentWeapon(int type)
    {
		foreach(BasicGun weapon in weapons)
        {
			if(weapon.type == type)
            {
				return weapon.gameObject;
            }
        }
			
		
		
		return null;
        
    }

	public GameObject getCurrentWeapon()
	{
		if(weapons.Count != 0)
        {
			return weapons[currentWeaponIndex].gameObject;
        }
		else
        {
			return null;
		}


		

	}

	public void Reanimate()
    {
		Died = false;
		health = 100;
		ExitGames.Client.Photon.Hashtable PlayerProperties = PhotonNetwork.LocalPlayer.CustomProperties;
		PlayerProperties["HP"] = 100;
		PhotonNetwork.SetPlayerCustomProperties(PlayerProperties);
		var cameras = FindObjectsOfType<Camera>();
		foreach (var camera in cameras)
		{
			if (!camera.transform.parent.parent.parent.GetComponent<PhotonView>().IsMine)
			{
				camera.gameObject.transform.parent.parent.GetComponent<SmoothPosition>().target = camera.transform.parent.parent.parent;
				camera.gameObject.transform.parent.parent.GetComponent<SmoothRotation>().target = camera.transform.parent.parent.parent;
				camera.enabled = false;
			}
		}
		foreach (var camera in cameras)
		{
			if (camera.transform.parent.parent.parent.GetComponent<PhotonView>().IsMine)
			{
				camera.gameObject.transform.parent.parent.GetComponent<SmoothPosition>().target = camera.transform.parent.parent.parent;
				camera.gameObject.transform.parent.parent.GetComponent<SmoothRotation>().target = camera.transform.parent.parent.parent;
				camera.enabled = true;
			}
		}
	}
	public void collectAmmunition(int quantity,int type)
    {
		ammunitions[type - 1] += quantity;
		Debug.Log("CollectedAmmunition");
    }
}
