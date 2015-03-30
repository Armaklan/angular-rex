class: center, middle, animated, slideInRight
layout: true

---

class: bigtitle
background-image: url(images/lune280209_hdr.jpg)

# La Face Cachée d'Angular

### Par .blue[ZUBER Lionel]

---

class: title
background-image: url(images/iceberg.jpg)

# La Facile visible de l'Iceberg

---

##Single Page Application

![Vue d'ensemble](images/ensemble.jpg)

Javascript, HTML5, Single Page Application

---

## Un bon exemple de SPA ? Trello !

![Trello](images/trello.jpg)


---

class: title
background-image: url(images/lsda.jpg)

# Mes Expériences

---

class: screen

## Carrefour - Flux Poussée

![Flux Poussé](images/fp.jpg)

---

class: screen

## April - Convergence

![Convergence](images/convergence.jpg)

---

## Formation Web / Angular

![Convergence](images/formation.jpg)

N'hésitez pas à réclamer !

---

class: title
background-image: url(images/palpatine.jpg)

# Le coté obscur

---

## Un outil magique

![Vue d'ensemble](images/baguette.png)

### Angular ne change pas les développeurs, ni le contexte projet !
### Ni le contexte projet !

---

## Un gain de temps

![Vue d'ensemble](images/montre.png)

### Une technologie en plus = une complexité en plus.
### Les fonctionnalitées à implémenter reste les mêmes...

---

## Javascript, la liberté au service du Chaos !

![Vue d'ensemble](images/chaos.jpg)

### L'omniprésence d'anti-pattern
### Un Ecosystème en mouvement...


---

class: title
background-image: url(images/kenobi.jpg)

# Le coté clair

---

## Le Front s'organise...

![Vue d'ensemble](images/xwing.jpg)

### Modèle MVC
### Capitalisation et Directives
### Testing

---

## Application persistante

![Vue d'ensemble](images/chene.jpg)

### Notification
### Stockage "in browser"
### Temps de traitements camoufflable

---

class: title
background-image: url(images/yoda.jpg)

# Bonne pratique

---

## Outiller-vous !

![Brunch](images/brunch.svg)![Gulp](images/gulp.png)

### Ne faites pas ce que l'ordinateur peut faire pour vous !
### Minifier dès le début

---

## Controllez-vous

![Control](images/control.jpg)

### JSHint and Co, dès le début !

---

## Guideline, Structure, et Refactoring

[Angular Style Guide](https://github.com/johnpapa/angular-styleguide)

---

class: inverse

## Wrapper et mode strict

```JS
(function() {
    "use strict";

})();
```

---

class: inverse

## Utiliser le Hoisting des fonctions

```JS
function mySrc() {
    srv.add = add;
    srv.del = del;
    srv.remove = remove;

    function add() {

    }

    ...
}

function myCtrl() {

    initVm();
    initOptionsList();

    function initVm() {
        ...
    }
}

```

---

class: inverse

## Découper en module
### Regrouper Javascript & HTML
### Voir même css

---

## Découpler
###encore...
####et encore...
#####et encore...

---

######et encore...

---

## Découpler

### Séparer service d'accès aux données
### Et service de transformation des données

##-

### Déleguer tout traitement à un service distinct

---

## Tester
### Unitaire et End-to-End

![Jasmine](images/jasmine.png)    ![Protractor](images/protractor.png)

---

## Controller As ...

```HTML
    <div ng-controller="MyCtrl as toto">
        <span ng-bind="toto.myValue"></span>
    </div>

```

```JS
/* En angular 1.2, pas d'excuse ! */
function myCtrl($scope) {
    $scope.toto = {};
    $scope.toto.myValue = "test";
}

```

---

## Le jeu de l'intégration

![Lego](images/lego.jpg)

### Non, mauvaise idée !

---

## Le jeu des Events

![Problematique](images/convergence2.jpg)

---

class: inverse

## Tout dans le controller

```JS
function MyCtrl() {

    this.propositionSelect = propositionSelect;
    
    function propositionSelect(proposition) {
        refreshNotes(proposition);
        refreshPanier(proposition);
    }
    
    function refreshNotes(proposition) {
        this.notes = proposition.notes;
    }
    
    function refreshPanier(proposition) {
        this.panier.cotisation = getBaseCotisation() + proposition.cotisation;
    }

}

```

---

class: inverse

## En mode service

```JS
function MyCtrl(Panier, Notes) {

    this.propositionSelect = propositionSelect;
    
    function propositionSelect(proposition) {
        Notes.refresh(proposition);
        Panier.refresh(proposition);
    }
    
}

function Notes() {
    this.notes = [];
    this.refresh = refresh;
    
    function refresh(proposition) {
        this.notes = proposition.notes;
    }
}

```
---

class: inverse

## Evenement

```JS
function MyCtrl(EventManager) {

    this.propositionSelect = propositionSelect;
    
    function propositionSelect(proposition) {
        EventManager.trigger('proposition-select', proposition);
    }
    
}

function Notes() {
    this.notes = [];
    this.refresh = refresh;
    
    function refresh(proposition) {
        this.notes = proposition.notes;
    }
}

function notesRun(Notes, EventManager) {
    EventManager.on('proposition-select', Notes.refresh);
}

```

---

## Gestion d'exceptions

![Blue Screen](images/bluescreen.png)

### Centralisé la gestion - Tracé coté Back-End

---

class: inverse

## Implémentation

```JS
function ExceptionHandler(EventManager) {

    return new function(e) {
        EventManager.trigger('error', e);
    }
    
}

function TraceError($http) {
    this.log = log;
    
    function log(e) {
        $http({
            url: '/error',
            data: e
        });
    }
}

function runTraceError(TraceError, EventManager) {
    EventManager.on('error', TraceError.log(e);
}
```

---

class: title
background-image: url(images/dolorian.jpg)

# Futur et Evolution ?

---

## Angular V2

![Rupture](images/rupture3.jpg)

Rapprochement d'ECMA 6

Suppression des controllers

Refonte des directives

---

## TypeScript

![Rupture](images/typescript.png)

Typage optionnel

Intégration des classes et interfaces

Syntaxe qui reste proche du JS