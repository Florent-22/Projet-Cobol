      * Files declarations
       FD fresa.
       01 tamp_fresa.
           02 fr_numResa PIC 9(6).
           02 fr_numCh PIC 9(4).
           02 fr_numCL PIC 9(6).
           02 fr_duree.
              03 fr_duree_hours PIC 9(2).
			     03 fr_duree_minute PIC 9(2).
           02 fr_date_debut.
              03 fr_date_debut_date.
                 04 fr_date_debut_year PIC 9(4).
                 04 fr_date_debut_month PIC 9(2).
                 04 fr_date_debut_day PIC 9(2). 
              03 fr_date_debut_time.
	              04 fr_date_debut_hours PIC 9(2).
				     04 fr_date_debut_minute PIC 9(2).
           02 fr_date_fin.
              03 fr_date_fin_date.
                 04 fr_date_fin_year PIC 9(4).
                 04 fr_date_fin_month PIC 9(2).
                 04 fr_date_fin_day PIC 9(2). 
              03 fr_date_fin_time.
	              04 fr_date_fin_hours PIC 9(2).
				     04 fr_date_fin_minute PIC 9(2).
       
       FD fresaarch.
       01 tamp_fresaarch.
           02 fra_numResa PIC 9(6).
           02 fra_numCh PIC 9(4).
           02 fra_numCL PIC 9(6).
           02 fra_duree.
              03 fra_duree_hours PIC 9(2).
			     03 fra_duree_minute PIC 9(2).
           02 fra_date_debut.
              03 fra_date_debut_date.
                 04 fra_date_debut_year PIC 9(4).
                 04 fra_date_debut_month PIC 9(2).
                 04 fra_date_debut_day PIC 9(2). 
              03 fra_date_debut_time.
	              04 fra_date_debut_hours PIC 9(2).
				     04 fra_date_debut_minute PIC 9(2).
           02 fra_date_fin.
              03 fra_date_fin_date.
                 04 fra_date_fin_year PIC 9(4).
                 04 fra_date_fin_month PIC 9(2).
                 04 fra_date_fin_day PIC 9(2). 
              03 fra_date_fin_time.
	              04 fra_date_fin_hours PIC 9(2).
				     04 fra_date_fin_minute PIC 9(2).

       
       FD fcli.
       01 tamp_fcli.
           02 fcl_numCl PIC 9(6).
           02 fcl_nom PIC A(30).
           02 fcl_prenom PIC A(30).
           02 fcl_tel PIC 9(10).
           02 fcl_adr PIC X(100).
           02 fcl_dateNaissance.
	          03 fcl_year PIC 9(4).
	          03 fcl_month PIC 9(2).
	          03 fcl_day PIC 9(2).

           
       FD fch.
       01  tamp_fch.
           02 fc_numCh PIC 9(4).
		     02 fc_typeCh PIC A(30).
		     02 fc_superficie PIC 9(2).
		     02 fc_lit PIC 9.
		     02 fc_description PIC A(100).
		     02 fc_prix_heure.
              03 fc_prix_heure_entier PIC 9(3).
              03 fc_prix_heure_decimal PIC 9(2).


       FD fpers.
       01 tamp_fpers.
           02 fp_numP PIC 9(4).
           02 fp_nom PIC A(30).
           02 fp_prenom PIC A(30).
           02 fp_type PIC 9.
           02 fp_motDePasse PIC X(30).
           02 fp_dateEmbauche.
           	  03 fp_year PIC 9(4).
           	  03 fp_month PIC 9(2).
           	  03 fp_day PIC 9(2).
           02 fp_actif PIC 9.

           
       FD fmis.
       01 tamp_fmis.
           02 fm_numM PIC 9(5).
           02 fm_numP PIC 9(4).
           02 fm_numCh PIC 9(4).
           02 fm_debut.
              03 fm_debut_date.
                 04 fm_debut_year PIC 9(4).
                 04 fm_debut_month PIC 9(2).
                 04 fm_debut_day PIC 9(2).
           	  03 fm_debut_time.
           		  04 fm_debut_hours PIC 9(2).
           		  04 fm_debut_minute PIC 9(2).
           02 fm_fin.
              03 fm_fin_date.
                 04 fm_fin_year PIC 9(4).
                 04 fm_fin_month PIC 9(2).
                 04 fm_fin_day PIC 9(2).
           	  03 fm_fin_time.
           		  04 fm_fin_hours PIC 9(2).
           		  04 fm_fin_minute PIC 9(2).
