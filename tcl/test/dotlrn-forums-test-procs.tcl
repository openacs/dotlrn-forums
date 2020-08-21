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

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
