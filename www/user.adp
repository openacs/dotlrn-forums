<master>
<property name="title">Forums: Posting history for @user.full_name@</property>
<property name="context_bar">@context_bar@</property>

<p>
  Posting history for
  <b>
    <%
        if {![permission::permission_p -object_id [acs_magic_object security_context_root] -privilege admin]} {
            adp_puts [acs_community_member_link -user_id $user(user_id)]
        } else {
            adp_puts [acs_community_member_admin_link -user_id $user(user_id)]
        }
    %>
  </b>
</p>

<p>
<center>
@dimensional_chunk@
</center>
</p>

<center>

<if @view@ eq "date">

  <table bgcolor="#cccccc" width="95%">

    <tr>
      <th align="left" width="30%">Forum</th>
      <th align="left">Subject</th>
      <th align="center" width="20%">Posted</th>
    </tr>

<if @messages:rowcount@ gt 0>
<multiple name="messages">

  <if @messages.rownum@ odd>
    <tr bgcolor="#eeeeee">
  </if>
  <else>
    <tr bgcolor="#d9e4f9">
  </else>

      <td><a href="@messages.url@forum-view?forum_id=@messages.forum_id@">@messages.forum_name@</a></td>
      <td><a href="@messages.url@message-view?message_id=@messages.message_id@">@messages.subject@</a></td>
      <td align="center">@messages.posting_date@</td>

    </tr>

</multiple>
</if>
<else>
    <tr>
      <td colspan="3">
        <i>No Postings.</i>
      </td>
    </tr>
</else>

  </table>

</if>

<if @view@ eq forum>

<multiple name="messages">

  <table bgcolor="#cccccc" width="95%">

    <tr bgcolor="#eeeeee">
      <th align="left" colspan="2">@messages.forum_name@<br><br></th>
    </tr>

    <tr>
      <th align="left">Subject</th>
      <th align="center" width="20%">Posted</th>
    </tr>

<group column="forum_name">

  <if @messages.rownum@ odd>
    <tr bgcolor="#eeeeee">
  </if>
  <else>
    <tr bgcolor="#d9e4f9">
  </else>

      <td><a href="@messages.url@message-view?message_id=@messages.message_id@">@messages.subject@</a></td>
      <td align="center">@messages.posting_date@</td>

    </tr>

</group>

  </table>
  <br>

</multiple>

</if>

</center>