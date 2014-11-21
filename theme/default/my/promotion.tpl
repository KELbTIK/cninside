{include file="header.tpl"}

<div id="container">
 <!--Main Start-->  
 
  <div id="main">
     <div class="content">
            
                      <div class="con" style="height:25px;">
                                 <div style="float:left">
                                   <h3>{l t='Claim Credit Points for'} {$var_user.fullname}</h3>
                              </div>
                              <div style=" float:right">
                                          
             <h5>[ <a href="account.php">&laquo; {l t='Back to Account'}</a> ]</h5> 
           
                              </div>
                     </div>
                     <div class="con">
                              <div >
                              
     {if $msg} {$msg}
     {else}
                <form action="/my/promotion.php" method="post" class="form">


                                <table width="100%" border="0">

                                  <tr>
                             <td height="20"><b>{l t='Member'}</b></td> <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td height="20">{$var_user.fullname} ({$var_user.email})</td>
                           </tr>
                           <tr>
                             <td height="20"><b>{l t='Promotional Code'}</b></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> 
                             <td height="20"><input type="text" name="code" id="code" /></td>
                           </tr>
                            
                            <tr>
                                    <td height="30">&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> 
                                    <td>
                                       <br /><br /> <input type="submit" name="button" id="button" class="trialBbtn" value="{l t='Claim Now'}" />                                      
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