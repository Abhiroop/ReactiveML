open Implem_lco_ctrl_tree_record;;

val rml_react : (((unit) Rmltop_global.rml_process) list -> unit)
;;


val rml_exec :
((((unit -> unit))) list -> (('a) Lco_ctrl_tree_record.process -> 'a))
;;


val sampling_hook : (float -> (unit -> unit))
;;


val n_hook : (int -> (unit -> unit))
;;


val debug_hook : (unit -> unit)
;;

