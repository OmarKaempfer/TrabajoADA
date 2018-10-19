package VectorMultiplication with SPARK_Mode => On is

   subtype Element is Positive range 1 .. 100;
   type Int_Vector is array (Positive range <>) of Integer;
   type Scalar_Pr_Vector is array(Positive range 1 .. 3) of Element;


   function Scalar_Product (First_vector, Second_vector : in Scalar_Pr_Vector) return Natural
     with
       Pre => First_vector'Length = Second_vector'Length
       and then First_vector'Length = 3,
       Post => Scalar_Product'Result = (First_vector(1) * Second_vector(1)
     + First_vector(2) * Second_vector(2)
     + First_vector(3) * Second_vector(3));


   function Constant_Product (Given_vector : in Int_Vector; Given_constant : in Integer) return Int_Vector
     with
       Pre => Given_vector'Length /= 0
       and then Given_vector'First < Integer'Last - Given_vector'Length
       and then Given_constant > Integer'First
       and then (for all L in Given_vector'Range => Given_vector(L) > Integer'First)
       and then (if Given_constant /= 0 then
                   (for all K in Given_vector'Range =>
                      Integer'Last/abs Given_constant >= abs Given_vector(K))),

       Post => (for all J in Constant_Product'Result'Range =>
                  Constant_Product'Result (J) <= Integer'Last)
       and (for all J in Constant_Product'Result'Range =>
              Constant_Product'Result (J) > Integer'First)
       and (for all J in Constant_Product'Result'Range =>
              Constant_Product'Result (J) = Given_constant * Given_vector(J))
       and Given_vector'Length = Constant_Product'Result'Length;

end VectorMultiplication;
