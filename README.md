# En bref
La configuration `init.lua` est la plus complète et a été réalisée sur un WSL dotée de [win32yank.exe](https://github.com/equalsraf/win32yank) (vous pouvez ôter cette configuration sans soucis). La configuration `init-ppti.lua` a été réalisé pour un environnement universitaire limité basé sur Linux.   
Le plugin manager est [LazyVim](https://github.com/LazyVim/LazyVim) et les deux configurations contient les plugins suivants (les plugins en sous listes sont des dépendences indiquées dans le fichier)  

- [Nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
  - [Nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [Barbar](https://github.com/romgrk/barbar.nvim)
  - [Nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [Catppuccin](https://github.com/catppuccin/nvim)
- [Mason](https://github.com/williamboman/mason.nvim)
- [Mason lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
  - [Nvim lspconfig](https://github.com/neovim/nvim-lspconfig)
- [Nvim jdtls (exclu de la config ppti)](https://github.com/mfussenegger/nvim-jdtls)
- [Nvim Tresitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
  - [Nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [Nvim-cmp](https://github.com/rsh7th/nvim-cmp)
  - [Cmp Nvim Lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
  - [Cmp buffer](https://github.com/hrsh7th/cmp-buffer)
  - [Cmp path](https://github.com/hrsh7th/cmp-path)
  - [Cmp CommandLine](https://github.com/hrsh7th/cmp-cmdline)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [NeoFormat](https://github.com/sbdchd/neoformat)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
  - [Plenary](https://github.com/nvim-lua/plenary.nvim)
  - [RipGrep](https://github.com/BurntSushi/ripgrep)
- [Autopairs](https://github.com/jiangmiao/auto-pairs)
- [Floating Terminal](https://github.com/numToStr/FTerm.nvim)
- [Nvim Transparent (exclu de la config ppti)](https://github.com/xiyaowong/nvim-transparent)
- [GitHub Copilot (exclu de la config ppti)](https://github.com/github/copilot.vim)

Neovim et les plugins tierses cités ci-dessous ont tous des licenses OpenSource différentes disponibles sur leur pages GitHub. Je ne suis pas affilié de quelque façon que ce soit à ces groupes et à NeoVim lui même.

Sur cette configuration, les plugins de lsp et de cmp sont lazy loadé, il sont chargé seulement lorsque un fichier de code compatible est ouvert. Vous pouvez consulter ces comportement de le dossier `ftplugin`  

Notez en revanche que la configuration "ppti" n'utilise pas le dossier `ftplugin` et ne profites pas bien des capacités du plugin manager (Une mise à jour est prévue)

:warning: Cette configuration utilisant `Nvim jdtls` la configuration pour Java doit changer en fonction de vos installation, consultez le [github du plugin en question](https://github.com/mfussenegger/nvim-jdtls) pour en savoir plus.

# Introduction
A proprement parler [Neovim](https://neovim.io/) est une modification de l'éditeur de texte [Vim](https://www.vim.org/), lui même une amlioration de l'éditeur [Vi](https://fr.wikipedia.org/wiki/Vi). C'est un logiciel dans le terminal, et bien que cela semble très vieux et peu pratique, l'évolution du fonctionnement du terminal ont permis à cet éditeur de texte a être particulièrement performant.  

L'intérêt d'utiliser Neovim, c'est son extrême modularité, mais aussi, son efficacité. Neovim est très peu gourmand en ressource, mais il peut être tout aussi puissant que n'importe quel IDE.  

Ce document est essentiellement orientés pour les gens ne connaissant pas ce logiciel et souhaitant en apprendre plus rapidement sans aucune connaissance. Pour ceux qui souhaite juste récupérer la configuration préfaite, l'intégralité des informations se situe [dans la section en bref ci-dessus](#en-bref).  

[Une section](#neovim-à-la-ppti) est destinée pour les étudiants d'UPMC souhaitant utiliser NeoVim sur les environement de PPTI et profiter de tout ses avantages.

# Fonctionnement basique

## Prise en main
Comprenons rapidement comment le logiciel fonctionne. Avant toute chose, installer le avec votre package manager favori. Le package se nomme *"neovim"* mais pour l'éxécuter, vous devrez taper `nvim` dans le terminal.  

Vous pouvez ouvrir un fichier directement après l'ouverture en spécifiant le fichier après la commande, et vous pouvez en mettre plusieurs. Même si ce fichier n'existe pas...  
```bash
nvim hello.c test.lua app.java
```

Une fois dessus, vous ne pouvez pas commencer à modifier les fichiers tout de suite... En réalité, il existe 3 modes:

- **Normal**: C'est le mode de départ, ici, vous pouvez naviguer dans le dossier et exécuter des commandes en tapant sur `:`
- **Insertion**: C'est le mode d'édition, c'est ici que vous pourrez modifier votre fichier... Vous pouvez y accéder en tapant sur `i` en mode **Normal** et retourner en mode **Normal** en appuyant sur `Esc`
- **Visuel**: C'est un mode de séléction, vous pouvez utiliser les commandes d'éditions sur une zone spécifique, vous pouvez y accéder en appuyant sur `v` en mode **Normal** et en sortir pour retourner en mode **Normal** en appuyant sur `Esc`

Ici, nous ne ferons pas un tutoriel complet, une parfaite introduction est déjà disponible sur le logiciel. Vous pouvez y accéder en tapant la commande suivant sur Neovim: 
```vim
:Tutor
```
## Customisation

Neovim est hautement customisable, et la communauté de développeur autour est florissante.  

Vos fichiers de configuration sont accessibles dans `~/.config/nvim/` à l'intérieur vous pourrez notamment mettre le fichier `init.lua` qui exécutera les codes écrit en lua dès l'ouverture de Neovim. C'est ce fichier que vous trouverez sur ce dépôt GitHub.  

Pour en savoir plus sur la customisation, n'hésitez pas à faire un tour sur les liens de [la section en bref](#en-bref) pour en apprendre plus sur les plugins et les configurations.  

## LSP

Le [LSP (Language Server Protocol)](https://en.wikipedia.org/wiki/Language_Server_Protocol) est la partie la plus importe de Neovim, car c'est grâce à ce service que la syntaxe de votre programme sera évaluée en temps réel.  

Il existe pleins de LSP différent, et ce système n'est pas propre à Neovim. Toutefois, nous l'abordons ici car il s'agit d'un élément fondamental pour programmer.  

Avec le plugin [Mason](https://github.com/williamboman/mason.nvim) couplé à [Mason lspconfig](https://github.com/williamboman/mason-lspconfig.nvim), il est possible de se construire un evironnement efficace et d'installer rapidement un **LSP** pour chacun des langages édités, et aussi de les customiser.  

De plus, il est possible de coupler cela à des **formatter**, pour formatter votre code et le rendre homogène rapidement.  

# Neovim à la PPTI

Neovim n'est pas directement disponible sur les ordinateur de la PPTI. ***But, fear not CS Student !*** Neovim est très facilement installable sur l'ordinateur de la PPTI et la majorité de ses fonctionnalités sont disponibles !  

> :bulb: Ce document est adressé aux personnes ayant des connaissances basiques sur l'environnement Linux et les outils associés. Si ce n'est pas votre cas, n'hésitez pas à faire un tour sur le [Wiki](https://github.com/Daisy-Road/wiki/wiki) si nécéssaire !

## Installation
A distance via SSH ou directement sur une machine, vous pouvez installer Neovim grâce au fichier `.appimage` disponible sur le [dépôt GitHub de Neovim](https://github.com/neovim/neovim) :o  

Dans l'onglet *"Releases"* accéder à la dernière ressource stable publiée et localiser le fichier `nvim.appimage`. Cliquez droit sur ce fichier, copiez le lien, puis télécharger le via `wget` !  
```bash
wget <lien du fichier nvim.appimage sur GitHub>
```
Pas de problèmes sur les dépendances liées au logiciel, l'appimage les contient toutes et ne pèse que **15MB**, donc oubliez aussi les problèmes de quotas d'espaces disque !  

Rendez maintenant le fichier `nvim.appimage` exécutable avec 
```bash
chmod u+x ./nvim.appimage
```
et exécutez le simplement avec
```bash
./nvim.appimage
```

Ce qui serait cool, ça serait de pouvoir l'exécuter depuis n'importe où et l'utiliser comme la commande `nvim` classique n'est-ce pas ?  

## Pré-installation (implémentation de `nvim`)

Pour cela, nous allons simplement créer un alias de commande. Et si on utilise notre Neovim tout neuf pour le faire ? :D

Si vous êtes sur le dossier `~` de votre aborescence (et que l'appimage de Neovim s'y trouve évidemment) modifier votre `.bashrc`:
```bash
./nvim.appimage .bashrc
```
Puis ensuite copier les infos suivantes où vous voulez dans le fichier (tant que ça reste cohérent :p)
```bash
alias nvim="~/nvim.appimage $@"
```
Ceci aura pour effet de créer un alias de commande qui exécutera l'appimage de Neovim lorsque vous taperez `nvim` sur le terminal. Le `$@` sert à prendre en compte les arguments que vous avez entré après la commande, ainsi, elle fonctionnera de la même manière que sur votre ordinateur personnel.  

Vous pouvez appliquer ces changements immédiatemment en sourçant votre `.bashrc`
```bash
source .bashrc
```

## Configuration

Neovim fonctionnera comme sur un environnement classique, vous pouvez donc incorporer vos fichiers de configuration dans la même arborescence que classiquemment, à savoir `~/.config/nvim/`.

Toutefois, certaines choses ne peuvent pas se passer comme prévu... Par exemple, le module `ensurepip` n'est pas disponible sur l'environnement de PPTI, ce qui empêche la création d'environnement virtuel Python.  

## Tips spécifique

### Installer le formatter `clang-format`

Le formatter `clang-format` demande un environnement Python spécifique que Mason ne peut installer dans l'environnement PPTI.

Cependant, nous pouvons l'installer via `pip` ! Tapez la commande suivante pour récupérer la librairie Python du formatter

```bash
pip install clang-format
```
> :bulb: Si une erreur de syntaxe s'affiche, elle n'est pas liée directement avec l'installation, mais avec la configuration pip de la PPTI. clang-format a été installé proprement ;)

Et maintenant, nous devons ajouter cette librairie dans notre PATH. Utilisez `pwd` pour connaître l'arborescence de votre dossier HOME et renseignez dans le PATH les fichiers binaires locaux.  

Dans votre `.bashrc` ajoutez l'instruction suivante si ce n'est pas déjà fait:
```bash
export PATH=$PATH:/users/Etu<num_dossier>/<num_etu>/.local/bin
```

Vous pouvez sourcer votre fichier `.bashrc` pour que ceci prenne effet immédiatemment:
```bash
source .bashrc
```

Pour vérifier si tout fonctionne, tapez `clang-format --help`, si le manuel s'affiche, c'est que tout ets bon !
