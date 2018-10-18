package body StringExtraction with SPARK_Mode => On is



   function Extract_Vowels (Given_string : in String) return String is
      result : String (Given_string'First .. Given_string'Last) := (others => Character'Val(0));
      result_index : Positive := Given_string'First;
      vowels : Constant String :="AEIOUaeiouÁÉÍÓÚáéíóúÜü";
   begin
      for J in Given_string'Range loop

         if Is_Contained(Given_String(J), vowels) then
            result(result_index) := Given_string(J);

            if result_index < result'Last then
               result_index := result_index + 1;
            end if;
         end if;

         pragma Loop_Invariant(result_index in result'First .. result'Last + 1);
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
      consonants : Constant String := "QWRTYPSDFGHJKLZXCVBNMqwrtypsdfghjklzxcvbnñm";
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

   --function Number_Of_Matches_Rec(Given_String: in String; char: in Character) return Natural is
   --begin
     -- if Given_String'Length = 0 then
       --  return 0;
      --elsif Given_String(Given_String'Last) = char then
        -- return Number_Of_Matches_Rec(Remove_Last()
      --end if;

   --end Number_Of_Matches_Rec;

end StringExtraction;

