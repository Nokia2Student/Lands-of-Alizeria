// ==========================================
// ENGSEC DEPARTMENT (SS13 Legacy)
// ==========================================

#define ENGSEC			(1<<0)

#define CAPTAIN			(1<<0)
#define HOS				(1<<1)
#define WARDEN			(1<<2)
#define DETECTIVE		(1<<3)
#define OFFICER			(1<<4)
#define CHIEF			(1<<5)
#define ENGINEER		(1<<6)
#define ATMOSTECH		(1<<7)
#define ROBOTICIST		(1<<8)
#define AI_JF			(1<<9)
#define CYBORG			(1<<10)


// ==========================================
// MEDSCI DEPARTMENT (SS13 Legacy)
// ==========================================

#define MEDSCI			(1<<1)

#define RD_JF			(1<<0)
#define SCIENTIST		(1<<1)
#define CHEMIST			(1<<2)
#define CMO_JF			(1<<3)
#define DOCTOR			(1<<4)
#define GENETICIST		(1<<5)
#define VIROLOGIST		(1<<6)


// ==========================================
// CIVILIAN DEPARTMENT (SS13 Legacy)
// ==========================================

#define CIVILIAN		(1<<2)

#define HOP				(1<<0)
#define BARTENDER		(1<<1)
#define BOTANIST		(1<<2)
//#define COOK			(1<<3) //This is redefined below, and is a ss13 leftover.
#define JANITOR			(1<<4)
#define CURATOR			(1<<5)
#define QUARTERMASTER	(1<<6)
#define CARGOTECH		(1<<7)
//#define MINER			(1<<8) //This is redefined below, and is a ss13 leftover.
#define LAWYER			(1<<9)
#define CHAPLAIN		(1<<10)
#define CLOWN			(1<<11)
#define MIME			(1<<12)
#define ASSISTANT		(1<<13)

// ==========================================
// JOB AVAILABILITY STATUS
// ==========================================

#define JOB_AVAILABLE 0
#define JOB_UNAVAILABLE_GENERIC 1
#define JOB_UNAVAILABLE_BANNED 2
#define JOB_UNAVAILABLE_PLAYTIME 3
#define JOB_UNAVAILABLE_ACCOUNTAGE 4
#define JOB_UNAVAILABLE_PATRON 5
#define JOB_UNAVAILABLE_RACE 6
#define JOB_UNAVAILABLE_SEX 7
#define JOB_UNAVAILABLE_AGE 8
#define JOB_UNAVAILABLE_WTEAM 9
#define JOB_UNAVAILABLE_LASTCLASS 10
#define JOB_UNAVAILABLE_JOB_COOLDOWN 11
#define JOB_UNAVAILABLE_SLOTFULL 12
#define JOB_UNAVAILABLE_VIRTUESVICE 13

// ==========================================
// DEFAULT PREFERENCES
// ==========================================

#define DEFAULT_RELIGION "Christianity"
#define DEFAULT_DEITY "Space Jesus"

#define JOB_DISPLAY_ORDER_DEFAULT 0

// ==========================================
// SS13 JOB DISPLAY ORDERS (Legacy, 1-32)
// ==========================================

#define JOB_DISPLAY_ORDER_ASSISTANT 1
#define JOB_DISPLAY_ORDER_CAPTAIN 2
#define JOB_DISPLAY_ORDER_HEAD_OF_PERSONNEL 3
#define JOB_DISPLAY_ORDER_QUARTERMASTER 4
#define JOB_DISPLAY_ORDER_CARGO_TECHNICIAN 5
#define JOB_DISPLAY_ORDER_SHAFT_MINER 6
#define JOB_DISPLAY_ORDER_BARTENDER 7
#define JOB_DISPLAY_ORDER_COOK 8
#define JOB_DISPLAY_ORDER_BOTANIST 9
#define JOB_DISPLAY_ORDER_JANITOR 10
#define JOB_DISPLAY_ORDER_CLOWN 11
#define JOB_DISPLAY_ORDER_MIME 12
#define JOB_DISPLAY_ORDER_CURATOR 13
#define JOB_DISPLAY_ORDER_LAWYER 14
#define JOB_DISPLAY_ORDER_CHAPLAIN 15
#define JOB_DISPLAY_ORDER_CHIEF_ENGINEER 16
#define JOB_DISPLAY_ORDER_STATION_ENGINEER 17
#define JOB_DISPLAY_ORDER_ATMOSPHERIC_TECHNICIAN 18
#define JOB_DISPLAY_ORDER_CHIEF_MEDICAL_OFFICER 19
#define JOB_DISPLAY_ORDER_MEDICAL_DOCTOR 20
#define JOB_DISPLAY_ORDER_CHEMIST 21
#define JOB_DISPLAY_ORDER_GENETICIST 22
#define JOB_DISPLAY_ORDER_VIROLOGIST 23
#define JOB_DISPLAY_ORDER_RESEARCH_DIRECTOR 24
#define JOB_DISPLAY_ORDER_SCIENTIST 25
#define JOB_DISPLAY_ORDER_ROBOTICIST 26
#define JOB_DISPLAY_ORDER_HEAD_OF_SECURITY 27
#define JOB_DISPLAY_ORDER_WARDEN 28
#define JOB_DISPLAY_ORDER_DETECTIVE 29
#define JOB_DISPLAY_ORDER_SECURITY_OFFICER 30
#define JOB_DISPLAY_ORDER_AI 31
#define JOB_DISPLAY_ORDER_CYBORG 32

// ==========================================
// ROGUETOWN JOB FLAGS - Bitflag Organization
// ==========================================
// System: Each job department uses its own (1<<N) range to avoid conflicts

// NOBILITY DEPARTMENT (1<<0 to 1<<7)
#define NOBLEMEN	(1<<0)

#define LORD		(1<<0)
#define LADY		(1<<1)
#define HAND		(1<<2)
#define STEWARD		(1<<3)
#define KNIGHT		(1<<4)
#define SQUIRE		(1<<5)
#define BLACKKNIGHT	(1<<6)
#define SUITOR		(1<<7)

// COURTIERS DEPARTMENT (1<<2 to 1<<4)
#define COURTIERS	(1<<2)

#define JESTER		(1<<0)
#define BUTLER		(1<<2)
#define COUNCILLOR	(1<<3)
#define SERVANT		(1<<4)

// CHURCH DEPARTMENT (1<<3 to 1<<3)
#define CHURCHMEN	(1<<3)

#define PRIEST		(1<<0)
#define MONK		(1<<1)
#define GRAVEDIGGER	(1<<2)
#define DRUID		(1<<3)

// GARRISON DEPARTMENT (1<<4 to 1<<8)
#define GARRISON	(1<<4)

#define MARSHAL		(1<<0)
#define GUARDSMAN	(1<<1)
#define MANATARMS	(1<<2)
#define DUNGEONEER	(1<<3)
#define GATEMASTER	(1<<4)
#define BOGGUARD	(1<<6)
#define SERGEANT	(1<<7)
#define SHERIFF		(1<<8)

// YEOMEN DEPARTMENT (1<<4 to 1<<15)
#define YEOMEN		(1<<4)

#define BARKEEP		(1<<0)
#define LOUDMOUTH	(1<<1)
#define ARCHIVIST	(1<<2)
#define ALCHEMIST	(1<<5)
#define MERCHANT	(1<<8)
#define SCRIBE		(1<<9)
#define ELDER		(1<<10)
#define PHYSICIAN 	(1<<11)
#define WIZARD		(1<<12)
#define NITEMASTER	(1<<13)
#define NECROMIST	(1<<14)
#define CAFE		(1<<15)

// PEASANTS DEPARTMENT (1<<5 to 1<<26)
#define PEASANTS	(1<<5)

#define HUNTER		(1<<0)
#define FARMER		(1<<1)
#define BUTCHER		(1<<2)
#define FISHER		(1<<3)
#define LUMBERJACK	(1<<4)
#define MINER		(1<<5)
#define COOK		(1<<6)
#define KNAVEWENCH  (1<<7)
#define GRABBER		(1<<8)
#define WENCH		(1<<10)
#define BEGGAR		(1<<11)
#define ADVENTURER	(1<<12)
#define PILGRIM		(1<<13)
#define VILLAGER	(1<<14)
#define PRISONERR	(1<<15)
#define PRISONERB	(1<<16)
#define LUNATIC		(1<<17)
#define MIGRANT		(1<<18)
#define BANDIT		(1<<19)
#define COURTAGENT	(1<<20)
#define WRETCH		(1<<21)
#define OGRE	    (1<<22)
#define HOSTAGE		(1<<23)
#define CAPO		(1<<24)
#define PBLACKSMITH	(1<<25)

// YOUNG FOLK DEPARTMENT (1<<6 to 1<<8)
#define YOUNGFOLK	(1<<6)

#define APPRENTICE	(1<<0)
#define CHURCHLING	(1<<1)
#define ORPHAN		(1<<3)
#define PRINCE		(1<<4)
#define SHOPHAND	(1<<5)
#define CLERK 		(1<<6)
#define MAGEAPPRENTICE	(1<<7)
#define APOTHECARY	(1<<8)

// MERCENARIES DEPARTMENT (1<<7 to 1<<4)
#define MERCENARIES		(1<<7)
#define MARSHGEN		(1<<0)
#define INS				(1<<1)
#define OJAN			(1<<2)
#define JAN				(1<<3)
#define ACADEM			(1<<4)

#define VETERAN			(1<<1)
#define MERCENARY		(1<<2)
#define DESERT_RIDER	(1<<3)	//Unused
#define GRENZELHOFT		(1<<4)	//Unused


// TRIBAL DEPARTMENT (1<<8)
#define TRIBAL		(1<<8)

#define CHIEFTAIN	(1<<0)
#define TRIBALCOOK	(1<<1)
#define TRIBALGUARD	(1<<2)
#define TRIBALSMITH	(1<<3)

// SPECIAL / ANTAGONIST DEPARTMENT (1<<9)
#define SLOP		(1<<9)

#define TESTER		(1<<0)
#define DEATHKNIGHT (1<<1)
#define SKELETON	(1<<2)
#define GOBLIN		(1<<3)
#define VAMPIRE_SERVANT (1<<4)
#define VAMPIRE_GUARD (1<<5)
#define VAMPIRE_SPAWN (1<<6)

// INQUISITION DEPARTMENT (1<<10)
#define INQUISITION (1<<10)

#define PURITAN		(1<<0)
#define ORTHODOXIST	(1<<1)
#define ABSOLVER (1<<2)

// GUILDS DEPARTMENT (1<<11)
#define GUILDSMEN	(1<<11)
#define GUILDMASTER (1<<1)
#define GUILDSMAN  	(1<<2)
#define TAILOR		(1<<3)

// AVANGARD DEPARTMENT (1<<12)
#define AVANGARD		(1<<12)
#define COMMANDER		(1<<0)
#define TRAVELLER		(1<<1)
#define EXPEDITOR		(1<<2)
#define TAVERNIER		(1<<3)
#define MASTER			(1<<4)
#define DARKWITCH		(1<<5)
#define NOBLETAILOR		(1<<6)

// ==========================================
// JOB COLOR DEFINITIONS
// ==========================================

#define JCOLOR_NOBLE "#e3e98b"
#define JCOLOR_COURTIER "#ceba82"
#define JCOLOR_CHURCH "#c0ba8d"
#define JCOLOR_SOLDIER "#6ec256"
#define JCOLOR_YEOMAN "#819e82"
#define JCOLOR_GUILD "#6e6259"
#define JCOLOR_PEASANT "#b09262"
#define JCOLOR_MERCENARY "#53a3d5"
#define JCOLOR_INQUISITION "#FF0000"
#define JCOLOR_TOWN "#6ec256"
#define JCOLOR_AVANGARD "#e5fafb"

// ==========================================
// ROGUETOWN JOB DISPLAY ORDERS (JDO_*)
// ==========================================
// Organization: 0-40+ with logical grouping
// Range System:
//   0          - Hidden/Not displayed
//   1.0-1.99   - NOBILITY (Lord, Lady, etc.)
//   2.0-2.99   - MERCENARY GENERALS (Marshgen, INS, OJAN, etc.)
//   3.0-3.99   - GARRISON (Marshal, Town Guard, Clerk)
//   4.0-4.99   - CHURCH (Priest, Monk, etc.)
//   5.0-5.99   - YEOMEN/CITIZENS (Merchants, Physicians, etc.)
//   6.0-6.99   - YEOMEN VARIANT (Barkeep, Tailor, etc.)
//   17.0+      - SPECIAL (Grabber)
//   27.0-27.99 - COOKING TRADES (Cook, Knavewench)
//   28.0-28.99 - FARMING TRADES (Soilson)
//   30.0-30.99 - WANDERERS (Adventurer, Pilgrim, etc.)
//   31.0-31.99 - MERCENARIES (Veteran, Grenzelhoft, etc.)
//   32.0-32.99 - SPECIAL WANDERERS (Migrants)
//   33.0-35.99 - SPECIAL/PRISONERS (Vagrant, Orphan, Prisoners, etc.)
//   36.0-39.99 - TRIBAL (Chieftain, Cook, Guard, Smith)
//   40.0-40.99 - INQUISITION (Puritan, Orthodoxist, Absolver)
//   41.0+      - AVANGARD (Commander)

// NOBILITY (1.0 - 1.99)
#define JDO_LORD 1
#define JDO_LADY 1.1
#define JDO_HAND 1.2
#define JDO_PRINCE 1.3
#define JDO_LGUARD 1.4
#define JDO_SQUIRE 1.5
#define JDO_STEWARD 1.6
#define JDO_MERCHANT 1.7
#define JDO_SHOPHAND 1.71
#define JDO_BLACKKNIGHT 1.8
#define JDO_SUITOR 0
#define JDO_JESTER 1.9
#define JDO_BUTLER 1.91
#define JDO_SERVANT 2
#define JDO_COUNCILLOR 0

// MERCENARY GENERALS (2.0 - 2.99)
#define JDO_MARSHGEN 2.1
#define JDO_INS 2.2
#define JDO_OJAN 2.3
#define JDO_JAN 2.4
#define JDO_ACADEM 2.5

// GARRISON (3.0 - 3.99)
#define JDO_MARSHAL 3
#define JDO_TOWNGUARD 3.1
#define JDO_CLERK 3.3

#define JDO_SERGEANT 0
#define JDO_CASTLEGUARD 0
#define JDO_GATEMASTER 0
#define JDO_SHERIFF 0
#define JDO_DUNGEONEER 0
#define JDO_BOGGUARD 0

// CHURCH (4.0 - 4.99)
#define JDO_PRIEST 25
#define JDO_MARTYR 25.1
#define JDO_TEMPLAR 0
#define JDO_MONK 25.2
#define JDO_DRUID 25.3
#define JDO_CHURCHLING 0
#define JDO_GRAVEMAN 0

#define JDO_NITEMASTER 4.4
#define JDO_CAPO 4.5
#define JDO_CAFE 4.6
#define JDO_WENCH 4.7

// YEOMEN/CITIZENS (5.0 - 5.99)
#define JDO_MAGEAPPRENTICE 0
#define JDO_PHYSICIAN 5.3
#define JDO_APOTHECARY 0
#define JDO_ARCHIVIST 5.4
#define JDO_CHIEF 0
#define JDO_GUILDMASTER 5.5
#define JDO_NECROMIST 5.7

// YEOMEN VARIANT (6.0 - 6.99)
#define JDO_GUILDSMAN 0
#define JDO_LOUDMOUTH 6
#define JDO_BARKEEP 6.1
#define JDO_TAILOR 6.2
#define JDO_PBLACKSMITH 6.7

// SPECIAL (17+)
#define JDO_GRABBER 17.2

#define JDO_COMMANDER 20
#define JDO_EXPEDITOR 20.1
#define JDO_TAVERNIER 20.2
#define JDO_MASTER 20.3
#define JDO_SUPP 20.4
#define JDO_DARKWITCH 20.5
#define JDO_NOBLETAILOR 20.6
#define JDO_MAGICIAN 20.7

// COOKING TRADES (27.0 - 27.99)
#define JDO_COOK 27
#define JDO_KNAVEWENCH 27.2

// FARMING TRADES (28.0 - 28.99)
#define JDO_SOILSON 28

// WANDERERS (30.0 - 30.99)
#define JDO_VILLAGER 30
#define JDO_ADVENTURER 30.1
#define JDO_PILGRIM 30.2
#define JDO_COURTAGENT 30.3
#define JDO_WRETCH 30.4
#define JDO_OGRE 30.5

// MERCENARIES (31.0 - 31.99)
#define JDO_MERCENARY 31
#define JDO_GRENZELHOFT 31.2
#define JDO_DESERT_RIDER 31.3
#define JDO_VET 31.4

// SPECIAL WANDERERS (32.0 - 32.99)
#define JDO_MIGRANT 32.3

// VAGRANT & ORPHAN (33.0 - 34.99)
#define JDO_VAGRANT 33
#define JDO_ORPHAN 34

// PRISONERS & SPECIAL (35.0 - 35.99)
#define JDO_PRISONERR 35
#define JDO_PRISONERB 35.1
#define JDO_HOSTAGE 35.2
#define JDO_LUNATIC 35.3

// BANDIT (Note: Slightly out of order, grouped with other antagonists)
#define JDO_BANDIT 31.3

// TRIBAL (36.0 - 39.99)
#define JDO_CHIEFTAIN 36
#define JDO_TRIBALCOOK 37
#define JDO_TRIBALGUARD 38
#define JDO_TRIBALSMITH 39

// INQUISITION (40.0 - 40.99)
#define JDO_PURITAN 40
#define JDO_ORTHODOXIST 40.1
#define JDO_ABSOLVER 40.2

// AVANGARD (41.0+)
#define JDO_TRAVELLER 41

// ==========================================
// BITFLAG GROUPS
// ==========================================

#define BITFLAG_CHURCH (1<<0)
#define BITFLAG_ROYALTY (1<<1)
#define BITFLAG_CONSTRUCTOR (1<<2)
#define BITFLAG_GARRISON (1<<3)

// ==========================================
// JOB ROLE LISTS
// ==========================================

#define MANOR_ROLES \
	/datum/job/roguetown/jester,\
	/datum/job/roguetown/veteran,\
	/datum/job/roguetown/clerk,\
	/datum/job/roguetown/wapprentice,\
	/datum/job/roguetown/servant,\
	/datum/job/roguetown/butler,\
	/datum/job/roguetown/apothecary,\
	/datum/job/roguetown/magician

#define NOBLE_ROLES \
	/datum/job/roguetown/prince,\
	/datum/job/roguetown/councillor,\
	/datum/job/roguetown/physician,\
	/datum/job/roguetown/marshal,\
	/datum/job/roguetown/captain,\
	/datum/job/roguetown/hand,\
	/datum/job/roguetown/knight,\
	/datum/job/roguetown/lady,\
	/datum/job/roguetown/lord,\
	/datum/job/roguetown/steward

#define KING_QUEEN_ROLES \
	/datum/job/roguetown/lady,\
	/datum/job/roguetown/lord

#define CHURCH_ROLES \
	/datum/job/roguetown/churchling,\
	/datum/job/roguetown/druid,\
	/datum/job/roguetown/monk,\
	/datum/job/roguetown/priest,\
	/datum/job/roguetown/templar

#define PEASANT_ROLES \
	/datum/job/roguetown/villager,\
	/datum/job/roguetown/nightmaiden,\
	/datum/job/roguetown/beggar,\
	/datum/job/roguetown/butcher,\
	/datum/job/roguetown/cook,\
	/datum/job/roguetown/knavewench,\
	/datum/job/roguetown/lunatic,\
	/datum/job/roguetown/farmer,\
	/datum/job/roguetown/orphan,\
	/datum/job/roguetown/shophand,\
	/datum/job/roguetown/bapprentice,\
	/datum/job/roguetown/prisonerb,\
	/datum/job/roguetown/hostage,\
	/datum/job/roguetown/prisonerr

#define YEOMEN_ROLES \
	/datum/job/roguetown/elder,\
	/datum/job/roguetown/niteman,\
	/datum/job/roguetown/loudmouth,\
	/datum/job/roguetown/archivist,\
	/datum/job/roguetown/barkeep,\
	/datum/job/roguetown/guildmaster,\
	/datum/job/roguetown/guildsman,\
	/datum/job/roguetown/tailor,\
	/datum/job/roguetown/merchant,\
	/datum/job/roguetown/scribe

#define WANDERER_ROLES \
	/datum/job/roguetown/pilgrim,\
	/datum/job/roguetown/adventurer,\
	/datum/job/roguetown/mercenary/desert_rider,\
	/datum/job/roguetown/mercenary/grenzelhoft,\
	/datum/job/roguetown/bandit,\
	/datum/job/roguetown/wretch,\
	/datum/job/roguetown/ogre

#define GARRISON_ROLES \
	/datum/job/roguetown/warden,\
	/datum/job/roguetown/sergeant,\
	/datum/job/roguetown/dungeoneer,\
	/datum/job/roguetown/gatemaster,\
	/datum/job/roguetown/manorguard,\
	/datum/job/roguetown/sheriff,\
	/datum/job/roguetown/squire,\
	/datum/job/roguetown/guardsman

#define INQUISITION_ROLES \
	/datum/job/roguetown/puritan,\
	/datum/job/roguetown/orthodoxist

#define AVANGARD_ROLES \
	/datum/job/roguetown/commander,\
	/datum/job/roguetown/expeditor,\
	/datum/job/roguetown/tavernier,\
	/datum/job/roguetown/merchant,\
	/datum/job/roguetown/supplier,\
	/datum/job/roguetown/darkwitch,\
	/datum/job/roguetown/traveller
