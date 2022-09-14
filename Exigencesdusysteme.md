# Exigences du système

Bien sur, il faut avoir au préalable installer de façon "propre" TOUS ces différents de développement.

&nbsp;

On commence, par Code::Blocks (origine SourceForge ou le site Web CB disponible), Red Panda DevCpp (origine SourceForge, LLVM en version 32 et 64 bits (pour CLANG adossé à Visual Studio), Borland C/C++, les deux package WinLibs de très bonne qualité, Mingw32 en version officielle (origine SourceForge), MSYS2 en procédant ensuite à l'installation des environnements de développement Mingw32 et Mingw64, mais aussi CLANG 32 bits et CLANG 64 bits, Mingw64 (origine SourceForge), le package CYGWIN64 en procédant ensuite à l'installation des environnements de développement Mingw32 et Mingw64 (sans oublier l'utilitaire "make" pour CMAKE \!), LCC 32 bits, LCC 64 bits, Pelles C (on installe les deux versions 32 et 64 bits) et Open Watcom C/C++ (on installe les deux versions 32 et 64 bits), TDM 32 bits, TDM 64 bits, Visual Studio 2022 community (on installe les deux versions 32 et 64 bits) sans oublier un Kit de développement Windows compatible avec votre environnement et votre version "système".

&nbsp;

Ce qui donne le descriptif suivant :

&nbsp;

OpenGL Tutorial #3

&nbsp;

Project Name: Jeff Molofee's OpenGL Tutorial

&nbsp;

Project Description: Creating Your First Polygon program with OpenGL in colors.&nbsp;

&nbsp;

Authors Name: Jeff Molofee (aka NeHe)

&nbsp;

Authors Web Site: nehe.gamedev.net

&nbsp;

COPYRIGHT AND DISCLAIMER: (c)2000 Jeff Molofee

&nbsp;

&nbsp; &nbsp; If you plan to put this program on your web page or a cdrom of

&nbsp; &nbsp; any sort, let me know via email, I'm curious to see where

&nbsp; &nbsp; it ends up :)

&nbsp;

&nbsp; &nbsp; &nbsp; &nbsp; If you use the code for your own projects please give me credit,

&nbsp; &nbsp; &nbsp; &nbsp; or mention my web site somewhere in your program or it's docs.

&nbsp;

&nbsp;Modified smoothly by Thierry DECHAIZE

&nbsp;

Paradigm : obtain one source (only one \!) compatible for multiple free C Compilers

&nbsp; &nbsp; and provide for all users an development environment on Windows 11 64 bits

&nbsp; &nbsp; the great Code::Blocks manager (version 20.3), and don't use glaux.lib or glaux.dll.

&nbsp;

&nbsp; &nbsp; a) Mingw 32 bits, version officielle gcc 9.2.0 (old \!) : downloadable on http://sourceforge.net/projects/mingw/ (official)&nbsp;

&nbsp; &nbsp; b) Mingw 64 bits included in new IDE Red Panda Dev-Cpp, version gcc 10.3.0 : donwloadable on http://sourceforge.net/projects/dev-cpp-2020/

&nbsp; &nbsp; c) Mingw 64 bits included in package Code::Blocks (version 20.03), version gcc 8.1.0 (very old \!) : downloadable on http://sourceforge.net/projects/codeblocks/files/Binaries/20.03/Windows/

&nbsp; &nbsp; d) Mingw 32 and 64 bits packagés, version gcc 11.2.0 : downloadable on&nbsp; https://winlibs.com/ (and CLANG included in, 32 and 64 bits), two kits :

&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; - winlibs-i686-posix-dwarf-gcc-12.2.0-llvm-14.0.6-mingw-w64ucrt-10.0.0-r2.7z (32 bits)

&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; - winlibs-x86\_64-posix-seh-gcc-12.2.0-llvm-14.0.6-mingw-w64ucrt-10.0.0-r2.7z (64 bits)

&nbsp; &nbsp; e) Cygwin64, 32 et 64 bits, version gcc 11.3.0 : downloadable on http://www.cygwin.com/install.html (tool for install : setup-x86\_64.exe)

&nbsp; &nbsp; f) TDM GCC, 32 et 64 bits, version 10.3.0 : downloadable on http://sourceforge.net/projects/TDM-GCC

&nbsp; &nbsp; g) MSYS2 environnement MINGW32 and MINGW64, 32 et 64 bits, version de 2022 (msys2-x86\_64-20220603.exe), version gcc 12.2.0 : downloadable on https://repo.msys2.org/distrib/x86\_64/msys2-x86\_64-20220603.exe

&nbsp; &nbsp; h) Visual Studio 2022, 32 et 64 bits, community edition for free : downloadable on https://visualstudio.microsoft.com/fr/thank-you-downloading-visual-studio/?sku=Community\&rel=17

&nbsp; &nbsp; i) Borland C/C++ 32 bits, version 5.5 : downloadable on https://developerinsider.co/download-and-install-borland-c-compiler-on-windows-10/

&nbsp; &nbsp; j) Digital Mars Compiler C/C++ 32 bits version 8.57 : downloadable on http://www.digitalmars.com (the more old compiler, the more bugged, dead branch \!)

&nbsp; &nbsp; k) OpenWatcom C/C++ 32 et 64 bits, version 2.0 : downloadable on http://openwatcom.mirror.fr/ (only 32 bits version run correctly \!)

&nbsp; &nbsp; l) Lcc and Lcc64, 32 et 64 bits: downloadable http://www.cs.virginia.edu/~lcc-win32/

&nbsp; &nbsp; m) PELLES C (only C) , 32 et 64 bits, version 11.0 : downloadable on http://www.smorgasbordet.com/pellesc/

&nbsp; &nbsp; o) CLANG, adossé aux environnements MINGW64 et MINGW32, version 114.0.6 (version gcc 12.0.0) : downloadable on https://winlibs.com/&nbsp;

&nbsp; &nbsp; p) CLANG, adossé aux environnements Visual Studio 2022 (+ kits Microsoft), version 14.0.6 : downloadable on https://releases.llvm.org/download.html

&nbsp; &nbsp; q) CLANG de la version MSYS2, adossé aux environnements MINGW64 et MINGW32, version 14.0.6 (version gcc 12.2.0) : downloadable on https://repo.msys2.org/distrib/x86\_64/msys2-x86\_64-20220118.exe

&nbsp; &nbsp; r) CLANG de la version CYGWIN, adossé aux environnements MINGW64 et MINGW32, version 8.0.0 (very old \!) (version gcc 11.3.0) : downloadable http://www.cygwin.com/install.html (tool for install : setup-x86\_64.exe) &nbsp; &nbsp;

&nbsp;&nbsp; &nbsp;

&nbsp; &nbsp; TDE -\> Add resource file end resource header for restitute version + icon OpenGL.ico for fun

&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; because versionning is important, same for freeware :-) \!

***
_Créé avec HelpNDoc Personal Edition: [Avantages d'un outil de création d'aide](<https://www.helpauthoringsoftware.com/fr>)_
