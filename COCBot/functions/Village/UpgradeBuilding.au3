Func UpgradeBuilding()
	If $ichkUpgrade1 = 0 And $ichkUpgrade2 = 0 And $ichkUpgrade3 = 0 Then Return

	If GUICtrlRead($txtUpgradeX1) = "" And GUICtrlRead($txtUpgradeX2) = "" And GUICtrlRead($txtUpgradeX3) = "" Then
		SetLog("Building location not set, skipping upgrade...", $COLOR_RED)
		ClickP($TopLeftClient) ; Click Away
		Return
	EndIf
	VillageReport()
	If $FreeBuilder = 0 Then
		SetLog("No builders available", $COLOR_RED)
		ClickP($TopLeftClient) ; Click Away
		Return
	EndIf

	Local $ElixirUpgrade1 = False
	Local $ElixirUpgrade2 = False
	Local $ElixirUpgrade3 = False
	Local $iMinGold = Number(GUICtrlRead($txtWallMinGold))
	Local $iMinElixir = Number(GUICtrlRead($txtWallMinElixir))
	Local $iGoldStorage = Number($GoldCount)
	Local $iElixirStorage = Number($ElixirCount)

	;Upgrade 1
	If $iElixirStorage < $iMinElixir And $iGoldStorage < $iMinGold Then
	    SetLog("Current Gold & Elixir lower than Minimum Gold & Elixir, skipping upgrade...", $COLOR_RED)
	    Return
	EndIf


	If $ichkUpgrade1 = 1 Then
		SetLog("Attempting to upgrade Building 1...")

		If _Sleep(500) Then Return
		Click(GUICtrlRead($txtUpgradeX1), GUICtrlRead($txtUpgradeY1))
		If _Sleep(500) Then Return

		Local $ElixirUpgrade = _PixelSearch(300, 565, 629, 575, Hex(0xF759E8, 6), 10) ;Finds Elixir Upgrade Button
		Local $GoldUpgrade = _PixelSearch(300, 565, 629, 575, Hex(0xF4EE54, 6), 10) ;Finds Gold Upgrade Button

		If IsArray($ElixirUpgrade) = True Then
			$ElixirUpgrade1 = True
			Click($ElixirUpgrade[0], $ElixirUpgrade[1]) ;Click Upgrade Button
			Local $UpgradeCheck = _WaitForPixelSearch(370, 480, 520, 483, Hex(0xB9E051, 6), 10) ;Confirm Upgrade
			If IsArray($UpgradeCheck) = True Then
				Click($UpgradeCheck[0], $UpgradeCheck[1]) ;Click Upgrade Button
				If Not _WaitForPixel(571, 263, Hex(0xD90404, 6), 20) Then
					SetLog("Building 1 successfully upgraded...", $COLOR_GREEN)
					If _Sleep(500) Then Return
					ClickP($TopLeftClient, 2)
					GUICtrlSetState($chkUpgrade1, $GUI_UNCHECKED)
				Else
					SetLog("Not enough Elixir to upgrade, try upgrade using Gold...", $COLOR_RED)
					ClickP($TopLeftClient, 2)
					If $iGoldStorage >= $iMinGold Then
						Click(GUICtrlRead($txtUpgradeX1), GUICtrlRead($txtUpgradeY1))
						If _Sleep(500) Then Return
						GoldUpgrade1()
					ElseIf $iGoldStorage < $iMinGold Then
						SetLog("Current Gold is lower than Minimum gold set for upgrading, skip upgrading...", $COLOR_RED)
						If _Sleep(500) Then Return
					EndIf
				EndIf
			EndIf
		EndIf

		If IsArray($GoldUpgrade) = True And $ElixirUpgrade1 <> True Then
			Click($GoldUpgrade[0], $GoldUpgrade[1]) ;Click Upgrade Button
			Local $UpgradeCheck = _WaitForPixelSearch(370, 480, 520, 483, Hex(0xB9E051, 6), 10) ;Confirm Upgrade
			If IsArray($UpgradeCheck) = True Then
				Click($UpgradeCheck[0], $UpgradeCheck[1]) ;Click Upgrade Button
				If _WaitForPixel(571, 263, Hex(0xD90404, 6), 20) Then
					SetLog("Not enough Gold to upgrade, skip upgrading...", $COLOR_RED)
					ClickP($TopLeftClient, 2)
				Else
					SetLog("Building 1 successfully upgraded...", $COLOR_GREEN)
					If _Sleep(500) Then Return
					ClickP($TopLeftClient, 2)
					GUICtrlSetState($chkUpgrade1, $GUI_UNCHECKED)
				EndIf
			EndIf
		EndIf

		VillageReport()
		If _Sleep(500) Then Return
		If $FreeBuilder = 0 Then
			SetLog("No builders available", $COLOR_RED)
			ClickP($TopLeftClient) ; Click Away
			Return
		EndIf
		$iGoldStorage = Number($GoldCount)
		$iElixirStorage = Number($ElixirCount)
		If _Sleep(500) Then Return
		ClickP($TopLeftClient, 2)
	EndIf

	If $iElixirStorage < $iMinElixir And $iGoldStorage < $iMinGold Then
	    SetLog("Current Gold & Elixir lower than Minimum Gold & Elixir, skipping upgrade...", $COLOR_RED)
	    Return
	EndIf

	;Upgrade 2

	If $ichkUpgrade2 = 1 Then
		SetLog("Attempting to upgrade Building 2...")

		If _Sleep(500) Then Return
		Click(GUICtrlRead($txtUpgradeX2), GUICtrlRead($txtUpgradeY2))
		If _Sleep(500) Then Return

		Local $ElixirUpgrade = _PixelSearch(300, 565, 629, 575, Hex(0xF759E8, 6), 10) ;Finds Elixir Upgrade Button
		Local $GoldUpgrade = _PixelSearch(300, 565, 629, 575, Hex(0xF4EE54, 6), 10) ;Finds Gold Upgrade Button

		If IsArray($ElixirUpgrade) = True Then
			$ElixirUpgrade2 = True
			Click($ElixirUpgrade[0], $ElixirUpgrade[1]) ;Click Upgrade Button
			Local $UpgradeCheck = _WaitForPixelSearch(370, 480, 520, 483, Hex(0xB9E051, 6), 10) ;Confirm Upgrade
			If IsArray($UpgradeCheck) = True Then
				Click($UpgradeCheck[0], $UpgradeCheck[1]) ;Click Upgrade Button
				If Not _WaitForPixel(571, 263, Hex(0xD90404, 6), 20) Then
					SetLog("Building 2 successfully upgraded...", $COLOR_GREEN)
					If _Sleep(500) Then Return
					ClickP($TopLeftClient, 2)
					GUICtrlSetState($chkUpgrade2, $GUI_UNCHECKED)
				Else
					SetLog("Not enough Elixir to upgrade, try upgrade using Gold...", $COLOR_RED)
					ClickP($TopLeftClient, 2)
					If $iGoldStorage >= $iMinGold Then
						Click(GUICtrlRead($txtUpgradeX2), GUICtrlRead($txtUpgradeY2))
						If _Sleep(500) Then Return
						GoldUpgrade2()
					ElseIf $iGoldStorage < $iMinGold Then
						SetLog("Current Gold is lower than Minimum gold set for upgrading, skip upgrading...", $COLOR_RED)
						If _Sleep(500) Then Return
					EndIf
				EndIf
			EndIf
		EndIf

		If IsArray($GoldUpgrade) = True And $ElixirUpgrade2 <> True Then
			Click($GoldUpgrade[0], $GoldUpgrade[1]) ;Click Upgrade Button
			Local $UpgradeCheck = _WaitForPixelSearch(370, 480, 520, 483, Hex(0xB9E051, 6), 10) ;Confirm Upgrade
			If IsArray($UpgradeCheck) = True Then
				Click($UpgradeCheck[0], $UpgradeCheck[1]) ;Click Upgrade Button
				If _WaitForPixel(571, 263, Hex(0xD90404, 6), 20) Then
					SetLog("Not enough Gold to upgrade, skip upgrading...", $COLOR_RED)
					ClickP($TopLeftClient, 2)
				Else
					SetLog("Building 2 successfully upgraded...", $COLOR_GREEN)
					If _Sleep(500) Then Return
					ClickP($TopLeftClient, 2)
					GUICtrlSetState($chkUpgrade2, $GUI_UNCHECKED)
				EndIf
			EndIf
		EndIf

		VillageReport()
		If _Sleep(500) Then Return
		If $FreeBuilder = 0 Then
			SetLog("No builders available", $COLOR_RED)
			ClickP($TopLeftClient) ; Click Away
			Return
		EndIf
		$iGoldStorage = Number($GoldCount)
		$iElixirStorage = Number($ElixirCount)
		If _Sleep(500) Then Return
		ClickP($TopLeftClient, 2)
	EndIf

	If $iElixirStorage < $iMinElixir And $iGoldStorage < $iMinGold Then
	    SetLog("Current Gold & Elixir lower than Minimum Gold & Elixir, skipping upgrade...", $COLOR_RED)
	    Return
	EndIf

	;Upgrade 3
	If $ichkUpgrade3 = 1 Then
		SetLog("Attempting to upgrade Building 3...")

		If _Sleep(500) Then Return
		Click(GUICtrlRead($txtUpgradeX3), GUICtrlRead($txtUpgradeY3))
		If _Sleep(500) Then Return

		Local $ElixirUpgrade = _PixelSearch(300, 565, 629, 575, Hex(0xF759E8, 6), 10) ;Finds Elixir Upgrade Button
		Local $GoldUpgrade = _PixelSearch(300, 565, 629, 575, Hex(0xF4EE54, 6), 10) ;Finds Gold Upgrade Button

		If IsArray($ElixirUpgrade) = True Then
			$ElixirUpgrade3 = True
			Click($ElixirUpgrade[0], $ElixirUpgrade[1]) ;Click Upgrade Button
			Local $UpgradeCheck = _WaitForPixelSearch(370, 480, 520, 483, Hex(0xB9E051, 6), 10) ;Confirm Upgrade
			If IsArray($UpgradeCheck) = True Then
				Click($UpgradeCheck[0], $UpgradeCheck[1]) ;Click Upgrade Button
				If Not _WaitForPixel(571, 263, Hex(0xD90404, 6), 20) Then
					SetLog("Building 3 successfully upgraded...", $COLOR_GREEN)
					If _Sleep(500) Then Return
					ClickP($TopLeftClient, 2)
					GUICtrlSetState($chkUpgrade3, $GUI_UNCHECKED)
				Else
					SetLog("Not enough Elixir to upgrade, try upgrade using Gold...", $COLOR_RED)
					ClickP($TopLeftClient, 2)
					If $iGoldStorage >= $iMinGold Then
						Click(GUICtrlRead($txtUpgradeX3), GUICtrlRead($txtUpgradeY3))
						If _Sleep(500) Then Return
						GoldUpgrade3()
					ElseIf $iGoldStorage < $iMinGold Then
						SetLog("Current Gold is lower than Minimum gold set for upgrading, skip upgrading...", $COLOR_RED)
						If _Sleep(500) Then Return
					EndIf
				EndIf
			EndIf
		EndIf

		If IsArray($GoldUpgrade) = True And $ElixirUpgrade3 <> True Then
			Click($GoldUpgrade[0], $GoldUpgrade[1]) ;Click Upgrade Button
			Local $UpgradeCheck = _WaitForPixelSearch(370, 480, 520, 483, Hex(0xB9E051, 6), 10) ;Confirm Upgrade
			If IsArray($UpgradeCheck) = True Then
				Click($UpgradeCheck[0], $UpgradeCheck[1]) ;Click Upgrade Button
				If _WaitForPixel(571, 263, Hex(0xD90404, 6), 20) Then
					SetLog("Not enough Gold to upgrade, skip upgrading...", $COLOR_RED)
					ClickP($TopLeftClient, 2)
				Else
					SetLog("Building 3 successfully upgraded...", $COLOR_GREEN)
					If _Sleep(1000) Then Return
					ClickP($TopLeftClient, 2)
					GUICtrlSetState($chkUpgrade3, $GUI_UNCHECKED)
				EndIf
			EndIf
		EndIf

		VillageReport()
		If _Sleep(500) Then Return
		If $FreeBuilder = 0 Then
			SetLog("No builders available", $COLOR_RED)
			ClickP($TopLeftClient) ; Click Away
			Return
		EndIf
		$iGoldStorage = Number($GoldCount)
		$iElixirStorage = Number($ElixirCount)
		If _Sleep(500) Then Return
		ClickP($TopLeftClient, 2)
	EndIf
EndFunc   ;==>UpgradeBuilding

Func GoldUpgrade1()
	Local $GoldUpgrade = _PixelSearch(300, 565, 629, 575, Hex(0xF4EE54, 6), 10) ;Finds Gold Upgrade Button
	If IsArray($GoldUpgrade) = True Then
		Click($GoldUpgrade[0], $GoldUpgrade[1]) ;Click Upgrade Button
		Local $UpgradeCheck = _WaitForPixelSearch(370, 480, 520, 483, Hex(0xB9E051, 6), 10) ;Confirm Upgrade
		If IsArray($UpgradeCheck) = True Then
			Click($UpgradeCheck[0], $UpgradeCheck[1]) ;Click Upgrade Button
			If _WaitForPixel(571, 263, Hex(0xD90404, 6), 20) Then
				SetLog("Not enough Gold to upgrade, skip upgrading...", $COLOR_RED)
				ClickP($TopLeftClient, 2)
			Else
				SetLog("Building 1 successfully upgraded...", $COLOR_GREEN)
				If _Sleep(500) Then Return
				ClickP($TopLeftClient, 2)
				GUICtrlSetState($chkUpgrade1, $GUI_UNCHECKED)
			EndIf
		EndIf
	EndIf
EndFunc   ;==>GoldUpgrade1

Func GoldUpgrade2()
	Local $GoldUpgrade = _PixelSearch(300, 565, 629, 575, Hex(0xF4EE54, 6), 10) ;Finds Gold Upgrade Button
	If IsArray($GoldUpgrade) = True Then
		Click($GoldUpgrade[0], $GoldUpgrade[1]) ;Click Upgrade Button
		Local $UpgradeCheck = _WaitForPixelSearch(370, 480, 520, 483, Hex(0xB9E051, 6), 10) ;Confirm Upgrade
		If IsArray($UpgradeCheck) = True Then
			Click($UpgradeCheck[0], $UpgradeCheck[1]) ;Click Upgrade Button
			If _WaitForPixel(571, 263, Hex(0xD90404, 6), 20) Then
				SetLog("Not enough Gold to upgrade, skip upgrading...", $COLOR_RED)
				ClickP($TopLeftClient, 2)
			Else
				SetLog("Building 2 successfully upgraded...", $COLOR_GREEN)
				If _Sleep(500) Then Return
				ClickP($TopLeftClient, 2)
				GUICtrlSetState($chkUpgrade2, $GUI_UNCHECKED)
			EndIf
		EndIf
	EndIf
EndFunc   ;==>GoldUpgrade2

Func GoldUpgrade3()
	Local $GoldUpgrade = _PixelSearch(300, 565, 629, 575, Hex(0xF4EE54, 6), 10) ;Finds Gold Upgrade Button
	If IsArray($GoldUpgrade) = True Then
		Click($GoldUpgrade[0], $GoldUpgrade[1]) ;Click Upgrade Button
		Local $UpgradeCheck = _WaitForPixelSearch(370, 480, 520, 483, Hex(0xB9E051, 6), 10) ;Confirm Upgrade
		If IsArray($UpgradeCheck) = True Then
			Click($UpgradeCheck[0], $UpgradeCheck[1]) ;Click Upgrade Button
			If _WaitForPixel(571, 263, Hex(0xD90404, 6), 20) Then
				SetLog("Not enough Gold to upgrade, skip upgrading...", $COLOR_RED)
				ClickP($TopLeftClient, 2)
			Else
				SetLog("Building 3 successfully upgraded...", $COLOR_GREEN)
				If _Sleep(500) Then Return
				ClickP($TopLeftClient, 2)
				GUICtrlSetState($chkUpgrade3, $GUI_UNCHECKED)
			EndIf
		EndIf
	EndIf
EndFunc   ;==>GoldUpgrade3
