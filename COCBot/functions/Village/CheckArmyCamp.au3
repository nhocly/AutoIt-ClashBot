Func CheckArmyCamp()
	SetLog("Checking Army Camp...", $COLOR_BLUE)

	If _Sleep(100) Then Return

	ClickP($TopLeftClient) ;Click Away

	If $ArmyPos[0] = "" Then
		LocateCamp()
		SaveConfig()
	Else
		If _Sleep(100) Then Return
		Click($ArmyPos[0], $ArmyPos[1]) ;Click Army Camp
	EndIf

	Local $BArmyPos = _WaitForPixelSearch(309, 581, 433, 583, Hex(0x4084B8, 6)) ;Finds Info button
	If IsArray($BArmyPos) = False Then
		SetLog("Your Army Camp is not available", $COLOR_RED)
	Else
		Click($BArmyPos[0], $BArmyPos[1]) ;Click Info button
		Local $Campbar = 0
		Switch $icmbRaidcap
			Case 0 ; 70%
				$Campbar = _WaitForPixelSearch(620, 210, 622, 213, Hex(0x37A800, 6))
			Case 1 ; 80%
				$Campbar = _WaitForPixelSearch(649, 210, 651, 213, Hex(0x37A800, 6))
			Case 2 ; 90%
				$Campbar = _WaitForPixelSearch(677, 210, 679, 213, Hex(0x37A800, 6))
			Case 3 ; 100%
				$Campbar = _WaitForPixelSearch(707, 210, 709, 213, Hex(0x37A800, 6))
		EndSwitch
		$CurCamp = Number(getOther(586, 193, "Camp"))
		If $CurCamp > 0 Then
			SetLog("Total Troop Capacity: " & $CurCamp & "/" & $itxtcampCap, $COLOR_GREEN)
		EndIf
		If $CurCamp >= ($itxtcampCap * (GUICtrlRead($cmbRaidcap) / 100)) Or IsArray($Campbar) = True Then
			$fullArmy = True
		Else
			_CaptureRegion()
			If $FirstStart Then
				$ArmyComp = 0
				$CurGiant = 0
				$CurWB = 0
				$CurArch = 0
				$CurBarb = 0
				$CurGoblin = 0
			EndIf
			For $i = 0 To 6
				Local $TroopKind = _GetPixelColor(230 + 71 * $i, 359)
				Local $TroopKind2 = _GetPixelColor(230 + 71 * $i, 385)
				Local $TroopName = "-"
				Local $TroopQ = getOther(229 + 71 * $i, 413, "Camp")
				If _ColorCheck($TroopKind, Hex(0xF85CCB, 6), 20) Then
					If ($FirstStart) Then $CurArch -= $TroopQ
					$TroopName = "Archers"
				ElseIf _ColorCheck($TroopKind, Hex(0xF8E439, 6), 20) Then
					If ($FirstStart) Then $CurBarb -= $TroopQ
					$TroopName = "Barbarians"
				ElseIf _ColorCheck($TroopKind, Hex(0xF8D198, 6), 20) Then
					If ($FirstStart) Then $CurGiant -= $TroopQ
					$TroopName = "Giants"
				ElseIf _ColorCheck($TroopKind, Hex(0x93EC60, 6), 20) Then
					If ($FirstStart) Then $CurGoblin -= $TroopQ
					$TroopName = "Goblins"
				ElseIf _ColorCheck($TroopKind, Hex(0x48A8E8, 6), 20) Then
					If ($FirstStart) Then $CurWB -= $TroopQ
					$TroopName = "Wallbreakers"
				ElseIf _ColorCheck($TroopKind, Hex(0x131D38, 6), 20) Then
					If ($FirstStart) Then $CurMinion -= $TroopQ
					$TroopName = "Minions"
				ElseIf _ColorCheck($TroopKind2, Hex(0x212018, 6), 20) Then
					If ($FirstStart) Then $CurHog -= $TroopQ
					$TroopName = "Hogs"
				ElseIf _ColorCheck($TroopKind, Hex(0x983B08, 6), 20) Then
					If ($FirstStart) Then $CurValkyrie -= $TroopQ
					$TroopName = "Valkyries"
				EndIf
				If $TroopQ <> 0 Then SetLog("- " & $TroopName & " " & $TroopQ, $COLOR_GREEN)
			Next
		EndIf
		If $fullArmy Then
			SetLog("Army Camp Full : " & $fullArmy, $COLOR_RED)
		EndIf
		ClickP($TopLeftClient) ;Click Away
		$FirstCampView = True
	EndIf
EndFunc   ;==>CheckArmyCamp
