<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Generator" content="MeePlace {$smarty.const._VERSION_}" />
<script src="/theme/{$get_theme}/js/menu.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/citychoice.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/jquery.scrollTo-1.3.3.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/jquery.localscroll-1.2.5.js" type="text/javascript" ></script>
<script src="/theme/{$get_theme}/js/jquery.serialScroll-1.2.1.js" type="text/javascript" ></script>
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/biz_detail.css" />
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/mgt/body/css/common.css" />
</head>
{literal}
<style type="text/css">
* { margin:0; padding:0; }
body,td,th {	font-family: Arial, Helvetica, sans-serif; font-size: 12px;	color: #000000;}
body {margin:0; padding:0; }


.box{ float:left; padding:0; border:1px #ccc solid; position:relative;}
.box  h2 {
border-bottom:1px solid #CCCCCC;
display:block;
font-size:18px;
font-weight:normal;
padding:0 0 10px 10px;
}

.change{ background:url(../images/box-bg.gif) repeat-x #EBEBEB; }


.coner{ position:absolute; height:5px; width:5px; display:block;}

 .c1{ background:url(../images/left-top-corner.gif) no-repeat; top:-1px; left:-1px;}
 .c2{ background:url(../images/right-top-corner.gif) no-repeat; top:-1px; right:-1px;}
 .c3{ background:url(../images/left-bot-corner.gif) no-repeat; bottom:-1px; _bottom:-12px;  left:-1px;}
 .c4{ background:url(../images/right-bot-corner.gif) no-repeat; bottom:-1px; _bottom:-12px;  right:-1px; _right:-2px;}
.blue { margin:0; width:99.6%; padding:0}
.blue h1{ margin:0 }
th{ background:#f0f7fe}
td, th{ border-top:1px  #BEE3FE solid; padding:5px;}
</style>

<script language="JavaScript">
<!--

/***********************************************
* Required field(s) validation v1.10- By NavSurf
* Visit Nav Surf at http://navsurf.com
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/

function formCheck(formobj){
    // Enter name of mandatory fields
{/literal}
    var fieldRequired = Array({$required_fields});
     
    // Enter field description to appear in the dialog box
    var fieldDescription = Array({$required_fields_name});
    // dialog message
    
    var alertMsg = "{$alertMsg}" + "\n";
    {literal} 
    var l_Msg = alertMsg.length;

    for (var i = 0; i < fieldRequired.length; i++){
        var obj = formobj.elements[fieldRequired[i]];
        if (obj){
            switch(obj.type){
            case "select-one":
                if (obj.selectedIndex == -1 || obj.options[obj.selectedIndex].text == ""){
                    alertMsg += " - " + fieldDescription[i] + "\n";
                }
                break;
            case "select-multiple":
                if (obj.selectedIndex == -1){
                    alertMsg += " - " + fieldDescription[i] + "\n";
                }
                break;
            case "text":
            case "textarea":
                if (obj.value == "" || obj.value == null){
                    alertMsg += " - " + fieldDescription[i] + "\n";
                }
                break;
            default:
            }
            if (obj.type == undefined){
                var blnchecked = false;
                for (var j = 0; j < obj.length; j++){
                    if (obj[j].checked){
                        blnchecked = true;
                    }
                }
                if (!blnchecked){
                    alertMsg += " - " + fieldDescription[i] + "\n";
                }
            }
        }
    }

    if (alertMsg.length == l_Msg){
        return true;
    }else{
        alert(alertMsg);
        return false;
    }
}
// -->
</script>
{/literal}
<body style="background:none;">
<div id="container">
 <!--Main Start-->  
  <div class="detail blue">
         <span class="coner c1b"></span>
        <span class="coner c2b"></span>
        <span class="coner c3b"></span>
        <span class="coner c4b"></span>
        <h1>{l t='Additional Info'} : {$var_bizname}</h1>
        {if $msg}
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p><center><h3>{$msg}</h3></center></p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p><center>[ <a href="#" onclick="parent.$.fn.fancybox.close(); return false">OK</a> ]</center></p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
        {else}
                <form id="fbusiness" method="post" action="" onsubmit="return formCheck(this)">
                <table style="width:100%; padding:0; margin:0; background:#f0f7fe;border:1px  #BEE3FE solid;" cellspacing="5px" id="features">
                {foreach from=$var_items item=i}
                <tr>
                <td align="right"><b>{l t=$i.title}{if $i.required == '1'}*{/if}</b>:</td>
                <td>
                {if $i.type eq 'radio'}
                        {foreach from=$i.value_array item=j} 
                        {if $j eq $i.chosen}
                        <input type="radio" checked="checked" name="iii_{$i.id}" value="{$j}" />{l t=$j} &nbsp;&nbsp;
                        {else}
                        <input type="radio" name="iii_{$i.id}" value="{$j}" />{l t=$j}&nbsp;&nbsp;
                        {/if}
                         {/foreach}
                
                {elseif $i.type eq 'checkbox'}
                
                        {foreach from=$i.value_array item=j} 
                            {foreach from=$i.chosen item=m}

                              {if $j eq $m} 
                                {assign var='checked' value='checked=\"checked\"'}                          
                               {/if}
                              {/foreach}
                               
                                <input type="checkbox" {$checked} name="ch_{$i.id}_{$j}" value="{$j}" />{l t=$j} &nbsp;&nbsp;                     
                                {assign var='checked' value=''}
                           
                         {/foreach}
                         <input type="hidden" name="ch_{$i.id}" value="" />
                
                {else}
                
               <input type="text" name="t_{$i.id}" value="{$i.chosen}" />
                         
                {/if}
                </td>
                </tr>
                {/foreach}
               
                <tr>
                <td colspan="2" align="center">
                <input type="hidden" value="{$var_biz_id}" name="business_id" /><div id="tssip" style="display:none"></div>
                <input type="submit" value="{l t='Submit'}" id="business_feature_submit" /></td>
                </tr>
                </table>
                </form>
                {l t='* Required Fields'}
          {/if}
        </div><!-- End .content .detail -->
 <!--Main End-->
 </div>
 </body>
 </html>