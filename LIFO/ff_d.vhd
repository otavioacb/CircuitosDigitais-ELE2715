--
-- Copyright (C) 2023 Samaherni M. D.
-- Laboratory of Automation, Control and Instrumentation (LACI)
-- Federal University of Rio Grande do Norte (UFRN)
-- 
-- This file is part of ELE2715 project (https://github.com/sama-md/ELE2715/). 
-- It is subject to the license terms in the LICENSE file found in the top-level 
-- directory of this distribution. 
--
-- Licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 
-- 4.0 International License;
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--  (EN)  https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode
--  (PT)  https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode.pt
--
-- Unless otherwise separately undertaken by the Licensor, to the extent possible, 
-- the Licensor offers the Licensed Material "as-is" and "as-available", and makes
-- no representations or warranties of any kind concerning the Licensed Material, 
-- whether express, implied, statutory, or other.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ffd IS
   PORT(
		ck, clr, set, en, d : IN  std_logic;
	   q : OUT std_logic
	);
END ffd;

ARCHITECTURE logica OF ffd IS

BEGIN
   PROCESS(ck, clr, set)
   BEGIN
      IF    (set = '0')            THEN q <= '1';
      ELSIF (clr = '0')            THEN q <= '0';
      ELSIF (ck'EVENT AND ck ='1' AND en = '1') THEN q <= d;   
      END IF;   
   END PROCESS;   
END logica;