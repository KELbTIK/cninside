{include file="header.tpl"}
{literal}
<style type="text/css">
<!--
#main .content { padding:5px; margin:0 10px;}
#main .content .left { float:left; width:59%; border-right:1px #ccc solid; padding-right:10px;}
#main .content .right {float:left; width:38%; margin-left:10px;}
#main .content .con{  padding-top:10px; padding-bottom:10px;; border-bottom:#ccc 1px solid;}
-->
 </style>
 
{/literal}

 
 <div id="main">
        <div class="content" style="clear:both; margin-top:0px; padding-top:0px;">
					   <div class="box" style="height:auto; margin-top:5px; padding:5px; width:99%;">
        <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
            		    <h2>{l t='Invite Your Friends'}</h2>

{if $msg==''}
                        <form action="?f=send" method="post" name="form1">
                          <table cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tbody>
                              <tr>
                                <td width="50%"><table cellspacing="0" cellpadding="0" width="400" border="0">
                                    <tbody>
                                      
                                      <tr>
                                        <td>{l t='Email Address'}</td>
                                        <td width="5" rowspan="3"></td>
                                        <td>{l t='Full Name'} <em>{l t='(optional)'}</em></td>
                                      </tr>
                                      <tr>
                                        <td height="35"><label>
                                          <input size="27" name="email_1" />
                                        </label></td>
                                        <td height="35"><input size="27" name="fname_1" /></td>
                                      </tr>
                                      <tr>
                                        <td height="35"><input size="27" name="email_2" /></td>
                                        <td height="35"><input size="27" name="fname_2" /></td>
                                      </tr>
                                      <tr>
                                        <td height="35"><input size="27" name="email_3" /></td>
                                        <td></td>
                                        <td height="35"><input size="27" name="fname_3" /></td>
                                      </tr>
                                      <tr>
                                        <td height="35"><input size="27" name="email_4" /></td>
                                        <td></td>
                                        <td height="35"><input size="27" name="fname_4" /></td>
                                      </tr>
                                      <tr>
                                        <td height="35"><input size="27" name="email_5" /></td>
                                        <td></td>
                                        <td height="35"><input size="27" name="fname_5" /></td>
                                      </tr>
                                      <tr>
                                        <td colspan="3" height="35" style="display:none;"><a href="#">Or, paste a list of email   addresses</a></td>
                                      </tr>
                                      <tr>
                                        <td bgcolor="#999999" colspan="3" height="1"></td>
                                      </tr>
                                      <tr>
                                        <td colspan="3" height="10"></td>
                                      </tr>
                                      <tr>
                                        <td colspan="3"><div align="justify" style="display:none;">You can also invite friends using your   Gmail, Hotmail, Yahoo or AOL address book.<a href="#"> Invite mail contacts</a></div></td>
                                      </tr>
                                      <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                      </tr>
                                    </tbody>
                                </table></td>
                          <td width="50%" valign="top"><table cellspacing="0" cellpadding="0" border="0">
                                    <tbody>
                                      <tr>
                                        <td></td>
                                      </tr>
                                      <tr>
                                        <td><p align="justify">{l t='Here is what we\'ll send to your friends to invite them - edit or remove the message below.'}</p></td>
                                      </tr>
                                      <tr>
                                        <td><table cellspacing="0" cellpadding="0" width="408" bgcolor="#ffffdd" border="0">
                                            <tbody>
                                              <tr>
                                                <td width="7" rowspan="2"></td>
                                                <td width="401" height="40">Hi [name], </td>
                                              </tr>
                                              <tr>
                                                <td><label>
                                                  <textarea name="subject" rows="8" wrap="virtual" cols="55">{l t='Have you heard about %s? Check it out:' r=$smarty.const._SITENAME_}
http://{$smarty.const._DOMAIN_}
- {$var_me.name}</textarea>
                                                </label></td>
                                              </tr>
                                            </tbody>
                                        </table></td>
                                      </tr>
                                      <tr>
                                        <td height="50" align="center" valign="center" >
                       <input type="submit" value="{l t='Send Invite'}" onclick="this.disabled=true;form.submit();" /></td>
</tr>
                                    </tbody>
                                </table></td>
                              </tr>
                            </tbody>
                          </table>
                        </form>
                        
      {else}

                        <div class="con" align="center">
                    <h1>&nbsp;</h1>
                    <h1>&nbsp;</h1>
                    <h1>&nbsp;</h1>
                    <h1></h1>
                    <h1>{$msg}</h1>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                  </div>
{/if}
                        
                        
                        
          </div>
   </div>
 </div>
 <!--Main End-->
  {include file="footer.tpl"}