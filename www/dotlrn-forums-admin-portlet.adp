<%

    #
    #  Copyright (C) 2001, 2002 MIT
    #
    #  This file is part of dotLRN.
    #
    #  dotLRN is free software; you can redistribute it and/or modify it under the
    #  terms of the GNU General Public License as published by the Free Software
    #  Foundation; either version 2 of the License, or (at your option) any later
    #  version.
    #
    #  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
    #  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
    #  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
    #  details.
    #

%>

<ul>
<li><a href="@url@">#dotlrn-forums.All_forums#</a> (<a href="@url@admin/">#dotlrn-forums.administer#</a>)</li>
<multiple name="forums">
  <li>
    <a href="@url@admin/forum-edit?forum_id=@forums.forum_id@">@forums.name@</a>
    <if @forums.enabled_p@ false><b>(disabled)</b></if>
    <br>
    #dotlrn-forums.Auto_subscribe_label#:
    <if @forums.autosubscribe_p@ true>
      <b>#acs-kernel.common_yes#</b> | <a href="@dotlrn_url@/unsubscribe-members?@forums.query_vars@">#acs-kernel.common_no#</a>
    </if>
    <else>
      <a href="@dotlrn_url@/subscribe-members?@forums.query_vars@">#acs-kernel.common_yes#</a> | <b>#acs-kernel.common_no#</b>
    </else>
  </li>
</multiple>
</ul>
<ul>
  <li>
    <a href="@url@admin/forum-new?name=@encoded_default_name@">#dotlrn-forums.New_Forum#</a>
  </li>
</ul>
