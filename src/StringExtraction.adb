package body StringExtraction with SPARK_Mode => Off is



   function Extract_Vowels (Given_string : in String) return String is
      result : String (Given_string'First .. Given_string'Last) := (others => Character'Val(0));
      result_index : Positive := Given_string'First;
   begin
      for J in Given_string'Range loop

         if Contains(vowels, Given_String(J)) then
            result(result_index) := Given_string(J);
            result_index := result_index + 1;
         end if;

         pragma Loop_Invariant(result_index <= result'Last + 1);
         pragma Loop_Invariant(for all K in result'Range =>
                                 Contains(vowels, result(K)) = True);
         pragma Loop_Invariant(for all K in Given_string'First .. J =>
                                  (if (for some L in vowels'Range =>
                                        vowels(L) = Given_string(K))
                                  then
                                     (for some M in result'Range =>
                                          result(M) = Given_string(K))));
      end loop;

      if result'Length = 0 then
         return "";
      end if;

      if Contains(vowels, result(result'Last)) then
         return result;
      else
         return result(result'First .. result_index - 1);
      end if;
   end Extract_Vowels;



   function Extract_Consonants (Given_string : in String) return String is
      result : String (Given_string'First .. Given_string'Last) := (others => Character'Val(0));
      result_index : Positive := Given_string'First;
   begin
      for J in Given_string'Range loop

         if Contains(consonants, Given_String(J)) then
            result(result_index) := Given_string(J);
            result_index := result_index + 1;
         end if;

         pragma Loop_Invariant(result_index <= result'Last + 1);
         pragma Loop_Invariant(for all K in result'Range =>
                                 Contains(consonants, result(K)));
         pragma Loop_Invariant(for all K in Given_string'First .. J =>
                                  (if (for some L in consonants'Range =>
                                        consonants(L) = Given_string(K))
                                  then
                                     (for some M in result'Range =>
                                          result(M) = Given_string(K))));
      end loop;

      if result'Length = 0 then
         return "";
      end if;

      if Contains(consonants, result(result'Last)) then
         return result;
      else
         return result(result'First .. result_index - 1);
      end if;
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









