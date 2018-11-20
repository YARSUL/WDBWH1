*----------------------------------------------------------------------*
***INCLUDE ZWDBWH1_MAP_OUT_USER_COMMANI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_1000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_1000 INPUT.
  DATA: lt_out TYPE STANDARD TABLE OF text40.

  CASE ok_code.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
    WHEN 'EXEC'.
      lo_te_inp->get_textstream(
*        EXPORTING
*          only_when_modified     = FALSE    " get text only when modified
        IMPORTING
          text                   = DATA(lv_text)    " Text as String with Carriage Returns and Linefeeds
*          is_modified            =     " modify status of text
*        EXCEPTIONS
*          error_cntl_call_method = 1
*          not_supported_by_gui   = 2
*          others                 = 3
      ).
      IF sy-subrc <> 0.
*       MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*                  WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.

      SPLIT lv_text AT cl_abap_char_utilities=>newline INTO TABLE DATA(lt_text).

      LOOP AT lt_text ASSIGNING FIELD-SYMBOL(<ls_text>).
        CONDENSE <ls_text>.
        REPLACE space WITH '$' IN CHARACTER MODE INTO <ls_text>.
        FIND FIRST OCCURRENCE OF '$' IN <ls_text> IN CHARACTER MODE MATCH OFFSET DATA(lv_moff)
                                                                    MATCH LENGTH DATA(lv_length).

        IF <ls_text>(7) = 'SQL__PR'.
*          no comma, last sign.
          <ls_text> = |"{ <ls_text>(lv_moff) }"|.
        ELSE.
          <ls_text> = |"{ <ls_text>(lv_moff) }",|.
        ENDIF.
      ENDLOOP.

*      result
      LOOP AT lt_text ASSIGNING <ls_text>.
        APPEND INITIAL LINE TO lt_out ASSIGNING FIELD-SYMBOL(<ls_out>).
        <ls_out> = |{ <ls_text> }{ cl_abap_char_utilities=>newline }|.
      ENDLOOP.

      IF lt_out IS NOT INITIAL.
        lo_te_out->set_text_as_stream(
          EXPORTING
            text            = lt_out    " text as stream with carrige retruns and linefeeds
*        EXCEPTIONS
*          error_dp        = 1
*          error_dp_create = 2
*          others          = 3
        ).
        IF sy-subrc <> 0.
*       MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*                  WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
        ENDIF.
      ENDIF.

  ENDCASE.

ENDMODULE.
