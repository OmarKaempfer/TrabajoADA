with TestVector;
with TestString;
with VectorMultiplication; use VectorMultiplication;
with StringExtraction; use StringExtraction;
with Ada.Text_IO; use Ada.Text_IO;

with StringExtraction;      use StringExtraction;

procedure Main is
   stringprueba : String(1 .. 0) := (others =>'A');
begin
   Ada.Text_IO.Put_Line(Boolean'Image(Contains(vowels, Character'Val(0))));
   --TestVector;
   TestString;
   --Put_Line(Substract_Vowels("Esto es una prueba"));
end Main;
