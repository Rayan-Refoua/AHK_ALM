#requires AutoHotkey v2.0

if (FileExist("key") != "") {
	FileDelete("key")
	MsgBox("License file removed!")
}else{
	MsgBox("No license file found!")
}
