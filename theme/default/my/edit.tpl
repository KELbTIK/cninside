{include file="header.tpl"}

<script src="/theme/{$get_theme}/js/link.js" type="text/javascript"></script>
<script type="text/javascript" src="/theme/{$get_theme}/js/ajax.js"></script>
<script src="/theme/{$get_theme}/js/edit.js" type="text/javascript"></script>

 <!--Main Start-->

<div id="main">
    <div class="content container">
        <div class="row">
            <div class="col-xs-12">
                <form action="?f=send" method="post" name="form1" enctype="multipart/form-data" class="form-horizontal edit-profile">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title" id="replyTitle">{l t='Edit your profile'}</h3>
                        </div>
                        <div class="panel-body">
                            <div class="">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Full Name'}</label>
                                    <div class="col-sm-8">
                                        <h2>
                                            {$var_me.firstname} {$var_me.lastname} ({$var_me.email})
                                        </h2>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Nickname'}</label>
                                    <div class="col-sm-8">
                                        <input name="nickname" class="form-control" type="text" id="nickname" value="{$var_me.nickname}" />
                                        {if $loginfail==3}
                                            <div class="alert alert-danger">{l t='This nickname has already  been registered'}!</div>
                                        {/if}
                                    </div>
                                </div>
                                {if !$var_me.fb_user_id}
                                <!-- password


                                <tr>
                                <td height="20"><h2>{l t='Change Password'}</h2></td>
                                <td height="20"><input name="password" type="password" id="password" onClick="this.style.backgroundColor='#fff'" /></td>
                                </tr>
                                <tr>
                                <td height="5"></td>
                                <td height="5"><h6><em>{l t='If you don\'t want to change your password, please leave it alone'}</em></h6></td>
                                </tr>
                                <tr>
                                <td height="20"><h2>{l t='Retype Password'}</h2></td>
                                <td height="20"><input type="password" name="rpassword" id="rpassword" onClick="this.style.backgroundColor='#fff'" /></td>
                                </tr>
                                <tr>
                                <td height="5">&nbsp;</td>
                                <td height="5"><h6><span id="err4" style="color:red; display:none">{l t='Two times should be the same'}</span></h6></td>
                                </tr>
                                -->
                                {/if}
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Location'}</label>
                                    <div class="col-sm-8">
                                        <span  id="ccity">
                                            {if $var_me.city}
                                                {$var_me.city}
                                            {/if}
                                            {if $var_me.state}
                                                , {$var_me.state}
                                            {/if}
                                            <a href="javascript:void(0);" onclick="$('#ccity').hide();$('#changecity').show();" class="btn button-blue">{l t='Change'}</a>
                                        </span>
                                        <div id="changecity" style="display:none" class="row">
                                            <div class="col-sm-4">
                                                <select class="form-control" id="country" name="country" onChange="getCountry(this,'state')">
                                                    <option value="">{l t='Select Country'}</option>
                                                    {$var_country}
                                                </select>
                                            </div>
                                            <div class="form-group visible-xs"></div>
                                            <div class="col-sm-4">
                                                <select class="form-control" id="state" name="state" onChange="getCat(this,'city')">
                                                    <option value="">{l t='Select State'}</option>
                                                </select>
                                            </div>
                                            <div class="form-group visible-xs"></div>
                                            <div class="col-sm-4">
                                                <select class="form-control" name="city" id="city">
                                                    <option value="">{l t='Select City'}</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Zip Code'}</label>
                                    <div class="col-sm-8">
                                        <input name="zip" class="form-control" type="text" id="zip"  value="{$var_me.zip}" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Gender'}</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" value="1" name="gender"  id="male" {if $var_me.gender==1}checked="checked"{/if} /> {l t='Male'}
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" value="2" name="gender" id="female" {if $var_me.gender==2}checked="checked"{/if} /> {l t='Female'}
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Birthdate'}</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <select class="form-control" name="month" id="month">

                                                    {php}
                                                        $mn=array("---","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
                                                        $b_m=old_turn_date(get_user_data('birthday'),m);
                                                        for($i=0;$i<=12;$i++)
                                                        {
                                                        $j = sprintf("%02d", $i);
                                                        $selected='';

                                                        if($j==$b_m)
                                                        {
                                                        $selected="selected=\"selected\"";
                                                        }
                                                        echo "<option value=\"$j\" $selected>".$mn[$i]."</option>";
                                                        }

                                                    {/php}

                                                </select>
                                                <div class="form-group visible-xs"></div>
                                            </div>
                                            <div class="col-sm-4">
                                                <select class="form-control" name="day" id="day">
                                                    {php}
                                                        $b_d=old_turn_date(get_user_data('birthday'),d);

                                                        for($i=00;$i<=31;$i++)
                                                        {
                                                        if($i<=9) $j="0$i";
                                                        else $j=$i;

                                                        if($i==0) $k="---";
                                                        else $k=$i;

                                                        if($i==$b_d)
                                                        {
                                                        echo "<option value=\"$j\" selected=\"selected\">".$k."</option>";
                                                        }
                                                        else

                                                        {echo "<option value=\"$j\">".$k."</option>";}
                                                        }

                                                    {/php}
                                                </select>
                                            </div>
                                            <div class="form-group visible-xs"></div>
                                            <div class="col-sm-4">
                                                <select class="form-control" name="year" id="year">
                                                    <option value="0000" selected="selected">----</option>
                                                    {php}
                                                        $b_y=old_turn_date(get_user_data('birthday'),Y);

                                                        for($i=date(Y);$i>=1901;$i--)
                                                        {
                                                        if($i==$b_y)
                                                        {
                                                        echo "<option value=\"$i\" selected=\"selected\">".$i."</option>";
                                                        }
                                                        else

                                                        {echo "<option value=\"$i\">".$i."</option>";}
                                                        }
                                                    {/php}
                                                </select>
                                            </div>
                                        </div>
                                        <div class="alert alert-danger" id="err6" style="display:none">{l t='Birthday'}!</div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Photo'}</label>
                                    <div class="col-sm-8">
                                        <img src="../images/photos/{$var_me.picurl}_100x100" class="img-responsive img-thumbnail"/>
                                        <!--<input type="file" name="file" id="file" />
                                {l t='(Type: JPEG GIF)'}-->
                                        &nbsp; <a href="./gallery.php?id={$var_me.user_id}" target="_blank"><strong>Select from gallery</strong></a>
                                        or <a href="./new_photo.php" target="_blank"><strong>Upload one to gallery first</strong></a>.
                                        <!--<h6><em>{l t='If you don\'t want to change your photo, please leave it alone'}</em></h6>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{l t='Tell everyone about yourself'}.</h3>
                        </div>
                        <div class="panel-body">
                            <div class="">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Your Tagline'}</label>
                                    <div class="col-sm-8">
                                        <input name="headline" class="form-control" id="headline" value="{$var_me.headline}" size="50" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Where You Can Find Me'}</label>
                                    <div class="col-sm-8">
                                        <input name="findme" class="form-control" id="findme" value="{$var_me.findmein}" size="50" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='My Hometown'}</label>
                                    <div class="col-sm-8">
                                        <input name="hometown" class="form-control" id="hometown" value="{$var_me.hometown}" size="50" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Blog Or Website'}</label>
                                    <div class="col-sm-8">
                                        <input name="website1" class="form-control" id="website1" value="{$var_me.blogurl}" size="50" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='When I\'m Not Golfing'}</label>
                                    <div class="col-sm-8">
                                        <input name="not_yelping" class="form-control" id="not_yelping" value="{$var_me.notplanet}" size="50" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Why My Reviews Are Good'}</label>
                                    <div class="col-sm-8">
                                        <input name="review_comment" class="form-control" id="review_comment" value="{$var_me.reviewcomment}" size="50" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Favorite Website'}</label>
                                    <div class="col-sm-8">
                                        <input name="website2" class="form-control" id="website2" value="{$var_me.favweb}" size="50" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Favorite Vacation Spot'}</label>
                                    <div class="col-sm-8">
                                        <input name="book" class="form-control" id="book" value="{$var_me.book}" size="50" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='My First Concert'}</label>
                                    <div class="col-sm-8">
                                        <input name="concert" class="form-control" id="concert" value="{$var_me.concert}" size="50" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='My Favorite Movie'}</label>
                                    <div class="col-sm-8">
                                        <input name="movie" class="form-control" id="movie" value="{$var_me.movie}" size="50" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='I Wish I Could'}</label>
                                    <div class="col-sm-8">
                                        <input name="meal" class="form-control" id="meal" value="{$var_me.meal}" size="50" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Favorite Course'}</label>
                                    <div class="col-sm-8">
                                        <input name="do_not_tell" class="form-control" id="do_not_tell" value="{$var_me.donottell}" size="50" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Favorite Food'}</label>
                                    <div class="col-sm-8">
                                        <input name="discovery" class="form-control" id="discovery" value="{$var_me.discovery}" size="50" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Favorite Golfer'}</label>
                                    <div class="col-sm-8">
                                        <input name="current_crash" class="form-control" id="current_crash" value="{$var_me.currentcrash}" size="50" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">&nbsp;</label>
                                    <div class="col-sm-8 text-right">
                                        <input type="button" class="btn button-blue" name="button" id="button" value="  {l t='Update'}" onclick="restore(); verify();" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<!--Main End-->

 {include file="footer.tpl"}