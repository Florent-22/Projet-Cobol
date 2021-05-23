      * Screens declarations


      ***** MENUS *****
       01  CONNECTION-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  6 COL 15 VALUE "PLEASE LOGIN:".
           05  LINE  8 COL 20 VALUE "IDENTIFICATION CODE:".
           05  LINE  9 COL 20 VALUE "PASSWORD:".
           05  LINE 8 COL 41 PIC 9(4) USING WS-LOGIN.
           05  LINE 9 COL 41 PIC X(30) USING WS-PASSWORD.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  LOGOUT-SCREEN.
           05  BLANK SCREEN.
           05  LINE  8 COL 12 VALUE "GOODBYE".
           05  LINE  8 COL  20 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05 LINE 21 COL 79 VALUE " ".

       01  A-RECEPTION-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  6 COL  20 BACKGROUND-COLOR IS 3 
           VALUE "RECEPTION MENU".
           05  LINE  8 COL 20 VALUE "PLEASE SELECT:".
           05  LINE  10 COL 25 VALUE "1. PLANNING".
           05  LINE  11 COL 25 VALUE "2. RESERVATIONS".
           05  LINE 12 COL 25 VALUE "3. CUSTOMERS".
           05  LINE 13 COL 25 VALUE "4. ROOM STATISTICS".
           05  LINE 14 COL 25 VALUE "5. ADMINISTRATION PANNEL".
           05  LINE 18 COL 25 VALUE "0. EXIT".
           05  LINE 20 COL  2 VALUE "YOUR SELECTION >".
           05  LINE 20 COL 19 PIC Z USING MENU-PICK.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.
      
       01  RECEPTION-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 20 VALUE "PLEASE SELECT:".
           05  LINE  10 COL 25 VALUE "1. PLANNING".
           05  LINE  11 COL 25 VALUE "2. RESERVATIONS".
           05  LINE 12 COL 25 VALUE "3. CUSTOMERS".
           05  LINE 13 COL 25 VALUE "4. ROOM STATISTICS".
           05  LINE 15 COL 25 VALUE "0. EXIT".
           05  LINE 20 COL  2 VALUE "YOUR SELECTION >".
           05  LINE 20 COL 19 PIC Z USING MENU-PICK.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  ADMINISTRATION-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 20 VALUE "PLEASE SELECT:".
           05  LINE  10 COL 25 VALUE "1. ROOMS".
           05  LINE  11 COL 25 VALUE "2. STAFF".
           05  LINE 12 COL 25 VALUE "3. MISSIONS SUPPRESSION".
           05  LINE 13 COL 25 VALUE "4. CUSTOMERS SUPPRESSION".
           05  LINE 15 COL 25 VALUE "0. EXIT".
           05  LINE 20 COL  2 VALUE "YOUR SELECTION >".
           05  LINE 20 COL 19 PIC Z USING MENU-PICK.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  CLEANING-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 20 VALUE "PLEASE SELECT:".
           05  LINE  10 COL 25 VALUE "1. MISSIONS".
           05  LINE  11 COL 25 VALUE "2. ASSIGNING A MISSION".
           05  LINE 12 COL 25 VALUE "3. CLOCK IN ON A MISSION".
           05  LINE 13 COL 25 VALUE "4. PERF STATISTICS".
           05  LINE 15 COL 25 VALUE "0. EXIT".
           05  LINE 20 COL  2 VALUE "YOUR SELECTION >".
           05  LINE 20 COL 19 PIC Z USING MENU-PICK.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  ROOM-EDITING-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 2 VALUE "ROOM NUMBER:".
           05  LINE 8 COL 15 PIC 9(4) FROM fc_numCh.
           05 LINE 10 COL 5 VALUE "ROOM TYPE:".
           05  LINE  10 COL 18 PIC A(30) USING fc_typeCh.
           05 LINE 11 COL 5 VALUE "SURFACE:".
           05  LINE  11 COL 18 PIC 9(2) USING fc_superficie.
           05 LINE 11 COL 21 VALUE "m2".
           05 LINE 12 COL 5 VALUE "BED TYPE:".
           05  LINE 12 COL 18 PIC 9(1) USING fc_lit.
           05  LINE 12 COL 21 VALUE 
           "(0 -> NORMAL 1 -> KING SIZE 2 -> DOUBLE)".
           05 LINE 13 COL 5 VALUE "DESCRIPTION:".
           05  LINE 13 COL 18 PIC A(100) USING fc_description.
           05 LINE 14 COL 5 VALUE "PRICE:".
           05  LINE 14 COL 18 PIC 9(3) USING fc_prix_heure_entier.
           05 LINE 14 COL 21 VALUE ",".
           05  LINE 14 COL 22 PIC 9(2) USING fc_prix_heure_decimal.
           05 LINE 14 COL 25 VALUE "euros".
           05  LINE 20 COL  2 VALUE "VALIDATE ? (Y/N) >".
           05  LINE 20 COL 21 PIC A USING MENU-VALIDATE.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.
       
       01  ROOM-DISPLAY-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 2 VALUE "ROOM NUMBER:".
           05  LINE 8 COL 15 PIC 9(4) FROM fc_numCh.
           05 LINE 10 COL 5 VALUE "ROOM TYPE:".
           05  LINE  10 COL 18 PIC A(30) FROM fc_typeCh.
           05 LINE 11 COL 5 VALUE "SURFACE:".
           05  LINE  11 COL 18 PIC 9(2) FROM fc_superficie.
           05 LINE 11 COL 21 VALUE "m2".
           05 LINE 12 COL 5 VALUE "BED TYPE:".
           05  LINE 12 COL 18 PIC 9(1) FROM fc_lit.
           05  LINE 12 COL 21 VALUE 
           "(0 -> NORMAL 1 -> KING SIZE 2 -> DOUBLE)".
           05 LINE 13 COL 5 VALUE "DESCRIPTION:".
           05  LINE 13 COL 18 PIC A(100) FROM fc_description.
           05 LINE 14 COL 5 VALUE "PRICE:".
           05  LINE 14 COL 18 PIC 9(3) FROM fc_prix_heure_entier.
           05 LINE 14 COL 21 VALUE ",".
           05  LINE 14 COL 22 PIC 9(2) FROM fc_prix_heure_decimal.
           05 LINE 14 COL 25 VALUE "euros".
           05  LINE 20 COL  2 VALUE "VALIDATE ? (Y/N) >".
           05  LINE 20 COL 21 PIC A USING MENU-VALIDATE.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  RESA-EDITING-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 2 VALUE "RESERVATION NUMBER:".
           05  LINE 8 COL 22 PIC 9(6) FROM fr_numResa.
           05 LINE 10 COL 5 VALUE "ROOM NUMBER:".
           05  LINE  10 COL 18 PIC 9(4) USING fr_numCh.
           05 LINE 11 COL 5 VALUE "CLIENT NUMBER:".
           05  LINE  11 COL 21 PIC 9(6) USING fr_numCL.
           05 LINE 13 COL 5 VALUE "DURATION:".
           05  LINE 13 COL 15 PIC 9(2) USING fr_duree_hours.
           05 LINE 13 COL 17 VALUE "h".
           05  LINE 13 COL 18 PIC 9(2) USING fr_duree_minute.
           05 LINE 14 COL 5 VALUE "STARTS:".
           05 LINE 14 COL 15 PIC 9(2) USING fr_date_debut_day.
           05 LINE 14 COL 17 VALUE "/".
           05 LINE 14 COL 18 PIC 9(2) USING fr_date_debut_month.
           05 LINE 14 COL 20 VALUE "/".
           05 LINE 14 COL 21 PIC 9(4) USING fr_date_debut_year.
           05 LINE 14 COL 30 PIC 9(2) USING fr_date_debut_hours.
           05 LINE 14 COL 32 VALUE "h".
           05 LINE 14 COL 33 PIC 9(2) USING fr_date_debut_minute.
           05 LINE 15 COL 5 VALUE "ENDS:".
           05 LINE 15 COL 15 PIC 9(2) USING fr_date_fin_day.
           05 LINE 15 COL 17 VALUE "/".
           05 LINE 15 COL 18 PIC 9(2) USING fr_date_fin_month.
           05 LINE 15 COL 20 VALUE "/".
           05 LINE 15 COL 21 PIC 9(4) USING fr_date_fin_year.
           05 LINE 15 COL 30 PIC 9(2) USING fr_date_fin_hours.
           05 LINE 15 COL 32 VALUE "h".
           05 LINE 15 COL 33 PIC 9(2) USING fr_date_fin_minute.
           05 LINE 20 COL  2 VALUE "VALIDATE ? (Y/N) >".
           05 LINE 20 COL 21 PIC A USING MENU-VALIDATE.
           05 LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.


       01  RESA-REMOVE-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05 LINE 5 COL 30 FOREGROUND-COLOR IS 4 
           VALUE "! REMOVE RESERVATION !".
           05  LINE  8 COL 2 VALUE "RESERVATION NUMBER:".
           05  LINE 8 COL 22 PIC 9(6) USING fr_numResa.
           05 LINE 10 COL 5 VALUE "ROOM NUMBER:".
           05  LINE  10 COL 18 PIC 9(4) FROM fr_numCh.
           05 LINE 11 COL 5 VALUE "CLIENT NAME:".
           05  LINE  11 COL 18 PIC A(30) FROM fcl_nom.
           05  LINE  12 COL 18 PIC A(30) FROM fcl_prenom.
           05 LINE 13 COL 5 VALUE "DURATION:".
           05  LINE 13 COL 15 PIC 9(2) FROM fr_duree_hours.
           05 LINE 13 COL 17 VALUE "h".
           05  LINE 13 COL 18 PIC 9(2) FROM fr_duree_minute.
           05 LINE 14 COL 5 VALUE "STARTS:".
           05 LINE 14 COL 12 PIC 9(2) FROM fr_date_debut_day.
           05 LINE 14 COL 14 VALUE "/".
           05 LINE 14 COL 15 PIC 9(2) FROM fr_date_debut_month.
           05 LINE 14 COL 17 VALUE "/".
           05 LINE 14 COL 18 PIC 9(4) FROM fr_date_debut_year.
           05 LINE 14 COL 24 PIC 9(2) FROM fr_date_debut_hours.
           05 LINE 14 COL 26 VALUE "h".
           05 LINE 14 COL 27 PIC 9(2) FROM fr_date_debut_minute.
           05 LINE 15 COL 5 VALUE "ENDS:".
           05 LINE 15 COL 12 PIC 9(2) FROM fr_date_fin_day.
           05 LINE 15 COL 14 VALUE "/".
           05 LINE 15 COL 15 PIC 9(2) FROM fr_date_fin_month.
           05 LINE 15 COL 17 VALUE "/".
           05 LINE 15 COL 18 PIC 9(4) FROM fr_date_fin_year.
           05 LINE 15 COL 24 PIC 9(2) FROM fr_date_fin_hours.
           05 LINE 15 COL 26 VALUE "h".
           05 LINE 15 COL 27 PIC 9(2) FROM fr_date_fin_minute.
           05 LINE 16 COL 5 VALUE "TOTAL PRICE:".
           05 LINE 16 COL 18 PIC 9(3) FROM WS-TOTAL-PRICE-ENTIER.
           05 LINE 16 COL 21 VALUE ",".
           05 LINE 16 COL 22 PIC 9(2) FROM WS-TOTAL-PRICE-DECIMAL.
           05 LINE 16 COL 25 VALUE "euros".
           05 LINE 20 COL  2 VALUE "VALIDATE ? (Y/N) >".
           05 LINE 20 COL 21 PIC A USING MENU-VALIDATE.
           05 LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.


      * USE 1tamp_fper BECAUSE OF THE SEQUENTIAL SEARCH REWRITE THE INIT
      * tamp
       01  PERS-EDITING-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 2 VALUE "PERSONAL NUMBER:".
           05  LINE 8 COL 19 PIC 9(4) FROM 1fp_numP.
           05 LINE 10 COL 5 VALUE "FIRSTNAME:".
           05  LINE  10 COL 18 PIC A(30) USING 1fp_nom.
           05 LINE 11 COL 5 VALUE "LASTNAME:".
           05  LINE  11 COL 18 PIC A(30) USING 1fp_prenom.
           05 LINE 12 COL 5 VALUE "PERS TYPE:".
           05  LINE 12 COL 18 PIC 9 USING 1fp_type.
           05  LINE 12 COL 25 VALUE 
           "(0 -> RECEPTION 1 -> CLEANING 2 -> ADMIN)".
           05 LINE 13 COL 5 VALUE "PASSWORD:".
           05  LINE 13 COL 18 PIC X(30) USING 1fp_motDePasse.
           05 LINE 14 COL 5 VALUE "DATE EMBAUCHE:".
           05  LINE 14 COL 21 PIC 9(4) USING 1fp_year.
           05 LINE 14 COL 25 VALUE "/".
           05  LINE 14 COL 26 PIC 9(2) USING 1fp_month.
           05 LINE 14 COL 28 VALUE "/".
           05  LINE 14 COL 29 PIC 9(2) USING 1fp_day.
           05  LINE 15 COL 5 VALUE "ACTIF:".
           05  LINE 15 COL 18 PIC 9 USING 1fp_actif.
           05  LINE 15 COL 25 VALUE 
           "(0 -> FIRED 1 -> HIRED 2 -> LEAVE)".
           05  LINE 20 COL  2 VALUE "VALIDATE ? (Y/N) >".
           05  LINE 20 COL 21 PIC A USING MENU-VALIDATE.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  MISS-EDITING-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 2 VALUE "MISSION NUMBER:".
           05  LINE 8 COL 17 PIC 9(5) USING fm_numM.
           05 LINE 10 COL 5 VALUE "PERSONNEL NUMBER:".
           05  LINE  10 COL 23 PIC 9(4) USING fm_numP.
           05 LINE 11 COL 5 VALUE "ROOM NUMBER:".
           05  LINE  11 COL 15 PIC 9(4) USING fm_numCh.
           05 LINE 14 COL 5 VALUE "START DATE:".
           05  LINE 14 COL 21 PIC 9(2) USING fm_debut_day.
           05 LINE 14 COL 23 VALUE "/".
           05  LINE 14 COL 24 PIC 9(2) USING fm_debut_month.
           05 LINE 14 COL 26 VALUE "/".
           05  LINE 14 COL 27 PIC 9(4) USING fm_debut_year.
           05 LINE 14 COL 31 VALUE "-".
           05 LINE 14 COL 32 PIC 9(2) USING fm_debut_hours.
           05 LINE 14 COL 34 VALUE ":".
           05 LINE 14 COL 35 PIC 9(2) USING fm_debut_minute.
           05 LINE 15 COL 5 VALUE "END DATE:".
           05  LINE 15 COL 21 PIC 9(2) USING fm_fin_day.
           05 LINE 15 COL 23 VALUE "/".
           05  LINE 15 COL 24 PIC 9(2) USING fm_fin_month.
           05 LINE 15 COL 26 VALUE "/".
           05  LINE 15 COL 27 PIC 9(4) USING fm_fin_year.
           05 LINE 15 COL 31 VALUE "-".
           05 LINE 15 COL 32 PIC 9(2) USING fm_fin_hours.
           05 LINE 15 COL 34 VALUE ":".
           05 LINE 15 COL 35 PIC 9(2) USING fm_fin_minute.
           05  LINE 20 COL  2 VALUE "VALIDATE ? (Y/N) >".
           05  LINE 20 COL 21 PIC A USING MENU-VALIDATE.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.
       
       01  MISS-REMOVE-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05 LINE 5 COL 30 FOREGROUND-COLOR IS 4 
           VALUE "! REMOVE MISSION !".
           05  LINE  8 COL 2 VALUE "MISSION NUMBER:".
           05  LINE 8 COL 23 PIC 9(5) USING fm_numM.
           05 LINE 10 COL 5 VALUE "PERSONNEL NUMBER:".
           05  LINE  10 COL 23 PIC 9(4) USING fm_numP.
           05 LINE 11 COL 5 VALUE "ROOM NUMBER:".
           05  LINE  11 COL 23 PIC 9(4) USING fm_numCh.
           05 LINE 14 COL 5 VALUE "START DATE:".
           05  LINE 14 COL 21 PIC 9(2) USING fm_debut_day.
           05 LINE 14 COL 23 VALUE "/".
           05  LINE 14 COL 24 PIC 9(2) USING fm_debut_month.
           05 LINE 14 COL 26 VALUE "/".
           05  LINE 14 COL 27 PIC 9(4) USING fm_debut_year.
           05 LINE 14 COL 31 VALUE "-".
           05 LINE 14 COL 32 PIC 9(2) USING fm_debut_hours.
           05 LINE 14 COL 34 VALUE ":".
           05 LINE 14 COL 35 PIC 9(2) USING fm_debut_minute.
           05 LINE 15 COL 5 VALUE "END DATE:".
           05  LINE 15 COL 21 PIC 9(2) USING fm_fin_day.
           05 LINE 15 COL 23 VALUE "/".
           05  LINE 15 COL 24 PIC 9(2) USING fm_fin_month.
           05 LINE 15 COL 26 VALUE "/".
           05  LINE 15 COL 27 PIC 9(4) USING fm_fin_year.
           05 LINE 15 COL 31 VALUE "-".
           05 LINE 15 COL 32 PIC 9(2) USING fm_fin_hours.
           05 LINE 15 COL 34 VALUE ":".
           05 LINE 15 COL 35 PIC 9(2) USING fm_fin_minute.
           05  LINE 20 COL  2 VALUE "VALIDATE ? (Y/N) >".
           05  LINE 20 COL 21 PIC A USING MENU-VALIDATE.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

      * DISPLAY 6 MISSIONS ON SCREEN
       01  DISP-MISSIONS-SCREEN.
           05  LINE  5 COL 5 VALUE "MISSION NUMBER:".
           05  LINE 5 COL 21 PIC 9(5) FROM 1fm_numM.
           05 LINE 7 COL 5 VALUE "PERSON:".
           05 LINE 7 COL 13 PIC 9(4) FROM 1fm_numP.
           05 LINE 8 COL 5 VALUE "ROOM:".
           05 LINE 8 COL 11 PIC 9(4) FROM 1fm_numCh.
           05 LINE 9 COL 5 VALUE "START AT:".
           05 LINE 9 COL 15 PIC 9(2) FROM 1fm_debut_hours.
           05 LINE 9 COL 17 VALUE "h".
           05 LINE 9 COL 18 PIC 9(2) FROM 1fm_debut_minute.

           05  LINE  5 COL 30 VALUE "MISSION NUMBER:".
           05  LINE 5 COL 46 PIC 9(5) FROM 2fm_numM.
           05 LINE 7 COL 30 VALUE "PERSON:".
           05 LINE 7 COL 38 PIC 9(4) FROM 2fm_numP.
           05 LINE 8 COL 30 VALUE "ROOM:".
           05 LINE 8 COL 36 PIC 9(4) FROM 2fm_numCh.
           05 LINE 9 COL 30 VALUE "START AT:".
           05 LINE 9 COL 40 PIC 9(2) FROM 2fm_debut_hours.
           05 LINE 9 COL 42 VALUE "h".
           05 LINE 9 COL 43 PIC 9(2) FROM 2fm_debut_minute.

           05  LINE  5 COL 55 VALUE "MISSION NUMBER:".
           05  LINE 5 COL 71 PIC 9(5) FROM 3fm_numM.
           05 LINE 7 COL 55 VALUE "PERSON:".
           05 LINE 7 COL 63 PIC 9(4) FROM 3fm_numP.
           05 LINE 8 COL 55 VALUE "ROOM:".
           05 LINE 8 COL 61 PIC 9(4) FROM 3fm_numCh.
           05 LINE 9 COL 55 VALUE "START AT:".
           05 LINE 9 COL 65 PIC 9(2) FROM 3fm_debut_hours.
           05 LINE 9 COL 67 VALUE "h".
           05 LINE 9 COL 68 PIC 9(2) FROM 3fm_debut_minute.
 

           05 LINE 12 COL 5 VALUE "MISSION NUMBER:".
           05 LINE 12 COL 21 PIC 9(5) FROM 4fm_numM.
           05 LINE 14 COL 5 VALUE "PERSON:".
           05 LINE 14 COL 13 PIC 9(4) FROM 4fm_numP.
           05 LINE 15 COL 5 VALUE "ROOM:".
           05 LINE 15 COL 11 PIC 9(4) FROM 4fm_numCh.
           05 LINE 16 COL 5 VALUE "START AT:".
           05 LINE 16 COL 15 PIC 9(2) FROM 4fm_debut_hours.
           05 LINE 16 COL 17 VALUE "h".
           05 LINE 16 COL 18 PIC 9(2) FROM 4fm_debut_minute.

           05 LINE 12 COL 30 VALUE "MISSION NUMBER:".
           05 LINE 12 COL 46 PIC 9(5) FROM 5fm_numM.
           05 LINE 14 COL 30 VALUE "PERSON:".
           05 LINE 14 COL 38 PIC 9(4) FROM 5fm_numP.
           05 LINE 15 COL 30 VALUE "ROOM:".
           05 LINE 15 COL 36 PIC 9(4) FROM 5fm_numCh.
           05 LINE 16 COL 30 VALUE "START AT:".
           05 LINE 16 COL 40 PIC 9(2) FROM 5fm_debut_hours.
           05 LINE 16 COL 42 VALUE "h".
           05 LINE 16 COL 43 PIC 9(2) FROM 5fm_debut_minute.

           05 LINE 12 COL 55 VALUE "MISSION NUMBER:".
           05 LINE 12 COL 71 PIC 9(5) FROM 6fm_numM.
           05 LINE 14 COL 55 VALUE "PERSON:".
           05 LINE 14 COL 63 PIC 9(4) FROM 6fm_numP.
           05 LINE 15 COL 55 VALUE "ROOM:".
           05 LINE 15 COL 61 PIC 9(4) FROM 6fm_numCh.
           05 LINE 16 COL 55 VALUE "START AT:".
           05 LINE 16 COL 65 PIC 9(2) FROM 6fm_debut_hours.
           05 LINE 16 COL 67 VALUE "h".
           05 LINE 16 COL 68 PIC 9(2) FROM 6fm_debut_minute.
           05  LINE 20 COL  2 VALUE ">ENTER FOR NEXT<".
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

      * DISPLAY 6 PERSONNEL ON SCREEN 
       01  DISP-PERSONNEL-SCREEN.
           05  LINE  5 COL 5 VALUE "PERSONNEL NUMBER:".
           05  LINE 5 COL 21 PIC 9(5) FROM 1fp_numP.
           05 LINE 7 COL 5 VALUE "NAME:".
           05 LINE 7 COL 13 PIC 9(4) FROM 1fp_nom.
           05 LINE 8 COL 5 VALUE "FIRSTNAME:".
           05 LINE 8 COL 11 PIC 9(4) FROM 1fp_prenom.
           05 LINE 9 COL 5 VALUE "TYPE:".
           05 LINE 9 COL 15 PIC 9(2) FROM 1fp_type.

           05  LINE  5 COL 30 VALUE "PERSONNEL NUMBER:".
           05  LINE 5 COL 46 PIC 9(5) FROM 2fp_numP.
           05 LINE 7 COL 30 VALUE "NAME:".
           05 LINE 7 COL 38 PIC 9(4) FROM 2fp_nom.
           05 LINE 8 COL 30 VALUE "FIRSTNAME:".
           05 LINE 8 COL 36 PIC 9(4) FROM 2fp_prenom.
           05 LINE 9 COL 30 VALUE "TYPE:".
           05 LINE 9 COL 40 PIC 9(2) FROM 2fp_type.

           05  LINE  5 COL 55 VALUE "PERSONNEL NUMBER:".
           05  LINE 5 COL 71 PIC 9(5) FROM 3fp_numP.
           05 LINE 7 COL 55 VALUE "NAME:".
           05 LINE 7 COL 63 PIC 9(4) FROM 3fp_nom.
           05 LINE 8 COL 55 VALUE "FIRSTNAME:".
           05 LINE 8 COL 61 PIC 9(4) FROM 3fp_prenom.
           05 LINE 9 COL 55 VALUE "TYPE:".
           05 LINE 9 COL 65 PIC 9(2) FROM 3fp_type.
 

           05 LINE 12 COL 5 VALUE "PERSONNEL NUMBER:".
           05 LINE 12 COL 21 PIC 9(5) FROM 4fp_numP.
           05 LINE 14 COL 5 VALUE "NAME:".
           05 LINE 14 COL 13 PIC 9(4) FROM 4fp_nom.
           05 LINE 15 COL 5 VALUE "FIRSTNAME:".
           05 LINE 15 COL 11 PIC 9(4) FROM 4fp_prenom.
           05 LINE 16 COL 5 VALUE "TYPE:".
           05 LINE 16 COL 15 PIC 9(2) FROM 4fp_type.

           05 LINE 12 COL 30 VALUE "PERSONNEL NUMBER:".
           05 LINE 12 COL 46 PIC 9(5) FROM 5fp_numP.
           05 LINE 14 COL 30 VALUE "NAME:".
           05 LINE 14 COL 38 PIC 9(4) FROM 5fp_nom.
           05 LINE 15 COL 30 VALUE "FIRSTNAME:".
           05 LINE 15 COL 36 PIC 9(4) FROM 5fp_prenom.
           05 LINE 16 COL 30 VALUE "TYPE:".
           05 LINE 16 COL 40 PIC 9(2) FROM 5fp_type.

           05 LINE 12 COL 55 VALUE "PERSONNEL NUMBER:".
           05 LINE 12 COL 71 PIC 9(5) FROM 6fp_numP.
           05 LINE 14 COL 55 VALUE "NAME:".
           05 LINE 14 COL 63 PIC 9(4) FROM 6fp_nom.
           05 LINE 15 COL 55 VALUE "FIRSTNAME:".
           05 LINE 15 COL 61 PIC 9(4) FROM 6fp_prenom.
           05 LINE 16 COL 55 VALUE "TYPE:".
           05 LINE 16 COL 65 PIC 9(2) FROM 6fp_type.
           05  LINE 20 COL  2 VALUE ">ENTER FOR NEXT<".
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  SRCH-CLI-SCREEN.
           05 BLANK SCREEN.
           05 LINE 2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05 LINE 2 COL  2 VALUE "WELCOME".
           05 LINE 2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05 LINE 3 PIC X(80) VALUE ALL "-".
           05 LINE 8 COL 2 VALUE "CLIENT NUMBER:".
           05 LINE 8 COL 22 PIC 9(6) USING fcl_numCl.
           05 LINE 10 COL 5 VALUE "CLIENT NAME:".
           05 LINE 10 COL 18 PIC A(30) FROM fcl_nom.
           05 LINE 11 COL 18 PIC A(30) FROM fcl_prenom.
           05 LINE 12 COL 5 VALUE "TELEPHONE:".
           05 LINE 12 COL 16 PIC 9(10) FROM fcl_tel.
           05 LINE 13 COL 5 VALUE "ADDRESS:".
           05 LINE 13 COL 14 PIC X(100) FROM fcl_adr.
           05 LINE 14 COL 5 VALUE "BIRTHDAY:".
           05 LINE 14 COL 15 PIC 9(2) FROM fcl_day.
           05 LINE 14 COL 17 VALUE "/".
           05 LINE 14 COL 18 PIC 9(2) FROM fcl_month.
           05 LINE 14 COL 20 VALUE "/".
           05 LINE 14 COL 21 PIC 9(4) FROM fcl_year.

           05 LINE 20 COL  2 VALUE "PRESS ENTER TO RETURN TO MENU".
           05 LINE 20 COL 21 PIC A USING MENU-VALIDATE.
           05 LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  ADD-CLI-SCREEN.
           05 BLANK SCREEN.
           05 LINE 2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05 LINE 2 COL  2 VALUE "WELCOME".
           05 LINE 2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05 LINE 3 PIC X(80) VALUE ALL "-".
           05 LINE 8 COL 2 VALUE "CLIENT NUMBER:".
           05 LINE 8 COL 22 PIC 9(6) FROM fcl_numCl.
           05 LINE 10 COL 5 VALUE "CLIENT NAME:".
           05 LINE 10 COL 18 PIC A(30) USING fcl_nom.
           05 LINE 11 COL 18 PIC A(30) USING fcl_prenom.
           05 LINE 12 COL 5 VALUE "TELEPHONE:".
           05 LINE 12 COL 16 PIC 9(10) USING fcl_tel.
           05 LINE 13 COL 5 VALUE "ADDRESS:".
           05 LINE 13 COL 14 PIC X(100) USING fcl_adr.
           05 LINE 14 COL 5 VALUE "BIRTHDAY:".
           05 LINE 14 COL 15 PIC 9(2) USING fcl_day.
           05 LINE 14 COL 17 VALUE "/".
           05 LINE 14 COL 18 PIC 9(2) USING fcl_month.
           05 LINE 14 COL 20 VALUE "/".
           05 LINE 14 COL 21 PIC 9(4) USING fcl_year.

           05  LINE 20 COL  2 VALUE "VALIDATE ? (Y/N) >".
           05  LINE 20 COL 21 PIC A USING MENU-VALIDATE.
           05 LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  CUSTOMERS-MENU-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 20 VALUE "PLEASE SELECT:".
           05  LINE  10 COL 25 VALUE "1. SEARCH CLIENT".
           05  LINE  11 COL 25 VALUE "2. MODIFY CLIENT".
           05  LINE 12 COL 25 VALUE "3. CREATE CLIENT".
           05  LINE 13 COL 25 VALUE "4. DELETE CLIENT".
           05  LINE 15 COL 25 VALUE "0. EXIT".
           05  LINE 20 COL  2 VALUE "YOUR SELECTION >".
           05  LINE 20 COL 19 PIC Z USING MENU-PICK.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       
       01  STAFF-MENU-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 20 VALUE "PLEASE SELECT:".
           05  LINE  10 COL 25 VALUE "1. SEARCH STAFF".
           05  LINE  11 COL 25 VALUE "2. MODIFY STAFF".
           05  LINE 12 COL 25 VALUE "3. CREATE STAFF".
           05  LINE 13 COL 25 VALUE "4. DELETE STAFF".
           05  LINE 15 COL 25 VALUE "0. EXIT".
           05  LINE 20 COL  2 VALUE "YOUR SELECTION >".
           05  LINE 20 COL 19 PIC Z USING MENU-PICK.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  ROOMS-MENU-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 20 VALUE "PLEASE SELECT:".
           05  LINE  10 COL 25 VALUE "1. SEARCH ROOM".
           05  LINE  11 COL 25 VALUE "2. MODIFY ROOM".
           05  LINE 12 COL 25 VALUE "3. CREATE ROOM".
           05  LINE 13 COL 25 VALUE "4. DELETE ROOM".
           05  LINE 15 COL 25 VALUE "0. EXIT".
           05  LINE 20 COL  2 VALUE "YOUR SELECTION >".
           05  LINE 20 COL 19 PIC Z USING MENU-PICK.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  RESA-MENU-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 20 VALUE "PLEASE SELECT:".
           05  LINE  10 COL 25 VALUE "1. SEARCH RESA".
           05  LINE  11 COL 25 VALUE "2. MODIFY RESA".
           05  LINE 12 COL 25 VALUE "3. CREATE RESA".
           05  LINE 13 COL 25 VALUE "4. DELETE RESA".
           05  LINE 15 COL 25 VALUE "0. EXIT".
           05  LINE 20 COL  2 VALUE "YOUR SELECTION >".
           05  LINE 20 COL 19 PIC Z USING MENU-PICK.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  STATS-MENU-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 20 VALUE "PLEASE SELECT:".
           05  LINE  10 COL 25 VALUE "1. DISPLAY BEST ROOM".
           05  LINE  11 COL 25 VALUE "2. DISPLAY BEST HOUR".
           05  LINE  12 COL 25 VALUE "3. DISPLAY NB MISSION DAY".
           05  LINE 15 COL 25 VALUE "0. EXIT".
           05  LINE 20 COL  2 VALUE "YOUR SELECTION >".
           05  LINE 20 COL 19 PIC Z USING MENU-PICK.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  NB-MIS-JOUR-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 5 VALUE "STAFF NUMBER:".
           05  LINE 8 COL 19 PIC 9(4) USING fp_numP.
           05  LINE  9 COL 5 VALUE "DATE:".
           05  LINE  9 COL 11 PIC 9(2) USING fm_fin_day.
           05 LINE 9 COL 13 VALUE "/".
           05 LINE 9 COL 14 PIC 9(2) USING fm_fin_month.
           05 LINE 9 COL 16 VALUE "/".
           05 LINE 9 COL 17 PIC 9(4) USING fm_fin_year.

           05 LINE 12 COL 5 VALUE "NUMBER OF MISSIONS DONE:".
           05 LINE 12 COL 30 PIC 9(3) FROM WS-NB-MIS.

           05  LINE 20 COL  2 VALUE "VALIDATE ? (Y/N) >".
           05  LINE 20 COL 21 PIC A USING MENU-VALIDATE.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  ROOM_GET_ID.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2  VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL  5  VALUE   "ROOM NUMBER:".
           05  LINE  8 COL  20 PIC 9(4) USING fc_numCh.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.
       
       01  ROOM_RES_BEST_HOUR.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2  VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL  5  VALUE   "ROOM NUMBER:".
           05  LINE  8 COL  20 PIC 9(4) USING fc_numCh.
           05  LINE 20 COL  2 VALUE "VALIDATE ? (Y/N) >".
           05  LINE 20 COL 21 PIC A USING MENU-VALIDATE.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.
       
       01  ROOM_RES_BEST_HOUR_DISP.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2  VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL  5  VALUE "ROOM NUMBER:".
           05  LINE  8 COL  20 PIC 9(4) FROM fc_numCh.
           05  LINE  10 COL 5  VALUE "AVG HOUR:".
           05  LINE  10 COL 20 PIC 9(2) FROM WS-H-RESA-ROOM.
           05  LINE  10 COL 22 VALUE ":".
           05  LINE  10 COL 23 PIC 9(2) FROM WS-M-RESA-ROOM.
           05 LINE 20 COL  2 VALUE "PRESS ENTER TO RETURN TO MENU".
           05 LINE 20 COL 31 PIC A USING MENU-VALIDATE.
           05 LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01 SRCH-MIS-SCREEN.
           05 BLANK SCREEN.
           05 LINE 2 COL 71 PIC 9(8) FROM WS-CURRENT-DATE.
           05 LINE 2 COL 2 VALUE "WELCOME".
           05 LINE 2 COL 10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05 LINE 3 PIC X(80) VALUE ALL "-".
           05 LINE 8 COL 2 VALUE "MISSION NUMBER:".
           05 LINE 8 COL 22 PIC 9(5) USING fm_numM.
           05 LINE 10 COL 2 VALUE "PERSONNEL NUMBER:".
           05 LINE 10 COL 22 PIC 9(4) FROM fm_numP.
           05 LINE 11 COL 2 VALUE "ROOM NUMBER:".
           05 LINE 11 COL 22 PIC 9(4) FROM fm_numCh.
           05 LINE 12 COL 2 VALUE "START DATE:".
           05 LINE 12 COL 22 PIC 9(2) FROM fm_debut_day.
           05 LINE 12 COL 25 VALUE "/".
           05 LINE 12 COL 26 PIC 9(2) FROM fm_debut_month.
           05 LINE 12 COL 28 VALUE "/".
           05 LINE 12 COL 29 PIC 9(4) FROM fm_debut_year.
           05 LINE 13 COL 2 VALUE "END DATE:".
           05 LINE 13 COL 22 PIC 9(2) FROM fm_fin_day.
           05 LINE 13 COL 25 VALUE "/".
           05 LINE 13 COL 26 PIC 9(2) FROM fm_fin_month.
           05 LINE 13 COL 28 VALUE "/".
           05 LINE 13 COL 29 PIC 9(4) FROM fm_fin_year.
           05 LINE 20 COL  2 VALUE "PRESS ENTER TO RETURN TO MENU".
           05 LINE 20 COL 21 PIC A USING MENU-VALIDATE.
           05 LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

      * DISPLAY 6 CLIENT ON SCREEN 
       01  DISP-CLIENT-SCREEN.
           05  LINE  5 COL 5 VALUE "CLIENT NUMBER:".
           05  LINE 5 COL 21 PIC 9(5) FROM 1fcl_numCl.
           05 LINE 7 COL 5 VALUE "NAME:".
           05 LINE 7 COL 13 PIC A(30) FROM 1fcl_nom.
           05 LINE 8 COL 13 PIC A(30) FROM 1fcl_prenom.
           05 LINE 8 COL 5 VALUE "DATE:".
           05 LINE 8 COL 15 PIC 9(2) FROM 1fcl_day.
           05 LINE 8 COL 17 VALUE "/".
           05 LINE 8 COL 18 PIC 9(2) FROM 1fcl_month.
           05 LINE 8 COL 20 VALUE "/".
           05 LINE 8 COL 21 PIC 9(4) FROM 1fcl_year.

           05  LINE  5 COL 5 VALUE "CLIENT NUMBER:".
           05  LINE 5 COL 21 PIC 9(5) FROM 2fcl_numCl.
           05 LINE 7 COL 5 VALUE "NAME:".
           05 LINE 7 COL 13 PIC A(30) FROM 2fcl_nom.
           05 LINE 8 COL 13 PIC A(30) FROM 2fcl_prenom.
           05 LINE 8 COL 5 VALUE "DATE:".
           05 LINE 8 COL 15 PIC 9(2) FROM 2fcl_day.
           05 LINE 8 COL 17 VALUE "/".
           05 LINE 8 COL 18 PIC 9(2) FROM 2fcl_month.
           05 LINE 8 COL 20 VALUE "/".
           05 LINE 8 COL 21 PIC 9(4) FROM 2fcl_year.

           05  LINE  5 COL 5 VALUE "CLIENT NUMBER:".
           05  LINE 5 COL 21 PIC 9(5) FROM 3fcl_numCl.
           05 LINE 7 COL 5 VALUE "NAME:".
           05 LINE 7 COL 13 PIC A(30) FROM 3fcl_nom.
           05 LINE 8 COL 13 PIC A(30) FROM 3fcl_prenom.
           05 LINE 8 COL 5 VALUE "DATE:".
           05 LINE 8 COL 15 PIC 9(2) FROM 3fcl_day.
           05 LINE 8 COL 17 VALUE "/".
           05 LINE 8 COL 18 PIC 9(2) FROM 3fcl_month.
           05 LINE 8 COL 20 VALUE "/".
           05 LINE 8 COL 21 PIC 9(4) FROM 3fcl_year.
 

           05  LINE  5 COL 5 VALUE "CLIENT NUMBER:".
           05  LINE 5 COL 21 PIC 9(5) FROM 4fcl_numCl.
           05 LINE 7 COL 5 VALUE "NAME:".
           05 LINE 7 COL 13 PIC A(30) FROM 4fcl_nom.
           05 LINE 8 COL 13 PIC A(30) FROM 4fcl_prenom.
           05 LINE 8 COL 5 VALUE "DATE:".
           05 LINE 8 COL 15 PIC 9(2) FROM 4fcl_day.
           05 LINE 8 COL 17 VALUE "/".
           05 LINE 8 COL 18 PIC 9(2) FROM 4fcl_month.
           05 LINE 8 COL 20 VALUE "/".
           05 LINE 8 COL 21 PIC 9(4) FROM 4fcl_year.

           05  LINE  5 COL 5 VALUE "CLIENT NUMBER:".
           05  LINE 5 COL 21 PIC 9(5) FROM 5fcl_numCl.
           05 LINE 7 COL 5 VALUE "NAME:".
           05 LINE 7 COL 13 PIC A(30) FROM 5fcl_nom.
           05 LINE 8 COL 13 PIC A(30) FROM 5fcl_prenom.
           05 LINE 8 COL 5 VALUE "DATE:".
           05 LINE 8 COL 15 PIC 9(2) FROM 5fcl_day.
           05 LINE 8 COL 17 VALUE "/".
           05 LINE 8 COL 18 PIC 9(2) FROM 5fcl_month.
           05 LINE 8 COL 20 VALUE "/".
           05 LINE 8 COL 21 PIC 9(4) FROM 5fcl_year.

           05  LINE  5 COL 5 VALUE "CLIENT NUMBER:".
           05  LINE 5 COL 21 PIC 9(5) FROM 6fcl_numCl.
           05 LINE 7 COL 5 VALUE "NAME:".
           05 LINE 7 COL 13 PIC A(30) FROM 6fcl_nom.
           05 LINE 8 COL 13 PIC A(30) FROM 6fcl_prenom.
           05 LINE 8 COL 5 VALUE "DATE:".
           05 LINE 8 COL 15 PIC 9(2) FROM 6fcl_day.
           05 LINE 8 COL 17 VALUE "/".
           05 LINE 8 COL 18 PIC 9(2) FROM 6fcl_month.
           05 LINE 8 COL 20 VALUE "/".
           05 LINE 8 COL 21 PIC 9(4) FROM 6fcl_year.
           05  LINE 20 COL  2 VALUE ">ENTER FOR NEXT<".
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.
