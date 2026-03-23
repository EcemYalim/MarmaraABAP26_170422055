CLASS zcl_170422055_work_with_intbl3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_170422055_work_with_intbl3 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  TYPES: BEGIN OF ty_employee,
          pernr         TYPE i,      "personel Number (key)
          ad            TYPE string, "First name
          soyad         TYPE string, "Last name
          yas           TYPE i,      "Age
          kayit_tarihi  TYPE d,      "Registration date
        END OF ty_employee.


  " Table type definitions
  TYPES: tt_standard TYPE STANDARD TABLE OF ty_employee WITH NON-UNIQUE KEY pernr,
         tt_sorted   TYPE SORTED TABLE OF ty_employee WITH UNIQUE KEY pernr,
         tt_hashed   TYPE HASHED TABLE OF ty_employee WITH UNIQUE KEY pernr.

  DATA: lt_standard TYPE tt_standard,
        lt_sorted   TYPE tt_sorted,
        lt_hashed   TYPE tt_hashed.

  DATA: ls_employee TYPE ty_employee.


  " 1st record
  ls_employee-pernr                = 1001.
  ls_employee-ad                   = 'Serpil'.
  ls_employee-soyad                = 'Çobanlar'.
  ls_employee-yas                  = 21.
  ls_employee-kayit_tarihi         = '20230115'.

  APPEND ls_employee TO lt_standard.
  INSERT ls_employee INTO TABLE lt_sorted.
  INSERT ls_employee INTO TABLE lt_hashed.
  CLEAR ls_employee.


  " 2st record
  ls_employee-pernr                = 1002.
  ls_employee-ad                   = 'Ayse'.
  ls_employee-soyad                = 'Demir'.
  ls_employee-yas                  = 32.
  ls_employee-kayit_tarihi         = '20230220'.

  APPEND ls_employee TO lt_standard.
  INSERT ls_employee INTO TABLE lt_sorted.
  INSERT ls_employee INTO TABLE lt_hashed.
  CLEAR ls_employee.

  " 3st record
  ls_employee-pernr                = 1003.
  ls_employee-ad                   = 'Mehmet'.
  ls_employee-soyad                = 'Kaya'.
  ls_employee-yas                  = 40.
  ls_employee-kayit_tarihi         = '20230321'.

  APPEND ls_employee TO lt_standard.
  INSERT ls_employee INTO TABLE lt_sorted.
  INSERT ls_employee INTO TABLE lt_hashed.
  CLEAR ls_employee.

  " 4st record
  ls_employee-pernr                = 1004.
  ls_employee-ad                   = 'Zeynep'.
  ls_employee-soyad                = 'Çelik'.
  ls_employee-yas                  = 24.
  ls_employee-kayit_tarihi         = '20230423'.

  APPEND ls_employee TO lt_standard.
  INSERT ls_employee INTO TABLE lt_sorted.
  INSERT ls_employee INTO TABLE lt_hashed.
  CLEAR ls_employee.

  " 5st record
  ls_employee-pernr                = 1005.
  ls_employee-ad                   = 'Mustafa'.
  ls_employee-soyad                = 'Aydın'.
  ls_employee-yas                  = 20.
  ls_employee-kayit_tarihi         = '20230117'.

  APPEND ls_employee TO lt_standard.
  INSERT ls_employee INTO TABLE lt_sorted.
  INSERT ls_employee INTO TABLE lt_hashed.
  CLEAR ls_employee.


  "1-) Linear Search on standard table
  READ TABLE lt_standard INTO ls_employee WITH KEY pernr = 1003.
  IF sy-subrc = 0.
    out->write( |Employee found: { ls_employee-pernr }|
            && | { ls_employee-ad } { ls_employee-soyad } | ).

  ENDIF.
  CLEAR ls_employee.

  "2-) Sort standard table by first name for binary search
  SORT lt_standard BY ad.
  READ TABLE lt_standard INTO ls_employee WITH KEY ad = 'Zeynep' BINARY SEARCH.
  IF sy-subrc = 0.
    out->write( |Employee found: { ls_employee-pernr }|
            && | { ls_employee-ad } { ls_employee-soyad } | ).

  ENDIF.
  CLEAR ls_employee.

  "3-) Search on sorted table( automatic binary search)
  READ TABLE lt_sorted INTO ls_employee WITH TABLE KEY pernr = 1002.
  IF sy-subrc = 0.
    out->write( |Employee found: { ls_employee-pernr }|
            && | { ls_employee-ad } { ls_employee-soyad } | ).

  ENDIF.
  CLEAR ls_employee.


  "4-) Search on hashed table
  READ TABLE lt_hashed INTO ls_employee WITH TABLE KEY pernr = 1004.
  IF sy-subrc = 0.
    out->write( |Employee found: { ls_employee-pernr }|
            && | { ls_employee-ad } { ls_employee-soyad } | ).

  ENDIF.
  CLEAR ls_employee.


  ENDMETHOD.
ENDCLASS.
