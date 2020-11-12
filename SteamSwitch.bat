set account1=
set account2=


@echo off
taskkill /IM steam.exe /F > NUL
timeout /t 1 > NUL

for /f "tokens=3*" %%a in ('reg query HKCU\Software\Valve\Steam /v AutoLoginUser') DO set currentUser=%%a

if "%currentUser%" == "%account1%" (set username=%account2%) else (
	if "%currentUser%" == "%account2%" (set username=%account1%) else (
		pause
	)
)

reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %username% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://open/main
