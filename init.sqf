KillCount = 0;

MedicCost = 10;
EngineerCost = 15;
FatigueCost = 20;

AmmoCost = 5;
SupplyDropCost = 10;
WeaponDropCost = 15;
MrapDropCost = 20;
MinefieldCost = 10;

lootProb = 9;

setTimeMultiplier 20;

// Choose center location on map
hint "Click on the map to select a center point.";
openmap true;
DropPos = [0,0,0];
clicked = false;
onMapSingleClick "DropPos = _pos; clicked = true; onMapSingleClick """"";

waitUntil {clicked};
flagPole = "Flag_Blue_F" createVehicle [(DropPos select 0), (DropPos select 1) - 2, (DropPos select 2)];
openmap false;

player setPos [(DropPos select 0), (DropPos select 1), (DropPos select 2)];
//officer setPos [(DropPos select 0), (DropPos select 1), (DropPos select 2)];
if (isMultiplayer) then {
    player2 setPos [(DropPos select 0), (DropPos select 1), (DropPos select 2)];
    player3 setPos [(DropPos select 0), (DropPos select 1), (DropPos select 2)];
    player4 setPos [(DropPos select 0), (DropPos select 1), (DropPos select 2)];
};

storageCrate setPos [(DropPos select 0) + 5, (DropPos select 1), (DropPos select 2)];
shop setPos [(DropPos select 0) - 5, (DropPos select 1), (DropPos select 2)];
shop2 setPos [(DropPos select 0), (DropPos select 1) + 5, (DropPos select 2)];

flagPole allowDamage false;
storageCrate allowDamage false;
shop allowDamage false;
shop2 allowDamage false;

_flagMarker = createMarker ["centerPointMarker", player];
_flagMarker setMarkerColor "ColorBlue";
_flagMarker setMarkerType "hd_flag";
centerPoint = getMarkerPos "centerPointMarker";

// Respawn markers
createMarker ["respawn_civilian", [(DropPos select 0), (DropPos select 1) + 50, (DropPos select 2)]];
createMarker ["respawn_civilian1", [(DropPos select 0), (DropPos select 1) - 50, (DropPos select 2)]];
createMarker ["respawn_civilian2", [(DropPos select 0) + 50, (DropPos select 1), (DropPos select 2)]];
createMarker ["respawn_civilian3", [(DropPos select 0) - 50, (DropPos select 1), (DropPos select 2)]];

null = execVM "scripts\lootArrays.sqf";

sleep 5;

_addons = activatedAddons;
_hlcCoreCheck = _addons find "hlcweapons_core";
_hlcAR15Check = _addons find "hlcweapons_ar15";
_hlcAKCheck = _addons find "hlcweapons_aks";
_hlcAUGCheck = _addons find "hlcweapons_AUG";
_hlcFALCheck = _addons find "hlcweapons_falpocalypse";
_hlcG3Check = _addons find "hlcweapons_g3";
_hlcG36Check = _addons find "hlcweapons_G36";
_hlcM134Check = _addons find "hlcweapons_M134";
_hlcM14Check = _addons find "hlcweapons_m14";
_hlcM60Check = _addons find "hlcweapons_m60e4";
_hlcMP5Check = _addons find "hlcweapons_mp5";
_hlcSAWCheck = _addons find "hlcweapons_SAW";
_hlcM1903Check = _addons find "hlcweapons_Springfield1903";
_hlcSTGW57Check = _addons find "hlcweapons_stgw57";
_hlcAWMCheck = _addons find "hlcweapons_FHAWCovert";
_aceGunBagCheck = _addons find "ace_gunbag";
_aceVectorCheck = _addons find "ace_vector";
_aceMedicalCheck = _addons find "ace_medical";
_aceGrenadesCheck = _addons find "ace_grenades";
_aceExplosivesCheck = _addons find "ace_explosives";
_aceTrenchesCheck = _addons find "ace_trenches";
_aceFlashlightsCheck = _addons find "ace_flashlights";

if(_hlcCoreCheck != -1)then{
    systemChat "NIArms Core is installed!";

    if(_hlcAKCheck != -1)then{
        systemChat "NIArms AK is installed!";
        weaponArray append [
            "hlc_rifle_ak74_MTK",
            "hlc_rifle_ak47",
            "hlc_rifle_akm_MTK",
            "hlc_rifle_rpk",
            "hlc_rifle_ak12",
            "hlc_rifle_rpk12",
            "hlc_rifle_rpk74n",
            "hlc_rifle_ak12gl",
            "hlc_rifle_akmgl",
            "hlc_rifle_aks74_GL",
            "hlc_rifle_saiga12k",
            "hlc_rifle_aek971_mtk",
            "hlc_rifle_RK62",
            "hlc_rifle_slr107u_MTK",
            "hlc_rifle_ak74m_gl",
            "hlc_rifle_ak74m_MTK"
        ];
    };

    if(_hlcAR15Check != -1)then{
        systemChat "NIArms AR15 is installed!";
        weaponArray append [
            "hlc_rifle_RU556",
            "hlc_rifle_RU5562",
            "hlc_rifle_Colt727",
            "hlc_rifle_Colt727_GL",
            "hlc_rifle_bcmjack",
            "hlc_rifle_Bushmaster300",
            "hlc_rifle_vendimus",
            "hlc_rifle_SAMR",
            "hlc_rifle_honeybase",
            "hlc_rifle_honeybadger",
            "hlc_rifle_RU556",
            "hlc_rifle_RU5562",
            "hlc_rifle_Colt727",
            "hlc_rifle_Colt727_GL",
            "hlc_rifle_bcmjack",
            "hlc_rifle_Bushmaster300",
            "hlc_rifle_vendimus",
            "hlc_rifle_SAMR",
            "hlc_rifle_honeybase",
            "hlc_rifle_honeybadger"
        ];
    };

    if(_hlcAUGCheck != -1)then{
        systemChat "NIArms AUG is installed!";
        weaponArray append [
            "hlc_rifle_aug",
            "hlc_rifle_auga1_B",
            "hlc_rifle_auga1carb",
            "hlc_rifle_aughbar",
            "hlc_rifle_auga2",
            "hlc_rifle_auga2lsw",
            "hlc_rifle_augsr",
            "hlc_rifle_augsrcarb",
            "hlc_rifle_auga3_GL",
            "hlc_rifle_augsrhbar_b",
            "hlc_rifle_auga2para_t"
        ];
    };

    if(_hlcFALCheck != -1)then{
        systemChat "NIArms FAL is installed!";
        weaponArray append [
            "hlc_rifle_l1a1slr",
            "hlc_rifle_SLR",
            "hlc_rifle_STG58F",
            "hlc_rifle_FAL5061",
            "hlc_rifle_SLRchopmod",
            "hlc_rifle_falosw",
            "hlc_rifle_LAR",
            "hlc_rifle_c1A1"
        ];
    };

    if(_hlcG3Check != -1)then{
        systemChat "NIArms G3 is installed!";
        weaponArray append [
            "hlc_rifle_g3sg1",
            "hlc_rifle_psg1",
            "hlc_rifle_g3a3ris",
            "hlc_rifle_PSG1A1_RIS",
            "hlc_rifle_hk33a2RIS",
            "hlc_rifle_hk33a2",
            "hlc_rifle_hk53RAS",
            "hlc_rifle_hk53",
            "HLC_Rifle_g3ka4_GL",
            "hlc_rifle_hk51"
        ];
    };

    if(_hlcG36Check != -1)then{
        systemChat "NIArms G36 is installed!";
        weaponArray append [
            "hlc_rifle_G36A1",
            "hlc_rifle_G36A1AG36",
            "hlc_rifle_G36C",
            "hlc_rifle_G36E1AG36",
            "hlc_rifle_G36V",
            "hlc_rifle_G36CV",
            "hlc_rifle_G36MLIC",
            "hlc_rifle_G36CMLIC"
        ];
    };

    if(_hlcM134Check != -1)then{
        systemChat "NIArms M134 is installed!";
        weaponArray append [
            "HLC_wp_M134Painless",
            "HLC_wp_M134Painless"
        ];
    };

    if(_hlcM14Check != -1)then{
        systemChat "NIArms M14 is installed!";
        weaponArray append [
            "hlc_rifle_M14",
            "hlc_rifle_M21",
            "hlc_rifle_M14DMR",
            "hlc_rifle_m14sopmod",
            "hlc_rifle_M14",
            "hlc_rifle_M21",
            "hlc_rifle_M14DMR",
            "hlc_rifle_m14sopmod",
            "hlc_rifle_M14",
            "hlc_rifle_M21",
            "hlc_rifle_M14DMR",
            "hlc_rifle_m14sopmod"
        ];
    };

    if(_hlcM60Check != -1)then{
        systemChat "NIArms M60 is installed!";
        weaponArray append [
            "hlc_lmg_M60E4",
            "hlc_lmg_m60",
            "hlc_lmg_M60E4",
            "hlc_lmg_m60",
            "hlc_lmg_M60E4",
            "hlc_lmg_m60"
        ];
    };

    if(_hlcMP5Check != -1)then{
        systemChat "NIArms MP5 is installed!";
        weaponArray append [
            "hlc_smg_mp5a4",
            "hlc_smg_mp5n",
            "hlc_smg_mp510",
            "hlc_smg_mp5sd5",
            "hlc_smg_mp5sd6"
        ];
    };

    if(_hlcSAWCheck != -1)then{
        systemChat "NIArms SAW is installed!";
        weaponArray append [
            "hlc_lmg_minimipara",
            "hlc_lmg_minimi",
            "hlc_lmg_minimi_railed",
            "hlc_m249_pip1",
            "hlc_m249_pip4"
        ];
    };

    if(_hlcM1903Check != -1)then{
        systemChat "NIArms M1903 is installed!";
        weaponArray append [
            "hlc_rifle_M1903A1",
            "hlc_rifle_M1903A10MR",
            "hlc_rifle_M1903A1",
            "hlc_rifle_M1903A10MR",
            "hlc_rifle_M1903A1",
            "hlc_rifle_M1903A10MR",
            "hlc_rifle_M1903A1",
            "hlc_rifle_M1903A10MR"
        ];
    };

    if(_hlcSTGW57Check != -1)then{
        systemChat "NIArms STGW57 is installed!";
        weaponArray append [
            "hlc_rifle_stgw57_commando",
            "hlc_rifle_stgw57_RIS",
            "hlc_rifle_sig5104",
            "hlc_rifle_amt"
        ];
    };

    if(_hlcAWMCheck != -1)then{
        systemChat "NIArms AWM is installed!";
        weaponArray append [
            "hlc_rifle_awcovert",
            "hlc_rifle_awcovert_BL",
            "hlc_rifle_awcovert_FDE",
            "hlc_rifle_awmagnum",
            "hlc_rifle_awmagnum_BL",
            "hlc_rifle_awMagnum_FDE_ghillie",
            "hlc_rifle_awMagnum_OD_ghillie",
            "hlc_rifle_awmagnum_FDE"
        ];
    };

    
}
else{
    systemChat "NIArms Core not installed!";
};

if(_aceExplosivesCheck != -1)then{
    attachmentArray append [
        "ACE_DeadManSwitch",
        "ACE_Clacker",
        "ACE_M26_Clacker"
    ];
};

if(_aceFlashlightsCheck != -1)then{
    attachmentArray append [
        "ACE_Flashlight_MX991",
        "ACE_Flashlight_XL50"
    ];
};

if(_aceGrenadesCheck != -1)then{
    usableArray append [
        "ACE_M14"
    ];
};

if(_aceGunBagCheck != -1)then{
    backpackArray append [
        "ACE_Gunbag"
    ];
};

if(_aceMedicalCheck != -1)then{
    usableArray append [
        "ACE_adenosine",
        "ACE_atropine",
        "ACE_fieldDressing",
        "ACE_elasticBandage",
        "ACE_quikclot",
        "ACE_bloodIV",
        "ACE_bloodIV_250",
        "ACE_bloodIV_500",
        "ACE_epinephrine",
        "ACE_morphine",
        "ACE_packingBandage",
        "ACE_personalAidKit",
        "ACE_plasmaIV",
        "ACE_plasmaIV_250",
        "ACE_plasmaIV_500",
        "ACE_salineIV",
        "ACE_salineIV_250",
        "ACE_salineIV_500",
        "ACE_surgicalKit",
        "ACE_tourniquet"
    ];
};

if(_aceTrenchesCheck != -1)then{
    weaponArray append [
        "ACE_EntrenchingTool"
    ];
};

if(_aceVectorCheck != -1)then{
    attachmentArray append [
        "ACE_VectorDay",
        "ACE_Vector"
    ];
};



null = execVM "scripts\loot.sqf";
null = execVM "scripts\zoneRestrict.sqf";
null = execVM "scripts\paratrooper.sqf";
null = execVM "scripts\randomCarePackages.sqf";