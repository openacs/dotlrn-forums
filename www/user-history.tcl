ad_page_contract {
    
    Posting History for a User across communities

    @author Ben Adida (ben@openforce)
    @creation-date 2002-05-29
    @version $Id$

} {
    user_id:integer,notnull
    {view "date"}
}

# The biggest issue here is finding all the package IDs
# that are to be looked at for user history
set package_user_id $user_id
set applet_key [dotlrn_forums::applet_key]

# Load up packages and community names
set user_package_id_list [list]
db_foreach select_user_package_id_list {} {
    lappend user_package_id_list $package_id
    set community_names($package_id) $community_pretty_name
}

if {[dotlrn::admin_p]} {
    # If an admin, that's the package ID list
    set package_id_list $user_package_id_list
} else {
    # If not an admin, we find the communities that the browsing
    # user is a member of
    set package_user_id [ad_conn user_id]

    set browser_package_id_list [list]
    db_foreach select_user_package_id_list {} {
        lappend browser_package_id_list $package_id
    }

    # We merge the lists
    set package_id_list [list]
    foreach pack_id $user_package_id_list {
        if {[lsearch -exact $browser_package_id_list $pack_id] > -1} {
            lappend package_id_list $pack_id
        }
    }
}

set package_id_list_sql "([join $package_id_list ","])"

# choosing the view
set dimensional_list {
    {
        view "View:" date {
            {date "by Date" { order by date desc } }
            {forum "by Forum" { order by forums_forums.name, date desc } }
        }
    }
}

set sql_order_by [ad_dimensional_sql $dimensional_list]

# Select the postings
db_multirow messages select_messages {}

# Get user information
oacs::user::get -user_id $user_id -array user

set dimensional_chunk [ad_dimensional $dimensional_list]
set context_bar {{Posting History}}
ad_return_template
