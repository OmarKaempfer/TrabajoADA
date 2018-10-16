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
                   (if (for some K in vowels'Range =>
                           vowels(K) = Given_string(J)) then
                      (for some K in Extract_Vowels'Result'Range =>
                           Extract_Vowels'Result(K) = Given_string(J))))
       and then (for all J in Extract_Vowels'Result'Range =>
                   (for some K in vowels'Range =>
                      vowels(K) = Extract_Vowels'Result(J)));

   function Extract_Consonants (Given_string : in String) return String
     with
       Pre => Given_string'Length <= Max_String_Length
       and then Given_string'Last < Positive'Last
         and then Given_string'First >= Positive'First,
       Post => Extract_consonants'Result'Length <= Given_string'Length
       and then (for all J in Given_string'Range =>
                   (if (for some K in consonants'Range =>
                           vowels(K) = Given_string(J)) then
                      (for some K in Extract_Consonants'Result'Range =>
                           Extract_Consonants'Result(K) = Given_string(J))))
       and then (for all J in Extract_Consonants'Result'Range =>
                   (for some K in consonants'Range =>
                      consonants(K) = Extract_Consonants'Result(J)));


   function Contains (Given_String: in String; char: in Character) return Boolean
     with
       Pre => Given_String'Length <= Max_String_Length,
       Post => (if (for some J in Given_String'Range =>
                          Given_String(J) = char)
                  then
                    Contains'Result = True
                  else
                    Contains'Result = False);

    end StringExtraction;








