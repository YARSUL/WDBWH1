*&---------------------------------------------------------------------*
*& Report ZWDBWH1_MAP_OUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zwdbwh1_map_out.
DATA: ta_inp    TYPE REF TO cl_gui_custom_container,
      lo_te_inp TYPE REF TO cl_gui_textedit,
      ta_out    TYPE REF TO cl_gui_custom_container,
      lo_te_out TYPE REF TO cl_gui_textedit,
      ok_code   LIKE sy-ucomm.

CALL SCREEN 1000.

INCLUDE zwdbwh1_map_out_status_1000o01.

INCLUDE zwdbwh1_map_out_user_commani01.
