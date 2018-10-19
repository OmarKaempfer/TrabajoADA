package body StringExtraction with SPARK_Mode => On is

   function Intersection_str (First_string, Second_string : in String) return String is
      result : String := First_string;
   begin
      for J in result'Range loop

         if First_string(J) /= Second_string(J) then
            result(J) := Character'Val(0);
         end if;

         pragma Loop_Invariant(for all K in result'First .. J =>
                          (if First_string(K) = Second_string(K) then
                              result(K) = First_string(K)
                           else
                              result(K) = Character'Val(0)));
      end loop;

      return result;
   end Intersection_str;

   function Extract_Vowels (Given_string : in String) return String is
      result : String (Given_string'First .. Given_string'Last) := (others => Character'Val(0));
      result_index : Positive := result'First;

      previous_index : Positive := result_index;
      match_found : Boolean with Ghost;
   begin
      if Given_string'Length = 0 then
         return "";
      end if;


      for J in Given_string'Range loop

         if Is_Contained(Given_String(J), vowels) then
            result(result_index) := Given_string(J);


            match_found := True;
            previous_index := result_index;

            if result_index < result'Last then
               result_index := result_index + 1;
            end if;
         else
            match_found := False;
         end if;

         pragma Loop_Invariant(result_index in result'Range);
         pragma Loop_Invariant(previous_index in result'Range);
         pragma Loop_Invariant(result_index <= J + 1);
         pragma Loop_Invariant(previous_index <= result_index);
         pragma Loop_Invariant(previous_index <= J);

         pragma Loop_Invariant(if Is_Contained(Given_String(J), vowels) then
                                  match_found);
         pragma Loop_Invariant(if match_found then
                                  result(previous_index) = Given_string(J));
         pragma Loop_Invariant(if match_found then
                                  Is_Contained(result(previous_index), vowels));
         pragma Loop_Invariant(if match_found then
                                  Is_Contained(Given_String(J), result));
         pragma Loop_Invariant(if not match_found then
                                  not Is_Contained(Given_string(J), result));

         pragma Loop_Invariant(for all K in result'Range =>
                                  (if result(K) /= Character'Val(0) then
                                        Is_Contained(result(K), Given_string)));
         pragma Loop_Invariant(for all K in result'Range =>
                                 (if result(K) /= Character'Val(0) then
                                       Is_Contained(result(K), vowels)));
         pragma Loop_Invariant(for all K in result'Range =>
                                 (if not Is_Contained(result(K), vowels) then
                                     result(K) = Character'Val(0)));
         pragma Loop_Invariant(for all K in result'First .. result_index - 1 =>
                                 Is_Contained(result(K), vowels));
         pragma Loop_Invariant(for all K in result'First .. result_index - 1 =>
                                 Is_Contained(result(K), Given_string));
         pragma Loop_Invariant(for all K in Given_string'First .. J =>
                                  (if Is_Contained(Given_String(K), vowels) then
                                  Is_Contained(Given_String(K), result)));
      end loop;

      if not Is_Contained(result(previous_index), vowels) then
         return "";
      end if;


      return result(result'First .. previous_index);

   end Extract_Vowels;



   function Extract_Consonants (Given_string : in String) return String is
      result : String (Given_string'First .. Given_string'Last) := (others => Character'Val(0));
      result_index : Positive := result'First;

      previous_index : Positive := result_index;
      match_found : Boolean with Ghost;
   begin
      if Given_string'Length = 0 then
         return "";
      end if;


      for J in Given_string'Range loop

         if Is_Contained(Given_String(J), consonants) then
            result(result_index) := Given_string(J);


            match_found := True;
            previous_index := result_index;

            if result_index < result'Last then
               result_index := result_index + 1;
            end if;
         else
            match_found := False;
         end if;

         pragma Loop_Invariant(result_index in result'Range);
         pragma Loop_Invariant(previous_index in result'Range);
         pragma Loop_Invariant(result_index <= J + 1);
         pragma Loop_Invariant(previous_index <= result_index);
         pragma Loop_Invariant(previous_index <= J);

         pragma Loop_Invariant(if Is_Contained(Given_String(J), consonants) then
                                  match_found);
         pragma Loop_Invariant(if match_found then
                                  result(previous_index) = Given_string(J));
         pragma Loop_Invariant(if match_found then
                                  Is_Contained(result(previous_index), consonants));
         pragma Loop_Invariant(if match_found then
                                  Is_Contained(Given_String(J), result));
         pragma Loop_Invariant(if not match_found then
                                  not Is_Contained(Given_string(J), result));

         pragma Loop_Invariant(for all K in result'Range =>
                                  (if result(K) /= Character'Val(0) then
                                        Is_Contained(result(K), Given_string)));
         pragma Loop_Invariant(for all K in result'Range =>
                                 (if result(K) /= Character'Val(0) then
                                       Is_Contained(result(K), consonants)));
         pragma Loop_Invariant(for all K in result'Range =>
                                 (if not Is_Contained(result(K), consonants) then
                                     result(K) = Character'Val(0)));
         pragma Loop_Invariant(for all K in result'First .. result_index - 1 =>
                                 Is_Contained(result(K), consonants));
         pragma Loop_Invariant(for all K in result'First .. result_index - 1 =>
                                 Is_Contained(result(K), Given_string));
         pragma Loop_Invariant(for all K in Given_string'First .. J =>
                                  (if Is_Contained(Given_String(K), consonants) then
                                  Is_Contained(Given_String(K), result)));
      end loop;

      if not Is_Contained(result(previous_index), consonants) then
         return "";
      end if;

      return result(result'First .. previous_index);

   end Extract_Consonants;

end StringExtraction;

