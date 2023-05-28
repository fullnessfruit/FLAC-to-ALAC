@ECHO OFF
CHCP 65001

REM The track number must precede the title.
REM For example : "01 DIVE!.flac" -> "01 DIVE!.m4a"

SET discNumber=1
SET lastDisc=1

FOR %%I IN (.) DO SET folderName=%%~nxI
FOR /F "tokens=1" %%I IN ('DIR /B *.flac /O:N') DO SET lastTrack=%%~I
FOR /F "tokens=1*" %%I IN ('DIR /B *.flac /O:N') DO ffmpeg -i "%%I %%J" -acodec alac -vcodec copy -metadata album="%folderName%" -metadata title="%%~nJ" -metadata track="%%I/%lastTrack%" -metadata disc="%discNumber%/%lastDisc%" "%%I %%~nJ.m4a"