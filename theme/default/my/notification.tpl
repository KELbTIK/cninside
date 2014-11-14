{include file="header.tpl"}

<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/7026.css" />

 <!--Main Start-->  
 
 <div id="main">
     <div class="content">
			<div class="left">
                  	<div class="con" style="height:25px;">
                   	          <div style="float:left">
                   	            <h2>{l t='Manage Email Notifications'}</h2>
           	          </div>
                              <div style=" float:right">
                                <h5>[ <a href="account.php">&laquo; {l t='Back to Account'}</a> ]</h5>
                              </div>
                     </div>
                     <div class="con">
                              <div > <form action="?f=change" method="post" name="form1">
                                <table width="100%" border="0">
                                  <tr>
                                    <td height="40" colspan="3"><h3>{l t='General'}</h3></td>
                                  </tr>
                                  <tr>
                                    <td width="7%" height="40">&nbsp;</td>
                                    <td colspan="2">
                                      <input name="f1" type="checkbox" id="c1" {if $var_noti.1==1}checked="checked"{/if} />
                                    <label for="c1">{l t='Send me an email when major features are released so that I know what is new.'}</label></td>
                                  </tr>
                                  <tr>
                                    <td height="40" colspan="3"><h3>{l t='Communications'}</h3></td>
                                  </tr>
                                  <tr>
                                    <td height="40">&nbsp;</td>
                                    <td colspan="2"><input type="checkbox" name="f2" id="c2" {if $var_noti.2==1}checked="checked"{/if} />
<label for="c2">{l t='Send me notification emails when I have received a new private message.'}</label></td>
                                  </tr>
                                  <tr>
                                    <td height="40">&nbsp;</td>
                                    <td colspan="2"><input type="checkbox" name="f3" id="c3"  {if $var_noti.3==1}checked="checked"{/if} />
                                    <label for="c3">{l t='Send me notification emails when members compliment me for a recommendation.'}</label></td>
                                  </tr>
                                  <tr>
                                    <td height="40"><p>&nbsp;</p>                                    </td>
                                    <td colspan="2">
                                      <input type="checkbox" name="f4" id="c4" {if $var_noti.4==1}checked="checked"{/if} />
                                    
                                    <label for="c4">{l t='Send me notification email when someone give me a comment.'}</label> </td>
                                  </tr>
                                  <tr>
                                    <td height="40">&nbsp;</td>
                                    <td width="23%">&nbsp;</td>
                                    <td width="70%"><input type="submit" name="button" id="button" value="    {l t='Update'}    " onclick="verify()" /></td>
                                  </tr>
                                </table>
                                </form>
                              </div>
              </div>
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