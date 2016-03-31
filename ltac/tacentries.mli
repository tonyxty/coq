(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, *   INRIA - CNRS - LIX - LRI - PPS - Copyright 1999-2016     *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

open Vernacexpr
open Tacexpr

(** Adding a tactic notation in the environment *)

val add_tactic_notation :
  locality_flag * int * grammar_tactic_prod_item_expr list * raw_tactic_expr ->
    unit

val add_ml_tactic_notation : ml_tactic_name ->
  Tacexpr.raw_tactic_expr Egramml.grammar_prod_item list list -> unit

val register_ltac : bool -> Vernacexpr.tacdef_body list -> unit

(** {5 Adding tactic quotations} *)

val create_ltac_quotation : string ->
  ('grm Loc.located -> raw_tactic_arg) -> ('grm Pcoq.Gram.entry * int option) -> unit
(** [create_ltac_quotation name f e] adds a quotation rule to Ltac, that is,
    Ltac grammar now accepts arguments of the form ["name" ":" "(" <e> ")"], and
    generates an argument using [f] on the entry parsed by [e]. *)
