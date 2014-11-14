{include file="header.tpl"}
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/7026.css" />


 <!--Main Start-->  
 
 <div id="main">
     <div class="content">
			<div class="left">
                  	<div class="con" style="height:25px;">
                   	          <div style="float:left">
                   	            <h3>{l t='Change Password'}</h3>
                    		  </div>
                              <div style=" float:right">
                                <h5>[ <a href="account.php">&laquo; {l t='Back to Account'}</a> ]</h5>
                              </div>
                     </div>
                     <div class="con">
                              <div > <form action="?f=change" method="post" name="form1">
                                <table width="100%" border="0">
                                  <tr>
                                    <td height="30">{l t='Your Current Email Address (Login name)'}</td>
                                    <td>{$var_currentemail}</td>
                                  </tr>
                                  <tr>
                                    <td height="5">&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td height="30">{l t='Current Password'}</td>
                                    <td><input name="old_password" type="password" id="old_password" size="40" /></td>
                                  </tr>
                                  <tr>
                                    <td height="5">&nbsp; </td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td height="30">{l t='New Password'}</td>
                                    <td><input name="password" type="password" id="password" size="40" /></td>
                                  </tr>
                                  <tr>
                                    <td height="5">&nbsp; </td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td height="30">{l t='Confirm New Password'}</td>
                                    <td><input name="rpassword" type="password" id="rpassword" size="40" /></td>
                                  </tr>
                                  <tr>
                                    <td height="5"><p>&nbsp;</p>
                                    </td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td height="30">&nbsp;</td>
                                    <td>
                                        <input type="submit" name="button" id="button" value="    {l t='Change'}    " />                                    </td>
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