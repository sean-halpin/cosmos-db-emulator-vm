PowerShell -Command "Set-ExecutionPolicy Unrestricted" >> "%TEMP%\StartupLog.txt" 2>&1
PowerShell C:\vagrant\start_cosmos.ps1 >> "%TEMP%\StartupLog.txt" 2>&1
