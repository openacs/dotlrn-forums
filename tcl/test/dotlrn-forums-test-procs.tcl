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
    } -cats {
        api
        production_safe
    } dotlrn_forums_portlet_links {
        Test diverse link procs.
} {
    aa_equals "dotlrn-forums admin portlet link" "[dotlrn_forums_admin_portlet::link]" ""
}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
