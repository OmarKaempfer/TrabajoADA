package VectorMultiplication with SPARK_Mode => On is

   type Int_Vector is array (Integer range <>) of Integer;

   function Scalar_Product (First_vector, Second_vector : in Int_Vector) return Integer
     with
       Pre => First_vector'Length = Second_vector'Length
       and First_vector'Length /= 0
       and Second_vector'Length /= 0,
       Post => Scalar_Product'Result <= Integer'Last
       and Scalar_Product'Result >= Integer'First;


   function Constant_Product (Given_vector : in Int_Vector; Given_constant : in Integer) return Int_Vector
     with
       Pre => Given_vector'Length /= 0,
       Post => (for all J in Constant_Product'Result'Range =>
                  Constant_Product'Result (J) <= Integer'Last)
       and (for all J in Constant_Product'Result'Range =>
              Constant_Product'Result (J) >= Integer'First)
       and (for all J in Constant_Product'Result'Range =>
              Constant_Product'Result (J) / Given_vector (J) = Given_constant)
       and Given_vector'Length = Constant_Product'Result'Length;

end VectorMultiplication;
