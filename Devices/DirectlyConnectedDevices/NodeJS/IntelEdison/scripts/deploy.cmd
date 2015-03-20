@echo off
REM  ---------------------------------------------------------------------------------
REM  Copyright (c) Microsoft Open Technologies, Inc.  All rights reserved.
REM
REM The MIT License (MIT)
REM
REM Permission is hereby granted, free of charge, to any person obtaining a copy
REM of this software and associated documentation files (the "Software"), to deal
REM in the Software without restriction, including without limitation the rights
REM to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
REM copies of the Software, and to permit persons to whom the Software is
REM furnished to do so, subject to the following conditions:
REM
REM The above copyright notice and this permission notice shall be included in
REM all copies or substantial portions of the Software.
REM
REM THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
REM IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
REM FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
REM AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
REM LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
REM OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
REM THE SOFTWARE.
REM ---------------------------------------------------------------------------------
set puttydir="C:\program files (x86)\PuTTY\"
set prjdir=..\
set edison_ip=192.168.0.118
set edison_usr=root
set edison_pw=P@ssw0rd
set CTD_Home=ConnectTheDots
set PUTTY_CMD=%puttydir%putty %edison_usr%@%edison_ip% -pw %edison_pw% 
set PSCP_CMD=%puttydir%pscp -pw %edison_pw% 

echo Creating ConnectTheDots directory
REM del /f %temp%\edisonconnectthedotsmacro.tmp
REM echo rm -rf %CTD_Home%  >> %temp%\edisonconnectthedotsmacro.tmp
REM echo mkdir  %CTD_Home%  >> %temp%\edisonconnectthedotsmacro.tmp
REM %PUTTY_CMD% -m %temp%\edisonconnectthedotsmacro.tmp

echo Copying Project files
%PSCP_CMD% %prjdir%\amqp_client.js %edison_usr%@%edison_ip%:%CTD_Home%/
%PSCP_CMD% %prjdir%\ConnectTheDotsEdison.js %edison_usr%@%edison_ip%:%CTD_Home%/
%PSCP_CMD% %prjdir%\package.json %edison_usr%@%edison_ip%:%CTD_Home%/
%PSCP_CMD% %prjdir%\settings.json %edison_usr%@%edison_ip%:%CTD_Home%/
%PSCP_CMD% %prjdir%\scripts\autorun.sh %edison_usr%@%edison_ip%:%CTD_Home%/
%PSCP_CMD% -r %prjdir%\lib %edison_usr%@%edison_ip%:%CTD_Home%/

echo Making autorun executable
REM del /f %temp%\edisonconnectthedotsmacro.tmp
REM echo chmod 755 %CTD_Home%\autorun.sh  >> %temp%\edisonconnectthedotsmacro.tmp
REM %PUTTY_CMD% -m %temp%\edisonconnectthedotsmacro.tmp

REM echo Installing node modules
REM del /f %temp%\edisonconnectthedotsmacro.tmp
REM echo cd %CTD_Home%  >> %temp%\edisonconnectthedotsmacro.tmp
REM echo npm update  >> %temp%\edisonconnectthedotsmacro.tmp
REM %PUTTY_CMD% -m %temp%\edisonconnectthedotsmacro.tmp

