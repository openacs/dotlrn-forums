<?xml version="1.0"?>

<queryset>

<fullquery name="select_user_package_id_list">
<querytext>
select dotlrn_community_applets.package_id,
dotlrn_communities.pretty_name as community_pretty_name
from 
dotlrn_member_rels_full, dotlrn_community_applets, dotlrn_communities
where
dotlrn_community_applets.community_id = dotlrn_member_rels_full.community_id
and dotlrn_communities.community_id= dotlrn_community_applets.community_id
and applet_id= (select applet_id from dotlrn_applets
               where applet_key= :applet_key)
and user_id= :package_user_id
</querytext>
</fullquery>

</queryset>
