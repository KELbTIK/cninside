{include file="header.tpl"}
 <!--Main Start-->
<div id="main">
    <div class="content container">
        <div class="row">
            <div class="col-md-9 col-sm-9 col-xs-12">
                <!-- List group -->
                <ul class="list-group">
                    <li class="list-group-item">
                        <div class="">
                            <div class="pull-left"><h3>{l t='My Profile Info'}</h3></div>
                            <div class="pull-right">
                                <h5>[ <a href="edit.php">{l t='Edit My Profile'}</a> ]</h5>
                            </div>
                            <div class="clearfix"></div>
                            <div class="pull-left review-img"><img class="img-responsive" src="../images/photos/{$var_me.picurl}_100x100"  /></div>
                            <div class="pull-left">
                                <strong>{l t='Full Name'}: </strong>{$var_me.firstname} {$var_me.lastname} {if $var_me.fb_user_id}<i class="fa fa-facebook"></i>{/if}<br />
                                <strong>Email: </strong>{$var_me.email}<br />
                                <strong>{l t='Nickname'}: </strong>{$var_me.nickname} <br />
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="">
                            <div class="pull-left"><h3>{l t='Email Address'}</h3>
                            </div>
                            <div class="pull-right">
                                <h5>[ <a href="changemail.php">{l t='Manage Email Address'}</a> ]</h5>
                            </div>
                            <div class="clearfix"></div>
                            <div>{$var_me.email}</div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="">
                            <div class="pull-left">
                                <h3>{l t='Change Password'}</h3>
                            </div>
                            <div class="pull-right">
                                <h5>[ <a href="changepassword.php">{l t='Change Password'}</a> ]</h5>
                            </div>
                            <div class="clearfix"></div>
                            <div><h5>{l t='Change password for your account.'}</h5></div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="">
                            <div class="pull-left">
                                <h3>{l t='Payments'}</h3>
                            </div>
                            <div class="pull-right">
                                <h5>[ <a href="payments.php">{l t='View Payment History'}</a> ]</h5>
                            </div>
                            <div class="clearfix"></div>
                            <div><h5>{l t='View your payment history'}</h5></div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="">
                            <div class="pull-left">
                                <h3>{l t='Credit Points'}</h3>
                            </div>
                            <div class="pull-right">
                                <h5>[ <a href="buy_points.php">{l t='Buy Credit Points'}</a> ]</h5>
                            </div>
                            <div class="clearfix"></div>
                            <div><h5>{l t='Your Available Credit Points'}: {$var_me.credit}</h5></div>
                        </div>

                    </li>
                    <li class="list-group-item">
                        <div class="">
                            <div class="pull-left">
                                <h3>{l t='Email Notifications'}</h3>
                            </div>
                            <div class="pull-right">
                                <h5>[ <a href="notification.php">{l t='Manage Notifications'}</a> ]</h5>
                            </div>
                            <div class="clearfix"></div>
                            <div><h5>{l t='Manage which notifications and alerts you would like to receive from us.'}</h5></div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="">
                            <div class="pull-left">
                                <h3>{l t='My Lists'}</h3>
                            </div>
                            <div class="pull-right">
                                <h5>[ <a href="./?f=Lists" target="_blank">{l t='Manage Lists'}</a> ]</h5>
                            </div>
                            <div class="clearfix"></div>
                            <div><h5>{l t='Manage your Lists.'}</h5></div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="">
                            <div class="pull-left">
                                <h3>{l t='My Friends'}</h3>
                            </div>
                            <div class="pull-right">
                                <h5>[ <a href="./?f=Friends" target="_blank">{l t='Manage Friends'}</a> ]</h5>
                            </div>
                            <div class="clearfix"></div>
                            <div><h5>{l t='Manage your friends.'}</h5></div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="">
                            <div class="pull-left">
                                <h3>{l t='My Bookmarks'}</h3>
                            </div>
                            <div class="pull-right">
                                <h5>[ <a href="./?f=Bookmarks" target="_blank">{l t='Manage Bookmarks'}</a> ]</h5>
                            </div>
                            <div class="clearfix"></div>
                            <div><h5>{l t='Manage your Bookmark of businesses.'}</h5></div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="">
                            <div class="pull-left">
                                <h3>{l t='Delete Account'}</h3>
                            </div>
                            <div class="pull-right">
                                <h5>[ <a href="javascript:del_account()">{l t='Delete Account'}</a> ]</h5>
                            </div>
                            <div class="clearfix"></div>
                            <div><h5>{l t='Delete your account, photos, events, classifieds, comments, messages, deals, lists, and reviews.'}</h5></div>
                        </div>
                    </li>

                </ul>
            </div>
            <div class="col-md-3 col-sm-3 hidden-xs" >
                <div class="text-center">
                    <p align="center">
                        {$ads->getAdCode(3)}
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Main End-->
{include file="footer.tpl"}