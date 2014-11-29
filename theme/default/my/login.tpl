{include file="header.tpl"}
<script type="text/javascript" src="/theme/{$get_theme}/js/ajax.js"></script>
<script type="text/javascript" src="/theme/{$get_theme}/js/login.js"></script>

<!--Main Start-->

<div id="main">
    <div class="content container">
        <div class="row">
            <div class="col-md-5 col-sm-5 col-xs-12 login">
                <h2 style="font-size:16px; margin:16px 0 40px;">{l t='Already a %s Member?' r=$get_sitename} </h2>
                <div>
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#" onclick="tabclick(this,1)"><span class="tab mp ctab">{$get_sitename}</span></a></li>
                        {if $smarty.const._FB_ENABLE_}
                            <li><a href="#" onclick="tabclick(this,2)"><span class="tab fb">{l t='Facebook Connect'}</span></a></li>
                        {/if}
                    </ul>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="forms">
                                <div class="formdisp">
                                    <div class="form">
                                        {if $loginfail==1}
                                            <div class="alert alert-danger"><h3>{l t='Invalid Email address or Password'}</h3></div>
                                        {/if}
                                        <form id="login" name="login" method="post" action="?f=login&referer={$referer}" class="form-horizontal">
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">{l t='Email Address'}</label>
                                                <div class="col-sm-7">
                                                    <input name="email" class="form-control" type="text" id="email" value="{$smarty.post.email}" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">{l t='Password'}</label>
                                                <div class="col-sm-7">
                                                    <input class="form-control" type="password" name="password" id="password" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">{l t='Password'}</label>
                                                <div class="col-sm-7">
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" name="remember" id="remember" /> {l t='Remember me'} | <a href="resetpsw.php">{l t='Forget password'}?</a>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label"></label>
                                                <div class="col-sm-7">
                                                    <input type="submit" value="{l t='Login now'}" class="btn btn-primary"/>

                                                </div>
                                            </div>
                                        </form>
                                    </div><!--/div.form-->
                                    {if $smarty.const._FB_ENABLE_}
                                        <div class="form">
                                            <form id="loginfb" name="loginfb" method="post" action="?f=login&referer={$referer}" class="text-center">
                                                <p><strong>Use your Facebook account to login now!</strong></p>
                                                <p>We have partnered with Facebook to offer integrated account support via Facebook Connect. Safe, secure and easy!</p>
                                                <a href="/my/loginfb.php" class="btn btn-primary" ><i class="fa fa-facebook"></i> &nbsp;{l t='Connect with Facebook'}</a>
                                            </form>
                                        </div><!--/div.form-->
                                    {/if}
                                </div><!--/div.formdisp-->
                            </div><!--/div.forms-->
                        </div>
                    </div>

                </div>
                <div class="text-center hidden-xs">
                    {$ads->getAdCode(2)}
                </div>
            </div>
            <div class="col-md-7 col-sm-7 col-xs-12" >
                <div class="register" id="login_regdiv">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{l t='Signup on %s'  r=$get_sitename}</h3>
                        </div>
                        <div class="panel-body">
                            <form action="?f=reg&referer={$referer}" method="post" name="form1" class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label col-xs-12">{l t='Email Address'}</label>
                                    <div class="col-sm-7 col-xs-10">
                                        <input name="email" type="text" id="email" class="form-control" onClick="this.style.backgroundColor='#fff'" value="{$form.email}"/>

                                        <div class="clearfix"></div>
                                        <div class="alert alert-danger" id="erre1"  style="display:none">{l t='Invalid Email Address'}</div>
                                        {if $loginfail==2}
                                            <div class="alert alert-danger">{l t='This Email address has already been registered'}!</div>
                                        {/if}
                                    </div>
                                    <div class="col-sm-1 col-xs-2" style="color:red;">*</div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label col-xs-12">{l t='Nickname'}</label>
                                    <div class="col-sm-7 col-xs-10">
                                        <input name="nickname" type="text" id="nickname" class="form-control" value="{$form.nickname}" />
                                        <div class="clearfix"></div>
                                        {if $loginfail==3}
                                            <div class="alert alert-danger">{l t='This nickname has already  been registered'}!</div>
                                        {/if}
                                    </div>
                                    <div class="col-sm-1 col-xs-2" style="color:red;">*</div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label col-xs-12">{l t='Create Password'}</label>
                                    <div class="col-sm-7 col-xs-10">
                                        <input type="password" name="password" class="form-control" id="password" onClick="this.style.backgroundColor='#fff'" value="{$smarty.post.password}"  />
                                        <div class="clearfix"></div>
                                        <div class="alert alert-danger" id="err3" style="display:none">{l t='Please input your password'}</div>
                                    </div>
                                    <div class="col-sm-1 col-xs-2" style="color:red;">*</div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label col-xs-12">{l t='Retype Password'}</label>
                                    <div class="col-sm-7 col-xs-10">
                                        <input type="password" name="rpassword" id="rpassword" class="form-control" onClick="this.style.backgroundColor='#fff'" value="{$smarty.post.rpassword}"  />
                                        <div class="clearfix"></div>
                                        <div class="alert alert-danger" id="err4" style="display:none">{l t='Two times should be the same'}</div>
                                    </div>
                                    <div class="col-sm-1 col-xs-2" style="color:red;">*</div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label col-xs-12">{l t='First Name'}</label>
                                    <div class="col-sm-7 col-xs-10">
                                        <input name="firstname" type="text" id="firstname" class="form-control" onClick="this.style.backgroundColor='#fff'" value="{$form.firstname}" />
                                        <div class="clearfix"></div>
                                        <div class="alert alert-danger" id="err1" style="display:none">{l t='Your first name is necessary'}</div>
                                    </div>
                                    <div class="col-sm-1 col-xs-2" style="color:red;">*</div>
                                </div>
                                <div class="form-group reg_lastname">
                                    <label class="col-sm-4 control-label col-xs-12">{l t='Last Name'}</label>
                                    <div class="col-sm-7 col-xs-10">
                                        <input name="lastname" type="text" id="lastname" class="form-control" onClick="this.style.backgroundColor='#fff'" value="{$form.lastname}" />
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label col-xs-12">{l t='Zip Code'}</label>
                                    <div class="col-sm-7 col-xs-10">
                                        <input name="zip" type="text" id="zip" class="form-control" onClick="this.style.backgroundColor='#fff'" value="{$form.zip}" />
                                        <div class="clearfix"></div>
                                        <div class="alert alert-danger" id="err5" style="display:none">{l t='Wrong Zip Code'}.</div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label col-xs-12">{l t='City'}</label>
                                    <div class="col-sm-7">
                                        <div class="row">
                                            <div class="col-md-4 col-sm-4 col-xs-10">
                                                <select id="country" class="form-control" name="country" onChange="getCountry(this,'state')">
                                                    <option value="">{l t='Select Country'}</option>
                                                    {$var_country}
                                                </select>
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-10">
                                                <select id="state" class="form-control" name="state" onChange="getCat(this,'city')">
                                                    <option value="">{l t='Select State'}</option>
                                                </select>
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-10">
                                                <select class="form-control" name="city" id="city">
                                                    <option value="">{l t='Select City'}</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Gender'}</label>
                                    <div class="col-sm-7">
                                        <label class="radio-inline" for="male">
                                            <input name="gender" type="radio"  id="male"  style="border:0;" value="1" checked="checked"/>
                                            {l t='Male'}
                                        </label>
                                        <label class="radio-inline" for="female">
                                            <input type="radio" value="2" name="gender" id="female"  style="border:0;"/>
                                            {l t='Female'}
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Birthdate'}</label>
                                    <div class="col-sm-7">
                                        <div class="row">
                                            <div class="col-md-4 col-sm-4 col-xs-10">
                                                <select name="month" class="reg_month form-control" onchange="this.style.backgroundColor='#fff'" >
                                                    <option value="00" selected="selected">Month</option>
                                                    <option value="01" {if $smarty.post.month=='01'}selected="selected"{/if}>{l t='Jan'}</option>
                                                    <option value="02" {if $smarty.post.month=='02'}selected="selected"{/if}>{l t='Feb'}</option>
                                                    <option value="03" {if $smarty.post.month=='03'}selected="selected"{/if}>{l t='Mar'}</option>
                                                    <option value="04" {if $smarty.post.month=='04'}selected="selected"{/if}>{l t='Apr'}</option>
                                                    <option value="05" {if $smarty.post.month=='05'}selected="selected"{/if}>{l t='May'}</option>
                                                    <option value="06" {if $smarty.post.month=='06'}selected="selected"{/if}>{l t='Jun'}</option>
                                                    <option value="07" {if $smarty.post.month=='07'}selected="selected"{/if}>{l t='Jul'}</option>
                                                    <option value="08" {if $smarty.post.month=='08'}selected="selected"{/if}>{l t='Aug'}</option>
                                                    <option value="09" {if $smarty.post.month=='09'}selected="selected"{/if}>{l t='Sep'}</option>
                                                    <option value="10" {if $smarty.post.month=='10'}selected="selected"{/if}>{l t='Oct'}</option>
                                                    <option value="11" {if $smarty.post.month=='11'}selected="selected"{/if}>{l t='Nov'}</option>
                                                    <option value="12" {if $smarty.post.month=='12'}selected="selected"{/if}>{l t='Dec'}</option>
                                                </select>
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-10">
                                                <select name="day" class="reg_day form-control"  onchange="this.style.backgroundColor='#fff'" >
                                                    <option value="00" selected="selected">Day</option>
                                                    <option value="01" {if $smarty.post.day=='01'}selected="selected"{/if}>1</option>
                                                    <option value="02" {if $smarty.post.day=='02'}selected="selected"{/if}>2</option>
                                                    <option value="03" {if $smarty.post.day=='03'}selected="selected"{/if}>3</option>
                                                    <option value="04" {if $smarty.post.day=='04'}selected="selected"{/if}>4</option>
                                                    <option value="05" {if $smarty.post.day=='05'}selected="selected"{/if}>5</option>
                                                    <option value="06" {if $smarty.post.day=='06'}selected="selected"{/if}>6</option>
                                                    <option value="07" {if $smarty.post.day=='07'}selected="selected"{/if}>7</option>
                                                    <option value="08" {if $smarty.post.day=='08'}selected="selected"{/if}>8</option>
                                                    <option value="09" {if $smarty.post.day=='09'}selected="selected"{/if}>9</option>
                                                    <option value="10" {if $smarty.post.day=='10'}selected="selected"{/if}>10</option>
                                                    <option value="11" {if $smarty.post.day=='11'}selected="selected"{/if}>11</option>
                                                    <option value="12" {if $smarty.post.day=='12'}selected="selected"{/if}>12</option>
                                                    <option value="13" {if $smarty.post.day=='13'}selected="selected"{/if}>13</option>
                                                    <option value="14" {if $smarty.post.day=='14'}selected="selected"{/if}>14</option>
                                                    <option value="15" {if $smarty.post.day=='15'}selected="selected"{/if}>15</option>
                                                    <option value="16" {if $smarty.post.day=='16'}selected="selected"{/if}>16</option>
                                                    <option value="17" {if $smarty.post.day=='17'}selected="selected"{/if}>17</option>
                                                    <option value="18" {if $smarty.post.day=='18'}selected="selected"{/if}>18</option>
                                                    <option value="19" {if $smarty.post.day=='19'}selected="selected"{/if}>19</option>
                                                    <option value="20" {if $smarty.post.day=='20'}selected="selected"{/if}>20</option>
                                                    <option value="21" {if $smarty.post.day=='21'}selected="selected"{/if}>21</option>
                                                    <option value="22" {if $smarty.post.day=='22'}selected="selected"{/if}>22</option>
                                                    <option value="23" {if $smarty.post.day=='23'}selected="selected"{/if}>23</option>
                                                    <option value="24" {if $smarty.post.day=='24'}selected="selected"{/if}>24</option>
                                                    <option value="25" {if $smarty.post.day=='25'}selected="selected"{/if}>25</option>
                                                    <option value="26" {if $smarty.post.day=='26'}selected="selected"{/if}>26</option>
                                                    <option value="27" {if $smarty.post.day=='27'}selected="selected"{/if}>27</option>
                                                    <option value="28" {if $smarty.post.day=='28'}selected="selected"{/if}>28</option>
                                                    <option value="29" {if $smarty.post.day=='29'}selected="selected"{/if}>29</option>
                                                    <option value="30" {if $smarty.post.day=='30'}selected="selected"{/if}>30</option>
                                                    <option value="31" {if $smarty.post.day=='31'}selected="selected"{/if}>31</option>
                                                </select>
                                                {*<span class="reg_day">{l t='Day'} </span>*}
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-10">
                                                <select name="year" class="reg_year form-control"  onchange="this.style.backgroundColor='#fff'" >
                                                    <option value="0000" selected="selected">Year</option>
                                                    {php}
                                                        for($i=date(Y); $i>=1901; $i--)
                                                        {
                                                        $selected='';
                                                        if($i==$_POST['year']) $selected='selected="selected"';
                                                        echo "<option value=\"".$i."\" $selected>$i</option>";
                                                        }
                                                    {/php}
                                                </select>
                                                {*<span class="reg_year">{l t='Year'} </span>*}
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="alert alert-danger" id="err6" style="display:none">{l t='Birthday need to be completed or empty'}!</div>
                                    </div>
                                </div>
                                {if $smarty.const._CAPTCHA_REG_ENABLE_}
                                <div class="form-group">
                                    <label class="col-sm-4 control-label col-xs-12">{l t='Word Verification'}</label>
                                    {l t='Type the code shown below'}
                                    <div class="col-sm-7">
                                        <img id="siimage" class="pull-left" style="padding-right: 5px; border: 0" src="/inc/captcha/securimage_show.php?sid={$smarty.now}" />
                                        <div id="captcha" class="pull-left">
                                            <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="19" height="19" id="SecurImage_as3" align="middle">
                                                <param name="allowScriptAccess" value="sameDomain" />
                                                <param name="allowFullScreen" value="false" />
                                                <param name="movie" value="/inc/captcha/securimage_play.swf?audio=/inc/captcha/securimage_play.php&bgColor1=#777&bgColor2=#fff&iconColor=#000&roundedCorner=5" />
                                                <param name="quality" value="high" />
                                                <param name="bgcolor" value="#ffffff" />
                                                <embed src="/inc/captcha/securimage_play.swf?audio=/inc/captcha/securimage_play.php&bgColor1=#777&bgColor2=#fff&iconColor=#000&roundedCorner=5" quality="high" bgcolor="#ffffff" width="19" height="19" name="SecurImage_as3" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
                                            </object>
                                            <br />
                                            <a tabindex="-1" style="border-style: none" href="#" title="Refresh Image" onClick="document.getElementById('siimage').src = '/inc/captcha/securimage_show.php?sid=' + Math.random(); return false"><img src="/inc/captcha/images/refresh.gif" alt="Reload Image" border="0" onClick="this.blur()" align="bottom" /></a>
                                        </div>
                                        <div class="clearfix"></div>
                                        <input type="text" name="code" class="form-control"/>
                                        <span style="color:red;">*</span>
                                        <div class="clearfix"></div>
                                        {if $loginfail==4}
                                            <div class="alert alert-danger">{l t='Wrong word'}!</div>
                                        {/if}
                                    </div>
                                </div>
                                {/if}
                                <div class="form-group">
                                    <label class="col-sm-4 control-label hidden-xs">&nbsp;</label>
                                    <div class="col-sm-7 text-right col-xs-10">
                                        <label><a href="javascript:restore();verify()" class="btn btn-block btn-primary">{l t='Sign Up'}</a></label>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script type="text/javascript" language="javascript">restore();</script>
    </div>
 </div>
<!--Main End-->
{include file="footer.tpl"}