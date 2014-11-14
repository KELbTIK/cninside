<div class="itemT" style="border-top:1px #ccc solid;" onclick="menu_toggle('sysmgts',this)">{l t='System Management'}</div>
<div id="sysmgts" class="toggles">
    <div id="itemid" class="itemS" onClick="sele_item(this,'body/')">{l t='Dashboard'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/system_general.php')">{l t='General Settings'}</div>
        <div id="itemid" class="item" onClick="sele_item(this,'body/system_theme.php')">{l t='Theme Settings'}</div>
        <div id="itemid" class="item" onClick="sele_item(this,'body/system_menu.php')">{l t='Manage Menu'}</div>
        <div id="itemid" class="item" onClick="sele_item(this,'body/social.php')">{l t='Social Links'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/system_mail.php')">{l t='Mail Settings'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/system_map.php')">{l t='Map Settings'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/system_language.php')">{l t='Language Settings'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/other_city.php');">{l t='Location Settings'}</div>
        <div id="itemid" class="item" onClick="sele_item(this,'body/system_paypal.php')">{l t='Paypal Settings'}</div>
        <div id="itemid" class="item" onClick="sele_item(this,'body/points_pricing_add.php')">{l t='Paypal Pricing'}</div>
        <div id="itemid" class="item" onClick="sele_item(this,'body/promotion_add.php')">{l t='Promo Code'}</div> 
    <div id="itemid" class="item" onClick="sele_item(this,'body/system_starbiz_reminder.php');">{l t='StarBiz Settings'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/system_classified.php');">{l t='Classified Settings'}</div> 
    <div id="itemid" class="item" onClick="sele_item(this,'body/system_report.php')">{l t='View Flags'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/user_admin.php')">{l t='View Admins'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/system_fb.php')">{l t='Facebook Connect'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/ad_list.php')">{l t='Ad Campaigns'}</div>
    <div id="itemid" class="item" style="border-bottom:1px #ccc solid" onclick="location='../my/logout.php'">{l t='Log off'}</div>
</div>

<div class="itemT" onclick="menu_toggle('usermgts',this)">{l t='User Panel'}</div>
<div id="usermgts" class="toggles">
    <div id="itemid" class="item" onClick="sele_item(this,'body/user_user.php');">{l t='User List'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/user_bookmark.php');">
    {l t='Bookmarks'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/user_list.php');">{l t='Lists'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/user_compliment.php');">{l t='Compliments'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/user_friend.php');">{l t='Friends'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/user_favorite.php');">{l t='Favorites'}</div>
    <div id="itemid" class="item" style="border-bottom:1px #ccc solid" onClick="sele_item(this,'body/user_ideas.php');">{l t='List Ideas'}</div>
</div>

<div class="itemT" onclick="menu_toggle('bizmgts',this)">{l t='Business'}</div>
<div id="bizmgts" class="toggles">
    <div id="itemid" class="item" onClick="sele_item(this,'body/business_list.php');">{l t='Business List'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/business_pricing_add.php');">{l t='StarBiz Pricing'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/business_payment.php');">{l t='StarBiz Payment'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/business_review.php');">{l t='Business Reviews'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/business_photo.php');">{l t='Business Photo'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/business_claim.php');">{l t='Claiming Requests'}</div>
<!--    <div id="itemid" class="item" onClick="sele_item(this,'body/hole_review.php');">{l t='CourseTips Reviews'}</div>-->
    <div id="itemid" class="item" onClick="sele_item(this,'body/business_category.php');">{l t='Category'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/business_category_item.php');">{l t='Manage Category Items'}</div>
     <div id="itemid" class="item" onClick="sele_item(this,'body/business_category_item_add.php');">{l t='Add Category Item'}</div>
     
         <div id="itemid" class="item" onClick="sele_item(this,'body/business_rating_item.php');">{l t='Manage Star Rating Items'}</div>
     <div id="itemid" class="item" onClick="sele_item(this,'body/business_rating_item_add.php');">{l t='Add Star Rating Item'}</div>
    
    <div id="itemid" class="item"  style="border-bottom:1px #ccc solid"  onClick="sele_item(this,'body/offer_list.php');">{l t='Special Offer List'}</div>
</div>

<div class="itemT" onclick="menu_toggle('eventsmgts',this)">{l t='Events'}</div>
<div id="eventsmgts" class="toggles">
    <div id="itemid" class="item" onClick="sele_item(this,'body/event_list.php');">{l t='Events List'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/event_review.php');">{l t='Events Reviews'}</div>
    <div id="itemid" class="item" style="border-bottom:1px #ccc solid" onClick="sele_item(this,'body/event_category.php');">{l t='Category'}</div>
</div>

<div class="itemT" onclick="menu_toggle('chattermgts',this)">{l t='Chatter'}</div>
<div id="chattermgts" class="toggles">
    <div id="itemid" class="item" onClick="sele_item(this,'body/chatter_list.php');">{l t='Chatter List'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/chatter_review.php');">{l t='Chatter Replies'}</div>
    <div id="itemid" class="item" style="border-bottom:1px #ccc solid" onClick="sele_item(this,'body/chatter_category.php');">{l t='Category'}</div>
</div>

<div class="itemT" onclick="menu_toggle('dealsmgts',this)">{l t='Classified'}</div>
<div id="dealsmgts" class="toggles">
    <div id="itemid" class="item" onClick="sele_item(this,'body/deals_list.php');">{l t='Classified List'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/deals_review.php');">{l t='Classified Replies'}</div>
    <div id="itemid" class="item" style="border-bottom:1px #ccc solid" onClick="sele_item(this,'body/deals_category.php');">{l t='Category'}</div>
</div>

<div class="itemT" onclick="menu_toggle('notificationmgts',this)">{l t='Template'}</div>
<div id="notificationmgts" class="toggles">
    <div id="itemid" class="item" onClick="sele_item(this,'body/noti_claim.php')">{l t='Claim Result Notify'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/noti_approve.php')">{l t='Submit Approve Notify'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/noti_bizreview.php')">{l t='New Biz Review Notify'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/noti_newmsg.php')">{l t='New PM Notify'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/noti_comment.php')">{l t='New Comment Notify'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/noti_addfriend.php')">{l t='Friend Request Notify'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/noti_compliment.php');" style="border-bottom:1px #ccc solid">{l t='New Compliment Notify'}</div>
</div>

<!--  <div class="itemT" onclick="menu_toggle('plugin',this)">{l t='Plugins'}</div>
<div id="plugin" class="toggles">-->
    {include file="mgt/menu_plugin.tpl"}
 <!-- <div id="itemid" class="item" style="border-bottom:1px #ccc solid" onClick="sele_item(this,'body/page_terms.php');">{l t='Plugin Management'}</div>
</div>-->

<div class="itemT" onclick="menu_toggle('pagemgts',this)">{l t='Page'}</div>
<div id="pagemgts" class="toggles">
<div id="itemid" class="item" onClick="sele_item(this,'body/page_create.php');">{l t='Add New Page'}</div>
<div id="itemid" class="item" onClick="sele_item(this,'body/page_list.php');">{l t='Manage Pages'}</div>
</div>


<div class="itemT" onclick="menu_toggle('othersmgts',this)">{l t='Others'}</div>
<div id="othersmgts" class="toggles">
    <div id="itemid" class="item" onClick="sele_item(this,'body/noti_newfeature.php')">{l t='Send Email Newsletter'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/other_newsletter.php');">{l t='Send PM Newsletter'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/other_feedback.php');">{l t='Feedback'}</div>
    <div id="itemid" class="item" onClick="sele_item(this,'body/other_invitation.php');" style="border-bottom:1px #ccc solid">{l t='Friend Invitation'}</div>
</div>
