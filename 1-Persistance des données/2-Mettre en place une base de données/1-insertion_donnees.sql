USE fil_rouge;
#------------------------------------------------------------
# INSERTION DE DONNEES
#------------------------------------------------------------
INSERT INTO fournisseur (nom_fournisseur, prenom_fournisseur, telephone_fournisseur, email_fournisseur, adresse_fournisseur, reference_fournisseur) VALUES 
("LAFORET", "thibaut", "03-44-96-12-36", "laforet@outlook.fr", "78 Place du paradis", "RB-10"),
("STARK", "john", "06-48-75-51-49", "stark@outlook.fr", "28 avenue du prix", "BG-71"),
("LANNISTER", "Cercei", "06-48-75-51-49", "cersei@outlook.fr", "114 rue des 7 couronnes","PT-64");

-- commercial, client, fournisseur, rubrique, sous rubrique, produit, livraison, commande 
INSERT INTO commercial (nom_commercial, prenom_commercial, telephone_commercial, adresse_commercial, email_commercial, role_commercial) VALUES 
("MARTIN", "léo", "01-58-79-65-80", "Compiègne, 117 rue de Paris, 60200", "martin@outlook.fr", "particulier"),
("PETIT", "jules", "06-75-10-08-16", "Amiens, 11 rue du général leclerc, 80000", "petit@outlook.fr", "particulier"),
("BARBIER", "eden", "09-92-18-27-98", "Ribécourt, 144 rue d'Aristide Briand, 60170", "barbier@outlook.fr", "professionnel");
 
INSERT INTO client (nom_client, prenom_client, telephone_client, email_client, mot_de_passe, adresse_client, adresse_facturation_client, adresse_livraison_client, coeff_client, statut_client, id_commercial) VALUES 
("ROBERT", "camille", "03-44-79-65-80", "robert@outlook.fr", "azerty", "41 rue Jobin 13003 Marseille", "41 rue Jobin 13003 Marseille", "41 rue Jobin 13003 Marseille", 5, "Professionnel", 1),
("SIMON", "chloé", "06-75-35-87-12", "simon@outlook.fr", "azerty", "19 rue des Augustins 33000 Bordeaux", "19 rue des Augustins 33000 Bordeaux", "19 rue des Augustins 33000 Bordeaux", 10, "Particulier", 1),
("FOURNIER", "hugo", "03-44-01-01-14", "fournier@outlook.fr", "azerty", "Marseille 13003 Marseille", "Marseille 13003 Marseille", "Marseille 13003 Marseille", 5, "Particulier", 2),
("Bouillon", "Anthony", "03-44-01-01-14", "anthony-bouillon@outlook.fr", "$2y$10$NqXyb1dx5DD6q.lheVjwEe9SxLAkDACt5Y52adstDh.zRVeOLJaG2", "Marseille 13003 Marseille", "Marseille 13003 Marseille", "Marseille 13003 Marseille", 5, "Particulier", 2);


INSERT INTO rubrique (nom_rubrique) VALUES 
("GUITARE"),
("BATTERIE");


INSERT INTO sous_rubrique (nom_sous_rubrique, id_rubrique) VALUES 
("ACOUSTIQUE", 1),
("FOLK", 1),
("ELECTRIQUE", 1),
("ACOUSTIQUE", 2),
("CYMBALES", 2),
("FUT", 2);


INSERT INTO produit (description_court_produit, description_long_produit, prix_ht_produit, photo_produit, quantite_produit, tva_produit, id_fournisseur, id_sous_rubrique) VALUES
("Batterie steve", "His cognitis Gallus ut serpens adpetitus telo vel saxo iamque spes extremas opperiens et succurrens saluti suae quavis ratione colligi omnes iussit armatos et cum starent attoniti, districta dentium acie stridens adeste inquit viri fortes mihi periclitanti vobiscum.", 42, '<img src="https://fakeimg.pl/250x100/">', 5, 22.5, 1, 2),
("Guitare folk", "Advenit post multos Scudilo Scutariorum tribunus velamento subagrestis ingenii persuasionis opifex callidus. qui eum adulabili sermone seriis admixto solus omnium proficisci pellexit vultu ", 80 , '<img src="https://fakeimg.pl/250x100/">', 8, 22.5, 1, 1),
("Guitare acoustique", "si quisquam, ille sapiens fuit. Quo modo, ut alia omittam, mortem filii tulit! memineram Paulum, videram Galum, sed hi in pueris, Cato in perfecto et spectato viro.", 12, '<img src="https://fakeimg.pl/250x100/">', 22, 22.5, 2, 1),
("Guitare rock and roll's", "Thalassius vero ea tempestate praefectus praetorio praesens ipse quoque adrogantis ingenii, considerans incitationem eius ad multorum augeri discrimina, non ma", 9, '<img src="https://fakeimg.pl/250x100/">', 1, 22.5, 2, 1);

INSERT INTO panier (id_produit, id_client, quantite) VALUES 
(3, 1, 3),
(2, 1, 3),
(1, 1, 3);


INSERT INTO commande (date_commande, date_facturation, adresse_livraison, adresse_facturation, remise, reglement, etat_commande, id_client) VALUES 
("2015/10/28", "2015/10/28", "114 rue ire", "114 rue ire", 5, 0, "En cours de livraison", 1),
("2015/11/28", "2015/11/28", "36 rue du paradis" ,"36 rue du paradis" , 5, 0, "En cours de livraison", 2),
("2015/12/22", "2015/11/22", "45 rue du printemps", "45 rue du printemps", 5, 1, "Livré", 3);

INSERT INTO livraison (date_livraison, id_commande) VALUES 
("2015/10/28", 1),
("2016/08/09", 2),
("2018/07/12", 3);

INSERT INTO Commande_Produit (id_commande, id_produit, prix_total, quantite) VALUES 
(1, 4, 50, 7),
(2, 3, 50, 7),
(3, 3, 50, 7);

INSERT INTO Livraison_Produit (id_livraison, id_produit, quantite) VALUES 
(1, 1, 5),
(1, 3, 5),
(3, 2, 5);

