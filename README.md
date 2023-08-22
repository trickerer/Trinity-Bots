### This mod was last updated:
### TC: 22 Aug 2023, [f9d8d85c37](https://github.com/trickerer/TrinityCore-3.3.5-with-NPCBots/commit/f9d8d85c37)
### AC: 22 Aug 2023, [ccc5182850](https://github.com/trickerer/AzerothCore-wotlk-with-NPCBots/commit/ccc5182850)

### Have questions? Found a bug? [Issues](https://github.com/trickerer/Trinity-Bots/issues)

# [ THE NPCBOTS MANUAL ]
>Compiled by: Trickerer (onlysuffering @ Gmail dot Com)  
>Version 0.25 - 14 Jun 2023
>Original version by: Thesawolf (@ Gmail dot Com) Version 0.3 - 20 July 2016 [here](https://github.com/thesawolf/TrinityCore/blob/TrinityCoreLegacy/README_Bots.md)

---------------------------------------
### Contents
1. [Introduction](#introduction)
2. [NPCBots](#npcbots)
    - [NPCBot Mod Installation](#npcbot-mod-installation)
    - [NPCBot Commands](#npcbot-commands)
    - [NPCBot Control and Usage](#npcbot-control-and-usage)
        - [NPCBot Getting Started](#npcbot-getting-started)
        - [NPCBot Hiring Alternatives](#npcbot-hiring-alternatives)
        - [NPCBot Getting Around](#npcbot-getting-around)
        - [NPCBot Equipment](#npcbot-equipment)
        - [NPCBot Roles](#npcbot-roles)
        - [NPCBot Formation](#npcbot-formation)
        - [NPCBot Abilities](#npcbot-abilities)
        - [NPCBot Talents](#npcbot-talents)
        - [NPCBot Grouping](#npcbot-grouping)
        - [NPCBot Extras](#npcbot-extras)
        - [NPCBots and Vehicles](#npcbots-and-vehicles)
    - [NPCBot Wander System](#npcbot-wander-system)
    - [NPCBot Config Settings](#npcbot-config-settings)
    - [NPCBot Mod Localization](#npcbot-mod-localization)
    - [NPCBot Extra Classes](#npcbot-extra-classes)
    - [NPCBot Occupations](#npcbot-occupations)
    - [NPCBot Addons](#npcbot-addons)
3. [Guide Changelog](#guide-changelog)

---------------------------------------
## Introduction
This manual is created to officially state the purpose and explain the usage of NPCBot system


---------------------------------------
## NPCBOTS
NPCBots are hireable pet-like minions (with some exceptions). You don't have full control over them, but you can tune their behavior in many ways. Bots will follow you around, buff you, defend you and help you in general. Their main purpose is to support players during their leveling although they can do dungeons and raids, but expect them being stupid in there

Features of the NPCBots:  

- Fighting (via spells, melee, ranged combat)  

- Buffing  

- Healing  

- Resurrecting  

- Acting as a guard (when bot has no owner)  

- Grouping  

- DungeonFinder (they can enter dungeons with you)  

- Raids (they can participate in raids)  

- PvP (they can fight members of your opposing faction)  

- Providing you with consumables (mage, warlock)  

- Receiving buffs and consumables from you  

- Equipping gear  

- Assigning roles  

- Abilities management  

- etc...  


### NPCBot Mod Installation
NPCBots is a TrinityCore/AzerothCore mod (https://github.com/TrinityCore/TrinityCore/, https://github.com/azerothcore/azerothcore-wotlk/), only 3.3.5 branch is supported  

**Pre-patched repository available for TC and AC [here](https://github.com/trickerer/TrinityCore-3.3.5-with-NPCBots/) and [here](https://github.com/trickerer/AzerothCore-wotlk-with-NPCBots/)**  
If you still prefer the patch then keep on reading, otherwise clone the patched repo and jump to step 4  

At the very start of this document you can find a link for TrinityCore revision for the last version of NPCBots. There is no guarantee you will be able to apply the mod if you are using other version of TrinityCore  
1. Follow TrinityCore Installation Guide (https://TrinityCore.info/) to install the server first  
2. Download NPCBots.patch and put it into your TrinityCore folder  
3. Apply the patch using `patch -p1 < NPCBots.patch` command (creating new files)  
4. (Re)run CMake and (re)build  
5. Merge worldserver.conf.dist into your worldserver.conf file (NPCBot mod settings)  
6. Apply SQL files from `/TrinityCore/sql/Bots/` to your DB (files starting with `characters_` and `world_` go into your `characters` and `world` DB respectively):
```
1_world_bot_appearance.sql
2_world_bot_extras.sql
3_world_bots.sql
4_world_generate_bot_equips.sql
5_world_botgiver.sql
characters_bots.sql
```
7. Apply SQL update files from `/TrinityCore/sql/Bots/updates` to your DB  
```
Hint: for fresh installation there are also shell scripts available for you to quickly merge all required SQL files into `ALL_auth.sql`, `ALL_chracters.sql` and `ALL_world.sql` to go to `auth`, `characters` and `world` DB respectively
```
And after that you are ready to go

### NPCBot Commands
First of all, to list your NPCBot's stats, use `/bonk` on them (Warning: big list)  

Note that some commands may not be available to all accounts (depending on their access level and permissions set in the RBAC tables (TC) / in the `command` table (AC)). You may need to change your account permissions / security level to enable usage of some commands
Most NPCBot commands are divised by persmissions into two groups: player commands and GM commands, there are also some Admin-only commands
```
KEY:
< >  (angled brackets) indicates essential command argument  
[ ]  (square brackets) indicates optional command argument  
 |  (pipe character) indicates argument choices (i.e. this|that  = this OR that)  
_ARGUMENT_  indicates argument names  
```
**COMMAND**: **`.npcbot`**, **`.npcb`** -- (Player command) by itself will list all syntax available  

- **`lookup <_CLASS_> [_UNSPAWNED_ONLY_]`** -- (GM command) lookup the NPCBot entries by <CLASS>, returns list of NPCBots as ID, Name and Race  
    - _CLASS_ = class ID (i.e. 1 for WARRIOR). **`.npcbot lookup` (`.npcb loo`)** (without the argument) to list class IDs  
    - _UNSPAWNED_ONLY_ = boolean flag, if set to 1 shows only NPCBots which weren't spawned yet  
    **Example Usage**:  
        - `.npcbot lookup 7` (to list all Shamans)  
        - `.npcb loo 11 1` (to list all unspawned Druids)  
- **`list`** -- (GM command)  
    - **`spawned`** -- Lists all spawned bots in the world, their location and quick status  
        - **`free`** -- Same as above but only lists **unowned** bots  
            **Example Usage**:  
                - `.npcbot list spawned`  
                - `.npcbot list spawned free`  
                - `.npcbot list s f`  
- **`add _TARGET_`** -- (GM command) selected NPCBot becomes yours bypassing the price condition. Only works on NPCBots which have no owner  
    - _TARGET_ = selected NPCBot  
    **Example Usage**:  
        - `.npcbot add`  
        - `.npcb add`  
- **`remove _TARGET_`** -- (GM command) dismisses the NPCBot(s) from player's control. **Any bot removed via this command retains its gear**  
    - _TARGET_ = selected NPCBot (dismisses selected NPCBot)  
    - _TARGET_ = selected player (dismisses ALL NPCBots)  
    **Example Usage**:  
        - `.npcbot remove`  
        - `.npcb rem`  
- **`spawn <_ENTRY_|_LINK_>`** -- (GM command) spawns a NPCBot in world, NPCBot is saved in DB. Only works in world maps (not instances). Note that unlike other creatures only one instance of each NPCBot can be spawned, but don't worry: there are many NPCBots to choose from  
    - _ENTRY_ = ID of NPCBot (can be obtained from lookup list)  
    - _LINK_ = creature_template link added by Shift-click (obtained from lookup list)  
    **Example Usage**:  
        - `.npcbot spawn 70001` (spawns NPCBot with ID 70001)  
        - `.npcb sp 70002` (spawn NPCBot with ID 70002)  
        - `.npcb sp [Haromm]` (spawn NPCBot by link)  
- **`move <_ENTRY_|_LINK_|_TARGET_>`** -- (GM command) moves spawned NPCBot to a new location. This command replaces `.npc move` command for bots  
    - _ENTRY_ = ID of NPCBot  
    - _LINK_ = creature_template link added by Shift-click (obtained from lookup list)  
    - _TARGET_ = selected NPCBot  
    **Example Usage**:  
        - `.npcbot move 70001` (moves NPCBot with ID 70001 to your position)  
- **`delete`** -- (GM command) deletes NPCBot from world, NPCBot is removed from its owner if any and deleted from DB. **Gear is given back to either the bot's owner (if there is one) or the player using the command**. If you need bot owner to **not** get the gear back, `.npcbot remove` the bot before deleting. Command will fail if used from the console on **unowned but geared** NPCBots  
    - _TARGET_ -- deletes selected NPCBot  
        - _TARGET_ = selected NPCBot  
        **Example Usage**:  
            - `.npcbot delete`  
            - `.npcb del`  
    - id _ID_ -- deletes NPCBots using creature ID instead of targeting, usable from the console  
        - _ID_ = creature ID (`creature_template`.`entry`)  
        **Example Usage**:  
            - `.npcbot delete id 70032`  
            - `.npcb del id 70032`  
    - free -- deletes **ALL** unowned NPCBots, usable from the console  
        **Example Usage**:  
            - `.npcbot delete free`  
            - `.npcb del f`  
- **`set`** (GM command)  
    - **`faction <a|h|m|f|_factionID_> _TARGET_`** -- sets the faction for selected NPCBot  
        - a = 1802 (alliance team)  
        - h = 1801 (horde team)  
        - m = 14 (monster, hostile to all)  
        - f = 35 (friendly to all)  
        - _factionID_ = ID from FactionTemplate.dbc (experts only). It's NOT what you get by using `.lookup faction` command  
        - _TARGET_ = selected NPCBot  
        **Example Usage:**  
            - `.npcbot set faction` (by itself will display list of subcommands for faction)  
            - `.npcb s f m` (sets the faction of a selected NPCBot to HostileToAll)  
    - **`owner <_GUID_|_NAME_> _TARGET_`** -- sets ownership of a selected NPCBot to a specific player  
        - _GUID_ = player DB guid  
        - _NAME_ = player name  
        - _TARGET_ = selected NPCBot  
        **Example Usage:**  
            - `.npcbot set owner 312` (sets the selected NPCBot owner to the player with guid 312)  
            - `.npcb s o Myplayer` (sets the selected NPCBot owner to the player by name `Myplayer`)  
    - **`spec <_NUMBER_> _TARGET_`** -- forces a spec change for selected NPCBot  
        - _NUMBER_ = a number from **1** to **30**  
        - _TARGET_ = selected NPCBot  
        **Example Usage:**  
            - `.npcbot set spec 2` (selected NPCBot will instantly respec into Fury talent tree; talents will only apply to a warrior NPCBot)  
- **`revive _TARGET_`** -- (GM command) revives NPCBot(s)  
    - _TARGET_ = selected NPCBot (revives this NPCBot)  
    - _TARGET_ = selected player (revives all NPCBots of selected player)  
    **Example Usage:**  
        - `.npcbot revive`  
        - `.npcb rev`  
- **`reloadconfig`** -- (GM command) reloads NPCBot system settings  
    - (No arguments)  
    **Example Usage:**  
        - `.npcbot reloadconfig  
- **`command`** -- (Player command) allows to manage your NPCBots positioning, movement and couple other things (by itself will display list of subcommands)  
    - **`follow _TARGET_`** -- set NPCBot(s) to FOLLOW mode  
        - **`only`** -- toggle INACTIVE mode for NPCBots. Inactive bots will not do anything but follow  
    - **`standstill _TARGET_`** -- set NPCBot(s) to STAY mode  
    - **`stopfully _TARGET_`** -- set NPCBot(s) to IDLE mode  
        - _TARGET_ = selected (your) NPCBot (command affects this NPCBot)  
        - _TARGET_ = any other unit or no selection (command affects all your NPCBots)  
    - **`nocast`** -- toggle NPCBots' ability to cast any spells  
    - **`nolongcast`** -- toggle NPCBots' ability to cast spells with non-zero cast time  
    - **`unbind <_TARGET_|_NAMES..._>`** -- free NPCBot(s) temporarily without dismissing them. Bot(s) will return to home position and wait there until invited back (or server restart)  
    - **`rebind <_TARGET_|_NAMES..._>`** -- call unbound NPCBot(s) back. Use `.npcbot info` to list your unbound NPCBots  
        - _TARGET_ = selected (your) NPCBot (command affects this NPCBot)  
        - _NAMES..._ = case-insensitive NPCBot name(s), *name_containing_spaces_must_be_underscored* (command affects named NPCBot(s))  
    - **`walk`** -- toggle WALK mode for NPCBots  
    - **`nogossip`** -- toggle GOSSIP availability for NPCBots  
    **Example Usage:**  
        - `.npcbot command standstill` (NPCBot stops moving and will hold position)  
        - `.npcb co sta` (same as above)  
        - `.npcbot command stopfully` (NPCBot will interrupt all actions, stop and not react to anything)  
        - `.npcbot command follow` (NPCBot will follow you if not already)  
        - `.npcbot command follow only` (all NPCBots will do nothing while following you)  
        - `.npcb co nog` (you will not be able to open NPCBot gossip menu even out of combat)  
        - `.npcb co unb sheal` (temporarily remove druid NPCBot Sheal)  
- **`info _TARGET_`** -- (Player command) shows info on owned bots  
    - _TARGET_ = selected grouped player or self (shows you info on that player)  
    **Example Usage:**  
        - `.npcbot info`  
        - `.npcb in`  
- **`hide`** -- (Player command) forces NPCBots to temporarily disappear. They will teleport off the map and out of the world for until allowed to come back. Cannot be used in combat  
    - (No arguments)  
    **Example Usage:**  
        - `.npcbot hide`  
        - `.npcb h`  
- **`unhide`|`show`** -- (Player command) the opposite of `.npcbot hide` command; your NPCBots will appear shortly. Cannot be used in combat  
    - (No arguments)
    **Example Usage:**  
        - `.npcbot unhide`  
        - `.npcbot show`  
- **`sendto <_TARGET_|_NAMES..._>`** -- (Player command) for 30 seconds makes NPCBot(s) wait for your signal to move to stationery position. The position must be pointed then by a dest spell (AoE, smoke flare, dynamite, etc.). Stationed bots will stay there indefinetely, use follow command to call them back. Bots in FULLSTOP state can't be moved by this  
    - **`last <_TARGET_|_NAMES..._>`** -- (Player command) same as plain `sendto` but moves NPCBot(s) back to previous position bot was sent **from**, making it stationery  
    - **`point <NUMBER> <_TARGET_|_NAMES..._>`** -- (Player command) moves NPCBot(s) to a previously marked station point  
        - **`set <_NUMBER_> <_TARGET_|_NAMES..._>`** -- (Player command) marks NPCBots' current positions as a station point by the `<_NUMBER_>`  
    - _NUMBER_ = integer in range `1 ... 5`  
    - _TARGET_ = selected NPCBot (move single NPCBot)  
    - _NAMES..._ = space-separated case-insensitive NPCBot names, *name_containing_spaces_must_be_underscored* (move a group of NPCBots)  
    **Example Usage:**  
        - `.npcbot sendto`  
        - `.npcb send eva jol eanor harene`  
        - `.npcbot sendto last eva jol eanor harene`  
- **`recall _TARGET_`** -- (Player command) forces a NPCBot to move directly on your position. Usable while dead. Designed mostly for situations like when you die and your NPCBots are stuck under textures and in combat at the same time  
    - **`teleport _TARGET_`** -- (Player command) forces NPCBots to *teleport* to you immediatelly. Cannot be used in PvP  
    - **`spawns`** -- (Player command) forces your inactive NPCBots to teleport to their spawn locations immediatelly. Use if bots do not join you back after logout  
    - _TARGET_ = selected NPCBot (move single NPCBot)  
    - _TARGET_ = self (move all NPCBots)  
    **Example Usage:**  
        - `.npcbot recall`  
        - `.npcb rec tele`  
- **`kill _TARGET_`|`suicide _TARGET_`** -- (Player command) forces a NPCBot to die. Designed for troubleshooting in situations like when NPCBots are not acting normally. This can be caused by a rare bug causing creatures to retain Unit States. If this doesn't work, try to `/tickle` them  
    - _TARGET_ = selected NPCBot (kill single NPCBot troublemaker)  
    - _TARGET_ = self (kill all your NPCBots)  
    **Example Usage:**  
        - `.npcbot kill`  
        - `.npcbot suicide`  
- **`order`** -- (Player command) allows you to issue an order to your NPCBot. Orders take priority over any other action. Each bot can have up to 3 queued orders at a time (by itself will display list of subcommands)  
    - **`cast <_BOT_NAME_ OR _CLASS_NAME_> <_SPELL_NAME_> [_TARGET_TOKEN_]`** -- cast some spell  
        - _BOT_NAME_ OR _CLASS_NAME_ = your bot name in client's locale, case insensitive OR bot class name in english, in lower case, *name_containing_spaces_must_be_underscored*  
        - _SPELL_NAME_ = spell name in client's locale. All_spaces_must_be_replaced_with_underscores. Case insensitive  
        - _TARGET_TOKEN_ = optional target identifier string. If left empty bot will target self. Case insensitive. Possible values:  
            - `bot`, `self` = selfcast  
            - `me`, `master` = bot owner (you)  
            - `target` = bot's current target (won't work if bot has no target)  
            - `mytarget` = your current target (won't work if you have no target)  
    **Example Usage:**  
        - `.npcbot order cast javad lesser_healing_wave me`  
        - `.npcbot order cast javad purge mytarget`  
- **`useonbot`** -- (Player command) allows you to use your abilities targeting only player on NPCBots. Resurrection, party spells like Intervene, Misdirection, etc. This circumvents any *client-side* restrictions that prevent selecting bots as target for those spells  
    - **`spell <_SPELL_ID_ OR _SPELL_LINK_ OR _SPELL_NAME_>`** -- use ability  
        - _SPELL_ID_ = spell id  
        - _SPELL_LINK_ = result of shift-click from spellbook to chat  
        - _SPELL_NAME_ = result of shift-click from spellbook to macro window, either `Spell Name` or `[Spell Name]`. Case sensitive  
    - **`item <_ITEM_ID_ OR _ITEM_LINK_ OR _ITEM_NAME_>`** -- use item  
        - _ITEM_ID_ = spell id  
        - _ITEM_LINK_ = result of shift-click from spellbook to chat  
        - _ITEM_NAME_ = result of shift-click from spellbook to macro window, either `Item Name` or `[Item Name]`. Case sensitive  
    **Example Usage:**  
        - `.npcbot useonbot spell [Resurrection]`  
        - `.npcbot useonbot spell Dampen Magic`  
        - `.npcbot useonbot spell Intervene`  
        - `.npcbot useonbot item [Gnomish Army Knife]`  
        - `.npcb use s Intervene`  
- **`distance <_VALUE_>`** -- (Player command) allows you to quickly set bot follow distance (by itself will display full help)  
    - **`attack <_VALUE_|_SHORT_|_LONG_>`** -- (Player command) sets attack distance
        - _VALUE_ = desired value for chosen distance type (within standard distance ranges)
        - _SHORT_, _LONG_ = "short" and "long" exact strings for minimum and maximum available spell range for the class  
    **Example Usage:**  
        - `.npcbot distance 75`  
        - `.npcbot distance attack 20`  
        - `.npcb dist a short`  
- **`vehicle eject _TARGET_`** -- (Player command) allows you to kick your NPCBots out of vehicles (bots won't dismount from vehicles automatically while in combat)  
    - _TARGET_ = selected NPCBot (eject this NPCBot)  
    - _TARGET_ = self (eject all NPCBots)  
    **Example Usage:**  
        - `.npcbot vehicle eject`  
        - `.npcb veh e`  
- **`go _ENTRY_`** -- (Admin command) allows you to teleport to NPCBot's current location, similar to `.appear` command for players. Be careful as this command may occasionally teleport you below ground level due to creature pathing errors  
    - _ENTRY_ = creature ID  
    **Example Usage:**  
        - `.npcbot go 70855` (teleport to NPCBot 70855)  
        - `.npcb go 70855`  
- **`wp`** -- (Admin command) a set of development commands for manipulating free-roaming bots wander points. If you wish to use them see the code  
    - **`spawnall`**  
    - **`move`**  
    - **`add`**  
    - **`del`**  
    - **`list`**  
    - **`list all`**  
    - **`go`**  
    - **`setlevels`**  
    - **`setlevels z`**  
    - **`setflags`**  
    - **`setflags z`**  
    - **`setname`**  
    - **`setlinks`**  
    - **`info`**  
    - **`links`**  
- **`dump`** -- (Admin command) allows you to migrate bots data, similar to `pdump` for players (by itself will display list of subcommands)  
    - **`write <_FILENAME_>`** -- creates a backup file containing info required to move bots to another DB  
        - _FILENAME_ = name of the file to create, will be saved in server root folder (Windows) or home directory (Linux), if file extension is not provided, **.sql** wil be used  
        **Example Usage:**  
            - `.npcbot dump write bots_backup` (write to `bots_backup.sql`)  
            - `.npcb du w 1.txt` (write to `1.txt`)  
    - **`load <_FILENAME_> [_KICK_PLAYERS_]`** -- load NPCBots info from a backup file into DB. Requires no players to be playing (use console) and will force a server restart after completion. NPCBots mod must be already installed (all tables present)  
        - _FILENAME_ = your backup file name, must be stored in server root folder (Windows) or home directory (Linux), if file extension is not provided, **.sql** wil be used  
        - _KICK_PLAYERS_ = boolean flag, if set to 1 all players will be kicked from server automatically  
        **Example Usage:**  
            - `.npcbot dump load bots_backup` (load from `bots_backup.sql`)  
            - `.npcb du l 1.txt` (load from `1.txt`)  
- **`createnew <_NAME_> <_CLASS_> _RACE_ _GENDER_ _SKIN_ _FACE_ _HEARSTYLE_ _HAIRCOLOR_ _FEATURES_ _SOUNDSET_`** -- (Admin command) allows you to create new NPCBots for players to use. Creature ids 70800+ are used for that.  
    - _NAME_ = name of created NPCBot. Note that first letter will always be in Upper Case, *name_containing_spaces_must_be_underscored*  
    - _CLASS_ = this refers to NPCBot class. Use `.npcbot lookup` comand to list all available classes  
    - _RACE_ = you have to provide a race for your new NPCbot unless you are creating a NPCBot of one of the special classes for whose race is predefined as well as other details  
        - 1: Human  
        - 2: Orc  
        - 3: Dwarf  
        - 4: Night Elf  
        - 5: Undead  
        - 6: Tauren  
        - 7: Gnome  
        - 8: Troll  
        - 10: Blood Elf  
        - 11: Draenei  
    - _GENDER_ = same as _RACE_, for normal classes you have to select one  
        - 0: Male  
        - 1: Female  
    - _SKIN_, _FACE_, _HEARSTYLE_, _HAIRCOLOR_, _FEATURES_ = appearance details, `0` and up. Different race/gender combinations have different constraints for visuals, use `.npcbot createnew ranges` to see them  
    - _SOUNDSET_ = NPC voice variant for bot to use. There are 3 variants for each race, by default the choice is random  
    **Example Usage:**  
        - `.npcbot createnew Selendris 2 10 1 6 4 3 2 4` (creates a female redhead Blood Elf mage npcbot)  
        - `.npcb cre Selendris 2 10 1 6 4 3 2 4` (creates a female redhead Blood Elf mage npcbot)  
        - `.npcb createnew ranges` (prints visuals constraints for all races)  

### NPCBot Control and Usage
#### NPCBot Getting started
If this is your first time using an NPCBot, you'll need to do the following to get started:

- `.npcbot lookup`  

This will give you a listing of the available classes with an ID to indicate each class. For example, 1 is the class ID for Warriors.  

_Example Output_:
```
.npcbot lookup #class
Looks up npcbots by #class, and return all matches with their creature ID's.
BOT_CLASS_WARRIOR = 1
BOT_CLASS_PALADIN = 2
BOT_CLASS_HUNTER = 3
BOT_CLASS_ROGUE = 4
BOT_CLASS_PRIEST = 5
BOT_CLASS_DEATH_KNIGHT = 6
BOT_CLASS_SHAMAN = 7
BOT_CLASS_MAGE = 8
BOT_CLASS_WARLOCK = 9
BOT_CLASS_DRUID = 11
BOT_CLASS_BLADEMASTER = 12
BOT_CLASS_SPHYNX = 13
BOT_CLASS_ARCHMAGE = 14
BOT_CLASS_DREADLORD = 15
BOT_CLASS_SPELLBREAKER = 16
BOT_CLASS_DARK_RANGER = 17
BOT_CLASS_NECROMANCER = 18
BOT_CLASS_SEA_WITCH = 19
BOT_CLASS_CRYPT_LORD = 20
```

After you have figured out which class you want to lookup type in:

- `.npcbot lookup 1`
```
Looking for bots of class 1...
70001 - [Llane] Human
70002 - [Thran] Dwarf
70003 - [Lyria] Human
70004 - [Ander] Dwarf
70005 - [Malosh] Orc
70006 - [Granis] Dwarf
...
70038 - [Kerra] Blood Elf
```
Next, you'll select an NPCBot from the list:

- `.npcbot spawn 70003`  
For this example, we'll select Lyria with an ID of 70003

Lyria will spawn at your location as a level 80 Warrior (by default, NPCBots spawn at max level)  
Note that NPCBot you spawned is friendly. By default NPCBots spawn with faction ID set to 35 (friendly to all) But NPCBots will follow realm PvP rules, even if it's a FFAPvP  
Also, NPCBots do not attack anything unless provoked, at which point they may attempt to do whatever it takes to kill their target; they can be very persistent  
**NPCBots can only be spawned in world maps**

Right-clicking on the NPCBot will open a _Gossip Menu_ (which gives you some command choices)  
_Example Output_:
```
You need something?
- <Hire bot>
- Nevermind
```
Note: if you are have a GM mode enabled you will also see a '\<Debug\>' menu

Next, you'll most likely just select '\<Hire bot\>' which will popup a confirmation box asking:   
"Do you wish to hire Lyria?", with a cost amount that you can _Accept_ or _Cancel_.
Note: price scales with your level, but rare and elite bots cost more and may require you to be at least level X to hire them

After NPCBot is hired, they will automatically match your level.  
Right-clicking on the NPCBot will open a new Gossip Menu with an assortment of options (described in following subsections). Your NPCBot will follow you around in or out of group, but it's probably a good idea to get them into your group so you can monitor their location on mini-map, or health/mana, etc. Your new hired Gossip Menu will show:
```
- Manage equipment...
- Manage roles...
- Manage formation...
- Manage abilities...
- Manage talents...
- Give consumable...
- <Create Group>
- You are dismissed
- Pull yourself together, damnit
- Nevermind
- [OPTIONAL options may be displayed here]
- <Create Group (all bots)>
- <Add to group>
- <Add all bots to group>
- <Remove from group>
- [CLASS-SPECIFIC options may be displayed here]
```

For now, select '\<Create Group\>' and your NPCBot will join your group and you can begin your adventures!  
As mentioned previously, the other options will be discussed further down this document.

#### NPCBot Hiring Alternatives
If you want you can also spawn an NPC which provides NPCBots hiring services. This is done normal way through `.npc add` command:

- `.npc add 70000`  
Right-click on the NPC will open a _Gossip Menu_:  
```
There are always dudes ready to kill for money.
- I need your services
- Nevermind
```

Down the menu you will find a list of classes of NPCBots. After you select one, a list of NPCBots in the world available to you will appear.  
Note that conditions you need to meet to hire NPCBots this way are completely the same as you would normally have, the only difference is that you don't need to go around the world to find NPCBots you need.

#### NPCBot Getting Around
Whether grouped or not, your NPCBot will follow you around, keeping you buffed along the way (if they can buff), healing you when needed (if it is a healer-type NPCBot), attacking things alongside you and even ressurecting you if you die (if they can ressurect, that is). NPCBots are designed to keep up to your run pace and will mount up on their own version of your mount when you do. In the event that they cannot keep up (due to you moving too fast or they being stuck in combat or something), your NPCBot will eventually teleport to your location (even if you go into another map).  
NOTE: NPCBots cannot teleport to you when you are in a dungeon, if they are not part of your group.

For the most part, go somewhere and they will follow. Simple as that.
In those cases where following might not be safe or you want to proceed safely, you have a few options.

If your NPCBot is in your direct vicinity, you can target them and emote:
- `/stand` to make your NPCBot stay put
- `/wave` to make your NPCBot follow you again

If your NPCBot is not targetable or in the immediate vicinity (for selection), you can use the commands:

- `.npcbot command stay` (`.npcb c s`) to make all your controlled NPCBots STAY

- `.npcbot command follow` (`.npcb c f`) to make all your controlled NPCBots FOLLOW

In the event your NPCBot is too far away to path to you, your NPCBot will teleport themself to you.
You can also use `.npcbot recall teleport` command to force your NPCBots to teleport to you

When you leave the world your NPCBots aren't hanging around outside the dungeon you decided to log out at. Unless you spawned that NPCBot outside that dungeon. When you log out your NPCBots temporarily become normal free NPCBots (but not hireable because they already have an owner - you) and return to their spawn location. If you picked up your NPCBot in Darnassus, it will return there. If you spawned your NPCBot on the road through the Barrens, it will return there. This can be both annoying and good, spawning NPCBots in a good central location (like in cities), will provide you an easy way to hire them (and coincidentally, they like to hang out and buff passerbys).

#### NPCBot Equipment
NPCBots spawn with some basic equipment and clothes. Some NPCBots however start with some rather powerful weapons but they are only visual and provide no benefits: no damage, no stats. Nothing. They are __purely visual__. In fact, in most cases these weapons are partial to class appearance and will always stay (like Dark Ranger and her trusty bow)  
NPCBots give you the ability to customize their individual gear pieces to make them more effective in combat. Note that visual changes to NPCBot's equipment are not instant (except weapons)

To make changes to their gear, you need to right-click that NPCBot and choose `Manage equipment...` from their post-hire Gossip Menu. You should then see the following:
```
- Show me your inventory
- Auto-equip...
- Main hand...
- Ranged...
- Head...
- Shoulders...
- Chest...
- Waist...
- Legs...
- Feet...
- Wrist...
- Hands...
- Back...
- Shirt...
- Finger 1...
- Finger 2...
- Trinket 1...
- Trinket 2...
- Neck...
- Unequip all
- Update visual
- BACK
```
As you can see, you can gear up pretty much every slot on your NPCBot

- `Show me your inventory` will make the NPCBot whisper you a list of everything they currently have including an item icon (helps to understand which slot the item is equipped into)

- `Auto-equip` will list out all the items you have in YOUR bags that the NPCBot can use. Clicking on one of those items will automatically give it to the NPCBot and equip it into the appropriate slot

- `_(INDIVIDUAL GEAR SLOTS)_` will show you what they have equipped (if any), an option to use their old equipment (if any to start with) OR an unequip option (if you gave them some gear), a listing of any item in YOUR bags that the NPCBot can use in that slot and a BACK option. Selecting any of your bag items will automatically send that item to the NPCBot and have them equip it. The option to use old equipment or unequip gear will have the NPCBot RETURN the gear you gave them BACK to YOUR bags. They will then return to the default gear/state for that slot. You can also transmogrify items in displayed gear slots (if this feature is enabled) using items you have in your inventory/bags, refer to worldserver config for transmog rules

- `Unequip all` will have them do just that... dump __ALL__ gear you have given them back into YOUR bags. If you don't have enough space in your bags the excess items will be mailed to you.  NOTE: When firing an NPCBot, any gear you have given your NPCBot will automatically be returned to you

- There is an additional optional item in this menu called `Bot gear bank...` which can be enabled by setting `NpcBot.GearBank.Enable = 1` in config. It gives access to unlimited storage for gear - useful when you have too many bots to keep all their extra gear in your own bags. This is an exploit of course so this feature is disabled by default. Note that this storage is saved per player so you will not lose this gear when your last bot is dismissed, but at the same time you won't be able to access it without bots to talk to

- `BACK` just goes back to the previous menu

#### NPCBot Roles
NPCBot Role management allows you to adjust how they operate overall. The available options are dependent upon the class of the NPCBot you are controlling

To adjust the NPCBot's roles, you need to right-click that NPCBot and choose `Manage roles...` from their Gossip Menu. You should then see (dependent upon the class):
```
- Gathering...
- Looting...
- Tank
- Off-Tank
- DPS
- Heal
- Ranged
- BACK
```
Clicking on the respective Role will toggle it on/off (changing the icon)

The roles can be a little tricky to understand:

- "Tanking" role means that NPCBots will try to produce as much threat as possible, use taunt-like abilities to reaggro targets attacking friends and use defensive cooldowns more liberally. This does NOT include attacking anything. "Tanking" bots with no "Off-Tanking" enabled are considered Main Tanks and will always stay on targets pointed by `TankTargetIconMask` (see [Config Settings](#npcbot-config-settings))

- "Off-Tanking" is an addition to "Tanking" role and makes tanking NPCBots prioritize targets pointed by `OffTankTargetIconMask`. Enabling this role will automatically enable "Tanking" role also

- "DPS" role allows NPCBots to actually deal damage. If this role is disabled NPCBot will not use damaging abilities, not even auto-attack

- "Heal" is what your healers need to have enabled. If this role is disabled NPCBots will not even try to heal anything, not even themselves. No, not even in a face of certain death

- "Ranged" role affects NPCBots' positioning and the distance they will keep from their attack target. Ranged DPS non-tanking bots will always attack target pointed by `RangedDPSTargetIconMask`
_Example_: Warrior having Tanking + DPS + Ranged role enabled will constantly try to taunt the target and run away, only attacking if target catches up

It's recommended to only enable 1 or 2 specific roles for that class to minimize them switching tactics around alot. The only exception is Priest which can handle DPS, Heal and Ranged roles just fine (they will preserve some mana for healing and resort to wand)

`Gathering...` roles allow NPCBots to collect different ores, herbs, leather and other trade goods. It does NOT allow to track those goods so good luck with that. It also does NOT allow bots to craft anything. NPCBots have their skill assigned according to their level so level 1 NPCBot for example will not be able to mine Mithril. Note that bots will only use nodes **you** are very close to

`Looting...` roles allow NPCBots to automatically and quickly collect items from nearby lootable creatures for you and other players in your group. Make sure to chose loot method, quality threshold in your group and looting setting for your looter bot

#### NPCBot Formation
Some times you just want your NPCBot close.. or as far away as possible. The formation option allows you to adjust your NPCBot's distance from you.

Select `Manage formation...` from their Gossip Menu to adjust the formation. You will see:
```
- Follow distance (current: XX)
- DISABLE combat positioning
- Attack distance...
- Attack angle...
- Engage behavior...
- Priority target (Tank)...
- Priority target (DPS)...
- BACK
```
NOTE1: you will see `DISABLE combat positioning`, `Attack distance...` and `Attack angle...` only if NPCBot has `Ranged` role assigned  
NOTE2: you will see `Engage behavior` only if NPCBot is not a tank  
NOTE3: you will see `Priority target (<Role>)...` only if NPCBot has required role(s), you are in group, and at least one target icon belonging to respectful target icon mask is set (see [Config Settings](#npcbot-config-settings)). **Priority targets are set for each NPCBot individually**  
Selecting `Follow distance` will open up a popup window that you can enter in an amount. This amount can be anywhere from **0** to **100**. Setting any higher than **100** will default to **100** and any lower than **0** to **0**. Setting the distance to **0** will result in the NPCBot PASSIVELY following you rather closely and not engaging mobs unless you attack

If `DISABLE combat positioning` option is checked your `Ranged` NPCBots will not try to assume attack positions and will instead retain their follow positioning even in combat, only attacking targets in reach

Selecting `Attack distance...` will allow you to set ranged attack distance. You will see:
```
- Short range attacks
- Long range attacks
- Exact (0-50)
- BACK
```
NOTE: if "Exact" mode is set, its text will change to
```
- Exact (current: XX)
```
Short range are attacks that are the shortest distance of all ranged attacks for NPCBot's class. For example for paladins it is 10 yards (Judgement range) and for Mages it is 20 yards (Fire Blast range)  
Long range attacks are the opposite of short range ones. For most classes this range is about 30-35 yards. This mode is useful when attacking something too dangerous to stand close to  
Selecting `Exact` will open up a popup window that you can enter in an amount. This amount can be anywhere from **0** to **50**. Same rules as for follow distance  
NOTE: setting exact attack distance to **0** will make NPCBots (and their pets) trying to position themselves on top of their target (ignoring model size)

`Attack angle...` allows you to set ranged bots positioning mode. You will see:
```
- Normal
- Avoid frontal AOE
- BACK
```
If you tell your NPCBots to avoid frontal AOE they will try to position themselves in the way that they won't get hit, behing their target and to the either side, but only if you do the same or are already in melee range of the target

`Engage behavior...` submenu is used to manage bots' behaviour when combat is initiated:
```
- Delay attack by: X.XXs
- BACK
```
Attack delay is time (in seconds) your `DPS` NPCBots will wait before they start attacking. **This does not apply to Tanks and Healers**

`Priority target (<Role>)...` allows you to set main target for each bot individually and by role:
```
- <Icon> <Name>
- <Icon> <Name>
- ...
- <None>
- BACK
```
Here `Icon` is group target icon (skull, cross, etc.), `Name` is marked unit's name. Number of those rows is the number of **active** icons belonging to corresponding role. If marked target is attackable then at engage instead of normal targeting this NPCBot will immediately rush towards this unit. Be aware that priority target is **set by icon** and will persist when icon is set to another unit, this new unit becomes new priority target to all bots who have priority set to this icon. Selecting `None` disables priority target for this NPCBot.

#### NPCBot Abilities
NPCBots use most of real class spells. Some spells/abilities such as buffs, heals, remove curse/poison, etc. are available through an NPCBot's Abilities menu. Level restrictions apply to NPCBots too, for example Warlock will not be able to use Fear until level 8  
Selecting `Manage abilities...` from the Gossip menu will give you a listing of spells/abilities that they can cast on you or for you. The "Update" option will refresh the spell listing as some spell may be cooled at the moment  
If spell is not listed this doesn't mean NPCBot does not have the spell, probably you just cannot use it manually  
NPCBots' abilities check algorithm includes finding missing buffs, friends to heal, restocking on consumables (like healthstones), class enchants (Rogue, Shaman), utilities (like using Sprint if falling far behind), spells for party and self, self-heals, finding crowd control targets and finally, attack abilities

Using `Manage allowed abilities...` submenu you can make bots not use some of their spells. Disabled spells list is saved in DB

#### NPCBot Talents
NPCBots don't use normal talent pick choice system. Instead, main talent tree is used (according to a spec) while also picking vital talents from other two trees up to tier 3 (available to players of the same spec).  
Select `Manage talents...` from the Gossip menu to chose a spec. Bot will activate it and continue to progress with chosen spec as you level up. This action has no cooldown

#### NPCBot Grouping
Although NPCBots will follow their owner around grouped or ungrouped and will usually buff people outside their groups, creating group will make NPCBots properly utilize buffs reserved for group members only  
Grouping is also required to properly utilize the DungeonFinder (as you cannot summon NPCBots in or into instances that are ungrouped)

>**NOTE**:
>If DungeonFinder group has only one real player loot rules will be set to _Free For All_

#### NPCBots and Vehicles
NPCBots will always try to use vehicles when player does. With random vehicle types bots will simply copy player actions, but for the essential vehicles bots will use their own tactics. Here is the list:
```
Wyrmrest Skytalon (Eye of Eternity)
Ruby Drake (Oculus)
Emerald Drake (Oculus)
Amber Drake (Oculus)
Argent Warhorse / Battleworg (Trial of the Champion)
Alliance / Horde Gunship Cannon (Icecrown Citadel Gunship Battle)
Mutated Abomination (Icecrown Citadel Professor Putricide, bots will never use)
```
Note: NPCBots do not dismount from vehicles automatically while in combat. Use `.npcbot vehicle eject` command to force them out of their vehicles.

#### NPCBot Extras
Depending on NPCBot's class, there may be extra options found in the Gossip menu for that NPCBot

For example, Rogue NPCBots will present the options:
```
- Help me pick a lock (XX)
- I need you to refresh poisons
- <Choose poison (Main Hand)>
- <Choose poison (Offhand)>
```
Lockpicks allow you to open locked chests in the world and locked items in your inventory. The skill level (XX) is based on NPCBot's level  
Poisons can be chosen for the expected encounters. You'll have to tell your NPCBot to refresh the poisons when you are done

Shaman NPCBots have similar menu for their weapon enchants

Mage NPCBots will give you:
```
- I need food
- I need drink
- I need a refreshment table
```
These options will summon a stack of food or drink for you  
If your level is high enough, the mage NPCBot can summon a refreshment table

Warlock NPCBots will present the options:
```
- I need your healthstone
- I need a soulwell
```
First option will make that Warlock give you their healthstone  
If your level is high enough, the warlock NPCBot can summon a soulwell  
Level restrictions are applied here, too

Hunter and Warlock NPCBots (once they reach level 10) also have pet submenu:
```
- <Choose pet type>
```
You are still aware of level restrictions, right?  
Because they don't quite apply to Hunter. He can summon any pet type, yet exotic pets are only unlocked at 80

Lastly, all NPCBots will have the following extra options:
```
- You are dismissed
- Nevermind
```
`You are dismissed` will remove the NPCBot from your control. They will become pissed off, throw all their gear at you and return back to their spawn location. They will also become enraged for 5 minutes to the point where they will attack anyone attempting to hire them (this can be disabled in config)  
`Nevermind` will simply close out the Gossip menu

### NPCBot Wander System
Besides main purpose which is to assist players, NPCBots can also be used as autonomous units. Wandering bots spawn with gear, but are free of player's control and cannot be hired. Here is a list of features supported:  
1. Wandering bots in open world. Config setting **`NpcBot.WanderingBots.Continents.Count`** controls desired amount of bots roaming world maps. Spawn points are random and level is selected accordingly. These bots give small reward for kill and bonus experience. See the config file for more info.  
2. Wandering bots generated for Battlegrounds. Enabled by **`NpcBot.WanderingBots.BG.Enable`** setting, this feature allows to generate NPCBots to fill BG queue and partake in BG matches themselves. Bots can't fulfill BG objectives currently. Only Warsong Gulch and Arathi Basin are implemented currently.  

### NPCBot Config Settings
If some config settings look ambiguous this section may be of help to you

- **`NpcBot.BaseFollowDistance`**
    - This parameter determines formation size and enemy chase cutoff distance
    - Value range: **0-100**
    - Not saved between log-ins  
    Explanation. Bots group around you in a formation where tanks are in front, melee are on the sides and ranged are in the back. The distance they keep from you is not changed if value of this parameter is 30 or less. Past 30 it is increased linearly up to additional 10 yards between you and a your bots. The distance at which bots start attacking incoming enemies is determined by this parameter as well. This is distance between *player* (or *bot*, if stationed) and the enemy and is about 75% of this paramenter's value. If bot's attack target moves outside of this range bot stops attacking it (unless you attack this target as well) and retreats. **This means** that if this parameter is set low bot actions and chase movement may become erratic. If this parameter is set to **0** bots will act passively unless you point an attack targets (with your melee attack, only works in combat); this may be useful in case you want bots to attack and retreat, or in situation where blind attack is dangerous and you need bots to attack only targets you want them to. **Auto-attack spells like Autoshot or Shoot Wand cancel your melee attack**
- **`NpcBot.XpReduction`**
    - This parameter allows you to set XP gain percent penalty for players using bots during leveling
    - Value range: **0-90**  
    Explanation. XP amount is reduced by a percentage for every used bot after first one (it doesn't matter if bots are in group with player or not). Two bots are able to do much more damage than one player, especially at low levels. Bots also open great potential for grind. So you may want to punish your players a little. The formula is: **(100 - X \* (Y - 1))%** XP gained, where **X** is XP reduction and **Y** is bots count. *Example: XP reduction is 10, bots count = 4; XP gained: 100 - 10 * (4 - 1) = 70% XP gained*. In any case, overall XP reduction from this parameter will never exceed 90%. **This penalty only applies to bots' owner**
- **`NpcBot.HealTargetIconsMask`**
    - This parameter allows players to mark units not under player's control as friends using Target Icons  
    Explanation. Sometimes you need to protect targets other than yourself, escort quests are a good example. With this parameter activated players can set *Raid Icon* on a target they want bots to care about. Bots will treat said target as a member of player's party, heal it if needed and assist it in combat. Parameter itself is a bit mask and consists of a combination of values assigned to each target icon: **Star - 1, Circle - 2, Diamond - 4, Triangle - 8, Moon - 16, Square - 32, Cross - 64, Skull - 128**. *Example: Star, Diamond and Triangle = 1 + 4 + 8 = 13*
- **`NpcBot.TankTargetIconsMask`**
    - This parameter is similar to `NpcBot.HealTargetIconsMask`, but this one marks targets for your NPCBot main tanks
    - Your main tanks **will not stop attacking pointed target** until it's dead or icon is unset
- **`NpcBot.OffTankTargetIconsMask`**
    - This parameter is similar to `NpcBot.TankTargetIconsMask`**, but this one marks targets for your NPCBot off-tanks
    - Your off-tanks **will not stop attacking pointed target** until it's dead or icon is unset
- **`NpcBot.DPSTargetIconsMask`**
    - Same as `NpcBot.TankTargetIconsMask`, but this one affects your damage dealers, and (off-)tanks with DPS role enabled without pointed tanking target, with the same rules
- **`NpcBot.RangedDPSTargetIconsMask`**
    - Same as `NpcBot.DPSTargetIconsMask` but this one only affects your ranged NPCBots
- **`NpcBot.NoDPSTargetIconMask`**
    - NPCBots will try to not damage these targets
- **`Heal / Tank / DPS _TargetIconsMask` priorities**
    - For every pointed target type priority goes from *Skull* (highest) to *Star* (lowest)
- **`Heal / Tank / DPS _TargetIconsMask` intersections**
    - If there are any bitmask intersections between target icons (simply put, same icon is used, on accident or otherwise), these rules are applied:
        - Heal + DPS target **will not be protected** by taunting or attacking the attackers
        - Heal + DPS target **may still be healed** if can be healed
        - Heal + DPS target **may still be attacked** if attackable and in combat
        - Heal + (Off-)Tank target **will still be tanked** if can be attacked
        - All DPS icons will be automatically excluded from **`NoDPSTargetIconMask`**
- **`NpcBot.Cost`**
    - This parameter determines how much money player has to pay to hire a bot
    - This is how much money player has to pay **at level 80**, for lower levels cost is reduced:
        - level  1-10: cost / 5000
        - level 11-20: cost / 100
        - level 21-30: cost / 20
        - level 31-40: cost / 5
        - level  41+:  cost / 80 \* level  
    Explanation. The value you set is in copper (1 silver = 100 copper, 1 gold = 100 silver = 10000 copper). Rare and Elite bots cost more (**x2** for Rare and **x5** for Elite)
- **`NpcBot.Movements.InterruptFood`**
    - This parameter determines if bots should stop eating and drinking if they move  
    Explanation. By default this parameter is disabled to prevent bots' food and drinks spam since bots try to eat and drink whenever they have the chance, which is every time they don't do anything even for a fraction of a second
- **`NpcBot.EquipmentDisplay.Enable`**
    - This parameter allows bots to display equipped items other than weapons on their model  
    Explanation. Normally, for creatures game client only draws default model determined by model ID. This parameter force feeds clients information about unit model and items in equipment slots which is generated at server side; so instead of default model client draws player model components including skin color, face, facial hair and others including "equipped" items. The only problem players may encounter comes from a game client bug which can cause a crash at game exit (client crash, not server crash) with error \#132. This bug can be reproduced by changing base model of unit having UNIT_FLAG2_MIRROR_IMAGE more than 4 times in a short period of time, so bots being polymorphed or druids shapeshifting have higher chance of causing this problem

### NPCBot Mod Localization
All localizable string are contained in `npc_text` table. If you want to make a translation you'll have to populate `npc_text_locale` table accordingly (`Text0_0` field)  

### NPCBot Extra Classes
#### General Information
NPCBot mod features several custom classes inspired by Warcraft III. These bots are ranked Rare, Elite or Rareelite, have different mana increase rate and cannot drink to restore mana, have increased level and hire cost, may have minimum player level requirement. Also, control magic affects them much less, even less than is does players. They are not intended to be as effective as normal classes and/or balanced at any given level. Their main purpose is to support you and other bots. For basic information on certain class use Gossip Menu and click `<Study the creature>`. If you need more info keep on reading  

#### Blademaster
*(Disabled in last version)*  
**Rank: Rare**  
**Level Bonus: +1**  
**Minimum player level: 1**  
**Equipment affects visual: no**  
**Number included: 1**  
**Class specifics:** Very high attack speed, equipped weapon does not affect attack speed, attack power from stats: agility x9, cannot crit with normal attacks, cannot dodge or parry, bonus armor penetration 80%  
Equippable weapon: 2h swords, 2h axes and polearms  
Equippable armor: any (no shield)  
Abilities:

- Netherwalk. Blademaster becomes invisible and moves faster for 30 seconds. If Blademaster breaks invisibility to attack, he will deal 150% damage on first attack
- Mirror Image. Blademaster disappears, creating 1-3 illusions of himself (depends on hero's level). Also dispells all magic from him. Mirror Images deal no real damage and take 200% damage themselves
- Critical Strike (passive). Gives 15% chance to deal critical strike for x2-x4 times normal damage (depends on hero's level)
- Bladestorm (not implemented)  

**Additional info:** Blademaster stands out as a class with highest single target damage capabilities and ability to almost one-shot most things if geared properly. Unfortunately, due to changes in movement mechanic, Blademaster's critical strike animation can no longer be emulated, and thus this class was disabled in last version  

#### Obsidian Destroyer
**Rank: Rareelite**  
**Level Bonus: +3**  
**Minimum player level: 60**  
**Equipment affects visual: weapons only**  
**Number included: 2**  
**Class specifics:** *Very* high resistances, *negative* mana regeneration which cannot be countered by passive mana regeneration effects (like item mp5 stats), cannot mount, no melee attack, stamina bonus +50%, armor bonus: +50%, all damage taken reduced by 33%, attack power from stats: strength x2, spellpower bonus: 50% attack power + 200% intellect + wands, cannot eat  
Equippable weapon: wands **x 2**  
Equippable armor: mail/plate (no shield), **no jewelry or cape**  
Abilities:

- Devour Magic. Dispels up to 2 magic effect from enemies, up to 2 magic effects and 2 curse effects from allies and damaging summoned units in 20 yards dest area, restoring caster's mana and health (20% mana and 5% health for every dispelled effect)
- Shadow Blast. Empowered attack that deals increased splash damage to targets in a rather large area. Main target takes more damage than others
- Drain Mana. Drains all mana from a random ***friendly*** unit. The amount drained is limited by Obsidian Destroyer's maximum mana. **This ability cannot be disabled**
- Replenish Mana. Energizes all surrounding party and raid members within 25 yards for 3% of their maximum mana. *This ability drains all mana*
- Replenish Health. Heals all surrounding party and raid members within 25 yards for 3% of their maximum health. *This ability drains all mana*
- Shadow Armor (passive). Restores mana equal to a percentage of damage taken. This ability only triggers when damage taken is enough to restore 10% of Obsidian Destroyer's mana  

**Additional info:** Obsidian Destroyer in fact derives from a non-hero unit, but received elite status because of the ability to deal insane amounts of damage given the chance, support party of any kind, dispel, purge AND tank at the same time, utilizing abilities of original unit's both forms: statue form and true form  

#### Archmage
**Rank: Rare**  
**Level Bonus: +1**  
**Minimum player level: 20**  
**Equipment affects visual: no**  
**Number included: 1**  
**Class specifics:** Always mounted (ground mount only), no melee attack, armor bonus: 500% intellect, spell damage taken reduced by 35%, spellpower bonus: 100% intellect  
Equippable weapon: staves  
Equippable armor: cloth (no shield)  
Abilities:

- Blizzard. It looks like your typical mage Blizzard but it's in fact a little different. It has no chill effects or anything, but has higher base damage and scales much more with spellpower
- Summon Water Elemental. Archmage Water Elemental has 1 minute duration and 20 sec cooldown, cannot run out of mana and deals more damage since W3 Archmage could have 3 active Elementals
- Brilliance Aura. Increases maximum mana by 10% and mana regeneration by 100% of party and raid members within 40 yards
- Mass Teleport (not implemented)  

**Additional info:** Archmage is most valued for his support capabilities in large groups, although he is very squishy  

#### Dreadlord
**Rank: Rareelite**  
**Level Bonus: +3**  
**Minimum player level: 60**  
**Equipment affects visual: no**  
**Number included: 5**  
**Class specifics:** High resistances, cannot mount, stamina bonus +20%, armor bonus: +50%, all damage taken reduced by 15%, critical strike rating x2, attack power from stats: strength x8, spellpower bonus: 200% stength  
Equippable weapon: axes, maces, swords, 2h axes, 2h maces, 2h swords, polearms, staves, fist weapons, daggers  
Equippable armor: plate (no shield)  
Abilities:

- Carrion Swarm. This ability damages enemies in a very large and long frontal cone, healing Dreadlord for 100% effective damage dealt, can easily restore all health to the Dreadlord, high mana cost. Carrion Swarm deals double damage to incapacitated targets
- Sleep. Puts enemy to sleep for 60 seconds and reduces armor by 100% for the duration. Damage over time effects do not interrupt this effect, only direct damage does
- Vampiric Aura. Increases physical critical damage by 5% and heals party and raid members within 40 yards for 25% (100% for Dreadlord) of damage dealt by melee physical attacks. This heal generates no threat
- Infernal. Summons an Infernal Servant at dest location, damaging and stunning enemy units in the area. Infernal is very resistant to magic and its stats scale with Dreadlord's stats. Infernal burns, dealing damage to surrounding enemies every 2 seconds, 180 sec duration  

**Additional info:** Dreadlord is most useful in a big party with a lot of melee classes and also can be very annoying in pvp if packed with enough haste and armor penetration  

#### Spell Breaker
**Rank: Rare**  
**Level Bonus: +1**  
**Minimum player level: 20**  
**Equipment affects visual: no**  
**Number included: 5**  
**Class specifics:** All spell damage taken reduced by 75%, armor penalty: -30%, attack power from stats: strength x5, block chance +90%, spellpower bonus: 200% stength  
Equippable weapon: axes, maces, swords, fist weapons, daggers  
Equippable armor: mail/plate  
Abilities:

- Steal Magic. Steals benefical spell from an enemy and transfers it to a nearby ally, or removes a negative spell from an ally and transfers it to a nearby enemy, affects magic and curse effects. Transferred effect duration is limited to a maximum of 5 minutes *and minimum of 5 seconds*
- Feedback (passive). Melee attacks burn target's mana dealing arcane damage. Amount burned is equal to melee damage dealt increased by spell power. If target is drained, Spell Breaker's melee attacks will do triple damage with increased critical strike chance. If target does't have mana then instead of draining Spellbreaker's damage restores his own mana equal to 25% of damage dealt
- Control Magic (not implemented)  

**Additional info:** Spell Breaker is mostly pure support class incapable of dealing any serious damage, but may also make quick work of some hapless caster, burning all his mana in seconds  

#### Dark Ranger
**Rank: Rareelite**  
**Level Bonus: +3**  
**Minimum player level: 40**  
**Equipment affects visual: no**  
**Number included: 5**  
**Class specifics:** Undead, damage generates no threat, sneak mode if not moving, spell damage taken reduced by 35%, attack power from stats: agility x4 + intellect x2, armor penetration bonus: 50%, crit bonus +20%, dodge bonus +30%, spellpower bonus: 50% intellect  
Equippable weapon: swords, daggers, bows  
Equippable armor: cloth/leather (no shield)  
Abilities:

- Silence. Silences an enemy and nearby targets for 8 seconds. Maximum of 5 targets, 15 sec cooldown
- Black Arrow. Fires a cursed arrow dealing 150% weapon damage and additional damage over time. If affected target dies from Dark Ranger's damage, Dark Minion will spawn from the corpse (does not apply to players), leaving a pile of gore (lootable). Deals 5 times more damage if target is under 20% health. Only affects humanoids, beasts and dragonkin. If target unit's rank is rare, elite of rareelite, spawns elite Minion instead. Maximum 5 Minions, Minions live for 80 seconds and are immune to healing effects
- Drain Life. Drains health from an enemy every second for 5 seconds starting with 0 (6 total ticks), healing Dark Ranger for 200% of the drained amount
- Charm (not implemented)
- Taunt (Dark Minion). Taunts an enemy within melee range to attack Dark Minion instead of Dark Ranger for 5 seconds. One-time use
- Improved Blocking (Dark Minion). Increases chance to block an attack by 60-100% (depends on caster's level) for 6 seconds. One-time use  

**Additional info:** Dark Ranger has most use in solo combined with healer, or as a support in big group due to Silence low cooldown and no other mana sinks  

#### Necromancer
**Rank: Elite**  
**Level Bonus: +2**  
**Minimum player level: 20**  
**Equipment affects visual: no**  
**Number included: 5**  
**Class specifics:** Spell damage taken reduced by 20%, no melee attack, spellpower bonus: 100% intellect  
Equippable weapon: staves  
Equippable armor: cloth (no shield)  
Abilities:

- Raise Dead. Raises 2 Skeletons from a corpse (maximum 6 Skeletons, 65 seconds duration, only works on humanoids, beasts and dragonkin)
- Unholy Frenzy. Increases target's melee attack speed by 75%, but constantly drains health and may kill the target. Lasts 45 seconds. Cannot be cancelled. Unlocked at level 30
- Corpse Explosion. Causes a corpse to explode, dealing damage equal to 35% to 75% of dead unit's maximum health (depends on Necromancer's level) to all surrounding enemies. This damage generates no threat. Unlocked at level 40
- Cripple. Reduces target's movement speed, melee attack speed and total strength by 50% for 60 seconds. Unlocked at level 50
- Taunt (Skeleton). Taunts an enemy within melee range to attack Skeleton instead of Necromancer for 5 seconds. One-time use
- Improved Blocking (Skeleton). Increases chance to block an attack by 60-100% (depends on caster's level) for 6 seconds. One-time use  

**Additional info:** Necromancer has some Diablo II spirit to it. Curses may come in the future. Necromancer is mainly a support class, he doesn't have any damaging abilities besides CE, but Skeletons combined with Unholy Frenzy can help quite a lot  

#### Naga Sea Witch
**Rank: Rareelite**  
**Level Bonus: +3**  
**Minimum player level: 1**  
**Equipment affects visual: no**  
**Number included: 5**  
**Class specifics:** Spell damage taken reduced by 30%, attack power from stats: agility x2, parry bonus +25%, spellpower bonus: 200% intellect  
Equippable weapon: daggers, bows  
Equippable armor: cloth (no shield)  
Abilities:

- Forked Lightning. Calls forth a cone of lightning to damage enemies. Hits from 2 to all targets (depending on Sea Witch's level), stunning them for 2 seconds. This damage generates no threat  
- Frost Arrows. Imbues arrow with spellfrost for extra damage, slowing target's movement, attack and casting speed by 30% to 70% (depending on Sea Witch's level)  
- Mana Shield. Creates a shield that absorbs 100% incoming (non-mitigated) damage by using Sea Witch's mana. Absorbs from 1 damage pet 10 points of mana to 10 damage per 1 point of mana (depending on Sea Witch's level)  
- Tornado. Summons a fierce tornado that damages and slows nearby enemy units, sometimes incapacitating them completely. Tornado grows in size over time outdoors, increasing damage dealt and area of effect, but shrinks indoors, dissipating quickly. Unlocked at level 60
- Naga (Passive). Swim speed increased by 200%, damage and dodge chance are greatly increased while in water

**Additional info:** Sea Witch is a versatile ranged damage dealer. She is very durable and has some CC capabilities  

#### Crypt Lord
**Rank: Rareelite**  
**Level Bonus: +3**  
**Minimum player level: 1**  
**Equipment affects visual: no**  
**Number included: 5**  
**Class specifics:** Melee damage taken reduced by 30%, spell damage taken reduced by 15%, stamina bonus +20%, armor bonus: up to +50%, attack power from stats: strength x9, spellpower bonus: 200% strength  
Equippable weapon: axes, maces, swords, 2h axes, 2h maces, 2h swords, polearms, staves, fist weapons, daggers  
Equippable armor: mail/plate (no shield)  
Abilities:

- Impale. Crypt Lord slams the ground with his massive claws, shooting spikes out in a frontal cone, dealing damage and hurling enemy units into the air in their wake, stunning them. Unlocked at level 20.  
- Spiked Carapace. Crypt Lord's chitinous armor increases damage resistance and returns 15% to 50% damage to enemy melee attackers.  
- Carrion Beetles. Crypt Lord progenerates a Carrion Beetle from a fresh corpse of an enemy to attack his enemies. Beetles are permanent but do not regenerate health and only 6 can be controlled at a time. Higher levels allow Crypt Lord to summon more powerful beetles. Unlocked at level 10.  
- Locust Swarm. Crypt Lord releases a swarm of 20-40 (depends on Crypt Lord's level) angry locusts that bite and tear at nearby enemy units, reducing their ability to move or attack. As they chew the enemy flesh, they convert it into a substance that restores hit points to the Crypt Lord when they return. Unlocked at level 40.  

**Additional info:** Crypt Lord is a great melee damage dealer and with little support he becomes a not bad melee tank. Higher levels also provide moderate CC capabilities. Crypt Lord is immune to poison-based effect (but not damage)  

### NPCBot Occupations
#### Database
NPCBot data is stored in the following locations:

- `characters` DB
    - `characters_npcbot` (created by this mod) contains all information about spawned npcbots
    - `characters_npcbot_group_member` (created by this mod) contains NPCBot group member records
    - `characters_npcbot_transmog` (created by this mod) contains transmogrification info for NPCBots
    - `characters_npcbot_gear_storage` (created by this mod) contains NPCBot gear storage info per player
    Also writes to:
        - `item_instance` (item owner assignment)
- `world` DB
    - `creature_template_outfits` (created by this mod) contains static display information
    - `creature_template_npcbot_appearance` (created by this mod) contains dynamic display information
    - `creature_template_npcbot_extras` (created by this mod) contains race and class info
    - `creature_template_npcbot_wander_nodes` (created by this mod) movement points for wandering bots
    - `creature_template` (ids 70000-71000\*) contains creature base data for bots
    - `creature_equip_template` (ids 70000-71000\*) contains bots' standard weapons info
    - `npc_text` (ids 70000-71000) custom text for bots' gossip and class descriptions
    - `creature` contains info about spawned creatures in the world  
    \* \- max id may be exceeded by custom NPCBots created

If you want to make changes to the static template data used for NPCBots, you make adjustments in the `world` database to those specific ids in the above tables (i.e. npcbot model, outfits, etc.)  
**Do not** tinker with `characters` DB NPCBot tables, any bug reports containing accidently corrupted NPCBots installation will be discarded without notice  
If you need to delete custom created NPCBot you need to first delete the bot from the world (using `.npcbot delete` command; you need to remove their equipment first, otherwise the items become inaccessible). Then delete by entry (creature id) from `creature_template_npcbot_extras`, `creature_template_npcbot_appearance` and `creature_equip_template` tables, and finally, from `creature_template`  
If you need to remove NPCBot mod completely you need to first delete every spawned bot in the world (using `.npcbot delete` command). Then delete `characters_npcbot`, `characters_npcbot_group_member`, `characters_npcbot_transmog`, `characters_npcbot_gear_storage`, `creature_template_npcbot_extras`, `creature_template_npcbot_appearance` and `creature_template_npcbot_wander_nodes` tables and clean all other used tables of entries by id (70000-71000 + possibly more custom bot entries). `creature_template_outfits` can also be deleted if you are not using Npc Dress Mod

#### Game World
Bots are counted as active objects and keep map grids loaded like players
Bots are being added to world at server loading (after Map System is started)

#### Total number of bots included in fresh install: **312**

### NPCBot Addons
For current version (3.3.5) there is a [NetherBot](https://github.com/NetherstormX/NetherBot) addon by NetherstormX

---------------------------------------
## Guide Changelog

- **Version 0.25** (_14 Jun 2023_)
    - Added `.npcbot useonbot ...` commands
- **Version 0.24** (_20 May 2023_)
    - Crypt lord implementation details
- **Version 0.23** (_08 Feb 2023_)
    - Added addons info
- **Version 0.22** (_24 Dec 2022_)
    - General review with lots of fixes
- **Version 0.21** (_15 Dec 2022_)
    - Added `.npcbot sendto` command
- **Version 0.20** (_13 Dec 2022_)
    - Added new commands / cmd parameters
- **Version 0.19** (_24 Jun 2022_)
    - Added `.npcbot command walk` command
- **Version 0.18** (_22 Jun 2022_)
    - Added info on sea witch
- **Version 0.17** (_18 Jun 2022_)
    - Fixed numerous mistakes, added info on ICC vehicles
- **Version 0.16** (_02 Jan 2022_)
    - Added info on necromancer
- **Version 0.15** (_29 Mar 2021_)
    - Added info on new installation method
- **Version 0.14** (_23 Jan 2021_)
    - Added info on vehicle and dump commands
- **Version 0.13** (_20 Jan 2021_)
    - Added info on vehicles
- **Version 0.12** (_06 Jan 2021_)
    - Added info on autoloot
- **Version 0.11** (_07 Nov 2020_)
    - Added info on localization
- **Version 0.10** (_16 Jun 2020_)
    - Added info on new config settings
- **Version 0.9** (_09 Jun 2020_)
    - Added info on botgiver
- **Version 0.8** (_15 May 2020_)
    - Added info on raid group unit frames
    - Added info on new commands
    - Added info on talents
- **Version 0.7** (_04 Nov 2019_)
    - Added config disambiguation
    - Added info on extra classes
- **Version 0.5.1** (_3 Nov 2019_)
    - Update for branch time-stop-2013
- **Version 0.5** (_30 Oct 2019_)
    - Markdown style fix
- **Version 0.4** (_17 Oct 2019_)
    - Added all extra info

---------------------------------------
