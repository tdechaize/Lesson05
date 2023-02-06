@echo off
REM ---------------------------------------------------------------------------------------------------
REM
REM		 Compil_link_pellesc64_64b_windows.bat : 	Nom de ce batch  
REM
REM      Batch de lancement d'une générations d'une application Windows (source C avec un fichier resource) 
REM    avec le compilateur Borland C/C++ 5.51.
REM
REM     Dans les grands principes, on modifie certaines variables d'environnement dont le PATH Windows, afin 
REM     de pouvoir lancer une compilation du source C, du fichier de resource et enfin de l'édition de lien
REM     final qui génère l'application attendue.
REM     Ce batch prend quatre paramètres  :
REM 				le répertoire des sources de l'application (le 1er paramètre),
REM 				le nom de l'application (qui doit être identique au nom du fichier source C, 
REM 								ainsi qu'au nom du fichier des ressources -> extension ".rc")
REM					le type de génération (compilation + linkage/manager de librairie) attendue parmi la 
REM									liste suivante : console|windows|lib|dll
REM					la catégorie de génération attendue parmi la liste suivante : Debug|Release
REM
REM 	PS : la procédure "create_dir.bat" permet de créer TOUS les répertoires utiles à ces générations multiples 
REM 					(certains compilateurs ne sont pas capables de les créer ONLINE s'ils sont absents !!)
REM 
REM 	AUTHOR : 						Thierry DECHAIZE
REM     Date de création :				26 Septembre 2022   
REM 	Date dernière modification : 	27 septembre 2022  -> adjonction de deux nouveaux paramètres afin de gérer : 
REM 									la cible attendue (Console, appli windows, lib ou dll) et le mode DEBUG|RELEASE.
REM 	Détails des modifications : 	le paramétrage permet une certaine généricité, mais le structure des sources est 
REM 									imposée sur le sous-répertoire \src : %NAME_APPLI%.c + %NAME_APPLI%.rc
REM 	Version de ce script :			1.1.3  ->  "Version majeure" . "Version mineure" . "niveau de patch"
REM
REM ---------------------------------------------------------------------------------------------------
REM set PellesC=C:\PellesC
  
if [%1]==[] goto usage
if [%2]==[] goto usage
if not exist %1\ goto usage
@echo on
echo "Répertoire principal de l'application : %1"
echo "Nom de l'application  				: %2"

@echo off
set DIRINIT=%CD%
SET PATHSAV=%PATH%
SET LIBSAV=%LIB%
SET INCSAV=%INCLUDE%
set SOURCE_DIR=%1
set NAME_APPLI=%2
cd %SOURCE_DIR%

REM    Génération d'une application [console|windows|lib|dll] (compil + link/lcclib) pour le compilateur Pelles C 64 bits
:pocc
SET PATH=C:\PellesC\bin;%PATH%
SET INC1=C:\PellesC\include\win
SET INC2=C:\PellesC\include
SET LIB1=C:\PellesC\lib\Win64
SET LIB2=C:\PellesC\lib
if "%3"=="console" goto CONSOL
if "%3"=="windows" goto APPWIN
if "%3"=="lib" goto LIBRA
if "%3"=="dll" goto DLLA

:CONSOL
echo "Pelles C 64bits -> Genération console de l'application en mode : %4"
if "%4"=="Debug" goto DEBCONS
set "CFLAGS=/nologo /Tx64-coff /Ze /c"
pocc %CFLAGS% /DNDEBUG  /D_AMD64_ /D_WIN64 /I%INC1% /I%INC2% /FoobjPellesC64\Release\%NAME_APPLI%.obj src\%NAME_APPLI%.c
porc /I%INC1% /I%INC2% /FoobjPellesC64\Release\%NAME_APPLI%.res src\%NAME_APPLI%.rc
polink /nologo /SUBSYSTEM:CONSOLE /MACHINE:X64 /LIBPATH:"%LIB1%" /LIBPATH:"%LIB2%" objPellesC64\Release\%NAME_APPLI%.obj objPellesC64\Release\%NAME_APPLI%.res /OUT:binPellesC64\Release\%NAME_APPLI%.exe glu32.lib opengl32.lib gdi32.lib advapi32.lib comdlg32.lib winmm.lib user32.lib kernel32.lib
goto FIN
:DEBCONS
set "CFLAGS=/nologo /Tx64-coff  /Ze /c /Zi"
pocc %CFLAGS% /DDEBUG /D_DEBUG /D_AMD64_ /D_WIN64 /I%INC1% /I%INC2% /FoobjPellesC64\Debug\%NAME_APPLI%.obj src\%NAME_APPLI%.c
porc /I%INC1% /I%INC2% /FoobjPellesC64\Debug\%NAME_APPLI%.res src\%NAME_APPLI%.rc
polink /nologo /DEBUG /SUBSYSTEM:CONSOLE /MACHINE:X64 /LIBPATH:"%LIB1%" /LIBPATH:"%LIB2%" objPellesC64\Debug\%NAME_APPLI%.obj objPellesC64\Debug\%NAME_APPLI%.res /OUT:binPellesC64\Debug\%NAME_APPLI%.exe glu32.lib opengl32.lib gdi32.lib advapi32.lib comdlg32.lib winmm.lib user32.lib kernel32.lib
goto FIN

:APPWIN
echo "Pelles C 64bits -> Genération windows de l'application en mode : %4"
if "%4"=="Debug" goto DEBAPP
set "CFLAGS=/nologo /Tx64-coff /Ze /c"
pocc %CFLAGS% /DNDEBUG /D_AMD64_ /D_WIN64 /I%INC1% /I%INC2% /FoobjPellesC64\Release\%NAME_APPLI%.obj src\%NAME_APPLI%.c
porc /I%INC1% /I%INC2% /FoobjPellesC64\Release\%NAME_APPLI%.res src\%NAME_APPLI%.rc
polink /nologo /SUBSYSTEM:WINDOWS /MACHINE:X64 /LIBPATH:"%LIB1%" /LIBPATH:"%LIB2%" objPellesC64\Release\%NAME_APPLI%.obj objPellesC64\Release\%NAME_APPLI%.res /OUT:binPellesC64\Release\%NAME_APPLI%.exe glu32.lib opengl32.lib gdi32.lib advapi32.lib comdlg32.lib winmm.lib user32.lib kernel32.lib
goto FIN
:DEBAPP
set "CFLAGS=/nologo /Tx64-coff  /Ze /c /Zi"
pocc %CFLAGS% /DDEBUG /D_DEBUG /D_AMD64_ /D_WIN64 /I%INC1% /I%INC2% /FoobjPellesC64\Debug\%NAME_APPLI%.obj src\%NAME_APPLI%.c
porc /I%INC1% /I%INC2% /FoobjPellesC64\Debug\%NAME_APPLI%.res src\%NAME_APPLI%.rc
polink /nologo /DEBUG /SUBSYSTEM:WINDOWS /MACHINE:X64 /LIBPATH:"%LIB1%" /LIBPATH:"%LIB2%" objPellesC64\Debug\%NAME_APPLI%.obj objPellesC64\Debug\%NAME_APPLI%.res /OUT:binPellesC64\Debug\%NAME_APPLI%.exe glu32.lib opengl32.lib gdi32.lib advapi32.lib comdlg32.lib winmm.lib user32.lib kernel32.lib
goto FIN

:LIBRA
echo "Pelles C 64bits -> Genération d'une librairie en mode : %4"
if "%4"=="Debug" goto DEBLIB
set "CFLAGS=/nologo /Tx64-coff /Ze /c"
pocc %CFLAGS% /DNDEBUG /D_AMD64_ /D_WIN64 /I%INC1% /I%INC2% /FoobjPellesC64\Release\%NAME_APPLI%.obj src\%NAME_APPLI%.c
REM porc /I%INC1% /I%INC2% /FoobjPellesC64\Release\%NAME_APPLI%.res src\%NAME_APPLI%.rc
polib /MACHINE:X64 /out:binPellesC64\Release\%NAME_APPLI%.lib objPellesC64\Release\%NAME_APPLI%.obj
goto FIN
:DEBLIB
set "CFLAGS=/nologo /Tx64-coff /Ze /c /Zi"
pocc %CFLAGS% /DDEBUG /D_DEBUG /D_AMD64_ /D_WIN64 /I%INC1% /I%INC2% /FoobjPellesC64\Debug\%NAME_APPLI%.obj src\%NAME_APPLI%.c
REM porc /I%INC1% /I%INC2% /FoobjPellesC64\Debug\%NAME_APPLI%.res src\%NAME_APPLI%.rc
polib /MACHINE:X64 /out:binPellesC64\Debug\%NAME_APPLI%.lib objPellesC64\Debug\%NAME_APPLI%.obj
goto FIN

:DLLA
echo "Pelles C 64bits -> Genération d'une librairie partagée (.ie. DLL) en mode : %4"
if "%4"=="Debug" goto DEBDLL
set "FLAGS=/nologo /Tx64-coff /Ze /c"
pocc %CFLAGS% /DNDEBUG /D_AMD64_ /D_WIN64 /I%INC1% /I%INC2% /FoobjPellesC64\Release\%NAME_APPLI%.obj src\%NAME_APPLI%.c
porc /I%INC1% /I%INC2% /FoobjPellesC64\Release\%NAME_APPLI%.res src\%NAME_APPLI%.rc
polink /nologo /Dll /MACHINE:X64 /LIBPATH:"%LIB1%" /LIBPATH:"%LIB2%" /IMPLIB:binPellesC64\Release\%NAME_APPLI%.lib objPellesC64\Release\%NAME_APPLI%.obj objPellesC64\Release\%NAME_APPLI%.res /OUT:binPellesC64\Release\%NAME_APPLI%.dll glu32.lib opengl32.lib gdi32.lib advapi32.lib comdlg32.lib winmm.lib user32.lib kernel32.lib
goto FIN
:DEBDLL
set "FLAGS=/nologo /Tx64-coff /Ze /c /Zi"
pocc %CFLAGS% /DDEBUG /D_AMD64_ /D_WIN64 /D_DEBUG /I%INC1% /I%INC2% /FoobjPellesC64\Debug\%NAME_APPLI%.obj src\%NAME_APPLI%.c
porc /I%INC1% /I%INC2% /FoobjPellesC64\Debug\%NAME_APPLI%.res src\%NAME_APPLI%.rc
polink /nologo /Dll /MACHINE:X64 /DEBUG /LIBPATH:"%LIB1%" /LIBPATH:"%LIB2%" /IMPLIB:binPellesC64\Debug\%NAME_APPLI%.lib objPellesC64\Debug\%NAME_APPLI%.obj objPellesC64\Debug\%NAME_APPLI%.res /OUT:binPellesC64\Debug\%NAME_APPLI%.dll glu32.lib opengl32.lib gdi32.lib advapi32.lib comdlg32.lib winmm.lib user32.lib kernel32.lib
goto FIN

:usage
echo "Usage : %0 DIRECTORY_APPLI NAME_APPLI console|windows|lib|dll Debug|Release"
echo "et si pas de deuxième paramètre, affichage de cette explication d'usage"
echo "ou alors, le répertoire des sources n'existe pas ... !"
 
:FIN
SET INCLUDE=%INCSAV%
SET LIB=%LIBSAV%
SET PATH=%PATHSAV%
SET INC1=""
SET INC2=""
SET LIB1=""
SET LIB2=""
cd %DIRINIT%