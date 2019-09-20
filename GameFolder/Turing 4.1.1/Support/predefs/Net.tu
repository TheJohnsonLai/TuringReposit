/*
 * Net module - Internet related routines
 *
 * NB:  DO NOT IMPORT OR INCLUDE THIS FILE INTO YOUR PROGRAM.
 *      IT WILL BE IMPLICITLY IMPORTED.
 */

unit
module pervasive Net
    export all

    % ------------------
    % Exported constants
    % ------------------

    const ipport_ftp := 21
    const ipport_telnet := 23
    const ipport_smtp := 25
    const ipport_time := 37
    const ipport_finger := 79
    const ipport_http := 80
    const ipport_pop3 := 110
    const ipport_ident := 113
    const ipport_nntp := 119
    const ipport_ntp := 123

    const ipport_exec := 512
    const ipport_login := 513
    const ipport_printer := 514
    const ipport_ntalk := 518
    const ipport_uucp := 540

    const ipport_user := 1024


    % -----------------
    % Exported routines
    % -----------------

    % Make connection with remote port, returing I/O descriptor

    function OpenConnection (netAddr : string, port : int) : int
	external procedure net_registeropen (netId : int)

	var netId : int

	open : netId, "%net(C:" + intstr (port) + ":" + netAddr + ")", put, get

	if netId > 0 then
	    net_registeropen (netId)
	end if

	result netId
    end OpenConnection

    % Wait for connection on a particular port, returning I/O descriptor
    % and connector's IP address (as known to communications layer).
    %
    % Note, ports less < ipport_user may not be available to user
    % processes on some systems.

    function WaitForConnection (port : int, var netAddr : string) : int
	external procedure net_registeropen (netId : int)
	external procedure net_waitforconnect (netId : int)
	external procedure net_getaddr (netId : int, var addr : string)

	var netId : int

	open : netId, "%net(A:" + intstr (port) + ")", put, get

	if netId > 0 then
	    net_registeropen (netId)
	    net_waitforconnect (netId)
	    net_getaddr (netId, netAddr)
	end if

	result netId
    end WaitForConnection


    function OpenURLConnection (urlAddr : string) : int
	external procedure net_registeropen (netId : int)

	var netId : int

	open : netId, "%net(U:" + urlAddr + ")", get

	if netId > 0 then
	    net_registeropen (netId)
	end if

	result netId
    end OpenURLConnection

    % Common close routine for:
    %           OpenConnection, WaitForConnection, OpenURLConnection

    procedure CloseConnection (netId : int)
	external procedure net_registerclose (netId : int)

	close : netId
	net_registerclose (netId)
    end CloseConnection


    % Availability tests on input stream of Net connections

    function BytesAvailable (netId : int) : int
	const na_bytes := 0

	external function net_avail (netId : int, ty : int) : int

	result net_avail (netId, na_bytes)
    end BytesAvailable

    function CharAvailable (netId : int) : boolean
	const na_bytes := 0

	external function net_avail (netId : int, ty : int) : int

	result (net_avail (netId, na_bytes) > 0)
    end CharAvailable

    function LineAvailable (netId : int) : boolean
	const na_line := 1

	external function net_avail (netId : int, ty : int) : int

	result (net_avail (netId, na_line) > 0)

    end LineAvailable

    function TokenAvailable (netId : int) : boolean
	const na_token := 2

	external function net_avail (netId : int, ty : int) : int

	result (net_avail (netId, na_token) > 0)
    end TokenAvailable

    % Name and address routines

    external "net_getlocaladdr" function LocalAddress : string
    external "net_getlocalname" function LocalName : string
    external "net_gethostaddr"
	function HostAddressFromName (name : string) : string
    external "net_gethostname"
	function HostNameFromAddress (nad : string) : string
end Net
