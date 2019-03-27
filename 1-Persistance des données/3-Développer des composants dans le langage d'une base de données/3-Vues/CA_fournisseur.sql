USE fil_rouge;
DROP VIEW IF EXISTS CA_fournisseur_ensemble;
CREATE VIEW CA_fournisseur_ensemble AS 
SELECT nom_fournisseur AS "Nom du fournisseur", SUM(prix_ht_produit * quantite_produit) AS "Chiffre d'affaire" 
FROM fournisseur 
JOIN produit ON fournisseur.id_fournisseur = produit.id_fournisseur 
GROUP BY nom_fournisseur;

SELECT SUM(prix_ht_produit * quantite_produit) AS "Chiffre d'affaire généré pour l'ensemble" 
FROM fournisseur 
JOIN produit ON fournisseur.id_fournisseur = produit.id_fournisseur;


SELECT * FROM CA_fournisseur_ensemble;

