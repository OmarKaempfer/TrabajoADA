package body VectorMultiplication with SPARK_Mode => On is

   function Scalar_Product (First_vector, Second_vector : in Int_Vector) return Integer is
      result : Integer := 0;
   begin
      for I in First_vector'Range loop
         result := result + First_vector (I) * Second_vector (I);
      end loop;
      return result;
   end Scalar_Product;

   function Constant_Product (Given_vector : in Int_Vector; Given_constant : in Integer) return Int_Vector is
      result : Int_Vector := Given_vector;
      count : Integer := Given_vector'First;
   begin
      while count <= Given_vector'Last loop
         result (count) := Given_vector (count) * Given_constant;
         count := count + 1;
         pragma Loop_Variant(Increases => count);
         pragma Loop_Variant(Decreases => Given_vector'Last - count);
         pragma Loop_Invariant(Given_vector'First + Given_vector'First = Given_vector'Length);
      end loop;
      return result;
   end Constant_Product;

end VectorMultiplication;
