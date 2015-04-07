; Functions used to check for certain pixels within a timeout period

; Minimum delay value to use should be 30-50ms to avoid problems on low end PCs

; Check for single pixel of a certain colour until timeout
Func _WaitForPixel($iX, $iY, $nColor, $tolerance = 5, $iTimeout = 1000, $iDelay = 100)
	Return _WaitForPixelCapture(0, 0, 860, 720, $iX, $iY, $nColor, $tolerance, $iTimeout, $iDelay)
EndFunc   ;==>_WaitForPixel

Func _WaitForPixelCapture($iLeft, $iTop, $iRight, $iBottom, $iX, $iY, $nColor, $tolerance = 5, $iTimeout = 1000, $iDelay = 100)
	$timer = TimerInit()
	Do
		If _Sleep($iDelay) Then ExitLoop
		_CaptureRegion($iLeft, $iTop, $iRight, $iBottom)
		If _ColorCheck(_GetPixelColor($iX, $iY), $nColor, $tolerance) Then Return True
	Until TimerDiff($timer) > $iTimeout
	Return False
EndFunc   ;==>_WaitForPixelCapture



; Search for a pixel of a certain colour within a region until timeout
; Do not use too large a search area as this increases search time considerably
Func _WaitForPixelSearch($iLeft, $iTop, $iRight, $iBottom, $nColor, $tolerance = 5, $iTimeout = 1000, $iDelay = 100)
	$timer = TimerInit()
	Local $Pos = 0
	Do
		If _Sleep($iDelay) Then ExitLoop
		$Pos = _PixelSearch($iLeft, $iTop, $iRight, $iBottom, $nColor, $tolerance)
		If $Pos <> 0 Then Return $Pos
	Until TimerDiff($timer) > $iTimeout
	Return 0
EndFunc   ;==>_WaitForPixelSearch



; Search for multiple pixels within a region until timeout
Func _WaitForMultiPixelSearch($iLeft, $iTop, $iRight, $iBottom, $xSkip, $ySkip, $firstColor, $arrayPixels, $tolerance = 5, $iTimeout = 1000, $iDelay = 100)
	$timer = TimerInit()
	Local $Pos = 0
	Do
		If _Sleep($iDelay) Then ExitLoop
		$Pos = _MultiPixelSearch($iLeft, $iTop, $iRight, $iBottom, $xSkip, $ySkip, $firstColor, $arrayPixels, $tolerance)
		If $Pos <> 0 Then Return $Pos
	Until TimerDiff($timer) > $iTimeout
	Return 0
EndFunc   ;==>_WaitForMultiPixelSearch
