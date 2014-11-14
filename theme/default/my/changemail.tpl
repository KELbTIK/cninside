{include file="header.tpl"}
<script type="text/javascript" src="/theme/{$get_theme}/js/changemail.js"></script>
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/7026.css" />


 <!--Main Start-->  
 
 <div id="main">
     <div class="content">
			<div class="left">
                  	<div class="con" style="height:25px;">
                   	          <div style="float:left"><h3>{l t='Manage Email Address'}</h3>
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
                                    <td height="30">{l t='New Email Address'}</td>
                                    <td><input name="changeto" type="text" id="changeto" size="40" onclick="clearw()" /></td>
                                  </tr>
                                  <tr>
                                    <td height="5">&nbsp;</td>
                                    <td>
                                    <span id="err1" style="color:red; background-color:#Ffc">{l t='Email Format Error!'}</span>                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="30">{l t='Re-type New Email Address'}</td>
                                    <td><input name="again" type="text" id="again" size="40" onclick="clearw()"  /></td>
                                  </tr>
                                  <tr>
                                    <td height="5"><p>&nbsp;</p>
                                    </td>
                                    <td><span id="err2" style="color:red; background-color:#Ffc">{l t='Two times are not the same!'}</span></td>
                                  </tr>
                                  <tr>
                                    <td height="30">&nbsp;</td>
                                    <td>
                                        <input type="button" name="button" id="button" value="    {l t='Change'}    " onclick="verify()" />                                    </td>
                                  </tr>
                                </table>
                                <script type="text/javascript" language="javascript">
								document.getElementById('err1').style.display='none';
								document.getElementById('err2').style.display='none';
								</script>
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