      * Files assignments    
           SELECT fresa ASSIGN TO 'files/reservations.dat'
           ORGANIZATION INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS fr_numResa
           ALTERNATE RECORD KEY IS fr_date_debut_date WITH DUPLICATES
           ALTERNATE RECORD KEY IS fr_numCl WITH DUPLICATES
           ALTERNATE RECORD KEY IS fr_numCh WITH DUPLICATES
           FILE STATUS IS cr_fresa.

           SELECT fresaarch ASSIGN TO 'files/reservations_archives.dat'
           ORGANIZATION INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS fra_numResa
           ALTERNATE RECORD KEY IS fra_date_debut_date WITH DUPLICATES
           ALTERNATE RECORD KEY IS fra_numCl WITH DUPLICATES
           ALTERNATE RECORD KEY IS fra_numCh WITH DUPLICATES
           FILE STATUS IS cr_fresaarch.
       
           SELECT fcli ASSIGN TO 'files/clients.dat'
           ORGANIZATION INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS fcl_numCl
           ALTERNATE RECORD KEY IS fcl_dateNaissance WITH DUPLICATES
           FILE STATUS IS cr_fcli. 

           SELECT fch ASSIGN TO 'files/chambres.dat'
           ORGANIZATION SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS cr_fch.

           SELECT fpers ASSIGN TO 'files/personnels.dat'
           ORGANIZATION SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS cr_fpers.

           SELECT fmis ASSIGN TO 'files/missions.dat'
           ORGANIZATION INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS fm_numM
           ALTERNATE RECORD KEY IS fm_numP WITH DUPLICATES
           ALTERNATE RECORD KEY IS fm_numCh WITH DUPLICATES
           FILE STATUS IS cr_fmis.  
