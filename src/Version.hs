{- PP

Copyright (C) 2015, 2016, 2017, 2018 Christophe Delord

https://www.cdsoft.fr/pp

This file is part of PP.

PP is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

PP is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with PP.  If not, see <http://www.gnu.org/licenses/>.
-}

module Version(copyright, help) where

import Data.List
import Data.Version
import System.Info

import qualified Tag

name :: String
name = "pp"

author :: String
author = "Christophe Delord"

dates :: [Int]
dates = [2015, 2016, 2017, 2018]

url :: String
url = "https://cdsoft.fr/" ++ name

copyright :: String
copyright = unlines [
        name ++ " " ++ Tag.describe ++ " (" ++ os ++ " " ++ arch ++ ", " ++ compilerName ++ " " ++ showVersion compilerVersion ++ ")",
        "Generic text Preprocessor (designed for Pandoc)",
        "",
        "Copyright (C) " ++ intercalate ", " (map show dates) ++ " " ++ author ++ ".",
        "This is free software; see the source for copying conditions.  There is NO",
        "warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.",
        "",
        "See " ++ url ++ " for further information."
    ]

help :: String
help = unlines [
        "Usage: " ++ name ++ " [options] [files]",
        "Options:",
        "  -v                   Display the current version",
        "  -h                   Display this help message",
        "  -help                Display a longer help",
        "  -userhelp            Display a longer user macro help",
        "  -import=<file>       Import definitions from a file",
        "  -D<name>[=<value>]   Define a variable",
        "  -U<name>             Undefine a variable",
        "  -img=<prefix>        Define the prefix to add to output image path",
        "  -M=<target>          Generate make-like dependency list",
        "  -<macro>[=<arg>]     Call a builtin macro with an optional argument",
        "                       ("++name++" -help for the full macro list)",
        "                       Some macros may prevent pp from reading stdin",
        "                       when no file is given on the command line.",
        "Files:",
        "  filename             Preprocess an existing file",
        "  -                    Preprocess stdin",
        "",
        "If no input file is specified, " ++ name ++ " preprocesses stdin.",
        "",
        "More information here: " ++ url
    ]
