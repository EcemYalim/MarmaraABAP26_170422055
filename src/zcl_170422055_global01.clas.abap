CLASS zcl_170422055_global01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_170422055_global01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

*First Instance

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    connection->carrier_id  = 'LH'.
    connection->connection_id = '0400'.

    APPEND connection TO connections.

*Second Instance

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    connection = NEW #(  ).

    connection->carrier_id = 'AA'.
    connection->connection_id = '0017'.

    APPEND connection to connections.

*Third Instance

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    connection = NEW #(  ).
    connection->carrier_id = 'SQ'.
    connection->connection_id = '0001'.

    APPEND connection TO connections.



  ENDMETHOD.
ENDCLASS.
