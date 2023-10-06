#requires AutoHotkey v2.0

#include libs\BcryptHash_ahk2.ahk

MyGui := Gui(, "ALM KeyGen V1.0")

MyGui.Add("Text",, "Enter HWID:")
HWIDEdit := MyGui.Add("Edit", "r2 w300")

MyGui.Add("Text",, "Enter AppID:")
AppIDEdit := MyGui.Add("Edit", "r2 w300")

MyBtn := MyGui.Add("Button", "Default w300 h40", "Generate")
MyBtn.OnEvent("Click", generate)  ; Call MyBtn_Click when clicked.

MyGui.Add("Text",, "License Key:")
LicenseKeyEdit := MyGui.Add("Edit", "r2 w300 ReadOnly")

MyBtn := MyGui.Add("Button", "w300", "Copy to clipboard")
MyBtn.OnEvent("Click", copytoclip)  ; Call MyBtn_Click when clicked.

MyGui.Show()

generateKey(HWID,AppID) {
	key := HWID . AppID
	return hash(&key)
}

generate(GuiCtrlObj, Info){
	global
	LicenseKeyEdit.Value := generateKey(HWIDEdit.Value,AppIDEdit.Value)
	/*
	if (FileExist("key") != "") {
		FileDelete("key")
	}
	FileAppend(LicenseKeyEdit.Value, "key")
	FileSetAttrib("+H", "key")
	*/
}

copytoclip(GuiCtrlObj, Info){
	GuiCtrlObj.Enabled := 0
	GuiCtrlObj.Text := "Copied!"
	A_Clipboard := LicenseKeyEdit.Value
	Sleep 500
	GuiCtrlObj.Text := "Copy to clipboard"
	Sleep 1000
	GuiCtrlObj.Enabled := 1
}