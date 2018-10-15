package body StringExtraction with SPARK_Mode => On is



   function Extract_Vowels (Given_string : in String) return String is
      result : String (1 .. Given_string'Length) := (others => Character'Val(0));
      result_index : Natural := 0;
   begin
      for J in Given_string'Range loop

         if Contains(vowels, Given_String(J)) = True then
            if result_index < result'Last then
               result_index := result_index + 1;
               result(result_index) := Given_String(J);

            end if;

         end if;

         pragma Loop_Invariant(result_index in 0 .. result'Last);
         pragma Loop_Invariant(result_index <= J);
         pragma Loop_Invariant(for all K in result'First .. result_index =>
                                 Contains(vowels, result(K)) = True);
         pragma Loop_Invariant(for all K in Given_string'First .. J =>
                                 (if Contains(vowels, Given_string(K)) = True then
                                     (Contains(result, Given_string(K)) = True)));

      end loop;

      return result(result'First .. result_index);

   end Extract_Vowels;



   function Extract_Consonants (Given_string : in String) return String is
      result : String (1 .. Given_string'Length) := (others => Character'Val(0));
      result_index : Natural := 0;
   begin
      for J in Given_string'Range loop

         if Contains(consonants, Given_String(J)) then
            if result_index < result'Last then
               result_index := result_index + 1;
               result(result_index) := Given_String(J);
            end if;

         end if;

         pragma Loop_Invariant(result_index in 0 .. result'Last);
         pragma Loop_Invariant(result_index <= J);
         pragma Loop_Invariant(for all K in result'First .. result_index =>
                      Contains(consonants, result(K)) = True);
      end loop;

      return result(result'First .. result_index);

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









