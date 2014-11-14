{include file="header.tpl"}

<script src="../../theme/{$get_theme}/js/ajax.js" language="javascript" type="text/javascript"></script>
<script src="../../theme/{$get_theme}/js/link.js" type="text/javascript"></script>
<script type="text/javascript" src="/theme/{$get_theme}/js/login.js"></script>
{literal}
<script type="text/javascript" language="javascript">
//==================CATEGORY===============
var ajax = new Array();
function getCat2(sel)
{
	var countryCode = sel.options[sel.selectedIndex].value;
	var id=document.getElementById('dhtmlgoodies_country').value;
	document.getElementById('dhtmlgoodies_city').options.length = 0;
	if(countryCode.length>0){
		var index = ajax.length;
		ajax[index] = new sack();
		
		ajax[index].requestFile = 'getcat.php?cat='+id;	
		ajax[index].onCompletion = function(){ createCities2(index) };	
		ajax[index].runAJAX();
	}
}
function createCities2(index)
{
	var obj = document.getElementById('dhtmlgoodies_city');
	eval(ajax[index].response);
}
</script>
<script type="text/javascript" language="javascript">
function veri()
{
if(!document.postform.topic.value)
{alert("Please input Topic Name"); return false;}
if(!document.postform.dhtmlgoodies_city.value)
{alert("Please select a Subcategory"); return false;}
if(!document.postform.content.value)
{alert("Please input content"); return false;}

document.postform.btn.disabled=true;
return true;
}
</script>
<style type="text/css">
<!--
#main .content { padding:5px; margin:0 10px;}
#main .content .left { float:left; width:20%; padding-right:10px;}
#main .content .right {float:left; width:77%; padding-left:10px; }
#main .content .con{  padding-top:10px; padding-bottom:10px;; border-bottom:#ccc 1px solid;}
#main .content .con ul{list-style:none; padding:0; margin:0; margin-left:5px; margin-right:5px;}
#main .content .con ul li {float:left; width:260px;}
-->
 </style>
{/literal}
 
 <div id="main">

        <div class="content">
				<div class="left">
                 <div class="con box" style=" width:100%;">
<span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
                    <!-- START 160x600 Code -->
<p align="center">
 	{$ads->getAdCode(7)}
</p>
<!-- END Code -->
                    
                  </div> 
   	      </div>
                
                <div class="right" >
					      <div class="con box" style=" padding:5px; width:99%;">
                          <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
            		    <h2>{l t='New Posting'}</h2>
                           <form action="?f=submit" method="post" name="postform" id="postform" onsubmit="return veri()" enctype="multipart/form-data">
                             <table width="100%" border="0" align="center" cellspacing="12">
                               <tr>
                                 <td width="14%"><div align="right"><strong>{l t='Posting Title'}:</strong></div></td>
                           <td width="86%"><label>
                                   <input name="topic" style="width:400px;font-family:Verdana; font-size:12px; border:1px #ccc solid;" id="topic" />
                                 </label></td>
                               </tr>
                               <tr>
                                 <td><div align="right"><strong>{l t='Category'}</strong></div></td>
                                 <td><select id="dhtmlgoodies_country" name="dhtmlgoodies_country" onchange="getCat2(this)">
                                   <option value="">{l t='Select Category'}</option>
                                  {$get_cat}

                                 </select>
                                   &nbsp;&nbsp;
                                   <select id="dhtmlgoodies_city" name="dhtmlgoodies_city" onfocus="this.style.backgroundColor='#fff'">
                                     <option value="">{l t='Select Subcategory'}</option>
                                   </select></td>
                               </tr>
                               <tr>
                                 <td><div align="right"><strong>{l t='Location'}</strong></div></td>
                                 <td>
<select id="country" name="country" onChange="getCountry_event(this,'state');">
                  <option value="">{l t='Select Country'}</option>
                        {$var_country}
                </select> - 
                 <select id="state" name="state" onChange="getCat(this,'location');">
                  <option value="">{l t='Select State'}</option>
                
                </select> - <select name="location" id="location">
                  <option value="">{l t='Select City'}</option>
                </select>
                                 </td>
                               </tr>
                               <tr>
                                 <td><div align="right"><strong>{l t='Other Stuff'}</strong></div></td>
                                 <td><input type="checkbox" name="s1" id="s1" value="Telecommuting" />
                                   <label for="s1">{l t='Telecommuting'}</label>    
                                   <input type="checkbox" name="s2" id="s2" value="Part-time" />
                                   <label for="s2">{l t='Part-time'}</label>  
                                   <input type="checkbox" name="s3" id="s3" value="Contract" />
                                   <label for="s3">{l t='Contract'}</label>     
                                   <input type="checkbox" name="s4" id="s4" value="Non-profit" />
                                   <label for="s4">{l t='Non-profit'}</label>
                                   <br /> 
                                   <input type="checkbox" name="s5" id="s5" value="Organization" />
                                   <label for="s5">{l t='Organization'}</label>  
                                   <input type="checkbox" name="s6" id="s6" value="Internship" />
                                 <label for="s6">{l t='Internship'}</label>
                                 <input type="checkbox" name="s7" id="s7" value="Dogs" />
                                 <label for="s7">{l t='Dogs'}</label></td>
                               </tr>
                               <tr>
                                 <td><div align="right"><strong>{l t='Permissions'}</strong></div></td>
                                 <td><input type="checkbox" name="f1" id="f1" value="Direct contact by recruiters is ok" />
                                   <label for="f1">{l t='Direct contact by recruiters is ok'}</label>  
                                   <br /> 
                                   <input type="checkbox" name="f2" id="f2" value="Phone calls to you about this job are ok" />
                                   <label for="f2">{l t='Phone calls to you about this job are ok'}</label>
                                   <br /> 
                                   <input type="checkbox" name="f3" id="f3" value="Ok for others to contact you about other services, products or commercial interests" />
                                   <label for="f3">{l t='Ok for others to contact you about other services, products or commercial interests'}</label>
                                   <br />
                                   <input type="checkbox" name="f4" id="f4" value="Ok to highlight this job opening for persons with disabilities" />
                                   <label for="f4">{l t='Ok to highlight this job opening for persons with disabilities'}</label></td>
                               </tr>
                               <tr>
                                 <td valign="top"><div align="right"><strong>{l t='Description'}</strong></div></td>
                                 <td valign="top"><label>
                                   <textarea name="content" style="width:90%; height:180px; font-family:Verdana; font-size:12px; border:1px #ccc solid;" id="content"></textarea>
                                 </label></td>
                               </tr>
                               <tr>
                                 <td>{l t='Photo'}&nbsp;</td>
                                 <td><input type="file" name="file" id="file" />&nbsp;</td>
                               </tr>
                               <tr>
                                 <td>&nbsp;</td>
                                 <td>
                                     <input type="submit" class="Bbtn" name="btn" id="btn" value="{l t='Submit'}" />                                </td>
                               </tr>
                             </table>
                                       
                         </form>
                  </div>
                  </div>
        </div>
 </div>
 <!--Main End-->
 {include file="footer.tpl"}