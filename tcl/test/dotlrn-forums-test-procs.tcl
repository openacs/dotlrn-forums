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

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
