package StringExtraction with SPARK_Mode => On is

   Max_String_Length : Constant := 500;
   vowels : Constant String :="AEIOUaeiouÁÉÍÓÚáéíóúÜü";
   consonants : Constant String := "QWRTYPSDFGHJKLZXCVBNMqwrtypsdfghjklzxcvbnñm";

   function Extract_Vowels (Given_string : in String) return String
     with
       Pre => Given_string'Length <= Max_String_Length
       and then Given_string'Last < Positive'Last
         and then Given_string'First >= Positive'First,
       Post => Extract_Vowels'Result'Length <= Given_string'Length
       and then (for all J in Given_string'Range =>
                   (if Is_Contained(Given_string(J), vowels) then
                      Is_Contained(Given_string(J), Extract_Vowels'Result)))
       and then (for all J in Extract_Vowels'Result'Range =>
                   Is_Contained(Extract_Vowels'Result(J), vowels));

   function Extract_Consonants (Given_string : in String) return String
     with
       Pre => Given_string'Length <= Max_String_Length
       and then Given_string'Last < Positive'Last
         and then Given_string'First >= Positive'First,
       Post => Extract_consonants'Result'Length <= Given_string'Length
       and then (for all J in Given_string'Range =>
                   (if Is_Contained(Given_string(J), consonants) then
                      Is_Contained(Given_string(J), Extract_Consonants'Result)))
       and then (for all J in Extract_Consonants'Result'Range =>
                   Is_Contained(Extract_Consonants'Result(J), consonants));


   function Contains (Given_String: in String; char: in Character) return Boolean
     with
       Pre => Given_String'Length <= Max_String_Length,
       Post => (if (for some J in Given_String'Range =>
                          Given_String(J) = char)
                  then
                    Contains'Result = True
                  else
                    Contains'Result = False);

   function Is_Contained (char: in Character; Given_String: in String) return Boolean is
      (for some K in Given_String'Range => char = Given_string(K));


    end StringExtraction;








