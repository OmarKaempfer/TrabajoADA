package body StringExtraction with SPARK_Mode => Off is



   function Extract_Vowels (Given_string : in String) return String is
      result : String (Given_string'First .. Given_string'Last) := (others => Character'Val(0));
      result_index : Positive := Given_string'First;
   begin
      for J in Given_string'Range loop

         if Is_Contained(Given_String(J), vowels) then
            result(result_index) := Given_string(J);
            result_index := result_index + 1;
         end if;

         pragma Loop_Invariant(result_index <= result'Last + 1);
         pragma Loop_Invariant(for all K in result'Range =>
                                 Is_Contained(result(K), vowels));
         pragma Loop_Invariant(for all K in Given_string'First .. J =>
                                  (if Is_Contained(Given_string(K), vowels)
                                   then
                                     Is_Contained(Given_string(K), result)));
      end loop;

      return result(result'First .. result_index - 1);

   end Extract_Vowels;



   function Extract_Consonants (Given_string : in String) return String is
      result : String (Given_string'First .. Given_string'Last) := (others => Character'Val(0));
      result_index : Positive := Given_string'First;
   begin
      for J in Given_string'Range loop

         if Is_Contained(Given_String(J), consonants) then
            result(result_index) := Given_string(J);
            result_index := result_index + 1;
         end if;

         pragma Loop_Invariant(result_index <= result'Last + 1);
         pragma Loop_Invariant(for all K in result'Range =>
                                 Is_Contained(result(K), consonants));
         pragma Loop_Invariant(for all K in Given_string'First .. J =>
                                  (if Is_Contained(Given_string(K), consonants)
                                   then
                                     Is_Contained(Given_string(K), result)));
      end loop;

      return result(result'First .. result_index - 1);

   end Extract_Consonants;



   function Contains(Given_String: in String; char: in Character) return Boolean is
   begin
      for J in Given_String'Range loop
         if Given_String(J) = char then return True;
         end if;
         pragma Loop_Invariant
           (for all K in Given_String'First .. J =>
              Given_String(K) /= char);
      end loop;
      return False;
   end Contains;

end StringExtraction;









