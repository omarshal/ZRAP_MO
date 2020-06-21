"!@testing Z_I_PURCHDOCOVPRICE_MO
CLASS ltc_Z_I_PURCHDOCOVPRICE_MO
DEFINITION FINAL FOR TESTING
DURATION SHORT
RISK LEVEL HARMLESS.
  PRIVATE SECTION.

    CLASS-DATA:
      environment TYPE REF TO if_cds_test_environment.

    CLASS-METHODS:
      "! In CLASS_SETUP, corresponding doubles and clone(s) for the CDS view under test and its dependencies are created.
      class_setup RAISING cx_static_check,
      "! In CLASS_TEARDOWN, Generated database entities (doubles & clones) should be deleted at the end of test class execution.
      class_teardown.

    DATA:
      act_results                TYPE STANDARD TABLE OF z_i_purchdocovprice_mo WITH EMPTY KEY,
      lt_z_i_purchasedoc_mo      TYPE STANDARD TABLE OF z_i_purchasedoc_mo WITH EMPTY KEY,
      lt_z_i_purchasedoc_item_mo TYPE STANDARD TABLE OF z_i_purchasedoc_item_mo WITH EMPTY KEY.

    METHODS:
      "! SETUP method creates a common start state for each test method,
      "! clear_doubles clears the test data for all the doubles used in the test method before each test method execution.
      setup RAISING cx_static_check,
      prepare_testdata_set,
      "!  In this method test data is inserted into the generated double(s) and the test is executed and
      "!  the results should be asserted with the actuals.
      overall_price_no_items FOR TESTING RAISING cx_static_check,
    overall_price_2_items FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltc_Z_I_PURCHDOCOVPRICE_MO IMPLEMENTATION.

  METHOD class_setup.
    environment = cl_cds_test_environment=>create( i_for_entity = 'Z_I_PURCHDOCOVPRICE_MO' ).
  ENDMETHOD.

  METHOD setup.
    environment->clear_doubles( ).
  ENDMETHOD.

  METHOD class_teardown.
    environment->destroy( ).
  ENDMETHOD.

  METHOD overall_price_no_items.
    prepare_testdata_set( ).
    SELECT * FROM z_i_purchdocovprice_mo WHERE purchasedocument = '1' INTO TABLE @act_results.
    cl_abap_unit_assert=>assert_equals( exp = 0 act = act_results[ 1 ]-overallprice ).
  ENDMETHOD.

  METHOD overall_price_2_items.
    prepare_testdata_set( ).
    SELECT * FROM z_i_purchdocovprice_mo WHERE purchasedocument = '2' INTO TABLE @act_results.
    cl_abap_unit_assert=>assert_equals( exp = 30 act = act_results[ 1 ]-overallprice ).
  ENDMETHOD.

  METHOD prepare_testdata_set.

    "Prepare test data for 'z_i_purchasedoc_mo'
    lt_z_i_purchasedoc_mo = VALUE #(
      ( purchasedocument = '1' description = 'Doc with no items' )
      ( purchasedocument = '2' description = 'Doc with 2 items' ) ).
    environment->insert_test_data( i_data =  lt_z_i_purchasedoc_mo ).

    "Prepare test data for 'z_i_purchasedoc_item_mo'
    lt_z_i_purchasedoc_item_mo = VALUE #(
        ( purchasedocument = '2' purchasedocumentitem = '1' overallitemprice = '10' )
        ( purchasedocument = '2' purchasedocumentitem = '2' overallitemprice = '20' ) ).
    environment->insert_test_data( i_data =  lt_z_i_purchasedoc_item_mo ).

  ENDMETHOD.


ENDCLASS.
