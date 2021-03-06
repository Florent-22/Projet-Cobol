      * Working variables
       77 cr_fresa                         PIC X(2).
       77 cr_fresaarch                     PIC X(2).
       77 cr_fcli                          PIC X(2).
       77 cr_fch                           PIC X(2).
       77 cr_fpers                         PIC X(2).
       77 cr_fmis                          PIC X(2).
      
       77 Wfin                             PIC 9.
       77 Wtrouve                          PIC 9.
       77 Wstop                            PIC 9.
       77 Wvalide                          PIC 9.
       77 Wid_personnel_to_find            PIC 9(4).
       77 Wdisp                            PIC 9.
       77 WS-NUM-CH                        PIC 9(4).
       77 WS-NB-MIS                        PIC 9(3).
       77 WS-NUMP                          PIC 9(4).
       77 WS-H-RESA-ROOM                   PIC 9(2).
       77 WS-M-RESA-ROOM                   PIC 9(2).
       77 WS-NB-RESA-ROOM                  PIC 9(3).
       77 Wcompteur                        PIC 9(4).

       
       01  WS-FIN-MIS-DATE.
               05  WS-FIN-MIS-YEAR         PIC 9(04).
               05  WS-FIN-MIS-MONTH        PIC 9(02).
               05  WS-FIN-MIS-DAY          PIC 9(02).

       01 WS-TOTAL-PRICE.
           05 WS-TOTAL-PRICE-ENTIER        PIC 9(3).
           05 WS-TOTAL-PRICE-DECIMAL       PIC 9(2).

       01 WS-CURRENT-USER.
           05  WS-CURRENT-USER-NUM         PIC 9(4).
           05  WS-CURRENT-USER-FIRSTNAME   PIC A(30).
           05  WS-CURRENT-USER-LASTNAME    PIC A(30).
           05  WS-CURRENT-USER-TYPE        PIC 9.
           05  WS-CURRENT-USER-PWD         PIC X(30). 
           05  WS-CURRENT-USER-HIREDDATE.
           	  10 WS-CURRENT-USER-YEAR      PIC 9(4).
           	  10 WS-CURRENT-USER-MONTH     PIC 9(2).
           	  10 WS-CURRENT-USER-DAY       PIC 9(2).
           05 WS-CURRENT-USER-ACTIF        PIC 9.      

       01 WS-CURRENT-DATE-DATA.
           05  WS-CURRENT-DATE.
               10  WS-CURRENT-YEAR         PIC 9(04).
               10  WS-CURRENT-MONTH        PIC 9(02).
               10  WS-CURRENT-DAY          PIC 9(02).
           05  WS-CURRENT-TIME.
               10  WS-CURRENT-HOURS        PIC 9(02).
               10  WS-CURRENT-MINUTE       PIC 9(02).
               10  WS-CURRENT-SECOND       PIC 9(02).
               10  WS-CURRENT-MILLISECONDS PIC 9(02).


      * MISSIONS TAMPON DUPLICATED SIX TIMES FOR DISPLAY SCREEN
       01 1tamp_fmis.
           02 1fm_numM PIC 9(5).
           02 1fm_numP PIC 9(4).
           02 1fm_numCh PIC 9(4).
           02 1fm_debut.
              03 1fm_debut_date.
                 04 1fm_debut_year PIC 9(4).
                 04 1fm_debut_month PIC 9(2).
                 04 1fm_debut_day PIC 9(2).
           	  03 1fm_debut_time.
           		  04 1fm_debut_hours PIC 9(2).
           		  04 1fm_debut_minute PIC 9(2).
           02 1fm_fin.
              03 1fm_fin_date.
                 04 1fm_fin_year PIC 9(4).
                 04 1fm_fin_month PIC 9(2).
                 04 1fm_fin_day PIC 9(2).
           	  03 1fm_fin_time.
           		  04 1fm_fin_hours PIC 9(2).
           		  04 1fm_fin_minute PIC 9(2).

       01 2tamp_fmis.
           02 2fm_numM PIC 9(5).
           02 2fm_numP PIC 9(4).
           02 2fm_numCh PIC 9(4).
           02 2fm_debut.
              03 2fm_debut_date.
                 04 2fm_debut_year PIC 9(4).
                 04 2fm_debut_month PIC 9(2).
                 04 2fm_debut_day PIC 9(2).
           	  03 2fm_debut_time.
           		  04 2fm_debut_hours PIC 9(2).
           		  04 2fm_debut_minute PIC 9(2).
           02 2fm_fin.
              03 2fm_fin_date.
                 04 2fm_fin_year PIC 9(4).
                 04 2fm_fin_month PIC 9(2).
                 04 2fm_fin_day PIC 9(2).
           	  03 2fm_fin_time.
           		  04 2fm_fin_hours PIC 9(2).
           		  04 2fm_fin_minute PIC 9(2).
                  

       01 3tamp_fmis.
           02 3fm_numM PIC 9(5).
           02 3fm_numP PIC 9(4).
           02 3fm_numCh PIC 9(4).
           02 3fm_debut.
              03 3fm_debut_date.
                 04 3fm_debut_year PIC 9(4).
                 04 3fm_debut_month PIC 9(2).
                 04 3fm_debut_day PIC 9(2).
           	  03 3fm_debut_time.
           		  04 3fm_debut_hours PIC 9(2).
           		  04 3fm_debut_minute PIC 9(2).
           02 3fm_fin.
              03 3fm_fin_date.
                 04 3fm_fin_year PIC 9(4).
                 04 3fm_fin_month PIC 9(2).
                 04 3fm_fin_day PIC 9(2).
           	  03 3fm_fin_time.
           		  04 3fm_fin_hours PIC 9(2).
           		  04 3fm_fin_minute PIC 9(2).

                    
       01 4tamp_fmis.
           02 4fm_numM PIC 9(5).
           02 4fm_numP PIC 9(4).
           02 4fm_numCh PIC 9(4).
           02 4fm_debut.
              03 4fm_debut_date.
                 04 4fm_debut_year PIC 9(4).
                 04 4fm_debut_month PIC 9(2).
                 04 4fm_debut_day PIC 9(2).
           	  03 4fm_debut_time.
           		  04 4fm_debut_hours PIC 9(2).
           		  04 4fm_debut_minute PIC 9(2).
           02 4fm_fin.
              03 4fm_fin_date.
                 04 4fm_fin_year PIC 9(4).
                 04 4fm_fin_month PIC 9(2).
                 04 4fm_fin_day PIC 9(2).
           	  03 4fm_fin_time.
           		  04 4fm_fin_hours PIC 9(2).
           		  04 4fm_fin_minute PIC 9(2).

               
       01 5tamp_fmis.
           02 5fm_numM PIC 9(5).
           02 5fm_numP PIC 9(4).
           02 5fm_numCh PIC 9(4).
           02 5fm_debut.
              03 5fm_debut_date.
                 04 5fm_debut_year PIC 9(4).
                 04 5fm_debut_month PIC 9(2).
                 04 5fm_debut_day PIC 9(2).
           	  03 5fm_debut_time.
           		  04 5fm_debut_hours PIC 9(2).
           		  04 5fm_debut_minute PIC 9(2).
           02 5fm_fin.
              03 5fm_fin_date.
                 04 5fm_fin_year PIC 9(4).
                 04 5fm_fin_month PIC 9(2).
                 04 5fm_fin_day PIC 9(2).
           	  03 5fm_fin_time.
           		  04 5fm_fin_hours PIC 9(2).
           		  04 5fm_fin_minute PIC 9(2).

       01 6tamp_fmis.
           02 6fm_numM PIC 9(5).
           02 6fm_numP PIC 9(4).
           02 6fm_numCh PIC 9(4).
           02 6fm_debut.
              03 6fm_debut_date.
                 04 6fm_debut_year PIC 9(4).
                 04 6fm_debut_month PIC 9(2).
                 04 6fm_debut_day PIC 9(2).
           	  03 6fm_debut_time.
           		  04 6fm_debut_hours PIC 9(2).
           		  04 6fm_debut_minute PIC 9(2).
           02 6fm_fin.
              03 6fm_fin_date.
                 04 6fm_fin_year PIC 9(4).
                 04 6fm_fin_month PIC 9(2).
                 04 6fm_fin_day PIC 9(2).
           	  03 6fm_fin_time.
           		  04 6fm_fin_hours PIC 9(2).
           		  04 6fm_fin_minute PIC 9(2).

      * PERSONNEL TAMPON DUPLICATED SIX TIMES FOR DISPLAY SCREEN
       01 1tamp_fpers.
           02 1fp_numP PIC 9(4).
           02 1fp_nom PIC A(30).
           02 1fp_prenom PIC A(30).
           02 1fp_type PIC 9.
           02 1fp_motDePasse PIC X(30).
           02 1fp_dateEmbauche.
           	  03 1fp_year PIC 9(4).
           	  03 1fp_month PIC 9(2).
           	  03 1fp_day PIC 9(2).
           02 1fp_actif PIC 9.

       01 2tamp_fpers.
           02 2fp_numP PIC 9(4).
           02 2fp_nom PIC A(30).
           02 2fp_prenom PIC A(30).
           02 2fp_type PIC 9.
           02 2fp_motDePasse PIC X(30).
           02 2fp_dateEmbauche.
           	  03 2fp_year PIC 9(4).
           	  03 2fp_month PIC 9(2).
           	  03 2fp_day PIC 9(2).
           02 2fp_actif PIC 9.

       01 3tamp_fpers.
           02 3fp_numP PIC 9(4).
           02 3fp_nom PIC A(30).
           02 3fp_prenom PIC A(30).
           02 3fp_type PIC 9.
           02 3fp_motDePasse PIC X(30).
           02 3fp_dateEmbauche.
           	  03 3fp_year PIC 9(4).
           	  03 3fp_month PIC 9(2).
           	  03 3fp_day PIC 9(2).
           02 3fp_actif PIC 9.

       01 4tamp_fpers.
           02 4fp_numP PIC 9(4).
           02 4fp_nom PIC A(30).
           02 4fp_prenom PIC A(30).
           02 4fp_type PIC 9.
           02 4fp_motDePasse PIC X(30).
           02 4fp_dateEmbauche.
           	  03 4fp_year PIC 9(4).
           	  03 4fp_month PIC 9(2).
           	  03 4fp_day PIC 9(2).
           02 4fp_actif PIC 9.

       01 5tamp_fpers.
           02 5fp_numP PIC 9(4).
           02 5fp_nom PIC A(30).
           02 5fp_prenom PIC A(30).
           02 5fp_type PIC 9.
           02 5fp_motDePasse PIC X(30).
           02 5fp_dateEmbauche.
           	  03 5fp_year PIC 9(4).
           	  03 5fp_month PIC 9(2).
           	  03 5fp_day PIC 9(2).
           02 5fp_actif PIC 9.
       
       01 6tamp_fpers.
           02 6fp_numP PIC 9(4).
           02 6fp_nom PIC A(30).
           02 6fp_prenom PIC A(30).
           02 6fp_type PIC 9.
           02 6fp_motDePasse PIC X(30).
           02 6fp_dateEmbauche.
           	  03 6fp_year PIC 9(4).
           	  03 6fp_month PIC 9(2).
           	  03 6fp_day PIC 9(2).
           02 6fp_actif PIC 9.

      * CLIENT TAMPON DUPLICATED SIX TIMES FOR DISPLAY SCREEN
       01 1tamp_fcli.
           02 1fcl_numCl PIC 9(6).
           02 1fcl_nom PIC A(30).
           02 1fcl_prenom PIC A(30).
           02 1fcl_tel PIC 9(10).
           02 1fcl_adr PIC X(100).
           02 1fcl_dateNaissance.
           	  03 1fcl_year PIC 9(4).
           	  03 1fcl_month PIC 9(2).
           	  03 1fcl_day PIC 9(2).

       01 2tamp_fcli.
           02 2fcl_numCl PIC 9(6).
           02 2fcl_nom PIC A(30).
           02 2fcl_prenom PIC A(30).
           02 2fcl_tel PIC 9(10).
           02 2fcl_adr PIC X(100).
           02 2fcl_dateNaissance.
           	  03 2fcl_year PIC 9(4).
           	  03 2fcl_month PIC 9(2).
           	  03 2fcl_day PIC 9(2).

       01 3tamp_fcli.
           02 3fcl_numCl PIC 9(6).
           02 3fcl_nom PIC A(30).
           02 3fcl_prenom PIC A(30).
           02 3fcl_tel PIC 9(10).
           02 3fcl_adr PIC X(100).
           02 3fcl_dateNaissance.
           	  03 3fcl_year PIC 9(4).
           	  03 3fcl_month PIC 9(2).
           	  03 3fcl_day PIC 9(2).

       01 4tamp_fcli.
           02 4fcl_numCl PIC 9(6).
           02 4fcl_nom PIC A(30).
           02 4fcl_prenom PIC A(30).
           02 4fcl_tel PIC 9(10).
           02 4fcl_adr PIC X(100).
           02 4fcl_dateNaissance.
           	  03 4fcl_year PIC 9(4).
           	  03 4fcl_month PIC 9(2).
           	  03 4fcl_day PIC 9(2).

       01 5tamp_fcli.
           02 5fcl_numCl PIC 9(6).
           02 5fcl_nom PIC A(30).
           02 5fcl_prenom PIC A(30).
           02 5fcl_tel PIC 9(10).
           02 5fcl_adr PIC X(100).
           02 5fcl_dateNaissance.
           	  03 5fcl_year PIC 9(4).
           	  03 5fcl_month PIC 9(2).
           	  03 5fcl_day PIC 9(2).
       
       01 6tamp_fcli.
           02 6fcl_numCl PIC 9(6).
           02 6fcl_nom PIC A(30).
           02 6fcl_prenom PIC A(30).
           02 6fcl_tel PIC 9(10).
           02 6fcl_adr PIC X(100).
           02 6fcl_dateNaissance.
           	  03 6fcl_year PIC 9(4).
           	  03 6fcl_month PIC 9(2).
           	  03 6fcl_day PIC 9(2).

      * TEMP RESA
       01 1tamp_fresa. 
           02 1fr_numResa PIC 9(6).
           02 1fr_numCh PIC 9(4).
           02 1fr_numCL PIC 9(6).
           02 1fr_duree.
              03 1fr_duree_hours PIC 9(2).
			     03 1fr_duree_minute PIC 9(2).
           02 1fr_date_debut.
              03 1fr_date_debut_date.
                 04 1fr_date_debut_year PIC 9(4).
                 04 1fr_date_debut_month PIC 9(2).
                 04 1fr_date_debut_day PIC 9(2). 
              03 1fr_date_debut_time.
	              04 1fr_date_debut_hours PIC 9(2).
				     04 1fr_date_debut_minute PIC 9(2).
           02 1fr_date_fin.
              03 1fr_date_fin_date.
                 04 1fr_date_fin_year PIC 9(4).
                 04 1fr_date_fin_month PIC 9(2).
                 04 1fr_date_fin_day PIC 9(2). 
              03 1fr_date_fin_time.
	              04 1fr_date_fin_hours PIC 9(2).
				     04 1fr_date_fin_minute PIC 9(2).

       01 2tamp_fresa. 
           02 2fr_numResa PIC 9(6).
           02 2fr_numCh PIC 9(4).
           02 2fr_numCL PIC 9(6).
           02 2fr_duree.
              03 2fr_duree_hours PIC 9(2).
			     03 2fr_duree_minute PIC 9(2).
           02 2fr_date_debut.
              03 2fr_date_debut_date.
                 04 2fr_date_debut_year PIC 9(4).
                 04 2fr_date_debut_month PIC 9(2).
                 04 2fr_date_debut_day PIC 9(2). 
              03 2fr_date_debut_time.
	              04 2fr_date_debut_hours PIC 9(2).
				     04 2fr_date_debut_minute PIC 9(2).
           02 2fr_date_fin.
              03 2fr_date_fin_date.
                 04 2fr_date_fin_year PIC 9(4).
                 04 2fr_date_fin_month PIC 9(2).
                 04 2fr_date_fin_day PIC 9(2). 
              03 2fr_date_fin_time.
	              04 2fr_date_fin_hours PIC 9(2).
				     04 2fr_date_fin_minute PIC 9(2).
       
       01 3tamp_fresa. 
           02 3fr_numResa PIC 9(6).
           02 3fr_numCh PIC 9(4).
           02 3fr_numCL PIC 9(6).
           02 3fr_duree.
              03 3fr_duree_hours PIC 9(2).
			     03 3fr_duree_minute PIC 9(2).
           02 3fr_date_debut.
              03 3fr_date_debut_date.
                 04 3fr_date_debut_year PIC 9(4).
                 04 3fr_date_debut_month PIC 9(2).
                 04 3fr_date_debut_day PIC 9(2). 
              03 3fr_date_debut_time.
	              04 3fr_date_debut_hours PIC 9(2).
				     04 3fr_date_debut_minute PIC 9(2).
           02 3fr_date_fin.
              03 3fr_date_fin_date.
                 04 3fr_date_fin_year PIC 9(4).
                 04 3fr_date_fin_month PIC 9(2).
                 04 3fr_date_fin_day PIC 9(2). 
              03 3fr_date_fin_time.
	              04 3fr_date_fin_hours PIC 9(2).
				     04 3fr_date_fin_minute PIC 9(2).

       01 4tamp_fresa. 
           02 4fr_numResa PIC 9(6).
           02 4fr_numCh PIC 9(4).
           02 4fr_numCL PIC 9(6).
           02 4fr_duree.
              03 4fr_duree_hours PIC 9(2).
			     03 4fr_duree_minute PIC 9(2).
           02 4fr_date_debut.
              03 4fr_date_debut_date.
                 04 4fr_date_debut_year PIC 9(4).
                 04 4fr_date_debut_month PIC 9(2).
                 04 4fr_date_debut_day PIC 9(2). 
              03 4fr_date_debut_time.
	              04 4fr_date_debut_hours PIC 9(2).
				     04 4fr_date_debut_minute PIC 9(2).
           02 4fr_date_fin.
              03 4fr_date_fin_date.
                 04 4fr_date_fin_year PIC 9(4).
                 04 4fr_date_fin_month PIC 9(2).
                 04 4fr_date_fin_day PIC 9(2). 
              03 4fr_date_fin_time.
	              04 4fr_date_fin_hours PIC 9(2).
				     04 4fr_date_fin_minute PIC 9(2).

       01 5tamp_fresa. 
           02 5fr_numResa PIC 9(6).
           02 5fr_numCh PIC 9(4).
           02 5fr_numCL PIC 9(6).
           02 5fr_duree.
              03 5fr_duree_hours PIC 9(2).
			     03 1fr_duree_minute PIC 9(2).
           02 5fr_date_debut.
              03 5fr_date_debut_date.
                 04 5fr_date_debut_year PIC 9(4).
                 04 5fr_date_debut_month PIC 9(2).
                 04 5fr_date_debut_day PIC 9(2). 
              03 5fr_date_debut_time.
	              04 5fr_date_debut_hours PIC 9(2).
				     04 5fr_date_debut_minute PIC 9(2).
           02 5fr_date_fin.
              03 5fr_date_fin_date.
                 04 5fr_date_fin_year PIC 9(4).
                 04 5fr_date_fin_month PIC 9(2).
                 04 1fr_date_fin_day PIC 9(2). 
              03 5fr_date_fin_time.
	              04 5fr_date_fin_hours PIC 9(2).
				     04 5fr_date_fin_minute PIC 9(2).

       01 6tamp_fresa. 
           02 6fr_numResa PIC 9(6).
           02 6fr_numCh PIC 9(4).
           02 6fr_numCL PIC 9(6).
           02 6fr_duree.
              03 6fr_duree_hours PIC 9(2).
			     03 1fr_duree_minute PIC 9(2).
           02 6fr_date_debut.
              03 6fr_date_debut_date.
                 04 6fr_date_debut_year PIC 9(4).
                 04 6fr_date_debut_month PIC 9(2).
                 04 6fr_date_debut_day PIC 9(2). 
              03 6fr_date_debut_time.
	              04 6fr_date_debut_hours PIC 9(2).
				     04 6fr_date_debut_minute PIC 9(2).
           02 6fr_date_fin.
              03 6fr_date_fin_date.
                 04 6fr_date_fin_year PIC 9(4).
                 04 6fr_date_fin_month PIC 9(2).
                 04 6fr_date_fin_day PIC 9(2). 
              03 6fr_date_fin_time.
	              04 6fr_date_fin_hours PIC 9(2).
				     04 6fr_date_fin_minute PIC 9(2).
