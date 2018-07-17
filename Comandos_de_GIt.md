# Comandos para Git

__Aprende a comandos basicos de git__
***
```bash
$ git commit
``` 
_(commitear tu archivo)_
```bash
$git branch <nombre>
```
_(crear una rama nueva)_
``bash
$ git checkout  <name>
```
_(situarnos en )_
```bash
$ git merge <name>
```
_(se une con )_
```
$git rebase <name>
```
_(rebasar a una version)_
```bash
$ git checkout HEAD~4
```
_(se vaya al HEAD de hace 4 versiones)_
```bash
$ git branch -f  <name> HEAD~3
```
_(lleva el brancheo de master tres versiones atras )_
```bash
$ git reset HEAD~1
```
_(Revertir cambios como si nunca hubuera existido el primero)_
``bash
$ git revert HEAD
```
_(se revierte los cambios pero crea un commit primo)_
```bash
$ git cherry-pick <commit1><commit2>
```
_(Copiar una serie de commits en tu ubicacion actual)_
```bash
& git commit --amend
```
_(modificas el commit)_
```bash
& git diff --color
```
_(enseña los cambios con diferentes colores)_
***




