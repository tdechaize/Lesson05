# Lancement d'une génération CB

Pour générer les exécutables attendus, plusieurs options :

&nbsp;- la première très simple, on ouvre le wokrspace ou le projet CB (.ie. "Lesson"nn".workspace" or&nbsp; "Lesson"nn".cbp"), puis on clique sur "rebuild", en ayant sélectionné soit la "virtual traget" -\> 'All build', soit un des "real target" : 'Debug DMC' (par exemple),

&nbsp;- la deuxième est d'utiliser le fichier de commande fourni : generate\_all\_with\_cmake.bat avec comme paramètres :

&nbsp;a) le premier paramètre : le répertoire "master" ou se trouve votre projet (.ie. C:\\src\\OpenGL\\NeHe\_Lesson01-master par exemple, attention, ce n'est pas le répertoire des sources qui se trouvent dans un sous-répertoire "src" de ce "master")

&nbsp;b) le deuxième paramètre : le nom de votre application (.ie. "Lesson01" par exemple)

&nbsp;c) le troisième paramètre (optionnel) permet de choisir alors la génération souhaitée parmi une liste d'environnements de compilation/linkage des exécutables.

Il suffit de lancer ce fichier de commande sans paramètre pour obtenir l'explication des différents choix de paramètres.


***
_Créé avec HelpNDoc Personal Edition: [Créer des documents d'aide PDF facilement](<https://www.helpndoc.com/fr/tour-des-fonctionnalites>)_
