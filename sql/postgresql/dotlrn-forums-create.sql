--
--  Copyright (C) 2001, 2002 MIT
--
--  This file is part of dotLRN.
--
--  dotLRN is free software; you can redistribute it and/or modify it under the
--  terms of the GNU General Public License as published by the Free Software
--  Foundation; either version 2 of the License, or (at your option) any later
--  version.
--
--  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
--  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
--  details.
--

--
-- The forums applet for dotLRN
--
-- @author Ben Adida (ben@openforce.net)
-- @creation-date 2002-05-29
-- @version $Id$
--
-- ported to postgres by mohan pakkurti (mohan@pakkurti.com)
-- 2002-07-12
--

create function inline_0()
returns integer as '
declare
    foo                             integer;
begin

    foo := acs_sc_impl__new (
        ''dotlrn_applet'',
        ''dotlrn_forums'',
        ''dotlrn_forums''
    );

    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_forums'',
        ''GetPrettyName'',
        ''dotlrn_forums::get_pretty_name'',
        ''TCL''
    );

    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_forums'',
        ''AddApplet'',
        ''dotlrn_forums::add_applet'',
        ''TCL''
    );

    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_forums'',
        ''RemoveApplet'',
        ''dotlrn_forums::remove_applet'',
        ''TCL''
    );

    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_forums'',
        ''AddAppletToCommunity'',
        ''dotlrn_forums::add_applet_to_community'',
        ''TCL''
    );

    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_forums'',
        ''RemoveAppletFromCommunity'',
        ''dotlrn_forums::remove_applet_from_community'',
        ''TCL''
    );

    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_forums'',
        ''AddUser'',
        ''dotlrn_forums::add_user'',
        ''TCL''
    );

    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_forums'',
        ''RemoveUser'',
        ''dotlrn_forums::remove_user'',
        ''TCL''
    );

    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_forums'',
        ''AddUserToCommunity'',
        ''dotlrn_forums::add_user_to_community'',
        ''TCL''
    );

    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_forums'',
        ''RemoveUserFromCommunity'',
        ''dotlrn_forums::remove_user_from_community'',
        ''TCL''
    );

    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_forums'',
        ''AddPortlet'',
        ''dotlrn_forums::add_portlet'',
        ''TCL''
    );

    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_forums'',
        ''RemovePortlet'',
        ''dotlrn_forums::remove_portlet'',
        ''TCL''
    );

    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_forums'',
        ''Clone'',
        ''dotlrn_forums::clone'',
        ''TCL''
    );

    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_forums'',
        ''ChangeEventHandler'',
        ''dotlrn_forums::change_event_handler'',
        ''TCL''
    );

    perform acs_sc_binding__new (
        ''dotlrn_applet'',
        ''dotlrn_forums''
    );

    return 0;

end;' language 'plpgsql';

select inline_0();
drop function inline_0();