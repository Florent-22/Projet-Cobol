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


       01 WS-CURRENT-USER.
           05  WS-CURRENT-USER-FIRSTNAME   PIC A(30).
           05  WS-CURRENT-USER-LASTNAME    PIC A(30).

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
