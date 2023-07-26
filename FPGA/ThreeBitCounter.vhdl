library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ThreeBitCounter is
    port (
        Clk        : in  std_logic;
        m1, m0     : in  std_logic;
        q2, q1, q0 : out std_logic
    );
end ThreeBitCounter;

architecture Behavioral of ThreeBitCounter is
    signal cnt : unsigned(2 downto 0) := "000";
    signal mode : std_logic_vector(1 downto 0);
begin
    -- Sammanfoga m1 och m0 signalerna till en 2-bitars logic vector signal
    mode <= m1 & m0;
    process(Clk)
    begin
        -- Vänta på klocksignal
        if rising_edge(Clk) then
            -- Beroende på läge i ingångarna m1 och m0
            case mode is
                -- m1m0 = 00 / aktuella tillståndet
                when "00" =>
                    q2 <= cnt(2);
                    q1 <= cnt(1);
                    q0 <= cnt(0);

                -- m1m0 = 01 / binär uppräkning
                when "01" =>
                    cnt <= cnt + 1;
                    q2 <= cnt(2);
                    q1 <= cnt(1);
                    q0 <= cnt(0);

                -- m1m0 = 10 / binär nedräkning
                when "10" =>
                    cnt <= cnt - 1;
                    q2 <= cnt(2);
                    q1 <= cnt(1);
                    q0 <= cnt(0);

                -- m1m0 = 11 / räkna med 2
                when "11" =>
                    cnt <= cnt + 2;
                    q2 <= cnt(2);
                    q1 <= cnt(1);
                    q0 <= cnt(0);

                -- Andra värden not expected, gör ingenting
                when others =>
                    null;
            end case;
        end if;
    end process;
end Behavioral;
