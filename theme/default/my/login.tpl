{include file="header.tpl"}
<script type="text/javascript" src="/theme/{$get_theme}/js/ajax.js"></script>
<script type="text/javascript" src="/theme/{$get_theme}/js/login.js"></script>
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/5938.css" />

<!--Main Start-->

<div id="main">
    <div class="content container-fluid">
        <div class="row">
            <div class="left col-md-7 col-sm-7 col-xs-12" >
                <div class="con box" style=" width:100%; margin-bottom:10px;" id="login_regdiv">

                    <h2><span style="color:red;">{l t='Signup on %s'  r=$get_sitename}</span></h2>
                    <form action="?f=reg&referer={$referer}" method="post" name="form1">
                        <table width="100%" border="0">
                            <tr>
                                <th height="20">
                                    <h3>{l t='Email Address'}</h3>
                                    <td height="20">
                                        <div class="col-md-11 col-sm-11 col-xs-11">
                                            <input name="email" type="text" id="email" class="form-control" onClick="this.style.backgroundColor='#fff'" value="{$form.email}"/>
                                        </div>
                                        <span style="color:red;">*</span>
                                        <h6><span id="erre1"  style="color:red;display:none">{l t='Invalid Email Address'}</span></h6>
                                    </td>
                                </th>
                            </tr>
                            <tr>
                                <td height="10" colspan="2" align="right">
                                    {if $loginfail==2}
                                        <span style="color:red; font-weight:bold; background-color:#FFC;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{l t='This Email address has already been registered'}! &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    {/if}
                                </td>
                            </tr>

                            <tr>
                                <th height="20">
                                    <h3>{l t='Nickname'}</h3>
                                    <td height="20">
                                        <div class="col-md-11 col-sm-11 col-xs-11">
                                            <input name="nickname" type="text" id="nickname" class="form-control" value="{$form.nickname}" />
                                        </div>
                                    </td>
                                </th>
                            </tr>
                            <tr>
                                <td height="10" colspan="2" align="right">
                                    {if $loginfail==3}
                                        <span style="color:red; font-weight:bold; background-color:#FFC;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{l t='This nickname has already  been registered'}! &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <th height="20">
                                    <h3>{l t='Create Password'}</h3>
                                    <td height="20">
                                        <div class="col-md-11 col-sm-11 col-xs-11">
                                            <input type="password" name="password" class="form-control" id="password" onClick="this.style.backgroundColor='#fff'" value="{$smarty.post.password}"  />
                                        </div>
                                        <span style="color:red;">*</span>
                                    </td>
                                </th>
                            </tr>
                            <tr>
                                <td height="10">&nbsp;</td>
                                <td height="10"><h6><span  id="err3" style="color:red;display:none">{l t='Please input your password'}</span></h6></td>
                            </tr>
                            <tr>
                                <th height="20">
                                    <h3>{l t='Retype Password'}</h3>
                                    <td height="20">
                                        <div class="col-md-11 col-sm-11 col-xs-11">
                                            <input type="password" name="rpassword" id="rpassword" class="form-control" onClick="this.style.backgroundColor='#fff'" value="{$smarty.post.rpassword}"  />
                                        </div>
                                        <span style="color:red;">*</span>
                                    </td>
                                </th>
                            </tr>
                            <tr>
                                <td height="10">&nbsp;</td>
                                <td height="10"><h6><span id="err4" style="color:red;display:none">{l t='Two times should be the same'}</span></h6></td>
                            </tr>
                            <tr>
                                <th width="30%" height="20">
                                    <h3>{l t='First Name'}</h3>
                                    <td width="61%" height="20">
                                        <div class="col-md-11 col-sm-11 col-xs-11">
                                            <input name="firstname" type="text" id="firstname" class="form-control" onClick="this.style.backgroundColor='#fff'" value="{$form.firstname}" />
                                        </div>
                                        <span style="color:red;">*</span>
                                    </td>
                                </th>
                            </tr>
                            <tr>
                                <td height="10"></td>
                                <td height="10"><h6><span id="err1" style="color:red; display:none">{l t='Your first name is necessary'}</span></h6></td>
                            </tr>
                            <tr class="reg_lastname">
                                <th height="20">
                                    <h3>{l t='Last Name'}</h3>
                                    <td height="20">
                                        <div class="col-md-11 col-sm-11 col-xs-11">
                                            <input name="lastname" type="text" id="lastname" class="form-control" onClick="this.style.backgroundColor='#fff'" value="{$form.lastname}" />
                                        </div>
                                    </td>
                                </th>
                            </tr>
                            <tr class="reg_lastname">
                                <td height="10">&nbsp;</td>
                                <td height="10"> </td>
                            </tr>

                            <tr>
                                <th height="20">
                                    <h3>{l t='Zip Code'}</h3>
                                    <td height="20">
                                        <div class="col-md-11 col-sm-11 col-xs-11">
                                            <input name="zip" type="text" id="zip" class="form-control" onClick="this.style.backgroundColor='#fff'" value="{$form.zip}" />
                                        </div>
                                    </td>
                                </th>
                            </tr>
                            <tr>
                                <td height="10">&nbsp;</td>
                                <td height="10"><h6><span id="err5" style="color:red;display:none">{l t='Wrong Zip Code'}.</span></h6></td>
                            </tr>
                            <tr>
                                <th height="28">
                                    <h3> {l t='City'}</h3>
                                    <td height="28">
                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                            <select id="country" class="form-control" name="country" onChange="getCountry(this,'state')">
                                                <option value="">{l t='Select Country'}</option>
                                                {$var_country}
                                            </select>
                                        </div>
                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                            <select id="state" class="form-control" name="state" onChange="getCat(this,'city')">
                                                <option value="">{l t='Select State'}</option>
                                            </select>
                                        </div>
                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                            <select style="margin-bottom: 0" class="form-control" name="city" id="city">
                                                <option value="">{l t='Select City'}</option>
                                            </select>
                                        </div>
                                    </td>
                                </th>
                            </tr>
                            <tr>
                                <th height="61">
                                    <h3>{l t='Gender'}</h3>
                                    <td height="61">
                                        <div class="col-xs-12">
                                            <label class="radio-inline" for="male">
                                                <input name="gender" type="radio"  id="male"  style="border:0;" value="1" checked="checked"/>
                                                {l t='Male'}
                                            </label>
                                            <label class="radio-inline" for="female">
                                                <input type="radio" value="2" name="gender" id="female"  style="border:0;"/>
                                                {l t='Female'}
                                            </label>
                                        </div>
                                    </td>
                                </th>
                            </tr>

                            <tr>
                                <th height="40">
                                    <h3>{l t='Birthdate'}</h3>
                                    <td height="40">
                                        <div class="col-md-4 col-sm-4 col-xs-12">
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
                                        {*<span class="reg_month">{l t='Month'} </span>*}
                                        <div class="col-md-4 col-sm-4 col-xs-12">
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
                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                            <select style="margin-bottom: 0" name="year" class="reg_year form-control"  onchange="this.style.backgroundColor='#fff'" >
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
                                    </td>
                                </th>
                            </tr>
                            <tr>
                                <td height="10">&nbsp;</td>
                                <td height="10"><h6><span id="err6" style="color:red;display:none">{l t='Birthday need to be completed or empty'}!</span></h6></td>
                            </tr>
                            {if $smarty.const._CAPTCHA_REG_ENABLE_}
                                <tr>
                                    <th height="20"><h3>{l t='Word Verification'}</h3><td height="20">{l t='Type the code shown below'}:</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <img id="siimage" style=" float:left; padding-right: 5px; border: 0" src="/inc/captcha/securimage_show.php?sid={$smarty.now}" />
                                        <div id="captcha" style=" float: left;">
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
                                        <div style="clear: both; height:10px;"></div>
                                        <input type="text" name="code" style="width:200px;"/>
                                        <span style="color:red;">*</span></td>
                                </tr>
                                <tr>
                                    <td height="10">&nbsp;</td>
                                    <td height="10">

                                        {if $loginfail==4}
                                            <span style="color:red; font-weight:bold; background-color:#FFC;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{l t='Wrong word'}! &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                        {/if}</td>
                                </tr>
                            {/if}
                            <tr>
                                <td height="51">&nbsp;</td>
                                <td height="51">
                                    <div class="col-xs-12">
                                        <label><a href="javascript:restore();verify()" class="btn btn-block button-blue">{l t='Sign Up'}</a></label>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <div class="right col-md-5 col-sm-5 col-xs-12">
                <h2 style="font-size:16px; margin:16px 0 40px;">{l t='Already a %s Member?' r=$get_sitename} </h2>
                <div class="con box change2" style=" padding:10px; width:100%; margin-bottom:10px; position:relative;">
                <div class="tabs">
                    <span class="tab mp ctab" onclick="tabclick(this,1)">{$get_sitename}</span>
                    {if $smarty.const._FB_ENABLE_}<span class="tab fb" onclick="tabclick(this,2)">{l t='Facebook Connect'}</span>{/if}
                </div>

                <div class="forms">
                    <div class="formdisp">
                        <div class="form">
                            {if $loginfail==1}
                                <div style="clear:both; text-align:center; background-color:#FFC; padding:2px; width:93%; border:1px #ccc solid;"><h3><span style="color:red;">{l t='Invalid Email address or Password'} </span></h3></div>
                            {/if}
                            <form id="login" name="login" method="post" action="?f=login&referer={$referer}">
                                <table width="100%" border="0">
                                    <tr>
                                        <th width="30%" height="20">
                                            <h3>{l t='Email Address'}</h3>
                                            <td width="61%" height="40">
                                                <input name="email" class="form-control" type="text" id="email" value="{$smarty.post.email}" />
                                            </td>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th height="20"><h3>{l t='Password'}</h3><td height="40"><input class="form-control" type="password" name="password" id="password" /></td>
                                    </tr>
                                    <tr>
                                        <td height="15"> </td>
                                        <td height="15">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="remember" id="remember"   style="border:0"/> {l t='Remember me'} | <a href="resetpsw.php">{l t='Forget password'}?</a>
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="40">&nbsp;</td>
                                        <td height="40">
                                            <label>
                                                <input type="submit" value="{l t='Login now'}" class="btn btn-block button-blue"/>
                                            </label>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div><!--/div.form-->
                        {if $smarty.const._FB_ENABLE_}
                        <div class="form">
                        <form id="loginfb" name="loginfb" method="post" action="?f=login&referer={$referer}">
                        <table width="100%" border="0">
                        <tr>
                        <td height="80" align="center">
                        <strong>Use your Facebook account to login now!</strong><br />
                        We have partnered with Facebook to offer integrated account support via Facebook Connect. Safe, secure and easy!
                        </td>
                        </tr>
                        <tr>
                        <td height="40" align="center">
                        <a href="/my/loginfb.php"><img src="/theme/{$get_theme}/images/fb_connect.png" alt="Connect with Facebook" border="0" /></a>
                        </td>
                        </tr>
                        </table>
                        </form>
                        </div><!--/div.form-->
                        {/if}
                    </div><!--/div.formdisp-->
                </div><!--/div.forms-->
                </div>
                <div class="con" style=" padding-left:10px; text-align:center; border-bottom:0;">
                    {$ads->getAdCode(2)}
                </div>
            </div>
        </div>
        <script type="text/javascript" language="javascript">restore();</script>
    </div>
 </div>
<!--Main End-->
{include file="footer.tpl"}