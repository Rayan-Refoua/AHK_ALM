﻿#requires AutoHotkey v2.0
#include libs\TheArkive_CliSAK.ahk
#include libs\BcryptHash_ahk2.ahk

class ALM {
	static AppID := ""
	static HWID := ""
	static Key := ""
	static checkLicense() {
		if (FileExist("key") == "") {
			return 0
		}
		FileRead("key")
		if (ALM.generateKey() = FileRead("key")) {
			return 1
		} else {
			return 0
		}
	}
	static generateHWID() {
		if (ALM.HWID != "") {
			return ALM.HWID
		}
		MainSN := ComObjGet("winmgmts:").ExecQuery("SELECT SerialNumber FROM Win32_BaseBoard").ItemIndex(0).SerialNumber
		CPUSN := ComObjGet("winmgmts:").ExecQuery("SELECT ProcessorId FROM Win32_Processor").ItemIndex(0).ProcessorId
		HWID := MainSN . CPUSN
		return ALM.HWID := hash(&HWID)
	}
	static generateKey() {
		if (ALM.Key != "") {
			return ALM.Key
		}
		if (ALM.HWID == "") {
			ALM.generateHWID()
		}
		if (ALM.AppID == "") {
			throw Error("AppID is not set")
		}
		key := ALM.HWID . ALM.AppID
		return ALM.key := hash(&key)
	}
	static WriteLicense() {
		ALM.SaveKeyFile(ALM.generateKey())
	}
	static SaveKeyFile(key){
		ALM.removeLicense()
		FileAppend(key, "key")
		FileSetAttrib("+H", "key")
	}
	static removeLicense(){
		if (FileExist("key") != "") {
			FileDelete("key")
			return 1
		}
		return 0
	}
}
