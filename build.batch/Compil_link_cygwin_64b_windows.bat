@echo off
REM ---------------------------------------------------------------------------------------------------
REM
REM		 Compil_link_cygwin_64b_windows.bat : 	Nom de ce batch  
REM
REM      Batch de lancement d'une générations d'une application Windows (source C avec un fichier resource) 
REM    avec le compilateur x86_64-w64-mingw32-gcc inclus dans le package CYGWIN64.
REM
REM     Dans les grands principes, on modifie certaines variables d'environnement dont le PATH Windows, afin 
REM     de pouvoir lancer une compilation du source C, du fichier de resource et enfin de l'édition de lien
REM     final qui génère l'application attendue ou du gestionnaire de librairie.
REM     Ce batch prend quatre paramètres  :
REM 				le répertoire de l'application (le 1er paramètre) qui doit contenir un sous-répertoire \src 
REm 								contenant les sources de celle-ci.
REM 				le nom de l'application (qui doit être identique au nom du fichier source C, 
REM 								ainsi qu'au nom du fichier des ressources -> extension ".rc")
REM					le type de génération (compilation + edition de lien/manager de librairie) attendue parmi 
REM 							la liste suivante : console|windows|lib|dll
REM					le type de génération attendue parmi la liste suivante : Debug|Release
REM
REM 	PS : la procédure "create_dir.bat" permet de créer TOUS les répertoires utiles à ces générations multiples 
REM 					(certains compilateurs ne sont pas capables de les créer ONLINE s'ils sont absents !!)
REM 
REM 	AUTHOR : 						Thierry DECHAIZE
REM     Date de création :				29 Septembre 2022   
REM 	Date dernière modification : 	29 septembre 2022  -> adjonction de deux nouveaux paramètres afin de gérer : 
REM    								la cible attendue (Console, appli windows, lib ou dll) et le mode DEBUG|RELEASE.
REM 	Détails des modifications : 	le paramétrage permet une certaine généricité, mais la structure des sources 
REM 									est imposée sur le sous-répertoire \src : %NAME_APPLI%.c + %NAME_APPLI%.rc
REM 	Version de ce script :			1.1.3  ->  "Version majeure" . "Version mineure" . "niveau de patch"
REM
REM ---------------------------------------------------------------------------------------------------
REM set CYGWIN64=C:\cygwin64

if [%1]==[] goto usage
if [%2]==[] goto usage
if not exist %1\ goto usage
echo "Répertoire principal de l'application : %1"
echo "Nom de l'application  				: %2"

set DIRINIT=%CD%
SET PATHSAV=%PATH%
SET LIBSAV=%LIB%
SET INCSAV=%INCLUDE%
set SOURCE_DIR=%1
set NAME_APPLI=%2
cd %SOURCE_DIR%

REM    Génération d'une application [console|windows|lib|dll] (compil + link/ar) pour le compilateur x86_64-w64-mingw32-gcc 64b inclus dans CYGWIN64
:CYGWIN64
SET PATH=%CYGWIN64%\bin;%PATH%
SET "INCLUDE=C:/cygwin64/usr/x86_64-w64-mingw32/sys-root/mingw/include"
SET "LIB==C:/cygwin64/usr/x86_64-w64-mingw32/sys-root/mingw/lib"
if "%3"=="console" goto CONSOL
if "%3"=="windows" goto APPWIN
if "%3"=="lib" goto LIBRA
if "%3"=="dll" goto DLLA

:CONSOL
echo "GCC 64b inclus dans CYGWIN64 -> Genération console de l'application en mode : %4"
if "%4"=="Debug" goto DEBCONS
set "CFLAGS=-O2 -m64"
x86_64-w64-mingw32-gcc %CFLAGS% -DNDEBUG -I%INCLUDE% -o objCYGWIN64/Release/%NAME_APPLI%.o -c src/%NAME_APPLI%.c
x86_64-w64-mingw32-windres -J rc -O coff -I%INCLUDE% -o objCYGWIN64/Release/%NAME_APPLI%.res -i src/%NAME_APPLI%.rc
x86_64-w64-mingw32-gcc -m64 -mconsole -s -L%LIB1% -L%LIB2% objCYGWIN64/Release/%NAME_APPLI%.o objCYGWIN64/Release/%NAME_APPLI%.res -o binCYGWIN64/Release/%NAME_APPLI%.exe -lglu32 -lopengl32 -ladvapi32 -lcomdlg32 -lgdi32 -lwinmm -lkernel32
goto FIN
:DEBCONS
set "CFLAGS=-m64 -g"
x86_64-w64-mingw32-gcc %CFLAGS% -DDEBUG -D_DEBUG -I%INCLUDE% -o objCYGWIN64/Debug/%NAME_APPLI%.o -c src/%NAME_APPLI%.c
x86_64-w64-mingw32-windres -J rc -O coff -I%INCLUDE% -o objCYGWIN64/Debug/%NAME_APPLI%.res src/%NAME_APPLI%.rc
x86_64-w64-mingw32-gcc -m64 -mconsole -L%LIB1% -L%LIB2% objCYGWIN64/Debug/%NAME_APPLI%.o objCYGWIN64/Debug/%NAME_APPLI%.res -o binCYGWIN64/Debug/%NAME_APPLI%.exe -lglu32 -lopengl32 -ladvapi32 -lcomdlg32 -lgdi32 -lwinmm -lkernel32
goto FIN

:APPWIN
echo "GCC 64b inclus dans CYGWIN64 -> Genération windows de l'application en mode : %4"
if "%4"=="Debug" goto DEBAPP
set "CFLAGS=-O2 -m64"
x86_64-w64-mingw32-gcc %CFLAGS% -DNDEBUG -I%INCLUDE% -o objCYGWIN64/Release/%NAME_APPLI%.o -c src/%NAME_APPLI%.c
x86_64-w64-mingw32-windres -J rc -O coff -I%INCLUDE% -o objCYGWIN64/Release/%NAME_APPLI%.res -i src/%NAME_APPLI%.rc
x86_64-w64-mingw32-gcc -m64 -mwindows -s -L%LIB1% -L%LIB2% objCYGWIN64/Release/%NAME_APPLI%.o objCYGWIN64/Release/%NAME_APPLI%.res -o binCYGWIN64/Release/%NAME_APPLI%.exe -lglu32 -lopengl32 -ladvapi32 -lcomdlg32 -lgdi32 -lwinmm -lkernel32
goto FIN
:DEBAPP
set "CFLAGS=-m64 -g"
x86_64-w64-mingw32-gcc %CFLAGS% -DDEBUG -D_DEBUG -I%INCLUDE% -o objCYGWIN64/Debug/%NAME_APPLI%.o -c src/%NAME_APPLI%.c
x86_64-w64-mingw32-windres -J rc -O coff -I%INCLUDE% -o objCYGWIN64/Debug/%NAME_APPLI%.res src/%NAME_APPLI%.rc
x86_64-w64-mingw32-gcc -m64 -mwindows -L%LIB1% -L%LIB2% objCYGWIN64/Debug/%NAME_APPLI%.o objCYGWIN64/Debug/%NAME_APPLI%.res -o binCYGWIN64/Debug/%NAME_APPLI%.exe -lglu32 -lopengl32 -ladvapi32 -lcomdlg32 -lgdi32 -lwinmm -lkernel32
goto FIN

:LIBRA
echo "GCC 64b inclus dans CYGWIN64 -> Genération d'une librairie en mode : %4"
if "%4"=="Debug" goto DEBLIB
set "CFLAGS=-O2 -m64"
x86_64-w64-mingw32-gcc %CFLAGS% -DNDEBUG -I%INCLUDE% -o objCYGWIN64/Release/%NAME_APPLI%.o -c src/%NAME_APPLI%.c
REM x86_64-w64-mingw32-windres -J rc -O coff -I%INCLUDE% -o objCYGWIN64/Release/%NAME_APPLI%.res -i src/%NAME_APPLI%.rc
ar rus binCYGWIN64/Release/lib%NAME_APPLI%.a objCYGWIN64/Release/%NAME_APPLI%.o
REM x86_64-w64-mingw32-gcc -o binCYGWIN64/Release/%NAME_APPLI%.lib objCYGWIN64/Release/%NAME_APPLI%.o
goto FIN
:DEBLIB
set "CFLAGS=-m64 -g"
x86_64-w64-mingw32-gcc %CFLAGS% -DDEBUG -D_DEBUG -I%INCLUDE% -o objCYGWIN64/Debug/%NAME_APPLI%.o -c src/%NAME_APPLI%.c
REM x86_64-w64-mingw32-windres -J rc -O coff -I%INCLUDE% -o objCYGWIN64/Debug/%NAME_APPLI%.res src/%NAME_APPLI%.rc
ar rus binCYGWIN64/Debug/lib%NAME_APPLI%.a objCYGWIN64/Debug/%NAME_APPLI%.o
REM x86_64-w64-mingw32-gcc -o binCYGWIN64/Debug/%NAME_APPLI%.lib objCYGWIN64/Debug/%NAME_APPLI%.o
goto FIN

:DLLA
echo "GCC 64b inclus dans CYGWIN64 -> Genération d'une librairie partagée (.ie. DLL) en mode : %4"
if "%4"=="Debug" goto DEBDLL
set "CFLAGS=-O2 -m64 -pic"
x86_64-w64-mingw32-gcc %CFLAGS% -DNDEBUG -I%INCLUDE% -o objCYGWIN64/Release/%NAME_APPLI%.o -c src/%NAME_APPLI%.c
x86_64-w64-mingw32-windres -J rc -O coff -I%INCLUDE% -o objCYGWIN64/Release/%NAME_APPLI%.res -i src/%NAME_APPLI%.rc
x86_64-w64-mingw32-gcc -m64 -shared -s -L%LIB1% -L%LIB2% -Wl,--out-implib,binCYGWIN64/Release/lib%NAME_APPLI%.dll.a -W1,—export-all-symbols -Wl,—enable-auto-image-base -Wl,--subsystem,windows objCYGWIN64/Release/%NAME_APPLI%.o objCYGWIN64/Release/%NAME_APPLI%.res -o binCYGWIN64/Release/%NAME_APPLI%.dll -lglu32 -lopengl32 -ladvapi32 -lcomdlg32 -lgdi32 -lwinmm -lkernel32
goto FIN
:DEBDLL
set "CFLAGS=-m64 -g -pic"
x86_64-w64-mingw32-gcc %CFLAGS% -DDEBUG -D_DEBUG -I%INCLUDE% -o objCYGWIN64/Debug/%NAME_APPLI%.o -c src/%NAME_APPLI%.c
x86_64-w64-mingw32-windres -J rc -O coff -I%INCLUDE% -o objCYGWIN64/Debug/%NAME_APPLI%.res src/%NAME_APPLI%.rc
x86_64-w64-mingw32-gcc -m64 -shared -L%LIB1% -L%LIB2% -Wl,--out-implib,binCYGWIN64/Debug/lib%NAME_APPLI%.dll.a -W1,—export-all-symbols -Wl,—enable-auto-image-base -Wl,--subsystem,windows objCYGWIN64/Debug/%NAME_APPLI%.o objCYGWIN64/Debug/%NAME_APPLI%.res -o binCYGWIN64/Debug/%NAME_APPLI%.dll -lglu32 -lopengl32 -ladvapi32 -lcomdlg32 -lgdi32 -lwinmm -lkernel32
goto FIN

:usage
echo "Usage : %0 DIRECTORY_APPLI NAME_APPLI console|windows|lib|dll Debug|Release"
echo "et si pas de deuxième paramètre, affichage de cette explication d'usage"
echo "ou alors, le répertoire des sources n'existe pas ... !"
 
:FIN
SET INCLUDE=%INCSAV%
SET LIB=%LIBSAV%
SET PATH=%PATHSAV%
cd %DIRINIT%
