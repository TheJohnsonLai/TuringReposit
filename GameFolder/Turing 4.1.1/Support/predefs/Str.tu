/*
 ** Str module - string routines
 **
 ** NB:  DO NOT IMPORT OR INCLUDE THIS FILE INTO YOUR PROGRAM.
 **      IT WILL BE IMPLICITLY IMPORTED.
 */

unit
module Str
    export ~.*index, ~.*length, ~.*repeat, Lower, Upper, Trim

    %
    % Find the position of the given pattern in the given string.
    % The result is zero if the pattern does not exist in the string.
    %
    external "string_index" function index (s, patt : string) : int

    %
    % Determine the length of the given string.
    %
    external "string_length" function length (s : string) : int

    %
    % Return the given number of copies of the given string concatenated together.
    %
    external "string_repeat" function repeat (s : string, i : int) : string

    %
    % Return a string with all upper case letters made lower case
    %
    function Lower (s : string) : string
	var res : string := ""
	for i : 1 .. length (s)
	    if "A" <= s (i) and s (i) <= "Z" then
		res := res + chr (ord (s (i)) + ord ("a") - ord ("A"))
	    else
		res := res + s (i)
	    end if
	end for
	result res
    end Lower

    %
    % Return a string with all lower case letters made upper case
    %
    function Upper (s : string) : string
	var res : string := ""
	for i : 1 .. length (s)
	    if "a" <= s (i) and s (i) <= "z" then
		res := res + chr (ord (s (i)) + ord ("A") - ord ("a"))
	    else
		res := res + s (i)
	    end if
	end for
	result res
    end Upper

    %
    % Return a string with all the space before and after removed
    %
    function Trim (s : string) : string
	var len : int := length (s)
	var start : int := 1
	var finish : int := len
	loop
	    exit when start > len
	    exit when s (start) not= " " and s (start) not= "\t" and
		s (start) not= "\n"
	    start += 1
	end loop
	if start > len then
	    result ""
	end if
	loop
	    exit when finish < 1
	    exit when s (finish) not= " " and s (finish) not= "\t" and
		s (finish) not= "\n"
	    finish -= 1
	end loop
	result s (start .. finish)
    end Trim
end Str

