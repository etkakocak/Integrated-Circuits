library ieee;
use ieee.std_logic_1164.all;

entity lock is
    port(
        Clk, R     : in  std_logic;
        X3, X2, X1 : in  std_logic;
        L, O       : out std_logic
    );
end lock;

architecture Behavioral of lock is
    type state_type is (S0, S1, S1_f, S2, S2_f, S3);  -- Deklarera situationer
    signal internal_state : state_type := S0; -- Börja med första situation S0
    signal internal_O : std_logic := '0'; -- Lysdioderna är 0 från början
    signal internal_L : std_logic := '0';

begin
    process(Clk)
    begin
        if rising_edge(Clk) then
            if R = '1' then  -- Reset är hög för att återvända till första situation S0
                internal_state <= S0;
                internal_O <= '0';
                internal_L <= '0';
            else
                case internal_state is
                    when S0 =>
                        if X3 = '1' and X2 = '0' and X1 = '0' then
                            internal_state <= S1; -- Fortsätt till rätt situation S1 om första inmätning är rätt
                        else
                            internal_state <= S1_f; -- Fortsätt till fel situation S1_f om första inmätning är fel
                        end if;
                    when S1 =>
                        if X3 = '0' and X2 = '1' and X1 = '0' then
                            internal_state <= S2; -- Samma sak
                        else
                            internal_state <= S2_f;
                        end if;
                    when S2 =>
                        if X3 = '0' and X2 = '0' and X1 = '1' then -- Låst om tredje inmätning är fel
                            internal_state <= S3; 
                            internal_O <= '1';
                        else
                            internal_L <= '1'; -- Oavsett om första två var rätt
                        end if;

                    when S1_f => -- Felaktiga situationer
                        if X3 = '0' then
                            internal_state <= S2_f;
                        else
                            internal_state <= S2_f;
                        end if;
                    when S2_f =>
                        if X3 = '0' then
                            internal_L <= '1';
                            internal_state <= S2_f;
                        else
                            internal_L <= '1';
                            internal_state <= S2_f;
                        end if;

                    when others => -- Skydd mot cracking, lås om det händer oförväntade inmätningar
                        internal_O <= '0';
                        internal_L <= '1';
                end case;
            end if;
        end if;
    end process;

    O <= internal_O;
    L <= internal_L;

end Behavioral;
