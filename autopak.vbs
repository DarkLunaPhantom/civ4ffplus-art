' A tool that fetches PakBuild and runs it over the Art/ directory here.
' Written in VBScript for maximum portability on Windows build systems.
' Ben Rosser (TC01)

' Standard mode constants (from https://stackoverflow.com/questions/127318/is-there-any-sed-like-utility-for-cmd-exe)
Const ForReading = 1
Const ForWriting = 2

' Default output name. If ran as "run_pakbuild.vbs name" on the command line, use name instead.
' Default to "AutoPak".
If Wscript.Arguments.Count < 1 Then
	OutputName = "AutoPak"
	' Final Frontier Plus override.
	OutputName = "FFPak"
Else
	OutputName = Wscript.Arguments(0)
End If

' Define the names of things.
PakBuildURL = "http://www.civfanatics.net/downloads/civ4/utility/PakBuild.zip"
PakBuildZipName = "PakBuild.zip"
PakBuild = "PakBuild.exe"

' Instantiate some objects.
Set ObjectShell = CreateObject("Shell.Application")
Set FileSystem = CreateObject("Scripting.FileSystemObject")
Set ScriptShell = CreateObject("WScript.Shell")
CurrentDir = FileSystem.GetAbsolutePathName(".")

' If there isn't a PakBuild.exe; download one.
If Not FileSystem.FileExists(PakBuild) Then
	' "Wget" the file; based on https://gist.github.com/udawtr/2053179
	Set Downloader = CreateObject("MSXML2.ServerXMLHTTP")
	Downloader.Open "GET", PakBuildURL, false
	Downloader.Send()
	If Downloader.Status = 200 Then
		Set Stream = CreateObject("ADODB.Stream")
		Stream.Open()
		Stream.Type = 1
		Stream.Write Downloader.ResponseBody
		Stream.Position = 0
		If FileSystem.FileExists(PakBuildZipName) Then
			FileSystem.DeleteFile(PakBuildZipName)
		End If
		Stream.SaveToFile(PakBuildZipName)
		Stream.Close()
	Else
		WScript.Echo "Error: could not download PakBuild."
	End If

	' Extract the downloaded PakBuild.
	FullPath = FileSystem.GetAbsolutePathName(PakBuildZipName)
	Set ZipFiles = ObjectShell.NameSpace(FullPath).Items
	ObjectShell.NameSpace(CurrentDir).CopyHere(ZipFiles)
	
	' Remove the downloaded zip file.
	FileSystem.DeleteFile(PakBuildZipName)
	
End If

' Now, run PakBuild using our layout file.
ScriptShell.CurrentDirectory = CurrentDir
ScriptShell.Run PakBuild & " /R=" & OutputName & " /X=.txt;.fpk_layout;.fpk;.vbs /F"