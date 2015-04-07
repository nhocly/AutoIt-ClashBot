;Main GUI Settings
$frmBot = GUICreate($sBotTitle, 640, 425, -1, -1)

GUISetIcon(@ScriptDir & "\Icons\cocbot.ico")
TraySetIcon(@ScriptDir & "\Icons\cocbot.ico")

; The Bot Status Screen
$txtLog = _GUICtrlRichEdit_Create($frmBot, "", 8, 68, 290, 225, BitOR($ES_MULTILINE, $ES_READONLY, $WS_VSCROLL, $WS_HSCROLL, 8912))


;Menu Settings
$fileMenu = GUICtrlCreateMenu("File")
$configMenu = GUICtrlCreateMenu("Config")
$loadConfig = GUICtrlCreateMenuItem("Load", $configMenu)
GUICtrlSetOnEvent(-1, "btnLoadConfig")
GUICtrlSetTip(-1, "Load Configuration Setting")
$saveConfig = GUICtrlCreateMenuItem("Save", $configMenu)
GUICtrlSetOnEvent(-1, "btnSaveConfig")
GUICtrlSetTip(-1, "Save Configuration Setting")
$aboutUs = GUICtrlCreateMenu("About Us")


; Main TABS Container
$tabMain = GUICtrlCreateTab(-1, 30, 645, 400)
GUICtrlSetOnEvent(-1, "tabMain")


; ------------------------- GLOBAL SECTION STARTS HERE ------------------------- ;

; Control Bot Container in GLOBAL
$bottomControlGroup = GUICtrlCreateGroup("Control", 8, 300, 290, 75)
$btnStart = GUICtrlCreateButton("Start Bot", 15, 320, 75, 50)
GUICtrlSetOnEvent(-1, "btnStart")
$btnStop = GUICtrlCreateButton("Stop Bot", 15, 320, 75, 50)
GUICtrlSetOnEvent(-1, "btnStop")
GUICtrlSetState(-1, $GUI_HIDE)
$btnHide = GUICtrlCreateButton("Hide BS", 110, 320, 75, 30)
GUICtrlSetOnEvent(-1, "btnHide")
GUICtrlSetState(-1, $GUI_DISABLE)
$chkBackground = GUICtrlCreateCheckbox("BG Mode", 115, 355, 75, 15)
GUICtrlSetBkColor($chkBackground, $COLOR_WHITE)
GUICtrlSetOnEvent(-1, "chkBackground")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetTip(-1, "Activate Background Mode")
$chkForceBS = GUICtrlCreateCheckbox("Force Active", 190, 355, 75, 15)
GUICtrlSetBkColor($chkForceBS, $COLOR_WHITE)
GUICtrlSetOnEvent(-1, "chkForceBS")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetTip(-1, "Maximize Bluestack window if fail to locate")
$btnAtkNow = GUICtrlCreateButton("Attack Now", 190, 320, 75, 30)
GUICtrlSetOnEvent(-1, "btnAtkNow")
GUICtrlSetState(-1, $GUI_DISABLE)


; ------------------------- General SECTION STARTS HERE ------------------------- ;

;General Tab
$pageGeneral = GUICtrlCreateTabItem("General")

; The Locate Buildings Manual CONTAINER
$LocationSettings = GUICtrlCreateGroup("Locate Buildings Manually", 310, 68, 320, 155)
; First Row
$btnLocateTownHall = GUICtrlCreateButton("Locate Townhall", 325, 88, 140, 25)
GUICtrlSetOnEvent(-1, "btnLocateTownHall")
$btnLocateClanCastle2 = GUICtrlCreateButton("Locate Clan Castle", 475, 88, 140, 25)
GUICtrlSetOnEvent(-1, "btnLocateClanCastle")
; Second Row!
$btnLocateKingAltar = GUICtrlCreateButton("Locate King Altar", 325, 120, 140, 25)
GUICtrlSetOnEvent(-1, "btnLocateKingAltar")
$btnLocateQueenAltar = GUICtrlCreateButton("Locate Queen Altar", 475, 120, 140, 25)
GUICtrlSetOnEvent(-1, "btnLocateQueenAltar")
; Third Row!
$btnLocateDarkBarracks = GUICtrlCreateButton("Locate Dark Barrack", 325, 152, 140, 25)
GUICtrlSetOnEvent(-1, "btnLocateDarkBarracks")
$btnLocateBarracks = GUICtrlCreateButton("Locate Barracks", 475, 152, 140, 25)
GUICtrlSetOnEvent(-1, "btnLocateBarracks")
; Fourth Row!
$btnLocateSFactory = GUICtrlCreateButton("Locate Spell Factory", 325, 185, 140, 25)
GUICtrlSetOnEvent(-1, "btnLocateSFactory")
$btnLocateCamp = GUICtrlCreateButton("Locate Army Camp", 475, 185, 140, 25)
GUICtrlSetOnEvent(-1, "btnLocateCamp")

; Options Group
$bottomOptionsGroup = GUICtrlCreateGroup("Options", 310, 230, 320, 80)

; Options Commands
$chkBotStop = GUICtrlCreateCheckbox("", 325, 250, 16, 16)
$cmbBotCommand = GUICtrlCreateCombo("", 348, 246, 250, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Halt Attack Mode|Shutdown PC|Sleep PC", "Halt Attack Mode")
$lblPC = GUICtrlCreateLabel("IF :", 330, 280, 25, 17)
$cmbBotCond = GUICtrlCreateCombo("", 360, 275, 240, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "G and E Full and Max.Trophy|(G and E) Full or Max.Trophy|(G or E) Full and Max.Trophy|G or E Full or Max.Trophy|Gold and Elixir Full|Gold or Elixir Full|Gold Full and Max.Trophy|Elixir Full and Max.Trophy|Gold Full or Max.Trophy|Elixir Full or Max.Trophy|Gold Full|Elixir Full|Reach Max. Trophy", "Gold and Elixir Full")

; Other Options
$otherOptionsGroup = GUICtrlCreateGroup("Other Options", 310, 315, 320, 60)

; Max Trophies
$lblMaxTrophy = GUICtrlCreateLabel("Trophy Range:", 325, 332, 72, 17)
GUICtrlSetTip(-1, "When max trophies is reached, trophies will be dropped until below minimum setting")
$txtMinimumTrophy = GUICtrlCreateInput("1800", 400, 328, 50, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetTip(-1, "When max trophies is reached, trophies will be dropped until below minimum setting")
$lblMaxTrophy2 = GUICtrlCreateLabel("-", 460, 332, 5, 17)
GUICtrlSetTip(-1, "When max trophies is reached, trophies will be dropped until below minimum setting")
$txtMaxTrophy = GUICtrlCreateInput("2000", 475, 328, 50, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetTip(-1, "When max trophies is reached, trophies will be dropped until below minimum setting")


; Donate Train Only
$chkNoAttack = GUICtrlCreateCheckbox("Donate/Train Only", 325, 352, 105, 17)
GUICtrlSetBkColor($chkNoAttack, $COLOR_WHITE)
GUICtrlSetOnEvent(-1, "chkNoAttack")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetTip(-1, "Disable attacking, only do collections/training/donating")

; Donate Only
$chkDonateOnly = GUICtrlCreateCheckbox("Donate Only", 442, 352, 80, 17)
GUICtrlSetBkColor($chkDonateOnly, $COLOR_WHITE)
GUICtrlSetOnEvent(-1, "chkNoAttack")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetTip(-1, "Disable attacking & training, only do collections/donating")


; ------------------------- Search SECTION STARTS HERE ------------------------- ;

;Search Tab
$pageSearchSetting = GUICtrlCreateTabItem("Search")

$DeadConditions = GUICtrlCreateGroup("Dead Base Conditions", 15, 68, 610, 100)
$lblDeadConditions = GUICtrlCreateLabel("Selected conditions must ALL be met when search base with full collectors", 30, 88, 380, 15)

$chkDeadGE = GUICtrlCreateCheckbox("Min Resources:", 30, 110, 100, 17)
$lblDeadMinGold = GUICtrlCreateLabel("Gold: ", 140, 111, 28, 17)
$txtDeadMinGold = GUICtrlCreateInput("50000", 170, 108, 50, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 6)

$cmbDead = GUICtrlCreateCombo("", 240, 105, 45, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "And|Or", "And")

$lblDeadMinElixir = GUICtrlCreateLabel("Elixir: ", 300, 111, 28, 17)
$txtDeadMinElixir = GUICtrlCreateInput("50000", 330, 108, 50, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 6)

$chkDeadMeetDE = GUICtrlCreateCheckbox("Min Dark Elixir:", 400, 108, 95, 17)
$txtDeadMinDarkElixir = GUICtrlCreateInput("0", 500, 105, 60, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 6)

$chkDeadMeetTH = GUICtrlCreateCheckbox("Max TH Level:", 30, 140, 95, 17)
$cmbDeadTH = GUICtrlCreateCombo("", 130, 137, 60, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "4-6|7|8|9|10", "4-6")


$chkDeadMeetTrophy = GUICtrlCreateCheckbox("Min Trophies:", 225, 140, 85, 17)
$txtDeadMinTrophy = GUICtrlCreateInput("0", 315, 137, 60, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)

$chkDeadMeetTHO = GUICtrlCreateCheckbox("Townhall Outside", 400, 140, 100, 17)


$AnyConditions = GUICtrlCreateGroup("Any Base Conditions", 15, 180, 610, 100)

$lblAnyConditions = GUICtrlCreateLabel("Selected conditions must ALL be met when search for any other base", 30, 200, 380, 15)

$chkMeetGE = GUICtrlCreateCheckbox("Min Resources: ", 30, 223, 100, 17)
GUICtrlSetState(-1, $GUI_CHECKED)

$lblMinGold = GUICtrlCreateLabel("Gold:", 140, 225, 28, 17)
$txtMinGold = GUICtrlCreateInput("80000", 170, 220, 50, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 6)

$cmbAny = GUICtrlCreateCombo("", 240, 220, 45, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "And|Or", "And")
$lblMinElixir = GUICtrlCreateLabel("Elixir:", 300, 225, 28, 17)
$txtMinElixir = GUICtrlCreateInput("80000", 330, 220, 50, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 6)

$chkMeetDE = GUICtrlCreateCheckbox("Min Dark Elixir:", 400, 222, 95, 17)
$txtMinDarkElixir = GUICtrlCreateInput("0", 500, 219, 60, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 6)

$chkMeetTH = GUICtrlCreateCheckbox("Max TH Level:", 30, 253, 95, 17)
$cmbTH = GUICtrlCreateCombo("", 130, 250, 60, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "4-6|7|8|9|10", "4-6")

$chkMeetTrophy = GUICtrlCreateCheckbox("Min Trophies:", 225, 253, 85, 17)
$txtMinTrophy = GUICtrlCreateInput("0", 315, 250, 60, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)

$chkMeetTHO = GUICtrlCreateCheckbox("Townhall Outside", 400, 253, 100, 17)

$Searchonly = GUICtrlCreateGroup("Search Only", 310, 290, 320, 85)
GUICtrlCreateLabel("Searching only! Disables attacking!", 375, 310, 320, 15)
$btnSearchMode = GUICtrlCreateButton("Search Mode", 319, 330, 300, 30)
GUICtrlSetOnEvent(-1, "btnSearchMode")
GUICtrlSetTip(-1, "Does not attack. Searches for base that meets conditions.")


; ------------------------- ATTACK SECTION STARTS HERE ------------------------- ;

;Attack Tab
$pageAttackSettings = GUICtrlCreateTabItem("Attack")


$DeadDeploySettings = GUICtrlCreateGroup("Dead Base Deploy Settings", 15, 68, 610, 90)
$cmbDeadDeploy = GUICtrlCreateCombo("", 30, 90, 290, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Attack on a single side, penetrates through base|Attack on two sides, penetrates through base|Attack on three sides, gets outer and some inside of base|Attack on all sides equally, gets most of outer base", "Attack on all sides equally, gets most of outer base")
$cmbDeadAlgorithm = GUICtrlCreateCombo("", 30, 125, 290, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Archers|Barbarians|Goblins|Barbarians + Archers|Barb + Arch + Goblin + Giant|Barb + Arch + Giant|Barb + Arch + Goblin|Barb + Arch + Goblin + Giant + Wallbreakers|Use Barracks|Use All Troops", "Use All Troops") ;"Archers|Barbarians|Goblins|Barbarians + Archers|Barb + Arch + Goblin + Giant|Barb + Arch + Giant|Barb + Arch + Goblin|Barb + Arch + Goblin + Giant + Wallbreakers|Use Barracks"
$chkDeadUseKing = GUICtrlCreateCheckbox("Attack with King", 					345,  90, 115, 17)
$chkDeadUseQueen = GUICtrlCreateCheckbox("Attack with Queen", 					345, 125, 115, 17)
$chkDeadUseClanCastle = GUICtrlCreateCheckbox("Attack with Clan Castle troops", 460, 90, 157, 17)
$chkDeadAttackTH = GUICtrlCreateCheckbox("Attack Townhall (Outside)", 			460, 125, 140, 17)
GUICtrlSetTip(-1, "Troops target Townhall when on the outside of a dead base. Enforces a match during base search if Townhall on outside and base is dead")


$AnyDeploySettings = GUICtrlCreateGroup("Other Base Deploy Settings", 15, 163, 610, 90)
$cmbDeploy = GUICtrlCreateCombo("", 30, 185, 290, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Attack on a single side, penetrates through base|Attack on two sides, penetrates through base|Attack on three sides, gets outer and some inside of base|Attack on all sides equally, gets most of outer base", "Attack on all sides equally, gets most of outer base")
$cmbAlgorithm = GUICtrlCreateCombo("", 30, 220, 290, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Archers|Barbarians|Goblins|Barbarians + Archers|Barb + Arch + Goblin + Giant|Barb + Arch + Giant|Barb + Arch + Goblin|Barb + Arch + Goblin + Giant + Wallbreakers|Use Barracks|Use All Troops", "Use All Troops") ;"Archers|Barbarians|Goblins|Barbarians + Archers|Barb + Arch + Goblin + Giant|Barb + Arch + Giant|Barb + Arch + Goblin|Barb + Arch + Goblin + Giant + Wallbreakers|Use Barracks"
$chkUseKing = GUICtrlCreateCheckbox("Attack with King", 					 345, 185, 115, 17)
$chkUseQueen = GUICtrlCreateCheckbox("Attack with Queen",					 345, 220, 115, 17)
$chkUseClanCastle = GUICtrlCreateCheckbox("Attack with Clan Castle troops",  460, 185, 157, 17)
$chkAttackTH = GUICtrlCreateCheckbox("Attack Townhall (Outside)", 			 460, 220, 140, 17)
GUICtrlSetTip(-1, "Troops target Townhall when on the outside of a base. Enforces a match during base search if Townhall on outside")



$AtkSpeed = GUICtrlCreateGroup("Deploy Speed", 310, 265, 320, 110)

$lblUnitDelay = GUICtrlCreateLabel("Unit Delay:", 320, 295, 65, 17)
$cmbUnitDelay = GUICtrlCreateCombo("", 390, 290, 50, 17, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|10", "5")

$lblWaveDelay = GUICtrlCreateLabel("Wave Delay:", 320, 325, 65, 17)
$cmbWaveDelay = GUICtrlCreateCombo("", 390, 320, 50, 17, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|10", "5")

$chkRandomSpeedAtk = GUICtrlCreateCheckbox("Random Speeds!!", 325, 348, 100, 17)
GUICtrlSetOnEvent(-1, "Randomspeedatk")

$lblAttackdelay = GUICtrlCreateLabel("* Delays of troops deployment speed *	       - [1] Fast = Bot Like!		        - [10] Slow = Human Like!    		                                                  Random will make bot more variant and closer to human!", 445, 280, 180, 400, $SS_CENTER)
;Delays of troops deployment speed, 1 (fast) = like a Bot, 10 (slow) = Like a Human. Random will make bot more varied and closer to a person.

; ------------------------- DONATE SECTION STARTS HERE ------------------------- ;

;Donate Tab
$pageDonateSettings = GUICtrlCreateTabItem("Donate")

$Barbarians = GUICtrlCreateGroup("Barbarians", 20, 93, 160, 175)
$chkDonateAllBarbarians = GUICtrlCreateCheckbox("Donate to All", 35, 118, 97, 17)
$txtDonateBarbarians = GUICtrlCreateEdit("", 30, 143, 140, 115, BitOR($ES_WANTRETURN, $WS_VSCROLL))
GUICtrlSetData(-1, StringFormat("barbarians\r\nbarb\r\nany\r\nreinforcement"))
GUICtrlSetTip(-1, "Keywords for donating Barbarians")

$Archers = GUICtrlCreateGroup("Archers", 190, 93, 160, 175)
$chkDonateAllArchers = GUICtrlCreateCheckbox("Donate to All", 205, 118, 97, 17)
$txtDonateArchers = GUICtrlCreateEdit("", 200, 143, 140, 115, BitOR($ES_WANTRETURN, $WS_VSCROLL))
GUICtrlSetData(-1, StringFormat("archers\r\narch\r\nany\r\nreinforcement"))
GUICtrlSetTip(-1, "Keywords for donating Archers")

$Giants = GUICtrlCreateGroup("Giants", 360, 93, 160, 175)
$chkDonateAllGiants = GUICtrlCreateCheckbox("Donate to All", 375, 118, 97, 17)
$txtDonateGiants = GUICtrlCreateEdit("", 370, 143, 140, 115, BitOR($ES_WANTRETURN, $WS_VSCROLL))
GUICtrlSetData(-1, StringFormat("giants\r\ngiant\r\nany\r\nreinforcement"))
GUICtrlSetTip(-1, "Keywords for donating Giants")

$chkDonateGiants = GUICtrlCreateCheckbox("Donate Giants", 375, 268, 97, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$chkDonateArchers = GUICtrlCreateCheckbox("Donate Archers", 205, 268, 97, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$chkDonateBarbarians = GUICtrlCreateCheckbox("Donate Barbarians", 35, 268, 112, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$chkRequest = GUICtrlCreateCheckbox("Request for :", 30, 68, 82, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUISetOnEvent(-1, "chkRequest")
$txtRequest = GUICtrlCreateInput("Any", 115, 68, 400, 21)
GUICtrlSetTip(-1, "Request for input.")

; ------------------------- TROOPS SECTION STARTS HERE ------------------------- ;


;Troops Tab
$pageTroopSettings = GUICtrlCreateTabItem("Troops")

$Barracks = 		GUICtrlCreateGroup("Troops", 20, 68, 200, 205)
$lblBarbarians = 	GUICtrlCreateLabel("Barb", 35, 88, 45, 17)
$lblArchers = 		GUICtrlCreateLabel("Archer", 92, 88, 45, 17)
$lblGoblins = 		GUICtrlCreateLabel("Goblin", 153, 88, 45, 17)
$txtBarbarians = 	GUICtrlCreateInput("30", 30, 105, 35, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 3)
GUICtrlSetState(-1, $GUI_DISABLE)
$txtArchers = 		GUICtrlCreateInput("60", 90, 105, 35, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 3)
GUICtrlSetState(-1, $GUI_DISABLE)
$txtGoblins = 		GUICtrlCreateInput("10", 150, 105, 35, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 3)
GUICtrlSetState(-1, $GUI_DISABLE)
$lblPercentBarbarians = GUICtrlCreateLabel("%", 68, 110, 12, 17)
$lblPercentArchers = GUICtrlCreateLabel("%", 128, 110, 12, 17)
$lblPercentGoblins = GUICtrlCreateLabel("%", 188, 110, 12, 17)

$lblGiants =		GUICtrlCreateLabel("Giants :", 30, 136, 85, 17)
$lblWallBreakers =  GUICtrlCreateLabel("Wall Breakers :", 30, 161, 85, 17)

$txtNumGiants = 	GUICtrlCreateInput("4", 120, 133, 56, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
GUICtrlSetTip(-1, "Enter number of individual units to train")
GUICtrlSetState(-1, $GUI_DISABLE)
$txtNumWallbreakers = GUICtrlCreateInput("4", 120, 158, 56, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
GUICtrlSetTip(-1, "Enter number of individual units to train")
GUICtrlSetState(-1, $GUI_DISABLE)

$lblCapacity = 		GUICtrlCreateLabel("Camp Capacity :", 30, 186, 85, 17)
$txtCapacity = 		GUICtrlCreateInput("0", 120, 183, 56, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))

$lblRaidcap = 		GUICtrlCreateLabel("Raid Capacity :", 30, 211, 85, 17)
$cmbRaidcap = 		GUICtrlCreateCombo("", 120, 208, 56, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "70|80|90|100", "100")
$lblPercentCapacity = GUICtrlCreateLabel("%", 180, 211, 12, 17)

$cmbTroopComp = 	GUICtrlCreateCombo("", 30, 240, 175, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUISetOnEvent(-1, "cmbTroopComp")
GUICtrlSetData(-1, "Archers|Barbarians|Goblins|B.Arch|B.A.G.G.|B.A.Giant|B.A.Goblin|B.A.G.G.Wall|Use Barracks|Custom Troops|Custom Troops 2", "Use Barracks") ;"Archers|Barbarians|Goblins|B.Arch|B.A.G.G.|B.A.Giant|B.A.Goblin|B.A.G.G.Wall|Use Barracks|Custom Troops|Custom Troops 2"


$BarrackCTGroup = GUICtrlCreateGroup("Custom Troops 2", 240, 68, 375, 121)
$lblBarrackJOE1 = GUICtrlCreateLabel("Barrack 1 :", 250, 87, 53, 17)
$lblBarrackJOE2 = GUICtrlCreateLabel("Barrack 2 :", 250, 112, 53, 17)
$lblBarrackJOE3 = GUICtrlCreateLabel("Barrack 3 :", 250, 137, 53, 17)
$lblBarrackJOE4 = GUICtrlCreateLabel("Barrack 4 :", 250, 162, 53, 17)
$lblBarrackBK1 = GUICtrlCreateLabel("the rest", 457, 87, 35, 17)
$lblBarrackBK2 = GUICtrlCreateLabel("the rest", 457, 112, 35, 17)
$lblBarrackBK3 = GUICtrlCreateLabel("the rest", 457, 137, 35, 17)
$lblBarrackBK4 = GUICtrlCreateLabel("the rest", 457, 162, 35, 17)

$txtFirstTroop1 = GUICtrlCreateInput("2", 310, 84, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
GUICtrlSetState(-1, $GUI_DISABLE)
$txtFirstTroop2 = GUICtrlCreateInput("2", 310, 109, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
GUICtrlSetState(-1, $GUI_DISABLE)
$txtFirstTroop3 = GUICtrlCreateInput("2", 310, 134, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
GUICtrlSetState(-1, $GUI_DISABLE)
$txtFirstTroop4 = GUICtrlCreateInput("2", 310, 159, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
GUICtrlSetState(-1, $GUI_DISABLE)

$cmbFirstTroop1 = GUICtrlCreateCombo("", 350, 84, 95, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins|W.Breakers|Nothing", "Giants")
GUICtrlSetState(-1, $GUI_DISABLE)
$cmbFirstTroop2 = GUICtrlCreateCombo("", 350, 109, 95, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins|W.Breakers|Nothing", "W.Breakers")
GUICtrlSetState(-1, $GUI_DISABLE)
$cmbFirstTroop3 = GUICtrlCreateCombo("", 350, 134, 95, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins|W.Breakers|Nothing", "Giants")
GUICtrlSetState(-1, $GUI_DISABLE)
$cmbFirstTroop4 = GUICtrlCreateCombo("", 350, 159, 95, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins|W.Breakers|Nothing", "W.Breakers")
GUICtrlSetState(-1, $GUI_DISABLE)

$cmbSecondTroop1 = GUICtrlCreateCombo("", 505, 48, 95, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins|Nothing", "Barbarians")
GUICtrlSetState(-1, $GUI_DISABLE)
$cmbSecondTroop2 = GUICtrlCreateCombo("", 505, 109, 95, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins|Nothing", "Archers")
GUICtrlSetState(-1, $GUI_DISABLE)
$cmbSecondTroop3 = GUICtrlCreateCombo("", 505, 134, 95, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins|Nothing", "Barbarians")
GUICtrlSetState(-1, $GUI_DISABLE)
$cmbSecondTroop4 = GUICtrlCreateCombo("", 505, 159, 95, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins|Nothing", "Archers")
GUICtrlSetState(-1, $GUI_DISABLE)

$BarrackGroup = GUICtrlCreateGroup("Barracks", 240, 195, 375, 80)
$lblBarrack1 = GUICtrlCreateLabel("Barrack 1:", 250, 217, 53, 17)
$lblBarrack2 = GUICtrlCreateLabel("Barrack 2:", 250, 242, 53, 17)
$lblBarrack3 = GUICtrlCreateLabel("Barrack 3:", 435, 217, 53, 17)
$lblBarrack4 = GUICtrlCreateLabel("Barrack 4:", 435, 242, 53, 17)
$cmbBarrack1 = GUICtrlCreateCombo("", 305, 213, 110, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins|W.Breakers|Balloon(Training Only)|Wizard(Training Only)|Healer(Training Only)|Dragon(Training Only)|Pekka(Training Only)|Nothing", "Barbarians")
$cmbBarrack2 = GUICtrlCreateCombo("", 305, 238, 110, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins|W.Breakers|Balloon(Training Only)|Wizard(Training Only)|Healer(Training Only)|Dragon(Training Only)|Pekka(Training Only)|Nothing", "Archers")
$cmbBarrack3 = GUICtrlCreateCombo("", 490, 213, 110, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins|W.Breakers|Balloon(Training Only)|Wizard(Training Only)|Healer(Training Only)|Dragon(Training Only)|Pekka(Training Only)|Nothing", "Archers")
$cmbBarrack4 = GUICtrlCreateCombo("", 490, 238, 110, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins|W.Breakers|Balloon(Training Only)|Wizard(Training Only)|Healer(Training Only)|Dragon(Training Only)|Pekka(Training Only)|Nothing", "Goblins")

$DarkBarracks = GUICtrlCreateGroup("", 310, 285, 305, 90)
$chkDarkTroop = GUICtrlCreateCheckbox("Dark Troops", 320, 285, 80, 15) ;; MUST BE REMOVED AND FOLLOW SAME SETUP AS ABOVE!

$lblDarkBarrack1 = GUICtrlCreateLabel("Dark Barrack 1:", 320, 315, 80, 17)
$lblDarkBarrack2 = GUICtrlCreateLabel("Dark Barrack 2:", 320, 340, 80, 17)
$cmbDarkBarrack1 = GUICtrlCreateCombo("", 450, 311, 150, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Minions|Hogs|Valkyries|Nothing", "Minions")
$cmbDarkBarrack2 = GUICtrlCreateCombo("", 450, 336, 150, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Minions|Hogs|Valkyries|Nothing", "Minions")
$txtDarkBarrack1 = GUICtrlCreateInput("5", 410, 311, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$txtDarkBarrack2 = GUICtrlCreateInput("5", 410, 336, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)


; ------------------------- OTHER SECTION STARTS HERE ------------------------- ;


;Other Tab
$pageOtherSettings = GUICtrlCreateTabItem("Other")

$Walls = GUICtrlCreateGroup("Walls", 20, 68, 375, 125)
$chkWalls = GUICtrlCreateCheckbox("Auto Wall Upgrade", 30, 90, 110, 17)
$UseGold = GUICtrlCreateRadio("Use Only Gold", 40, 115, 115, 17)
$WallMinGold = GUICtrlCreateLabel("Minimum Gold: ", 220, 120, 76, 17)
GUICtrlSetTip(-1, "Minimum level of Gold storage to perform the upgrade")
$txtWallMinGold = GUICtrlCreateInput("1300000", 325, 115, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetTip(-1, "Minimum level of Gold storage to perform the upgrade")
GUICtrlSetLimit(-1, 7)
$UseElixir = GUICtrlCreateRadio("Use Only Elixir", 40, 140, 115, 17)
$WallMinElixir = GUICtrlCreateLabel("Minimum Elixir:", 220, 145, 72, 17)
GUICtrlSetTip(-1, "Minimum level of Elixir storage to perform the upgrade")
$txtWallMinElixir = GUICtrlCreateInput("1300000", 325, 140, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetTip(-1, "Minimum level of Elixir storage to perform the upgrade")
GUICtrlSetLimit(-1, 7)
$UseGoldElix = GUICtrlCreateRadio("Use Gold and then Elixir", 40, 165, 150, 17)
$lblWalls = GUICtrlCreateLabel("Current Wall Level:", 220, 92, 100, 17)
$cmbWalls = GUICtrlCreateCombo("", 325, 88, 40, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "4|5|6|7|8|9|10", "4")

$lblTolerance = GUICtrlCreateLabel("Tolerance Level:", 220, 170, 80, 17)
$cmbTolerance = GUICtrlCreateCombo("", 325, 165, 60, 17, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Default|Lower|Higher", "Default")
$btnFindWall = GUICtrlCreateButton("Find Wall", 145, 88, 63, 21)
GUICtrlSetOnEvent(-1, "btnFindWall")
GUICtrlCreateGroup("", -99, -99, 1, 1)

$Upgrade = GUICtrlCreateGroup("Buildings / Walls Upgrade", 20, 193, 375, 105)
$chkUpgrade1 = GUICtrlCreateCheckbox("Upgrade 1 :", 30, 210, 80, 17)
$lblUP1PosX = GUICtrlCreateLabel("Pos X : ", 112, 212, 40, 17)
$txtUpgradeX1 = GUICtrlCreateInput("", 152, 207, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_READONLY))
$lblUP1PosY = GUICtrlCreateLabel("Pos Y : ", 195, 212, 40, 17)
$txtUpgradeY1 = GUICtrlCreateInput("", 235, 207, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_READONLY))
$btnLocateUp1 = GUICtrlCreateButton("Locate Building 1", 285, 207, 100, 21)
GUICtrlSetOnEvent(-1, "btnLocateUp1")
$chkUpgrade2 = GUICtrlCreateCheckbox("Upgrade 2 :", 30, 240, 80, 17)
$lblUP2PosX = GUICtrlCreateLabel("Pos X : ", 112, 242, 40, 17)
$txtUpgradeX2 = GUICtrlCreateInput("", 152, 237, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_READONLY))
$lblUP2PosY = GUICtrlCreateLabel("Pos Y : ", 195, 242, 40, 17)
$txtUpgradeY2 = GUICtrlCreateInput("", 235, 237, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_READONLY))
$btnLocateUp2 = GUICtrlCreateButton("Locate Building 2", 285, 237, 100, 21)
GUICtrlSetOnEvent(-1, "btnLocateUp2")
$chkUpgrade3 = GUICtrlCreateCheckbox("Upgrade 3 :", 30, 270, 80, 17)
$lblUP3PosX = GUICtrlCreateLabel("Pos X : ", 112, 272, 40, 17)
$txtUpgradeX3 = GUICtrlCreateInput("", 152, 267, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_READONLY))
$lblUP3PosY = GUICtrlCreateLabel("Pos Y : ", 195, 272, 40, 17)
$txtUpgradeY3 = GUICtrlCreateInput("", 235, 267, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_READONLY))
$btnLocateUp3 = GUICtrlCreateButton("Locate Building 3", 285, 267, 100, 21)
GUICtrlSetOnEvent(-1, "btnLocateUp3")
GUICtrlCreateGroup("", -99, -99, 1, 1)

$Boosts = GUICtrlCreateGroup("Boosts", 400, 68, 215, 225)
$lblBoostBarracks = GUICtrlCreateLabel("Boosts left :", 410, 88, 60, 17)
$cmbBoostBarracks = GUICtrlCreateCombo("", 480, 84, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5", "0")
$chkBoostKing = GUICtrlCreateCheckbox("King Altar", 410, 118, 65, 17)
$chkBoostQueen = GUICtrlCreateCheckbox("Queen Altar", 510, 118, 75, 17)
$chkBoostRax1 = GUICtrlCreateCheckbox("Barrack 1", 410, 143, 65, 17)
$chkBoostRax2 = GUICtrlCreateCheckbox("Barrack 2", 410, 168, 65, 17)
$chkBoostRax3 = GUICtrlCreateCheckbox("Barrack 3", 510, 143, 65, 17)
$chkBoostRax4 = GUICtrlCreateCheckbox("Barrack 4", 510, 168, 65, 17)


; ------------------------- MISC SECTION STARTS HERE ------------------------- ;


;Misc Tab
$pageMiscSettings = GUICtrlCreateTabItem("Misc")

$Miscs = GUICtrlCreateGroup("Misc", 20, 68, 600, 215)
$lblReconnect = GUICtrlCreateLabel("Reconnect Interval:", 30, 93, 100, 17)
GUICtrlSetTip(-1, "Set reconnect interval when other devices connected - COC English version Only")
$txtReconnect = GUICtrlCreateInput("2", 130, 88, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$lblReconnectmin = GUICtrlCreateLabel("minutes", 165, 93, 100, 17)
$chkTrap = GUICtrlCreateCheckbox("Auto Rearm Traps", 270, 93, 110, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetTip(-1, "Auto rearm for Traps, Crossbows & Inferno Towers")

$lblSearchsp = GUICtrlCreateLabel("Seach Base Speed:", 30, 120, 100, 17)
GUICtrlSetTip(-1, "Set search base speed to higher number if having frequent server sync issue")
$cmbSearchsp = GUICtrlCreateCombo("", 130, 115, 45, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5", "0") ; Search Base Speed
$lblSearchspd = GUICtrlCreateLabel("Tips: 0 = Fast, 5 = Slow", 182, 120, 200, 17)

$UseSkillTimed = GUICtrlCreateRadio("King Skill Delay:", 30, 147, 100, 17)
GUICtrlSetTip(-1, "Set delay timing for King skill")
$txtKingSkill = GUICtrlCreateInput("10", 130, 142, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$lblKingsSkill = GUICtrlCreateLabel("seconds   /", 165, 147, 60, 17)

$lblQueenSkill = GUICtrlCreateLabel("Queen Skill Delay:", 230, 147, 88, 17)
GUICtrlSetTip(-1, "Set delay timing for Queen skill")
$txtQueenSkill = GUICtrlCreateInput("10", 320, 142, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$lblQueensSkill = GUICtrlCreateLabel("seconds", 355, 147, 50, 17)

$UseSkillAuto = GUICtrlCreateRadio("Auto activate of Heroes Skill on low health", 30, 174, 250, 17)
GUICtrlSetTip(-1, "Skill will activate when hero's health is low")

$lblReturnh = GUICtrlCreateLabel("Return Home Delay:", 30, 201, 98, 17)
GUICtrlSetTip(-1, "Set delay timing for return home during raid")
$txtReturnh = GUICtrlCreateInput("10", 130, 196, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$lblReturndelay = GUICtrlCreateLabel("seconds after no income detected", 165, 201, 200, 17)

$chkSpellDarkStorage = GUICtrlCreateCheckbox("Cast Lightning when left:", 30, 228, 131, 17)
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetTip(-1, "Set Min Dark Elixir to Lightning Dark Storage")
$txtSpellDarkStorage = GUICtrlCreateInput("500", 170, 223, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 4)
$lblSpellDarkStorage = GUICtrlCreateLabel("Dark Elixir", 210, 228, 100, 17)

$chkTakeTownSS = GUICtrlCreateCheckbox("Take All Towns Snapshot", 253, 258, 141, 17)
$chkTakeLootSS = GUICtrlCreateCheckbox("Take Loots Snapshot", 131, 258, 118, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$chkAlertSearch = GUICtrlCreateCheckbox("Base Found Alert", 30, 258, 100, 17)


; ------------------------- STATS SECTION STARTS HERE ------------------------- ;


;Stats Tab
$pageStatsSetting = GUICtrlCreateTabItem("Stats")
$resourceonstart = GUICtrlCreateGroup("Resources at Start", 20, 68, 185, 120)
$lblgoldonstart = GUICtrlCreateLabel("Gold at Start :", 50, 96, 65, 17)
$lblresultgoldtstart = GUICtrlCreateLabel("0", 128, 96, 60, 17, $SS_RIGHT)
GUICtrlCreatePic (@ScriptDir & "\images\Resource\Gold.jpg", 30, 96, 15, 15)
$lblelixironstart = GUICtrlCreateLabel("Elixir at Start :", 50, 116, 65, 17)
$lblresultelixirstart = GUICtrlCreateLabel("0", 128, 116, 60, 17, $SS_RIGHT)
GUICtrlCreatePic (@ScriptDir & "\images\Resource\Elixir.jpg", 30, 116, 15, 15)
$lbldeonstart = GUICtrlCreateLabel("DE at Start :", 50, 136, 60, 17)
$lblresultdestart = GUICtrlCreateLabel("0", 128, 136, 60, 17, $SS_RIGHT)
GUICtrlCreatePic (@ScriptDir & "\images\Resource\Dark.jpg", 30, 136, 15, 15)
$lbltrophyonstart = GUICtrlCreateLabel("Trophies at Start :", 50, 156, 100, 17)
$lblresulttrophystart = GUICtrlCreateLabel("0", 128, 156, 60, 17, $SS_RIGHT)
GUICtrlCreatePic (@ScriptDir & "\images\Resource\Trophy.jpg", 30, 156, 15, 15)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$Currentresource = GUICtrlCreateGroup("Other Stats", 210, 68, 185, 120)
$lblvillagesattacked = GUICtrlCreateLabel("Attacked :", 220, 86, 100, 17)
$lblresultvillagesattacked = GUICtrlCreateLabel("0", 318, 86, 60, 17, $SS_RIGHT)
$lblvillagesskipped = GUICtrlCreateLabel("Skipped :", 220, 101, 100, 17)
$lblresultvillagesskipped = GUICtrlCreateLabel("0", 318, 101, 60, 17, $SS_RIGHT)
$lblwallupgrade = GUICtrlCreateLabel("Wall Upgrade :", 220, 116, 100, 17)
$lblwallupgradecount = GUICtrlCreateLabel("0", 318, 116, 60, 17, $SS_RIGHT)
$lblsearchcost = GUICtrlCreateLabel("Search Cost :", 220, 131, 100, 17)
$lblresultsearchcost = GUICtrlCreateLabel("0", 318, 131, 60, 17, $SS_RIGHT)
$lblruntime = GUICtrlCreateLabel("Builder :", 220, 146, 100, 17)
$lblresultbuilder = GUICtrlCreateLabel("0", 318, 146, 60, 17, $SS_RIGHT)
$lblbuilder = GUICtrlCreateLabel("Bot Run Time :", 220, 161, 100, 17)
$lblresultruntime = GUICtrlCreateLabel("00:00:00", 318, 161, 60, 17, $SS_RIGHT)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$LastLoot = GUICtrlCreateGroup("Last Raid", 20, 188, 375,110)
$lblgoldlast = GUICtrlCreateLabel("Gold :",50, 213, 60, 17)
$lblresultgoldlast = GUICtrlCreateLabel("0", 128, 213, 60, 17, $SS_RIGHT)
GUICtrlCreatePic (@ScriptDir & "\images\Resource\Gold.jpg", 30, 213, 15, 15)
$lblelixirlast = GUICtrlCreateLabel("Elixir :", 50, 233, 60, 17)
$lblresultelixirlast = GUICtrlCreateLabel("0", 128, 233, 60, 17, $SS_RIGHT)
GUICtrlCreatePic (@ScriptDir & "\images\Resource\Elixir.jpg", 30, 233, 15, 15)
$lbldelast = GUICtrlCreateLabel("DE :", 250, 213, 60, 17)
$lblresultdelast = GUICtrlCreateLabel("0", 318, 213, 60, 17, $SS_RIGHT)
GUICtrlCreatePic (@ScriptDir & "\images\Resource\Dark.jpg", 230, 213, 15, 15)
$lbltrophylast = GUICtrlCreateLabel("Trophies :", 250, 233, 100, 17)
$lblresulttrophylast = GUICtrlCreateLabel("0", 318, 233, 60, 17, $SS_RIGHT)
GUICtrlCreatePic (@ScriptDir & "\images\Resource\Trophy.jpg", 230, 233, 15, 15)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$CurrentLoot = GUICtrlCreateGroup("Current Resources", 420, 68, 185, 110)
$lblgoldnow = GUICtrlCreateLabel("Gold Now :",450, 91, 60, 17)
$lblresultgoldnow = GUICtrlCreateLabel("0", 528, 91, 60, 17, $SS_RIGHT)
GUICtrlCreatePic (@ScriptDir & "\images\Resource\Gold.jpg", 430, 91, 15, 15)
$lblelixirnow = GUICtrlCreateLabel("Elixir Now :", 450, 111, 60, 17)
$lblresultelixirnow = GUICtrlCreateLabel("0", 528, 111, 60, 17, $SS_RIGHT)
GUICtrlCreatePic (@ScriptDir & "\images\Resource\Elixir.jpg", 430, 111, 15, 15)
$lbldenow = GUICtrlCreateLabel("DE Now :", 450, 131, 60, 17)
$lblresultdenow = GUICtrlCreateLabel("0", 528, 131, 60, 17, $SS_RIGHT)
GUICtrlCreatePic (@ScriptDir & "\images\Resource\Dark.jpg", 430, 131, 15, 15)
$lbltrophynow = GUICtrlCreateLabel("Trophies Now :", 450, 151, 100, 17)
$lblresulttrophynow = GUICtrlCreateLabel("0", 528, 151, 60, 17, $SS_RIGHT)
GUICtrlCreatePic (@ScriptDir & "\images\Resource\Trophy.jpg", 430, 151, 15, 15)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$totalresource = GUICtrlCreateGroup("Total Raid", 420, 185, 185, 110)
$lblgoldgain = GUICtrlCreateLabel("Gold Gain :", 450, 208, 100, 17)
$lblresultgoldgain = GUICtrlCreateLabel("0", 518, 208, 60, 17, $SS_RIGHT)
GUICtrlCreatePic (@ScriptDir & "\images\Resource\Gold.jpg", 430, 208, 15, 15)
$lblelixirgain = GUICtrlCreateLabel("Elixir Gain :", 450, 228, 100, 17)
$lblresultelixirgain = GUICtrlCreateLabel("0", 518, 228, 60, 17, $SS_RIGHT)
GUICtrlCreatePic (@ScriptDir & "\images\Resource\Elixir.jpg", 430, 228, 15, 15)
$lbldegain = GUICtrlCreateLabel("DE Gain :", 450, 248, 100, 17)
$lblresultdegain = GUICtrlCreateLabel("0", 518, 248, 60, 17, $SS_RIGHT)
GUICtrlCreatePic (@ScriptDir & "\images\Resource\Dark.jpg", 430, 248, 15, 15)
$lbltrophiesdropped = GUICtrlCreateLabel("Trophies Won :", 450, 268, 100, 17)
$lblresulttrophiesdropped = GUICtrlCreateLabel("0", 518, 268, 60, 17, $SS_RIGHT)
GUICtrlCreatePic (@ScriptDir & "\images\Resource\Trophy.jpg", 430, 268, 15, 15)

GUICtrlCreateGroup("", -99, -99, 1, 1)


; ------------------------- Notifications SECTION STARTS HERE ------------------------- ;


;Notification
$pagenotificationSetting = GUICtrlCreateTabItem("Notification")
$lblpushbullet = GUICtrlCreateGroup("PushBullet", 20, 68, 375, 175)
$pushbullettoken1 = GUICtrlCreateLabel("Account Token:", 30, 118, 80, 17, $SS_CENTER)
$txtPushBulletTokenValue = GUICtrlCreateInput("", 120, 118, 260, 17)
$chkPushBulletEnabled = GUICtrlCreateCheckbox("Enable", 30, 93, 60, 17)
GUICtrlSetTip(-1, "Enable pushbullet notification")
$chkPushBulletDebug = GUICtrlCreateCheckbox("Debug", 100, 93, 60, 17)
GUICtrlSetTip(-1, "This will add verbosity on log while sending files via pushbullet")
$chkPushBulletRemote = GUICtrlCreateCheckbox("Remote", 170, 93, 60, 17)
GUICtrlSetTip(-1, "Enables pushbullet remote function")
$chkPushBulletDelete = GUICtrlCreateCheckbox("Delete Msg on Start", 240, 93, 120, 17)
GUICtrlSetTip(-1, "Will delete your messages on start button click")

$lblpushmessage = GUICtrlCreateGroup("Push Messages", 30, 143, 260, 75)
$chkPushVillageReport = GUICtrlCreateCheckbox("Village Report", 40, 168, 90, 17)
$chkPushMatchFound = GUICtrlCreateCheckbox("Match Found", 40, 185, 90, 17)
GUICtrlSetOnEvent(-1, "MatchFound")
$chkPushLastRaid = GUICtrlCreateCheckbox("Last Raid", 130, 168, 70, 17)
$chkPushTotalRaid = GUICtrlCreateCheckbox("Total Raid", 130, 185, 70, 17)
$chkPushFreeBuilder = GUICtrlCreateCheckbox("Free Builder", 210, 168, 75, 17)
$chkPushError = GUICtrlCreateCheckbox("Errors", 210, 185, 70, 17)

$lblpushbulletloot = GUICtrlCreateGroup("Last Raid", 300, 143, 80, 75)
$UseJPG = GUICtrlCreateRadio("as JPG", 310, 168, 60, 17)
GUICtrlSetTip(-1, "Attach the loot jpg file in push message")
GUICtrlSetLimit(-1, 7)

$UseText = GUICtrlCreateRadio("as TXT", 310, 185, 60, 17)
GUICtrlSetTip(-1, "Push only text message")
GUICtrlSetLimit(-1, 7)

$lblpushbulletconfig = GUICtrlCreateGroup("Remote Configuration", 415, 68, 185, 75)
$lblpushbulletinterval = GUICtrlCreateLabel("Check Interval:", 425, 93, 80, 17, $SS_RIGHT)
$txtPushBulletInterval = GUICtrlCreateInput("10", 510, 88, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$lblpushbulleintervalmin = GUICtrlCreateLabel("minutes", 525, 93, 80, 17, $SS_CENTER)
$lblpushbullemessages = GUICtrlCreateLabel("Keep Messages:", 425, 118, 80, 17, $SS_RIGHT)
$txtPushBulletMessages = GUICtrlCreateInput("100", 510, 113, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 3)

GUISetState(@SW_SHOW)



;Bottom status bar
$statLog = _GUICtrlStatusBar_Create($frmBot)
_GUICtrlStatusBar_SetSimple($statLog)
_GUICtrlStatusBar_SetText($statLog, "Status : Idle")
$tiAbout = TrayCreateItem("About")
TrayCreateItem("")
$tiExit = TrayCreateItem("Exit")
GUISetState(@SW_SHOW)

$hPic_background = GUICtrlCreatePic(@ScriptDir & "\images\GUI\banner.bmp", 0, 0, 0, 35)
GUICtrlSetState($hPic_background, $GUI_DISABLE)
