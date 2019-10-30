# Devoir1Forage
### /!\ Attention : Ce Git est PUBLIC, et proposé à titre indicatif d'après mon expérience. Ce n'est pas le Git du professeur. Je partage un peu d'aide pour que mes cadets galèrent moins que moi MAIS : RECOPIER BÊTEMENT CE GIT VOUS FERA ECHOUER LA MATIERE POUR CAUSE DE  PLAGIAT (le cas est déjà arrivé...) ! Sur ce, bon courage et bonne lecture ! 🙂  /!\ 
Code du devoir 1 de Forage de Données

Devoir 1 dans le cadre de la matière Forage de Données (8INF954) à l'UQAC (Semestre automne 2019).

L'exercice consiste à étudier un article dans lequel un nouveau calcul pour l'entropie est proposé pour l'algorithme ID3. Il faut ensuite implémenter ce nouveau calcul, idéalement dans le logiciel de Machine Learning : [Weka](https://www.cs.waikato.ac.nz/ml/weka/ "Site de Weka") et observer/interprêter les résultats

### Ce README part du principe que vous utilisez JAVA pour ce projet, avec intégration dans Weka.

Pour modifier Weka (y ajouter un algorithme : un nouveau ID3), il faut le recompiler. Je conseille d'utiliser une distribution issue de Debian pour profiter du célèbre "apt". Cependant, j'ai un ordinateur sous Windows.  
J'ai donc utilisé ["Windows Subsystem for Linux"](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux "Wikipedia vers WSL") qui permet de bénéfier de "apt" avec une distro Ubuntu sous Windows 10.
#### 1 : [Recompiler Weka](#1--recompiler-weka-)
#### 2 : [Installer ant sous WSL](#2--installer-ant-sous-wsl-)
#### 3 : Debugger Weka avec Eclipse

# 1 : Recompiler Weka :
Il suffit d'utiliser ["ant"](https://ant.apache.org/ "Site officiel de \"ant\""). ant existe pour Windows 10 mais cette page ne parlera pas de l'installation de ant sous Windows.    
#### ID3 n'est PAS de base dans Weka, il faut l'installer via le gestionnaire de paquets du logiciel :  
![](https://lh4.googleusercontent.com/C4WsuqlwkA92Xddej4OL65I6leRZJWcTDo5jlf3MehVDv5CHgvXfLUYoMyyOq_SmBuerOqezbhSP24YxSBV9=w1920-h435)  
Le paquet à télécharger s'appelle 'simpleEducationalLearningSchemes' :  
![](https://lh3.googleusercontent.com/2ZhWcNmuNWutdYELbm_OXHmtZ8RGilHOixZPT39wndiFixpwGzWceS_Q226HJB9cWLUrETveHa92NQIjxg8T=w1920-h435)  
Au prochain redémarrage de Weka, ID3 sera disponible dans Weka.  
* Extrayez le contenu du fichier `weka-src.jar` (j'utilise [7zip](https://www.7-zip.org/)) par exemple dans un dossier `TEMP` (Ce sera le nom utilisé ici).  
![fichier .jar](https://lh6.googleusercontent.com/x4SAbTeORvMp1Ow_FGh9BuTL_hTROsK52FPhp9XIFhM3czOAPfTWqyonHWeI3gPX0EkxxOrH7p6vwvroPLeY=w1920-h947-rw "weka-src.jar fichier")  
* Ensuite, déplacez (ou copiez) le fichier `ID3.java` du dossier  
`C:\Users\"votre compte"\wekafiles\packages\simpleEducationalLearningSchemes\src\main\java\weka\classifiers\trees` vers le dossier d'installation de Weka (`D:\Program Files\Weka-3-8\weka-src\src\main\java\weka\classifiers\trees` chez moi).  
Pensez à renommer le fichier dans le dossier de destination : Weka va déjà chercher un fichier appelé "ID3.java" lors de l'éxecution. S'il trouve deux fichiers du même nom, des conflits peuvent apparaître...  
Le dossier `TEMP` contient une architecture de la sorte :  
![Arborescence de résultat](https://lh3.googleusercontent.com/CTjIFSUDwrLAF8LAOZTfIa61HpjzVbJqYqUahHfmuDvoU4HYjPbuxJQsOxyDP20BfodU-M7XJnzF5D8XUPS4=w1920-h435)  
Le fichier à modifier (`ID3.java`) se trouve donc dans le dossier `src\main\java\weka\classifiers\trees` depuis ce répertoire.  
La partie à modifier commence à la ligne 310 avec la fonction "computeEntropy" où l'entropie actuelle est celle de Shannon.  

* Une fois les modifications apportées à ID3Modifie.java (le fichier dans le dossier d'installation de Weka), il faut recompiler Weka pour en obtenir un .jar executable.  
Appelez la commande "ant exejar" depuis le dossier `TEMP`. Si la compilation se déroule bien (si votre nouveau code est compilable), alors le `.jar` de résultat ira dans le dossier `TEMP\dist`. Il suffira alors de double cliquer dessus pour lancer le nouveau Weka avec vos modifications.

#### Notes : J'ai donc utilisé des commandes Ubuntu depuis mon Windows 10. Je m'en sers pour ant que je n'ai pas installé sur mon Windows.  
Pour utiliser une commande bash depuis l'invite de commande Windows, il faut utiliser : `bash -c "votrecommande"` (soit `bash -c "ant exejar"` dans notre compilation avec ant).

# 2 : Installer ant sous WSL :  
Comme présenté, WSL permet d'utiliser des commandes bash dans notre Windows sans machine virtuelle. WSL a toujours des limites par rapport à un vrai Ubuntu mais pour cet exercice, ça fera l'affaire.  
Pour installer WLS, installez [l'article "Ubuntu"](https://www.microsoft.com/store/productId/9NBLGGH4MSV6) (différentes versions existent, j'ai installé la 18.04 mais peu importe). Il apparaitra dans votre Menu Démarrer mais pour l'instant Ubuntu n'est pas activé.  
Pour se faire, il faut se rendre dans le panneau de configuration de Windows (Tapez "Panneau de Configuration" dans la barre de recherche Windows), puis dans "Programmes", puis dans "Activer ou désactiver les fonctionnalités Windows" :  
![](https://lh4.googleusercontent.com/qZqnp4_h1gDj0VKOueY4cOibwan-ZZNskJvuf-nQBhlHyeeb3AIJd0sVcbg8a8q9whN2w-lvs42x7m24ZKbm=w1920-h947-rw)  
Après ça, l'ordinateur demandera à redémarrer pour finaliser l'installation.
Ensuite, ouvrez Ubuntu, répondez aux quelques questions (création de l'utilisateur Ubuntu : retenez le mot de passe, il vous permettra d'utiliser la commande `sudo`).  
Un fois le compte créé, tapez les commandes :
* `sudo apt-get update`
* `sudo apt-get install defaultjdk ant`  

Si tout s'est bien déroulé, ant est installé sur votre Ubuntu (et java qui est nécessaire pour la compilation).  
Vous pouvez utiliser le petit script `run_weka.bat` à placer dans votre dossier `TEMP` pour automatiser la compilation :  
* Il compile Weka
* Arrête Weka s'il tournait déjà
* Lance la nouvelle version de Weka  

# 3 : Debugger Weka avec Eclipse  
Pour faciliter le développement, il est souvent utile d'avoir un debugger disponible. Il est possible de debugger Weka avec Eclipse dans notre cas.  
Il faut au préalable avoir installé [Eclipse](https://www.eclipse.org/downloads/) sur votre ordinateur.  
Une fois lancé, faîtes "Open Projets from File System" :  
![](https://lh3.googleusercontent.com/CJkqa1r161jvWqmg5_phJXVa818b1Ziej-0yh23kHwiBe6ThotVQMuJt07vvr2r-xQ9xR98JDKPYmjweQPNp=w1920-h947)  
Puis sélectionnez le répertoire de Weka que vous avez extrait (`TEMP`) :  
![](https://lh3.googleusercontent.com/5fq_FvoR6rQP4wVemjQqOWYgYauHw5k3oqHnI9Qxt7ZV9iH8e0OSi7kKQaQn8rzifxbt1G1g8jUVO4fhhIFQ=w1920-h435-rw)  
Ouvrir le fichier `GUIChooser.java` depuis le paneau à gauche "Project Explorer". Le fichier se situe dans les dossiers :  
  * src/main/java
  * weka.gui
Une fois sur cette classe, il est possible de lancer le debugger Eclipse.

Pour la suite, il est possible de lancer le debugger depuis le fichier `ID3Modifie.java` (dans le dossier `src/main/java` puis `weka.classifiers.trees`), il suffit de s'assurer que le configuration est bien celle de GUIChooser
