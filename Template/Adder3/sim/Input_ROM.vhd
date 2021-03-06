----------------------------------------------------------------------------------
--! 
--! @file      Input_ROM.vhd
--!
--! @brief     Inpput ROM for testbench
--! @details  
--!
--!         ROM containing data to stimulate input ports of \ref FullAdd
--!         during testing.    
--!
--! @author    Guilherme Shimabuko 
--! 
--!
--! @version 1.1
--! @date 2020-04-07
--!
--!     Version History
--!
--!     Version     Date            Author              Changes
--!         
--!     1.1         2020-04-07      GSHIMABUKO          Added Doxygen coding
--!                                                     Style.
--!
--!     1.0         2020-03-18      GSHIMABUKO          Block Created
--! 
--! @pre       
--! @copyright  Copyright (c) 2020 Shima's Digital Hardware
--!
--!     Redistribution and use in source and binary forms, with or without
--!     modification, are permitted provided that the following conditions
--!     are met:
--!     
--!     * Redistributions of source code must retain the above copyright
--!       notice, this list of conditions and the following disclaimer.
--!
--!     * Redistributions in binary form must reproduce the above copyright
--!       notice, this list of conditions and the following disclaimer in the
--!       documentation and/or other materials provided with the distribution.
--!
--!     * Neither the name of Shima's DIgital Hardware  nor the names of its
--!       contributors may be used to endorse or promote products
--!       derived from this software without specific prior written permission.
--!
--!     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
--!     IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
--!     TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTI-
--!     CULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL SHIMA'S DIGITAL HARDWARE
--!     BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
--!     CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
--!     SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
--!     INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
--!     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
--!     ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF 
--!     THE POSSIBILITY OF SUCH DAMAGE.
--!
----------------------------------------------------------------------------------

-- Libraries ---------------------------------------------------------------------

library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;
-- Entity ------------------------------------------------------------------------
--! @brief     Input ROM for testbench
--! @details  
--!
--!         ROM containing data to stimulate input ports of \ref FullAdd
--!         during testing.    
----------------------------------------------------------------------------------
entity Input_ROM is
    port (
            -- Inputs ------------------------------------------------------------
            --! Input signal indicating  memory address to look for
            address_in : in integer range 7 downto 0;

            -- Outputs -----------------------------------------------------------
            --! Outputs stimulus for DUT "A Input port"
            A_out :  out std_logic;

            --! Outputs stimulus for DUT "B Input Port"
            B_out :  out std_logic;

            --! Outputs stimulus for DUT "Cin Input Port"
            C_out :  out std_logic
    );
end Input_ROM;
-- Architecture ------------------------------------------------------------------
--! @brief Output ROM
--! @details
--!
--!         Uses rom_array type to initialize LUT with stimulus values for DUT 
--!         inputs
--!
--!         A_out outputs data with column index 0 with stimulus for DUT input A
--!
--!         B_out outputs data with column index 1 with stimulus for DUT input B
--!
--!         C_out outputs data with column index 2 with stimulus for DUT input Cin
----------------------------------------------------------------------------------
architecture Behavioral of Input_ROM is
type rom_array is array (7 downto 0) of std_logic_vector (2 downto 0);
constant rom: rom_array := ("000",
                            "001",
                            "010",
                            "011",
                            "100",
                            "101",
                            "110",
                            "111");
begin

	A_out <= rom(address_in)(0);
    B_out <= rom(address_in)(1);
    C_out <= rom(address_in)(2);

end Behavioral;
