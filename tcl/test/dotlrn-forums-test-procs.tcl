ad_library {

        Automated tests for the dotlrn-forums package.

        @author Héctor Romojaro <hector.romojaro@gmail.com>
        @creation-date 2019-09-10

}

aa_register_case \
    -cats {api smoke production_safe} \
    -procs {
        dotlrn_forums::package_key
        dotlrn_forums::my_package_key
        dotlrn_forums::applet_key
    } \
    dotlrn_forums__keys {

        Simple test for the various dotlrn_forums::..._key procs.

        @author Héctor Romojaro <hector.romojaro@gmail.com>
        @creation-date 2019-09-10
} {
    aa_equals "Package key" "[dotlrn_forums::package_key]" "forums"
    aa_equals "My Package key" "[dotlrn_forums::my_package_key]" "dotlrn-forums"
    aa_equals "Applet key" "[dotlrn_forums::applet_key]" "dotlrn_forums"
}

aa_register_case -procs {
        dotlrn_forums_admin_portlet::link
        dotlrn_forums::get_pretty_name
        dotlrn_forums_admin_portlet::get_pretty_name
    } -cats {
        api
        production_safe
    } dotlrn_forums_portlet_links_names {
        Test diverse link and name procs.
} {
    aa_equals "dotlrn-forums admin portlet link"        "[dotlrn_forums_admin_portlet::link]" ""
    aa_equals "dotlrn-forums admin portlet pretty name" "[dotlrn_forums_admin_portlet::get_pretty_name]" "#forums-portlet.admin_pretty_name#"
    aa_equals "dotlrn-forums pretty name"               "[dotlrn_forums::get_pretty_name]" "#forums.pretty_name#"
}

aa_register_case -procs {
        dotlrn_forums::add_applet
        dotlrn_forums::add_portlet
        dotlrn_forums::add_portlet_helper
        dotlrn_forums::remove_portlet
        dotlrn_forums::remove_applet
        portal::exists_p
    } -cats {
        api
    } dotlrn_forums__applet_portlet {
        Test add/remove applet/portlet procs.
} {
    #
    # Helper proc to check portal elements
    #
    proc portal_elements {portal_id} {
        return [db_string elements {
            select count(1)
            from portal_element_map pem,
                 portal_pages pp
           where pp.portal_id = :portal_id
             and pp.page_id = pem.page_id
        }]
    }
    #
    # Start the tests
    #
    aa_run_with_teardown -rollback -test_code {
        #
        # Create test user
        #
        # As this is running in a transaction, it should be cleaned up
        # automatically.
        #
        set portal_user_id [db_nextval acs_object_id_seq]
        set user_info [acs::test::user::create -user_id $portal_user_id]
        #
        # Create portal
        #
        set portal_id [portal::create $portal_user_id]
        if {[portal::exists_p $portal_id]} {
            aa_log "Portal created (portal_id: $portal_id)"
            set applet_key [dotlrn_forums::applet_key]
            #
            #
            if {[dotlrn_applet::get_applet_id_from_key -applet_key $applet_key] ne ""} {
                #
                # Remove the applet in advance, if it already exists
                #
                dotlrn_forums::remove_applet
                aa_true "Removed existing applet" "[expr {[dotlrn_applet::get_applet_id_from_key -applet_key $applet_key] eq ""}]"
            }
            #
            # Add applet
            #
            dotlrn_forums::add_applet
            aa_true "Add applet" "[expr {[dotlrn_applet::get_applet_id_from_key -applet_key $applet_key] ne ""}]"
            #
            # Add portlet to portal
            #
            # Set portal type first, as it is checked by 'add_portlet'
            #
            dotlrn::set_type_portal_id -type foo -portal_id $portal_id
            dotlrn_forums::add_portlet $portal_id
            aa_equals "Number of portal elements after addition" "[portal_elements $portal_id]" "1"
            #
            # Remove portlet from portal
            #
            set args [ns_set create]
            ns_set put $args package_id 0
            dotlrn_forums::remove_portlet $portal_id $args
            aa_equals "Number of portal elements after removal" "[portal_elements $portal_id]" "0"
            #
            # Add portlet to portal using directly the helper
            #
            dotlrn_forums::add_portlet_helper $portal_id $args
            aa_equals "Number of portal elements after addition" "[portal_elements $portal_id]" "1"
            #
            # Remove applet
            #
            dotlrn_forums::remove_applet
            aa_equals "Remove applet" "[dotlrn_applet::get_applet_id_from_key -applet_key $applet_key]" ""
        } else {
            aa_error "Portal creation failed"
        }
    }
}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
