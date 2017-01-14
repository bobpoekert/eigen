(*
 * Eigen - an OCaml interface to C++ Eigen library
 * Copyright (c) 2016-2017 Liang Wang <liang.wang@cl.cam.ac.uk>
 *)

open Ctypes
open Eigen_types.SPMAT_D

let create m n =
  let x = ml_eigen_new (Int64.of_int m) (Int64.of_int n) in
  Gc.finalise ml_eigen_delete x;
  x

let delete x = ml_eigen_delete x

let eye m = ml_eigen_eye (Int64.of_int m)

let rows x = ml_eigen_rows x |> Int64.to_int

let cols x = ml_eigen_cols x |> Int64.to_int

let nnz x = ml_eigen_nnz x |> Int64.to_int

let get x i j = ml_eigen_get x (Int64.of_int i) (Int64.of_int j)

let set x i j a = ml_eigen_set x (Int64.of_int i) (Int64.of_int j) a

let reset x = ml_eigen_reset x

let is_compressed x = ml_eigen_is_compressed x = 1

let compress x = ml_eigen_compress x

let uncompress x = ml_eigen_uncompress x

let reshape x m n = ml_eigen_reshape x (Int64.of_int m) (Int64.of_int n)

let prune x r e = ml_eigen_prune x r e

let valueptr x =
  let l = allocate int64_t (Signed.Int64.of_int 0) in
  let raw = ml_eigen_valueptr x l in
  let l = Signed.Int64.to_int !@l in
  bigarray_of_ptr array1 l Bigarray.float64 raw

let innerindexptr x =
  let raw = ml_eigen_innerindexptr x in
  bigarray_of_ptr array1 (nnz x) Bigarray.int64 raw

let outerindexptr x =
  let raw = ml_eigen_outerindexptr x in
  bigarray_of_ptr array1 (rows x + 1) Bigarray.int64 raw

let clone x = ml_eigen_clone x

let row x i = ml_eigen_row x (Int64.of_int i)

let col x i = ml_eigen_col x (Int64.of_int i)

let transpose x = ml_eigen_transpose x

let adjoint x = ml_eigen_adjoint x

let diagonal x = ml_eigen_diagonal x

let trace x = ml_eigen_trace x

let is_zero x = ml_eigen_is_zero x = 1

let is_positive x = ml_eigen_is_positive x = 1

let is_negative x = ml_eigen_is_negative x = 1

let is_nonpositive x = ml_eigen_is_nonpositive x = 1

let is_nonnegative x = ml_eigen_is_nonnegative x = 1

let is_equal x y = ml_eigen_is_equal x y = 1

let is_unequal x y = ml_eigen_is_unequal x y = 1

let is_greater x y = ml_eigen_is_greater x y = 1

let is_smaller x y = ml_eigen_is_smaller x y = 1

let equal_or_greater x y = ml_eigen_equal_or_greater x y = 1

let equal_or_smaller x y = ml_eigen_equal_or_smaller x y = 1

let add x y = ml_eigen_add x y

let sub x y = ml_eigen_sub x y

let mul x y = ml_eigen_mul x y

let div x y = ml_eigen_div x y

let dot x y = ml_eigen_dot x y

let add_scalar x a = ml_eigen_add_scalar x a

let sub_scalar x a = ml_eigen_sub_scalar x a

let mul_scalar x a = ml_eigen_mul_scalar x a

let div_scalar x a = ml_eigen_div_scalar x a

let min2 x y = ml_eigen_min2 x y

let max2 x y = ml_eigen_max2 x y

let sum x = ml_eigen_sum x

let min x = ml_eigen_min x

let max x = ml_eigen_max x

let abs x = ml_eigen_abs x

let neg x = ml_eigen_neg x

let sqrt x = ml_eigen_sqrt x

let print x = ml_eigen_print x
