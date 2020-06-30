CLASS zcl_rap_data_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_data_fill IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: purchase_docs TYPE TABLE OF zpurdocum_mo.
    GET TIME STAMP FIELD DATA(current_timestamp).
    purchase_docs = VALUE #( ( client                   = '100'
                               purchasedocument         = '0000000001'
                               description              = 'Test 1'
                               status                   = '1'
                               priority                 = '1'
                               purchasingorganization   = 'TEST'
                               purchasedocumentimageurl = ''
                               crea_date_time           = current_timestamp
                               crea_uname               = sy-uname
                               lchg_date_time           = current_timestamp
                               lchg_uname               = sy-uname ) ).
    DELETE FROM zpurdocum_mo.
    INSERT zpurdocum_mo FROM TABLE @purchase_docs.
    COMMIT WORK.
    SELECT * FROM zpurdocum_mo INTO TABLE @purchase_docs.
    out->write( sy-dbcnt ).
    out->write( 'data inserted successfully!').
  ENDMETHOD.

ENDCLASS.
