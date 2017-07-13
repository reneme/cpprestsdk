. ${PSScriptRoot}\common.ps1
# the script above should make sure that we are in the source root

# Note: this command requires powershell 3
Invoke-WebRequest https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -OutFile nuget.exe

.\nuget.exe restore .\cpprestsdk140.sln

Initialize-VisualStudio

cd Release
msbuild dirs.proj /t:Rebuild /p:Configuration=Release /p:Platform=x64 /p:UseEnv=true
if ($?) { cd .. }  # only cd if build was successful, preserving the exit code if build failed
