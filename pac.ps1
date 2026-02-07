dotnet publish -c Release  ..\OrderHub\OrderHub.UI\ -r win-x64  -o .\Publish
ISCC.exe "OrderHub Installer Script.iss"
