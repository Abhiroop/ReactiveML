(* THIS FILE IS GENERATED. *)
(* ../compiler/rmlc -I ../stdlib -I ../interpreter -I ../interpreter/lco -runtime Rmltop rmltop_controller.rml  *)

open Rmltop_implem;;
let suspend =
      Machine_controler_machine.rml_global_signal_combine
        () (function | ()  -> (function | ()  -> () ) )
     and
    resume =
      Machine_controler_machine.rml_global_signal_combine
        () (function | ()  -> (function | ()  -> () ) )
    
;;
let step =
      Machine_controler_machine.rml_global_signal_combine
        1
        (function
          | x__val_rml_4  -> (function | y__val_rml_5  -> x__val_rml_4 ) ) 
;;
let ref_to_sig =
      (function
        | ref_s__val_rml_7  ->
            (function
              | s__val_rml_8  ->
                  (match Pervasives.(!) ref_s__val_rml_7 with | None  -> ()
                   | Some (v__val_rml_9)  ->
                       Pervasives.(:=) ref_s__val_rml_7 None;
                         Machine_controler_machine.rml_expr_emit_val
                           s__val_rml_8 v__val_rml_9
                   )
              )
        ) 
;;
let get_to_run =
      (function
        | ()  ->
            Rmltop_global.lock ();
              (let proc_list__val_rml_11 =
                     Pervasives.(!) Rmltop_global.to_run
                 in
                Pervasives.(:=) Rmltop_global.to_run ([]);
                  Rmltop_global.unlock (); proc_list__val_rml_11)
        ) 
;;
let generate_signals =
      ((function
         | ()  ->
             Machine_controler_machine.rml_loop
               (Machine_controler_machine.rml_seq
                 (Machine_controler_machine.rml_compute
                   (function
                     | ()  ->
                         Rmltop_global.lock ();
                           ref_to_sig Rmltop_global.suspend suspend;
                           ref_to_sig Rmltop_global.resume resume;
                           ref_to_sig Rmltop_global.step step;
                           Rmltop_global.unlock ()
                     ))
                 Machine_controler_machine.rml_pause)
         ):
        (_) Machine_controler_machine.process) 
;;
let sampled =
      ((function
         | ()  ->
             Machine_controler_machine.rml_loop
               (Machine_controler_machine.rml_seq
                 (Machine_controler_machine.rml_compute
                   (function
                     | ()  ->
                         Rmltop_reactive_machine.rml_react (get_to_run ())
                     ))
                 Machine_controler_machine.rml_pause)
         ):
        (_) Machine_controler_machine.process) 
;;
let step_by_step =
      ((function
         | ()  ->
             Machine_controler_machine.rml_loop
               (Machine_controler_machine.rml_await_all'
                 step
                 (function
                   | n__val_rml_15  ->
                       Machine_controler_machine.rml_until'
                         suspend
                         (Machine_controler_machine.rml_loop_n
                           (function
                             | ()  ->
                                 Pervasives.(+)
                                   (Pervasives.(-) n__val_rml_15 1) 1
                             )
                           (Machine_controler_machine.rml_seq
                             (Machine_controler_machine.rml_compute
                               (function
                                 | ()  ->
                                     Rmltop_reactive_machine.rml_react
                                       (get_to_run ())
                                 ))
                             Machine_controler_machine.rml_pause))
                   ))
         ):
        (_) Machine_controler_machine.process) 
;;
let machine_controller =
      ((function
         | ()  ->
             Machine_controler_machine.rml_loop
               (Machine_controler_machine.rml_par
                 Machine_controler_machine.rml_pause
                 (Machine_controler_machine.rml_seq
                   (Machine_controler_machine.rml_until'
                     suspend
                     (Machine_controler_machine.rml_run
                       (function | ()  -> sampled )))
                   (Machine_controler_machine.rml_until'
                     resume
                     (Machine_controler_machine.rml_run
                       (function | ()  -> step_by_step )))))
         ):
        (_) Machine_controler_machine.process) 
;;
let set_suspend =
      (function | ()  -> Machine_controler_machine.rml_expr_emit suspend ) 
;;
let controller =
      ((function
         | ()  ->
             Machine_controler_machine.rml_par
               (Machine_controler_machine.rml_run
                 (function | ()  -> machine_controller ))
               (Machine_controler_machine.rml_run
                 (function | ()  -> generate_signals ))
         ):
        (_) Machine_controler_machine.process) 
;;
