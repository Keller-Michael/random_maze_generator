REPORT z_random_maze.

DATA: lr_random_int TYPE REF TO cl_abap_random_int,
      lv_random_int TYPE i,
      lv_position_x TYPE i,
      lv_position_y TYPE i,
      lv_maze_part  TYPE char2.

lr_random_int = cl_abap_random_int=>create( seed = CONV i( sy-uzeit ) min = 1 max = 9 ).

DO 20 TIMES.
  lv_position_y = sy-index.
  lv_position_x = 1.
  DO 30 TIMES.
    CLEAR lv_maze_part.
    IF lv_position_y = 20.
      lv_maze_part = '--'.
    ELSE.
      lv_random_int = lr_random_int->get_next( ).
      IF lv_random_int < 5.
        lv_maze_part = '|'.
      ELSEIF lv_random_int > 7.
        lv_maze_part = '--'.
      ENDIF.
    ENDIF.
    WRITE AT lv_position_x(2) lv_maze_part.
    lv_position_x = lv_position_x + 2.
  ENDDO.
  NEW-LINE.
ENDDO.
