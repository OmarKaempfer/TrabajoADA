package StringExtraction with SPARK_Mode => On is

   Max_String_Length : Constant := 500;
   vowels : Constant String :="AEIOUaeiouÁÉÍÓÚáéíóúÜü";
   consonants : Constant String := "QWRTYPSDFGHJKLZXCVBNMqwrtypsdfghjklzxcvbnñm";
   type Custom_String is array (Positive range 1 .. 100) of Character;

   function Extract_Vowels (Given_string : in String) return String
     with
       Depends => (Extract_Vowels'Result => (Given_string)),
       Pre => Given_string'Length <= Max_String_Length
       and then Given_string'First = 1
       and then (for all J in Given_string'Range =>
                   Given_string(J) /= Character'Val(0)),

       Post => Extract_Vowels'Result'Length <= Given_string'Length
       and then (for all J in Extract_Vowels'Result'Range =>
                   Is_Contained(Extract_Vowels'Result(J), Given_string));

   function Extract_Consonants (Given_string : in String) return String
     with
       Depends => (Extract_Consonants'Result => (Given_string)),
       Pre => Given_string'Length <= Max_String_Length
       and then Given_string'First = 1
       and then (for all J in Given_string'Range =>
                   Given_string(J) /= Character'Val(0)),

       Post => Extract_Consonants'Result'Length <= Given_string'Length
       and then (for all J in Extract_Consonants'Result'Range =>
                   Is_Contained(Extract_Consonants'Result(J), Given_string));


   function Is_Contained (char: in Character; Given_String: in String) return Boolean is
      (for some K in Given_String'Range => char = Given_string(K));

   function Matches_Some_Char (Given_String: in String; Reference_String: in String) return Boolean is
     (for some K in Given_String'Range =>
         Is_Contained(Given_String(K), Reference_String));


    end StringExtraction;








