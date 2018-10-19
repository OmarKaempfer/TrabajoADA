package body VectorMultiplication with SPARK_Mode => On is

   function Scalar_Product (First_vector, Second_vector : in Scalar_Pr_Vector) return Natural is
      result : Natural := 0;
   begin

      for J in First_vector'Range loop

         result := First_vector(J) * Second_vector (J) + result;

         pragma Loop_Invariant
           (if J = 1 then
               result = First_vector(J) * Second_vector (J));
         pragma Loop_Invariant
           (if J = 2 then
               result = First_vector(J - 1) * Second_vector(J - 1) + First_vector(J) * Second_vector(J));
         pragma Loop_Invariant
           (if J = 3 then
               result = First_vector(J - 2) * Second_vector(J - 2)
                + First_vector(J - 1) * Second_vector(J - 1) + First_vector(J) * Second_vector(J));
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
         pragma Loop_Invariant(for all K in result'First .. count - 1 =>
                                    Given_vector(K) * Given_constant = result(K));
         pragma Loop_Invariant(count in Given_vector'First .. Given_vector'Last + 1);
      end loop;
      return result;
   end Constant_Product;
end VectorMultiplication;
