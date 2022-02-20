goto %acr%

:help

echo "core" show your core version
echo "*package-[...] (update),(install),(check)"
echo "ipc" see your ip
echo "exit" exit term
echo "ping" ping
echo "connection-status" see your connection status
echo "remove" delete reply
echo "list" see all file
echo "cs" clear
echo "startup" your acro term startup settings
echo "restart" restart your term


goto ext

:ipc
ipconfig
arp -a
goto ext

:core
echo Core version 3
goto ext

:exit
exit

:connection-status
set "connection=[ONLINE]"
ping -l 1 -n 1 8.8.8.8 > Chace || set "connection=[OFFLINE]"
echo %connection%
goto ext

:add-reply
set /p file=Filename : 
set /p fcom=[%file%] command : 
echo %fcom% > %file%.bat || goto comf
goto ext
:comf
echo Failed to add reply
goto ext

:run
set /p rn=Filename : 
call %rn%.bat
goto ext

:remove
set /p rm=File name to delete : 
del %rm%.bat || goto fdel
echo File %rm% succesfully deleted
goto ext
:fdel
echo Failed to delete data
goto ext

:list
dir
goto ext

:cs
cls
goto ext

:startup
echo type "fcolor" for startup color settings
echo type "massage" for startup massage/text
echo type "rmstr" disable the startup massage

:startup

set /p str="[Startup]>>"

if %str% == fcolor goto strcolor
if %str% == massage goto fmassage
if %str% == rmstr goto removemassage


goto terminput2

:strcolor
echo insert the color name
set /p strcolor="[Color]>>"
if %strcolor% == white set color=color 7
if %strcolor% == yellow set color=color 6
if %strcolor% == purple set color=color 5
if %strcolor% == red set color=color 4
if %strcolor% == aqua set color=color 3
if %strcolor% == green set color=color 2
if %strcolor% == blue set color=color 1

cls

echo saving your color settings...
echo %color% > startup.bat
echo restart your term to apply the startup settings
goto ext

:fmassage
set /p strmassage="[Massage]>>"
echo x=msgbox("%strmassage%",0,"Acro term") > strmassage.vbs
cls

echo startup massage succesfully applied
goto ext

:removemassage
del strmassage.vbs
echo Startup massage disabled


:ext



