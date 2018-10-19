with Ada.Text_IO; use Ada.Text_IO;
with Assertions;  use Assertions;
with VectorMultiplication;      use VectorMultiplication;

procedure TestVector is

   Msg1 : constant String := "Test Scalar Product";
   Msg2 : constant String := "Test Constant Product";
   V0 : constant Int_Vector := (0,0,0);
   V1 : constant Int_Vector := (1,2,3);
   V2 : constant Int_Vector := (-1,2,3);
   V3 : constant Int_Vector := (1,-2,3);
   V4 : constant Int_Vector := (1,2,-3);
   SPV0 : constant Scalar_Pr_Vector := (1,1,1);
   SPV1 : constant Scalar_Pr_Vector := (Element'Last,Element'Last,Element'Last);
   SPV2 : constant Scalar_Pr_Vector := (50,50,50);


   -- Scalar_Product ###########################################################

   procedure Test_1 is
   begin
      Assert_True (Scalar_Product(SPV0,SPV1) = 300, "Test_1: Scalar Product");
      Assert_True (Scalar_Product(SPV1,SPV2) = 15000, "Test_2: Scalar Product");
      Assert_True (Scalar_Product(SPV1,SPV1) = 30000, "Test_3: Scalar Product");
      Assert_True (Scalar_Product(SPV0,SPV0) = 3, "Test_4: Scalar Product");
   exception
      when Assertion_Error =>
         Put_Line (Msg1 & " Failed (assertion)");
      when others =>
         Put_Line (Msg1 & " Failed (exception)");
   end Test_1;

   -- Constant_Product #########################################################

   procedure Test_2 is
   begin
      Assert_True (Constant_Product(V0,1) = (0,0,0), "Test_1: Constant Product");
      Assert_True (Constant_Product(V1,0) = (0,0,0), "Test_2: Constant Product");
      Assert_True (Constant_Product(V1,1) = (1,2,3), "Test_3: Constant Product");
      Assert_True (Constant_Product(V3,-2) = (-2,4,-6), "Test_6: Constant Product");
   exception
      when Assertion_Error =>
         Put_Line (Msg2 & " Failed (assertion)");
      when others =>
         Put_Line (Msg2 & " Failed (exception)");
   end Test_2;

begin
   Put_Line ("********************* Test_Vector");
   Test_1;
   Test_2;
end TestVector;
