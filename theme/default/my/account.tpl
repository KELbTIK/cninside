{include file="header.tpl"}
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/7026.css" />
 <!--Main Start-->  
 <div id="main">
     <div class="content">
			<div class="left">
                  	<div class="con">
                              <div style="float:left"><h3>{l t='My Profile Info'}</h3></div>
                              <div style=" float:right">
                                <h5>[ <a href="edit.php">{l t='Edit My Profile'}</a> ]</h5>
           			           </div>
                              <div id="clear"></div>
                              <div style="float:left; text-align:center; width:104px; height:104px; overflow:hidden;"><img src="../images/photos/{$var_me.picurl}_100x100"  /></div>
                              <div style="float:left; padding-left:10px;">
                              <strong>{l t='Full Name'}: </strong>{$var_me.firstname} {$var_me.lastname} {if $var_me.fb_user_id}<img src="/theme/{$get_theme}/images/fb_16.gif" border="0" style="vertical-align:text-bottom" />{/if}<br />
                              <strong>Email: </strong>{$var_me.email}<br />
                              <strong>{l t='Nickname'}: </strong>{$var_me.nickname} <br />
                              </div>
                    </div>
                    <div id="clear"></div>
                  	<div class="con">
                              <div style="float:left"><h3>{l t='Email Address'}</h3>
                              </div>
                              <div style=" float:right">
                                <h5>[ <a href="changemail.php">{l t='Manage Email Address'}</a> ]</h5>
                              </div>
                              <div id="clear"></div>
                              <div style="padding-left:10px;">{$var_me.email}</div>
                    </div>
                    <div id="clear"></div>
                  	<div class="con">
                              <div style="float:left">
                                <h3>{l t='Change Password'}</h3>
                              </div>
                              <div style=" float:right">
                                <h5>[ <a href="changepassword.php">{l t='Change Password'}</a> ]</h5>
                      </div>
                              <div id="clear"></div>
                              <div style="padding-left:10px;"><h5>{l t='Change password for your account.'}</h5></div>
                    </div>
                    <div id="clear"></div>
                    
                    <div class="con">
                              <div style="float:left">
                                <h3>{l t='Payments'}</h3>
                              </div>
                              <div style=" float:right">
                                <h5>[ <a href="payments.php">{l t='View Payment History'}</a> ]</h5>
                              </div>
                              <div id="clear"></div>
                              <div style="padding-left:10px;"><h5>{l t='View your payment history'}</h5></div>
                    </div>
                    <div id="clear"></div>
                    
                            <div class="con">
                              <div style="float:left">
                                <h3>{l t='Credit Points'}</h3>
                              </div>
                              <div style=" float:right">
                                <h5>[ <a href="buy_points.php">{l t='Buy Credit Points'}</a> ]</h5>
                              </div>
                              <div id="clear"></div>

                              <div style="padding-left:10px;"><h5>{l t='Your Available Credit Points'}: {$var_me.credit}</h5></div>
                    </div>
                    <div id="clear"></div>
                  	<div class="con">
                              <div style="float:left">
                                <h3>{l t='Email Notifications'}</h3>
                              </div>
                              <div style=" float:right">
                                <h5>[ <a href="notification.php">{l t='Manage Notifications'}</a> ]</h5>
                              </div>
                              <div id="clear"></div>
                              <div style="padding-left:10px;"><h5>{l t='Manage which notifications and alerts you would like to receive from us.'}</h5></div>
                    </div>
                    <div id="clear"></div>
                  	<div class="con">
                              <div style="float:left">
                                <h3>{l t='My Lists'}</h3>
                              </div>
                              <div style=" float:right">
                                <h5>[ <a href="./?f=Lists" target="_blank">{l t='Manage Lists'}</a> ]</h5>
                      </div>
                              <div id="clear"></div>
                              <div style="padding-left:10px;"><h5>{l t='Manage your Lists.'}</h5></div>
                    </div>
                    <div id="clear"></div>
                  	<div class="con">
                              <div style="float:left">
                                <h3>{l t='My Friends'}</h3>
                              </div>
                              <div style=" float:right">
                                <h5>[ <a href="./?f=Friends" target="_blank">{l t='Manage Friends'}</a> ]</h5>
                      </div>
                              <div id="clear"></div>
                              <div style="padding-left:10px;"><h5>{l t='Manage your friends.'}</h5></div>
                    </div>
                    <div id="clear"></div>
                  	<div class="con">
                              <div style="float:left">
                                <h3>{l t='My Bookmarks'}</h3>
                              </div>
                              <div style=" float:right">
                                <h5>[ <a href="./?f=Bookmarks" target="_blank">{l t='Manage Bookmarks'}</a> ]</h5>
                      </div>
                              <div id="clear"></div>
                              <div style="padding-left:10px;"><h5>{l t='Manage your Bookmark of businesses.'}</h5></div>
                    </div>
                    <div id="clear"></div>
                    
                    <div class="con">
                              <div style="float:left">
                                <h3>{l t='Delete Account'}</h3>
                              </div>
                              <div style=" float:right">
                                <h5>[ <a href="javascript:del_account()">{l t='Delete Account'}</a> ]</h5>
                      </div>
                              <div id="clear"></div>
                              <div style="padding-left:10px;"><h5>{l t='Delete your account, photos, events, classifieds, comments, messages, deals, lists, and reviews.'}</h5></div>
                    </div>
                    <div id="clear"></div>
            </div>
                
            <div class="right" >
              <div class="con" style=" padding-left:10px; text-align:center;">
               <p align="center">
   
 	{$ads->getAdCode(3)}
</p>

              </div>
          </div>

    </div>
 </div>
 <!--Main End-->
 {include file="footer.tpl"}