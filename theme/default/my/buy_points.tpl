{include file="header.tpl"}
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/7026.css" />

<div id="container">
 <!--Main Start-->  
 
  <div id="main">
     <div class="content">
            
                      <div class="con" style="height:25px;">
                                 <div style="float:left">
                                   <h3>{l t='Buy Credit Points for'} {$var_user.fullname}</h3>
                              </div>
                              <div style=" float:right">
                                          
             <h5>[ <a href="account.php">&laquo; {l t='Back to Account'}</a> ]</h5> 
           
                              </div>
                     </div>
                     <div class="con">
                              <div >
                              
     {if $smarty.const._PAYPAL_ENABLE_ && $paypal_pricing}

                {if $smarty.const._PAYPAL_TESTMODE_}
                <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" class="form">
                {else}
                <form action="https://www.paypal.com/cgi-bin/webscr" method="post" class="form"> 
                {/if}
                <input type="hidden" name="cmd" value="_xclick">
                <input type="hidden" name="business" value="{$smarty.const._PAYPAL_EMAIL_}">
                <input type="hidden" name="notify_url" value="http://{$smarty.const._DOMAIN_}/paypal-ipn-point.php" />
                <input type="hidden" name="item_name" value="{l t='Credit Points'}">
                <input type="hidden" name="item_number" value="{$var_user.user_id}">
                <input type="hidden" name="no_shipping" value="1">
                <input type="hidden" name="no_note" value="1">
                <input type="hidden" name="currency_code" value="USD">
                <input type="hidden" name="lc" value="US">
                <input type="hidden" name="bn" value="PP-BuyNowBF">
                <input type="hidden" name="return" value="{$var_user.link}" />

                                <table width="100%" border="0">

                                  <tr>
                             <td height="20"><b>{l t='Member'}</b></td> <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td height="20">{$var_user.fullname} ({$var_user.email})</td>
                           </tr>
                           <tr>
                             <td height="20"><b>{l t='Amount'}</b></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> 
                             <td height="20">{$paypal_pricing}</td>
                           </tr>
                            
                            <tr>
                                    <td height="30">&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> 
                                    <td>
                                       <br /><br /> <input type="submit" name="button" id="button" class="trialBbtn" value="{l t='Pay Now'}" />                                       
                                       </td>
                                  </tr>
                                </table>
                              
                                </form> {/if}
                              </div>
             
            </div>


    </div>
 </div>
 
 <br /> <br />  <br />  <br /> 
 
 {include file="footer.tpl"}