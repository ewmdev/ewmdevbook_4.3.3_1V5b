class ZCL_IM_CORE_PTS_TYPSQ definition
  public
  final
  create public .

public section.

  interfaces /SCWM/IF_EX_CORE_PTS_TYPSQ .
  interfaces IF_BADI_INTERFACE .
protected section.
private section.

  constants C_PTS_TYPSQ type CHAR1 value 'Q' ##NO_TEXT.
ENDCLASS.



CLASS ZCL_IM_CORE_PTS_TYPSQ IMPLEMENTATION.


  METHOD /scwm/if_ex_core_pts_typsq~storage_type_seq.

    BREAK-POINT ID zewmdevbook_1v5b.
    "1 Set return values
    ev_put_sseq = iv_put_sseq.
    ev_put_rule = iv_put_rule.
    "2 Changing the stor.type search seq.
    IF  NOT is_mat_global-qqtime IS INITIAL
    AND NOT ev_put_sseq IS INITIAL.
      REPLACE SECTION LENGTH '1' OF ev_put_sseq
      WITH c_pts_typsq.
      "3 Raise message
      MESSAGE i001(zewmbookdev_1v5b)
      WITH iv_put_sseq ev_put_sseq INTO DATA(message).
      DATA(ls_bapiret) = VALUE bapiret2( type       = sy-msgty
                                         id         = sy-msgid
                                         number     = sy-msgno
                                         message_v1 = sy-msgv1
                                         message_v2 = sy-msgv2
                                         message_v3 = sy-msgv3
                                         message_v4 = sy-msgv4 ).
      APPEND ls_bapiret TO et_bapiret.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
