@ECHO OFF 
CLS 
ECHO WoW Server Started %time:~0,5% %date:~1% 
:SERVERLOOP 
worldserver.exe
ECHO Trinity Restarted %time:~0,5% %date:~1% 
ECHO. 
GOTO SERVERLOOP 
:END