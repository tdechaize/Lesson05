# Accueil

Ces sources, même s'ils commencent à dater un peu, sont une mine pour comprendre les concepts de base d'OpenGL sur environnement Windows.

Alors je vous souhaite de profiter autant que moi de cet apprentissage, et je me suis imposé pas mal de contraintes.

En voici, quelques unes :

&nbsp; - faire converger les sources des applications pour n'obtenir qu'une seule version de ces sources compatibles avec TOUS les environnements de développements et les compilateurs C/C++ "free" disponibles sur Windows

&nbsp; - utiliser au début le même IDE (.ie. Code::Blocks) pour générer TOUS les exécutables de ces applications en version 32 et 64 bits, aussi bien en version Debug que Release.

&nbsp;

Ce qui a conduit, en utilisant un "virtual target" de cet IDE dénommé "All build", a pouvoir générer "automatiquement"&nbsp; 52 exécutables correspondant à 26 environnements de développement différents.

&nbsp;

Voici la liste de tous ces environnements (même si la génération Open Watcom 64 bits pose problème à l'IDE CB \!)&nbsp; :

&nbsp; &nbsp; Borland C/C++ 5.51, CLANG adossé à Mingw32 (issu de Winlibs), CLANG adossé à Mingw64 (issu de Winlibs), CLANG adossé à MSYS2/Mingw32, CLANG adossé à MSYS2/Mingw64, CLANG adossé à Visual Studio 2022 32 bits, CLANG adossé à Visual Studio 2022 64 bits, un IDE Red Panda DevCpp installé avec une version de Mingw64, l'IDE Code::Blocks installé avec une version de Mingw64, Mingw32 version officielle, GCC inclus dans&nbsp; MSYS2/Mingw32, GCC inclus dans&nbsp; MSYS2/Mingw64, GCC inclus dans&nbsp; CYGWIN64/Mingw32, GCC inclus dans&nbsp; CYGWIN64/Mingw64, GCC inclus dans TDM32/Mingw32, GCC inclus dans TDM64/Mingw64, Mingw32 issu du package WinLibs, Mingw64 issu du package WinLibs, LCC version 32 bits, LCC version 64 bits, Pelles C version 32 bits, Pelles C version 64 bits, Open Watcom version 32 bits, Open Watcom version 64 bits, Visual Studio 2022 "community" en mode 32 bits, Visual Studio 2022 "community" en mode 64 bits.

***
_Créé avec HelpNDoc Personal Edition: [Produire des livres électroniques facilement](<https://www.helpndoc.com/fr/creer-des-livres-numeriques-epub>)_
