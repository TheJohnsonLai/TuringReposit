/*
 * Error module - Predefined error management routines
 *                See the unit Errno for error constant definitions
 *
 * NB:  DO NOT IMPORT OR INCLUDE THIS FILE INTO YOUR PROGRAM.
 *      IT WILL BE IMPLICITLY IMPORTED.
 */

unit
module pervasive Error
    export Halt, Last, LastMsg, LastStr, Msg, Str % , Trip, TripMsg

    %
    %  Cause the execution to halt with the specified error message.
    %
    external "error_halt" procedure Halt (errmsg : string)

    %
    % Return the last error value for the running process
    %
    external "error_last" function Last : int

    %
    % Return a string representation of the last error value
    % for the running process.
    %
    external "error_laststr" function LastStr : string

    %
    % Return a string representation of the passed error value
    %
    external "error_str" function Str (errno : int) : string

    %
    % Return the defined error message associated with the last error value
    % for the running process.
    %
    external "error_lastmsg" function LastMsg : string

    %
    %  Return the defined error message associated with the passed error value
    %
    external "error_msg" function Msg (errno : int) : string

    %
    % Sets the error condition (for Error.Last), but does not 
    % halt the program.
    %
    % external "error_trip" procedure Trip (errno : int)
    
    %
    % Sets the error condition (for Error.Last), but does not 
    % halt the program.
    %
    % external "error_tripmsg" procedure TripMsg (errno : int, errmsg : string)
end Error
