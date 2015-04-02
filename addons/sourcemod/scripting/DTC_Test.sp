#include <sourcemod>
#include <dtc>

public Plugin:myinfo = 
{
	name = "DTC_Test",
	author = "Raska",
	description = "",
	version = "0.5",
	url = ""
};

public OnPluginStart()
{
	new String:sConfig1[PLATFORM_MAX_PATH], String:sConfig2[PLATFORM_MAX_PATH];
	BuildPath(Path_SM, sConfig1, sizeof (sConfig1), "configs/dtc_test_1.cfg");
	BuildPath(Path_SM, sConfig2, sizeof (sConfig2), "configs/dtc_test_2.cfg");
	
	// Create test configs
	DTC_CreateConfig(sConfig1, OnCreateConfig1, false);
	DTC_CreateConfig(sConfig2, OnCreateConfig2);
	
	// Loade test config1
	DTC_LoadConfig(sConfig1, OnFile, OnFile);
	
	// Test strings (file & prefix + arguments) out of config
	TestStrings();
}

public OnCreateConfig1(String:sConfigPath[], Handle:hConfigFile)
{
	WriteFileLine(hConfigFile, "// [Mark <team> <scale> <offset>]");
	WriteFileLine(hConfigFile, "");
	WriteFileLine(hConfigFile, "[Mark Red 0.125 12.0] materials/sprites/laserbeam.vmt // some comment");
}

public OnCreateConfig2(String:sConfigPath[], Handle:hConfigFile)
{
	WriteFileLine(hConfigFile, "// Material for mark (.vmt)");
	WriteFileLine(hConfigFile, "// name: name of the mark");
	WriteFileLine(hConfigFile, "// scale = \"1.0\": scale of the mark");
	WriteFileLine(hConfigFile, "// offset = \"12.0\": offset of the mark");
	WriteFileLine(hConfigFile, "// -");	
	WriteFileLine(hConfigFile, "// [Mark <team> <scale> <offset>]");
}

public OnFile(String:sFile[], String:sPrefixName[DTC_MAX_NAME_LEN], Handle:hArgs)
{
	if (StrEqual(sPrefixName, "Mark")) {
		
		new String:sHelper[64];
		DTC_GetArg(hArgs, 1, sHelper, sizeof(sHelper), "ERROR");
		
		LogMessage("File = '%s'", sFile);
		LogMessage("Arg1 = '%s'", sHelper);
		LogMessage("Arg2 = '%.3f'", DTC_GetArgFloat(hArgs, 2, 0.0));
		LogMessage("Arg3 = '%.3f'", DTC_GetArgFloat(hArgs, 3, -1.0));
	}
	
	strcopy(sPrefixName, DTC_MAX_NAME_LEN, "MarkEdited");
	LogMessage("EditedPrefixName = '%s'", sPrefixName);
}

TestStrings()
{
	new String:sSource[256];	
	strcopy(sSource, sizeof(sSource), "[MarkLaser Red 255 0 10.9 -1.125] materials/sprites/laserbeam.vmt");
	LogMessage("sSource = '%s'", sSource);
	
	new String:sPrefix[DTC_MAX_NAME_LEN];
	DTC_GetPrefix(sSource, sPrefix, sizeof(sPrefix));
	LogMessage("DTC_GetPrefix => '%s'", sPrefix);
	
	new String:sFile[DTC_MAX_NAME_LEN];
	DTC_GetFile(sSource, sFile, sizeof(sFile));
	LogMessage("DTC_GetFile => '%s'", sFile);
	
	LogMessage("DTC_StrHasPrefix(sSource, 'marklaser', true) = %s", DTC_StrHasPrefix(sSource, "marklaser", true) ? "true" : "false");
	LogMessage("DTC_StrHasPrefix(sSource, 'marklaser', false) = %s", DTC_StrHasPrefix(sSource, "marklaser", false) ? "true" : "false");
	LogMessage("DTC_StrHasPrefix(sSource, 'testname', false) = %s", DTC_StrHasPrefix(sSource, "testname", false) ? "true" : "false");
	LogMessage("DTC_StrHasPrefix(sSource, 'testname', true) = %s", DTC_StrHasPrefix(sSource, "testname", true) ? "true" : "false");
	
	new String:sPrefixName[DTC_MAX_NAME_LEN];
	DTC_GetPrefixName(sSource, sPrefixName, sizeof(sPrefixName));
	LogMessage("DTC_GetPrefixName => '%s'", sPrefixName);
	
	new Handle:hArgs = DTC_GetArgs(sSource);
	new String:sArg[DTC_MAX_ARG_LEN];
	LogMessage("DTC_GetArgs = %d", hArgs);
	LogMessage("DTC_GetArgsCount = %d", DTC_GetArgsCount(hArgs));
	
	DTC_GetArg(hArgs, 1, sArg, sizeof(sArg), "ERROR");
	LogMessage("Arg1 = %s", sArg);
	
	LogMessage("Arg2 = %d", DTC_GetArgNum(hArgs, 2, -1));
	LogMessage("Arg3 = %d", DTC_GetArgNum(hArgs, 3, -1));
	
	LogMessage("Arg4 = %f", DTC_GetArgFloat(hArgs, 4, -1.0));
	LogMessage("Arg5 = %f", DTC_GetArgFloat(hArgs, 5, -1.0));
	
	LogMessage("DTC_ExistArgValue(hArgs, 'Red', true) = %s", DTC_ExistArgValue(hArgs, "Red", true) ? "true" : "false");
	LogMessage("DTC_ExistArgValue(hArgs, 'Red', false) = %s", DTC_ExistArgValue(hArgs, "Red", false) ? "true" : "false");
	LogMessage("DTC_ExistArgValue(hArgs, 'Blue', true) = %s", DTC_ExistArgValue(hArgs, "Blue", true) ? "true" : "false");
	LogMessage("DTC_ExistArgValue(hArgs, 'Blue', false) = %s", DTC_ExistArgValue(hArgs, "Blue", false) ? "true" : "false");
	
	new bool:bParseString = DTC_ParseString(sSource, sFile, sizeof(sFile), sPrefixName, sizeof(sPrefixName), hArgs);
	LogMessage("DTC_ParseString");
	LogMessage("\t bParseString = %d", _:bParseString);
	LogMessage("\t sFile = '%s'", sFile);
	LogMessage("\t sPrefixName = '%s'", sPrefixName);
	LogMessage("\t hArgs = %d", _:hArgs);
	
	new bool:bSplitString = DTC_SplitString(sSource, sPrefix, sizeof(sPrefix), sFile, sizeof(sFile));
	LogMessage("DTC_SplitString");
	LogMessage("\t bSplitString = %d", _:bSplitString);
	LogMessage("\t sPrefix = '%s'", sPrefix);
	LogMessage("\t sFile = '%s'", sFile);
	
	new Handle:bParsePrefix = DTC_ParsePrefix(sPrefix, sPrefixName, sizeof(sPrefixName));
	LogMessage("DTC_ParsePrefix");
	LogMessage("\t bParsePrefix = %d", _:bParsePrefix);
	LogMessage("\t sPrefixName = '%s'", sPrefixName);
	
	strcopy(sSource, sizeof(sSource), "[MarkLaser 255 \"test\\]test\" -1.125] materials/sprites/laserbeam.vmt");
	LogMessage("sSource = '%s'", sSource);
	hArgs = DTC_GetArgs(sSource);
	LogMessage("DTC_GetArgs = %d", hArgs);
	DTC_GetArg(hArgs, 2, sArg, sizeof(sArg), "ERROR");
	LogMessage("Arg2 = %s", sArg);
}
