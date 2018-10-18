package VectorMultiplication with SPARK_Mode => On is

   type Int_Vector is array (Positive range <>) of Integer;

   function Scalar_Product (First_vector, Second_vector : in Int_Vector) return Integer
     with
       Pre => First_vector'Length = Second_vector'Length
       and First_vector'Length /= 0
       and Second_vector'Length /= 0,
       Post => Scalar_Product'Result <= Integer'Last
       and Scalar_Product'Result >= Integer'First;


   function Constant_Product (Given_vector : in Int_Vector; Given_constant : in Integer) return Int_Vector
     with
       Pre => Given_vector'Length /= 0
       and then Given_vector'First < Integer'Last - Given_vector'Length
       and then Given_constant > Integer'First
       and then (for all L in Given_vector'Range => Given_vector(L) > Integer'First)
       and then (if Given_constant /= 0 then (for all K in Given_vector'Range => Integer'Last/abs Given_constant >= abs Given_vector(K))),
       Post => (for all J in Constant_Product'Result'Range =>
                  Constant_Product'Result (J) <= Integer'Last)
       and (for all J in Constant_Product'Result'Range =>
              Constant_Product'Result (J) > Integer'First)
       and (for all J in Constant_Product'Result'Range =>
              Constant_Product'Result (J) = Given_constant * Given_vector (Given_vector'First + (J - Constant_Product'Result'First)))
       and Given_vector'Length = Constant_Product'Result'Length;

end VectorMultiplication;
