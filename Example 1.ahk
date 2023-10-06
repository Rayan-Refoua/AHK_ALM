#requires AutoHotkey v2.0

#Include ALM v1.0.ahk

;A key that will be used as unique app identifier.
;Can be anything but it should be at least 6 characters or more
;In this case this AppId will change in each app build so the end user have to acquire new licensekeys to user newer builds.
;You can set it as a static string so it that the license key works on future builds.
ALM.AppID := "SampleAppName v1.0"

;Returns true if the license check is successful and false if otherwise.
Result := ALM.checkLicense()

if (Result == 0){
	A_Clipboard := ALM.generateHWID()
	Msg := "You do not have a valid license key.`nPlease send us your HWID (at JerryFromSales@PaidSoftware.com) and receive a valid license key from us to continue.`n`nYour Hardware ID is:`n" ALM.generateHWID() . "`n(Copied to Clipboard!)"
	LicenseBox := InputBox(Msg, "License Management", "W600 H200", "Enter the key you received")
	if (LicenseBox.Result = "OK"){
		ALM.SaveKeyFile(LicenseBox.Value)
		Reload
	}else{
		ExitApp
	}
}
MsgBox("App Started!")
