with Ada.Text_IO; use Ada.Text_IO;
with Assertions;  use Assertions;
with StringExtraction;      use StringExtraction;

procedure TestString is
   Msg1 : constant String := "Test String Vowels";
   Msg2 : constant String := "Test String Consonants";
   Msg3 : constant String := "Test Substring";
   S0 : constant String := "";
   S1 : constant String := "Esto es una prueba";
   S2 : constant String := "35t0-35-un4-pru364";
   S3 : constant String := "ü yGFgheTEoJHWIns";
   S4 : constant String := "123456789";
   S5 : constant String := "aeiou";


   -- Vowels ###################################################################

   procedure Test_1 is
   begin
      Assert_True (Extract_Vowels(S0) = "", "Test_1: Extract Vowels");
      Assert_True (Extract_Vowels(S1) = "Eoeuauea", "Test_2: Extract Vowels");
      Assert_True (Extract_Vowels(S2) = "uu", "Test_3: Extract Vowels");
      Assert_True (Extract_Vowels(S3) = "üeEoI", "Test_4: Extract Vowels");
      Assert_True (Extract_Vowels(S3 & S2) = "üeEoIuu", "Test_5: Extract Vowels");
      Assert_True (Extract_Vowels(S4) = "", "Test_6: Extract Vowels");
      Assert_True (Extract_Vowels(S5) = "aeiou", "Test_7: Extract Vowels");
   exception
      when Assertion_Error =>
         Put_Line (Msg1 & " Failed (assertion)");
      when others =>
         Put_Line (Msg1 & " Failed (exception)");
   end Test_1;

   -- Consonants ###############################################################

   procedure Test_2 is
   begin
      Assert_True (Extract_Consonants(S0) = "", "Test_1: Extract Consonants");
      Assert_True (Extract_Consonants(S1) = "stsnprb", "Test_2: Extract Consonants");
      Assert_True (Extract_Consonants(S2) = "tnpr", "Test_3: Extract Consonants");
      Assert_True (Extract_Consonants(S3) = "yGFghTJHWns", "Test_4: Extract Consonants");
      Assert_True (Extract_Consonants(S3 & S2) = "yGFghTJHWnstnpr", "Test_5: Extract Consonants");
      Assert_True (Extract_Consonants(S4) = "", "Test_6: Extract Consonants");
      Assert_True (Extract_Consonants(S5) = "", "Test_7: Extract Consonants");
   exception
      when Assertion_Error =>
         Put_Line (Msg2 & " Failed (assertion)");
      when others =>
         Put_Line (Msg2 & " Failed (exception)");
   end Test_2;

begin
   Put_Line ("********************* Test_String");
   Test_1;
   Test_2;
end TestString;
