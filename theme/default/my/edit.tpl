{include file="header.tpl"}

<script src="/theme/{$get_theme}/js/link.js" type="text/javascript"></script>
<script type="text/javascript" src="/theme/{$get_theme}/js/ajax.js"></script> 
<script src="/theme/{$get_theme}/js/edit.js" type="text/javascript"></script>

 <!--Main Start-->  
 
 <div id="main">
        <div class="content">
                       <div class="con" style="height:30px; padding-top:20px; padding-left:10px;" id="replyTitle">
            		    <h1>{l t='Edit your profile'}</h1>
        			  </div>
                        <form action="?f=send" method="post" name="form1" enctype="multipart/form-data">
                       <div class="con" style="   padding-top:20px; padding-left:70px;">
                       
                         <table width="100%" border="0">
                           <tr>
                             <td width="31%" height="20"><h2>{l t='Full Name'}:<span style="color:red;"></span></h2></td>
                             <td width="69%" height="20"><h2>{$var_me.firstname} {$var_me.lastname} 
                             
                             ({$var_me.email})
                             
                             </h2></td>
                           </tr>
                           <tr>
                             <td height="5"></td>
                             <td height="5">&nbsp;</td>
                           </tr>
                           <tr>
                             <td height="20"><h2>{l t='Nickname'}</h2></td>
                             <td height="20"><input name="nickname" type="text" id="nickname" value="{$var_me.nickname}" /></td>
                           </tr>
                           <tr>
                             <td height="5">&nbsp;</td>
                             <td height="5">
							{if $loginfail==3}
							 <span style="color:red; font-weight:bold; background-color:#FFC;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{l t='This nickname has already  been registered'}! &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							 {/if}
							 </td>
                           </tr>
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
                           
                           <tr>
                             <td height="20"><h2>{l t='Location'}</h2></td>
                             <td height="20"><span  id="ccity">{$var_me.city}, {$var_me.state} 
                             &nbsp; 
                             <a href="javascript:void(0);" onclick="$('#ccity').hide();$('#changecity').show();" class="Bbtn">{l t='Change'}</a></span>
                             <div id="changecity" style="display:none">
                             <select id="country" name="country" onChange="getCountry(this,'state')">
                                  <option value="">{l t='Select Country'}</option>
                                        {$var_country}
                             </select> - 
                             
                             <select id="state" name="state" onChange="getCat(this,'city')">
                                  <option value="">{l t='Select State'}</option>
                                </select> - <select name="city" id="city">
                              <option value="">{l t='Select City'}</option>
                            </select></div>
                             
                             </td>
                           </tr>
                                                      <tr>
                             <td height="5">&nbsp;</td>
                             <td height="5"></td>
                           </tr>

                           
                            <tr>
                             <td height="20"><h2>{l t='Zip Code'}</h2></td>
                             <td height="20"><input name="zip" type="text" id="zip"  value="{$var_me.zip}" /></td>
                           </tr>
                           <tr>
                             <td height="5">&nbsp;</td>
                             <td height="5"></td>
                           </tr>
                           <tr>
                             <td height="20"><h2>{l t='Gender'} </h2></td>
                             <td height="20"><input type="radio" value="1" name="gender"  id="male" style=" border:0;" {if $var_me.gender==1}checked="checked"{/if} />
                               <label for="male">{l t='Male'} </label>
                               <input type="radio" value="2" name="gender" id="female" style=" border:0;" {if $var_me.gender==2}checked="checked"{/if} />
                             <label for="female">{l t='Female'}</label></td>
                           </tr>
                           <tr>
                             <td height="5">&nbsp;</td>
                             <td height="5">&nbsp;</td>
                           </tr>
                           <tr>
                             <td height="20"><h2>{l t='Birthdate'} </h2></td>
                             <td height="20"><select name="month" id="month">
                               
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
                               <select name="day" id="day">
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
                               <select name="year" id="year">
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
                               </select></td>
                           </tr> <tr>
                            <td height="10">&nbsp;</td>
                            <td height="10"><h6><span id="err6" style="color:red; display:none">{l t='Birthday'}!</span></h6></td>
                          </tr>
                           <tr>
                             <td height="56"><h2>{l t='Photo'} </h2></td>
                             <td height="56"><table width="100%" border="0">
                               <tr>
                                 <td width="6%"><img src="../images/photos/{$var_me.picurl}_100x100" style="padding:1px; border:1px #ccc solid" /></td>
                                 <td width="94%"><!--<input type="file" name="file" id="file" />
{l t='(Type: JPEG GIF)'}--> <a href="./gallery.php?id={$var_me.user_id}" target="_blank"><strong>Select from gallery</strong></a> or <a href="./new_photo.php" target="_blank"><strong>Upload one to gallery first</strong></a>.</td>
                               </tr>
                             </table>
                             <label></label></td>
                           </tr>
                           <tr>
                             <td height="5">&nbsp;</td>
                             <td height="5"><!--<h6><em>{l t='If you don\'t want to change your photo, please leave it alone'}</em></h6>--></td>
                           </tr>
                         </table>
                 		 </div>
                          <div class="con" style="height:30px; padding-top:20px; padding-left:10px;">
            		    <h1>{l t='Tell everyone about yourself'}.</h1>
        			  </div>   
                 	   <div class="con" style=" border-bottom:0; padding-top:20px; padding-left:70px;">
                         <table width="100%" border="0">
                           <tr>
                             <td width="31%" height="20"><h3>{l t='Your Tagline'} </h3></td>
                             <td width="69%" height="20"><input name="headline" id="headline" value="{$var_me.headline}" size="50" /></td>
                           </tr>
                           <tr>
                             <td height="5"></td>
                             <td height="5"><h6>&nbsp;</h6></td>
                           </tr>
                           <tr>
                             <td height="20"><h3>{l t='Where You Can Find Me'}</h3></td>
                             <td height="20"><input name="findme" id="findme" value="{$var_me.findmein}" size="50" /></td>
                           </tr>
                           <tr>
                             <td height="5">&nbsp;</td>
                             <td height="5"><h6>&nbsp;</h6></td>
                           </tr>
                           <tr>
                             <td height="20"><h3>{l t='My Hometown'} </h3></td>
                             <td height="20"><input name="hometown" id="hometown" value="{$var_me.hometown}" size="50" /></td>
                           </tr>
                           <tr>
                             <td height="5"></td>
                             <td height="5"><h6>&nbsp;</h6></td>
                           </tr>
                           <tr>
                             <td height="20"><h3>{l t='Blog Or Website'} </h3></td>
                             <td height="20"><input name="website1" id="website1" value="{$var_me.blogurl}" size="50" /></td>
                           </tr>
                           <tr>
                             <td height="5">&nbsp;</td>
                             <td height="5"><h6>&nbsp;</h6></td>
                           </tr>
                           <tr>
                             <td height="20"><h3>{l t='When I\'m Not Golfing'} </h3></td>
                             <td height="20"><input name="not_yelping" id="not_yelping" value="{$var_me.notplanet}" size="50" /></td>
                           </tr>
                           <tr>
                             <td height="5">&nbsp;</td>
                             <td height="5"><h6>&nbsp;</h6></td>
                           </tr>
                           <tr>
                             <td height="20"><h3>{l t='Why My Reviews Are Good'}</h3></td>
                             <td height="20"><input name="review_comment" id="review_comment" value="{$var_me.reviewcomment}" size="50" />                               </td>
                           </tr>
                           <tr>
                             <td height="5">&nbsp;</td>
                             <td height="5"><h6>&nbsp;</h6></td>
                           </tr>
                           <tr>
                             <td height="20"><h3> {l t='Favorite Website'} </h3></td>
                             <td height="20"><input name="website2" id="website2" value="{$var_me.favweb}" size="50" /></td>
                           </tr>
                           <tr>
                             <td height="5">&nbsp;</td>
                             <td height="5"><h6>&nbsp;</h6></td>
                           </tr>
                           <tr>
                             <td height="20"><h3>{l t='Favorite Vacation Spot'}</h3></td>
                             <td height="20"><input name="book" id="book" value="{$var_me.book}" size="50" />                               </td>
                           </tr>
                           <tr>
                             <td height="5">&nbsp;</td>
                             <td height="5"><h6>&nbsp;</h6></td>
                           </tr>
                           <tr>
                             <td height="20"><h3>{l t='My First Concert'} </h3></td>
                             <td height="20"><input name="concert" id="concert" value="{$var_me.concert}" size="50" />                               </td>
                           </tr>
                           <tr>
                             <td height="5">&nbsp;</td>
                             <td height="5"><h6>&nbsp;</h6></td>
                           </tr>
                           <tr>
                             <td height="20"><h3>{l t='My Favorite Movie'} </h3></td>
                             <td height="20"><input name="movie" id="movie" value="{$var_me.movie}" size="50" />                               </td>
                           </tr>
                           <tr>
                             <td height="5">&nbsp;</td>
                             <td height="5"><h6>&nbsp;</h6></td>
                           </tr>
                           <tr>
                             <td height="20"><h3>{l t='I Wish I Could'}</h3></td>
                             <td height="20"><input name="meal" id="meal" value="{$var_me.meal}" size="50" />                               </td>
                           </tr>
                           <tr>
                             <td height="5">&nbsp;</td>
                             <td height="5"><h6>&nbsp;</h6></td>
                           </tr>
                           <tr>
                             <td height="20"><h3>{l t='Favorite Course'}</h3></td>
                             <td height="20"><input name="do_not_tell" id="do_not_tell" value="{$var_me.donottell}" size="50" />                              </td>
                           </tr>
                           <tr>
                             <td height="5">&nbsp;</td>
                             <td height="5"><h6>&nbsp;</h6></td>
                           </tr>
                           <tr>
                             <td height="20"><h3>{l t='Favorite Food'}</h3></td>
                             <td height="20"><input name="discovery" id="discovery" value="{$var_me.discovery}" size="50" />                              </td>
                           </tr>
                           <tr>
                             <td height="5">&nbsp;</td>
                             <td height="5"><h6>&nbsp;</h6></td>
                           </tr>
                           <tr>
                             <td height="20"><h3>{l t='Favorite Golfer'}</h3></td>
                             <td height="20"><input name="current_crash" id="current_crash" value="{$var_me.currentcrash}" size="50" />                               </td>
                           </tr>
                           <tr>
                             <td height="5">&nbsp;</td>
                             <td height="5"><h6>&nbsp;</h6></td>
                           </tr>
                           <tr>
                             <td height="48"><h3>&nbsp;</h3></td>
                             <td height="48"><label>
                               <input type="button" class="Bbtn" name="button" id="button" value="  {l t='Update'} &gt;&gt;  " onclick="restore(); verify();" />
                             </label></td>
                           </tr>
                         </table>

                  </div>
             </form>
   </div>
                
 </div>
 <!--Main End-->
 
 {include file="footer.tpl"}