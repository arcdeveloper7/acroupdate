goto %acr%

:help

echo "core" show your core version
echo "ipc" see your ip
echo "exit" exit term
echo "connection-status" see your connection status
echo "add-reply" add some custom auto reply ["type run to accsess your reply"]
echo "remove" delete reply
echo "list" see all file
echo "term-check" see all problem
echo "cs" clear


goto ext

:ipc
ipconfig
arp -a
goto ext

:core
echo Core version 2
echo Acroterm Default data
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





:ext