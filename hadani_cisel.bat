@echo off
title Hadani_cisel
setlocal enabledelayedexpansion
set /a score=0
set /a pokus=5

:hra
cls
Set /a number=(%RANDOM%*10/32768)+1 
echo ===============
echo  HADANI CISEL
echo ===============
echo Tvoje skore je !score!
set /p input=zadej svuj odhad 1/10:
if %input% == %number% goto complete
if not %input% == %number% goto pokus

:complete 
cls
echo Spravne si uhadl cislo na prvni pokus :)))))
set /a score+=6
goto hra

:pokus
cls
if %pokus% lss 1 (
    echo Bohuzel ti dosly pokusy.
    timeout /t 3
    goto konec
)

if %input% lss %number% (
    if not %input% lss %number% goto uvazeni
    echo Cislo je vetsi nez tvoje uvazeni.
    echo Tvoje cislo bylo %input%
    set /a pokus-=1
    timeout /t 6 >nul
    goto input
	
)
:uvazeni
if %input% gtr %number% (
    echo Cislo je mensi nez tvoje uvazeni.
    echo Tvoje cislo bylo %input%
    timeout /t 6 >nul
    set /a pokus-=1
    goto input
)

:input
cls
set /p input=Zkus to znovu ale mas uz jen !pokus! pokusu:
if %input% == %number% goto bodovani
if not %input% == %number% goto pokus

:bodovani
if %pokus% == 5 (
    set /a score+=5
)
if %pokus% == 4 (
    set /a score+=4
)
if %pokus% == 3 (
    set /a score+=3
)
if %pokus% == 2 (
    set /a score+=2
)
if %pokus% == 1 (
    set /a score+=1
)
set /a pokus=5
goto hra

:konec
echo Konec hry. Tvoje celkove skore je: !score!
pause
set /a score=0
set /a pokus=5
goto hra
