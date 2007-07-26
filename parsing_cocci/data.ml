module Ast0 = Ast0_cocci

(* Things that need to be seen by the lexer and parser. *)

let in_rule_name = ref false
let in_meta = ref false
let in_iso = ref false
let in_prolog = ref false

type line_type =
    MINUS | OPTMINUS | UNIQUEMINUS | MULTIMINUS
  | PLUS
  | CONTEXT | UNIQUE | OPT | MULTI

let all_metadecls =
  (Hashtbl.create(100) : (string, Ast_cocci.metavar list) Hashtbl.t)

let clear_meta: (unit -> unit) ref = 
  ref (fun _ -> failwith "uninitialized add_meta") 

let add_id_meta: ((string * string) -> Ast0.pure -> unit) ref = 
  ref (fun _ -> failwith "uninitialized add_meta") 

let add_type_meta: ((string * string) -> Ast0.pure -> unit) ref = 
  ref (fun _ -> failwith "uninitialized add_meta") 

let add_param_meta: ((string * string) -> Ast0.pure -> unit) ref = 
  ref (fun _ -> failwith "uninitialized add_meta") 

let add_paramlist_meta: ((string * string) -> Ast0.pure -> unit) ref = 
  ref (fun _ -> failwith "uninitialized add_meta") 

let add_const_meta:
    (Type_cocci.typeC list option -> (string * string) -> Ast0.pure -> unit)
    ref =
  ref (fun _ -> failwith "uninitialized add_meta") 

let add_err_meta: ((string * string) -> Ast0.pure -> unit) ref =
  ref (fun _ -> failwith "uninitialized add_meta") 

let add_exp_meta:
    (Type_cocci.typeC list option -> (string * string) -> Ast0.pure -> unit)
    ref =
  ref (fun _ -> failwith "uninitialized add_meta") 

let add_explist_meta: ((string * string) -> Ast0.pure -> unit) ref = 
  ref (fun _ -> failwith "uninitialized add_meta") 

let add_stm_meta: ((string * string) -> Ast0.pure -> unit) ref = 
  ref (fun _ -> failwith "uninitialized add_meta") 

let add_stmlist_meta: ((string * string) -> Ast0.pure -> unit) ref = 
  ref (fun _ -> failwith "uninitialized add_meta") 

let add_func_meta: ((string * string) -> Ast0.pure -> unit) ref = 
  ref (fun _ -> failwith "uninitialized add_meta") 

let add_local_func_meta: ((string * string) -> Ast0.pure -> unit) ref = 
  ref (fun _ -> failwith "uninitialized add_meta") 

let add_type_name: (string -> unit) ref = 
  ref (fun _ -> failwith "uninitialized add_type") 

let add_declarer_name: (string -> unit) ref = 
  ref (fun _ -> failwith "uninitialized add_decl") 

let add_iterator_name: (string -> unit) ref = 
  ref (fun _ -> failwith "uninitialized add_decl") 

let init_rule: (unit -> unit) ref =
  ref (fun _ -> failwith "uninitialized install_bindings") 

let install_bindings: (string -> unit) ref =
  ref (fun _ -> failwith "uninitialized install_bindings") 

(* ---------------------------------------------------------------------- *)

(* types that clutter the .mly file *)
(* for iso metavariables, true if they can only match nonmodified, unitary
   metavariables *)
type fresh = bool

type clt =
    line_type * int * int * int * int (* starting spaces *) *
      string list (* code before *) * string list (* code after *)
