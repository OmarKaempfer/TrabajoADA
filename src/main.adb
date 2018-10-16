with TestVector;
with TestString;
with VectorMultiplication; use VectorMultiplication;
with StringExtraction; use StringExtraction;
with Ada.Text_IO; use Ada.Text_IO;

with StringExtraction;      use StringExtraction;

procedure Main is
   stringprueba : String := "";
begin

   Ada.Text_IO.Put_Line(Integer'Image(stringprueba'First)
                        & " " & Integer'Image(stringprueba'Last)
                        & " " & Integer'Image(stringprueba'Length));
   Ada.Text_IO.Put_Line(Integer'Image(Extract_Vowels("asasadediffofgggu")'Length));
   Ada.Text_IO.Put_Line(Character'Image(Character'Val(0)) & "sads");
   --TestVector;
   TestString;
   Ada.Text_IO.Put_Line("Size " & Integer'image(stringprueba'Length));
   --Put_Line(Substract_Vowels("Esto es una prueba"));
end Main;
