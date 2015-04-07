Global $atkDElix[25]

For $i = 0 To 15
	$atkDElix[$i] = @ScriptDir & "\images\DElix\" & $i + 1 & ".bmp"
Next

For $i = 16 To 24
	$atkDElix[$i] = @ScriptDir & "\images\DElix6\" & $i - 15 & ".bmp"
Next

Global $Tolerance1 = 80

Func checkDarkElix()
	If _Sleep(500) Then Return
	For $i = 0 To 24
		_CaptureRegion(0, 0, 845, 540)
		$DELocation = _ImageSearch($atkDElix[$i], 1, $DElixx, $DElixy, $Tolerance1)
		If $DELocation = 1 Then
			Return $DELocation
		EndIf
	Next
	If $DELocation = 0 Then
		$DElixx = 0
		$DElixy = 0
		Return $DELocation
	EndIf
EndFunc   ;==>checkDarkElix
