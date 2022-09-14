# Quoi de neuf

Mais comme j'ai aussi souhaité me frotter à un autre utilitaire de génération automatique dénommé CMAKE (pour mémoire CMAKE génère automatiquement des fichiers Makefile qu'il faut donc ensuite lancer en mode classique), j'ai aussi créé l'ensemble des fichiers de paramétrages utiles, dans le répertoire build.cmake.

Et bien entendu, il reste quelques difficultés/bugs avec CMAKE, que j'ai résolu par l'utilisation de fichiers Makefile en mode natif pour chaque environnement de développement non traité correctement par CMAKE (.ie. Borland C/C++, Digital Mars C/C++, LCC32, LCC64, Pelles C 32 bits, Pelles C 64 bits, Open Watcom C/C++ 32 bits, Open Watcom C/C++ 64 bits) en présence de fichier Ressource : (\*.rc).


***
_Créé avec HelpNDoc Personal Edition: [Sites web iPhone faciles](<https://www.helpndoc.com/fr/tour-des-fonctionnalites/generation-de-site-web-iphone>)_
