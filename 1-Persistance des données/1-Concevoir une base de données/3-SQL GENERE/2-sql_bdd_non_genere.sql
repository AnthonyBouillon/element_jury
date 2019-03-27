#------------------------------------------------------------
# CREER ET UTILISE LA BASE DE DONNEES FIL_ROUGE
#------------------------------------------------------------

DROP DATABASE IF EXISTS fil_rouge;
CREATE DATABASE fil_rouge;
USE fil_rouge;

#------------------------------------------------------------
# Table: Fournisseur
#------------------------------------------------------------

CREATE TABLE Fournisseur(
        id_fournisseur        Int  Auto_increment  NOT NULL PRIMARY KEY,
        nom_fournisseur       Varchar (150),
        prenom_fournisseur    Varchar (150),
        telephone_fournisseur Varchar (15),
        email_fournisseur     Varchar (150),
        adresse_fournisseur   Varchar (150),
        reference_fournisseur VARCHAR(10)
);
#------------------------------------------------------------
# Table: Commercial
#------------------------------------------------------------

CREATE TABLE Commercial(
        id_commercial        Int  AUTO_INCREMENT NOT NULL PRIMARY KEY,
        nom_commercial       Varchar (150),
        prenom_commercial    Varchar (150),
        telephone_commercial Varchar (15),
        adresse_commercial   Varchar (150),
        email_commercial     Varchar (150) ,
        mot_de_passe			  VARCHAR (60),
        role_commercial	  VARCHAR (50)
);
#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
        id_client                  Int  Auto_increment  NOT NULL PRIMARY KEY,
        nom_client                 Varchar (150),
        prenom_client              Varchar (150),
        telephone_client           Varchar (15),
        email_client               Varchar (150),
        mot_de_passe					  VARCHAR (60),
        adresse_client             Varchar (50),
        adresse_facturation_client Varchar (150),
        adresse_livraison_client   Varchar (150),
        statut_client				  VARCHAR (50),
        coeff_client               INT,
        admin							  BOOLEAN,
        id_commercial              INT NOT NULL,
	     FOREIGN KEY (id_commercial) REFERENCES Commercial(id_commercial)
);



#------------------------------------------------------------
# Table: Commande
#------------------------------------------------------------

CREATE TABLE Commande(
        id_commande       Int  Auto_increment  NOT NULL PRIMARY KEY,
        date_commande     DATE,
        date_facturation  DATE,
        adresse_livraison  VARCHAR(255),
        adresse_facturation VARCHAR(255),
        remise         INT,
        reglement 		  BOOL,
        etat_commande	  VARCHAR(150),
        id_client     	  INT NOT NULL,
	     FOREIGN KEY (id_client) REFERENCES Client(id_client)
);

#------------------------------------------------------------
# Table: Livraison
#------------------------------------------------------------

CREATE TABLE Livraison(
        id_livraison   Int  Auto_increment  NOT NULL PRIMARY KEY,
        date_livraison DATETIME,
        id_commande    INT NOT NULL,
		  FOREIGN KEY (id_commande) REFERENCES Commande(id_commande)
);

#------------------------------------------------------------
# Table: Rubrique
#------------------------------------------------------------

CREATE TABLE Rubrique(
        id_rubrique  Int  Auto_increment  NOT NULL PRIMARY KEY,
        nom_rubrique Varchar (255)
);

#------------------------------------------------------------
# Table: Sous-rubrique
#------------------------------------------------------------

CREATE TABLE Sous_rubrique(
        id_sous_rubrique  Int  Auto_increment  NOT NULL PRIMARY KEY,
        nom_sous_rubrique Varchar (255),
        id_rubrique       Int NOT NULL,
		  FOREIGN KEY (id_rubrique) REFERENCES Rubrique(id_rubrique)
);

#------------------------------------------------------------
# Table: Produit
#------------------------------------------------------------

CREATE TABLE Produit(
        id_produit                Int  Auto_increment  NOT NULL PRIMARY KEY,
        description_court_produit Varchar (150) ,
        description_long_produit  TEXT,
        prix_ht_produit           DECIMAL (4,2),
        photo_produit             Varchar (1500),
        quantite_produit  INT,
        tva_produit                       Decimal (4,2),
        id_fournisseur            Int NOT NULL,
        id_sous_rubrique          Int NOT NULL,
		  FOREIGN KEY (id_fournisseur) REFERENCES Fournisseur(id_fournisseur),
	     FOREIGN KEY (id_sous_rubrique) REFERENCES Sous_rubrique(id_sous_rubrique)
);

#------------------------------------------------------------
# Table: Commande&Produit
#------------------------------------------------------------

CREATE TABLE Commande_Produit(
		  id_commande_produit Int  Auto_increment  NOT NULL PRIMARY KEY,
		  id_produit  Int NOT NULL,
        id_commande INT NOT NULL,
        prix_total  DECIMAL (4,2),
        quantite   INT,

        FOREIGN KEY (id_produit) REFERENCES Produit(id_produit),
        FOREIGN KEY (id_commande) REFERENCES Commande(id_commande)
);

#------------------------------------------------------------
# Table: Livraison&Produit
#------------------------------------------------------------

CREATE TABLE Livraison_Produit(
		  id_livraison Int NOT NULL,
        id_produit   Int NOT NULL,
        quantite    INT,
		  PRIMARY KEY (id_livraison, id_produit),
		  FOREIGN KEY (id_livraison) REFERENCES Livraison(id_livraison),
		  FOREIGN KEY (id_produit) REFERENCES Produit(id_produit)	  
);

#------------------------------------------------------------
# Table: Panier
#------------------------------------------------------------

CREATE TABLE panier
(
		  id Int  Auto_increment  NOT NULL PRIMARY KEY,
        id_produit   INT,
        id_client		INT,
        quantite    INT,
        FOREIGN KEY (id_client) REFERENCES Client(id_client),
		  FOREIGN KEY (id_produit) REFERENCES Produit(id_produit)
		
);


