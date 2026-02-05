# Fonction PostgreSQL – Articles vendus par année (paramétrée)

## Description
Ce projet fournit des **fonctions PostgreSQL paramétrées** permettant de consulter :
- la **liste détaillée des articles vendus** pour une année donnée ;
- le **résumé annuel des ventes par article** (quantités et chiffre d’affaires).

Les fonctions sont conçues pour un **environnement professionnel** et respectent les **bonnes pratiques PostgreSQL** (performance, lisibilité, maintenabilité).

---

## Objectifs
- Obtenir rapidement les ventes d’une **année dynamique** (ex. 2023, 2024, 2025).
- Centraliser la logique métier au niveau **base de données**.
- Faciliter l’exploitation via :
  - requêtes SQL,
  - API REST,
  - outils de reporting (Power BI, Excel, etc.).

---

## Modèle de données (hypothèses)

### Table `articles`
| Colonne | Type | Description |
|------|------|-------------|
| id_article | SERIAL | Identifiant unique |
| nom_article | TEXT | Nom de l’article |

### Table `ventes`
| Colonne | Type | Description |
|------|------|-------------|
| id_vente | SERIAL | Identifiant de la vente |
| date_vente | DATE | Date de la vente |

### Table `ligne_vente`
| Colonne | Type | Description |
|------|------|-------------|
| id_ligne | SERIAL | Identifiant |
| id_vente | INT | Référence vente |
| id_article | INT | Référence article |
| quantite | INT | Quantité vendue |
| prix_unitaire | NUMERIC | Prix unitaire |

---

## Fonctions disponibles

### 1️Détail des articles vendus par année
Retourne chaque ligne de vente pour une année donnée.

```sql
SELECT * FROM fn_articles_vendus_par_annee_fast(2025);

Intégration possible
------------------------

API REST (PostgreSQL + FastAPI)

Tableau de bord Power BI

Export CSV / Excel automatisé

Traitement ETL

Auteur
--------

MUHINDO KISUMBA Abdiel
Expert Cybersécurité & PostgreSQL | CEH • CISSP • CompTIA Security+ | Sécurité Réseaux, Systèmes & Bases de Données | Protection des Infrastructures Critiques
