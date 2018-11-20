*----------------------------------------------------------------------*
***INCLUDE ZWDBWH1_MAP_OUT_STATUS_1000O01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  STATUS_1000  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE STATUS_1000 OUTPUT.
  SET PF-STATUS 'STATUS_1000'.
*  SET TITLEBAR 'xxx'.

  IF lo_te_inp IS INITIAL.

*   create control container
    CREATE OBJECT ta_inp
      EXPORTING
        container_name              = 'TA_INP'
      EXCEPTIONS
        cntl_error                  = 1
        cntl_system_error           = 2
        create_error                = 3
        lifetime_error              = 4
        lifetime_dynpro_dynpro_link = 5.
    IF sy-subrc NE 0.
*      add your handling
    ENDIF.

*   create calls constructor, which initializes, creats and links
*   TextEdit Control
    CREATE OBJECT lo_te_inp
      EXPORTING
        parent                     = ta_inp
        wordwrap_mode              =
*               cl_gui_textedit=>wordwrap_off
*              cl_gui_textedit=>wordwrap_at_fixed_position

cl_gui_textedit=>wordwrap_at_windowborder
*       WORDWRAP_POSITION          = line_length
        wordwrap_to_linebreak_mode = cl_gui_textedit=>true.

  ENDIF.

  IF lo_te_out IS INITIAL.

*   create control container
    CREATE OBJECT ta_out
      EXPORTING
        container_name              = 'TA_OUT'
      EXCEPTIONS
        cntl_error                  = 1
        cntl_system_error           = 2
        create_error                = 3
        lifetime_error              = 4
        lifetime_dynpro_dynpro_link = 5.
    IF sy-subrc NE 0.
*      add your handling
    ENDIF.

*   create calls constructor, which initializes, creats and links
*   TextEdit Control
    CREATE OBJECT lo_te_out
      EXPORTING
        parent                     = ta_out
        wordwrap_mode              =
*               cl_gui_textedit=>wordwrap_off
*              cl_gui_textedit=>wordwrap_at_fixed_position

cl_gui_textedit=>wordwrap_at_windowborder
*       WORDWRAP_POSITION          = line_length
        wordwrap_to_linebreak_mode = cl_gui_textedit=>true.

  ENDIF.
ENDMODULE.
