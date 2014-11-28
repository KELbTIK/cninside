<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Generator" content="MeePlace {$smarty.const._VERSION_}" />
<script src="/theme/{$get_theme}/js/menu.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/citychoice.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/jquery.scrollTo-1.3.3.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/jquery.localscroll-1.2.5.js" type="text/javascript" ></script>
<script src="/theme/{$get_theme}/js/jquery.serialScroll-1.2.1.js" type="text/javascript" ></script>
<link href="/theme/{$get_theme}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/theme/{$get_theme}/css/style.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/biz_detail.css" />
</head>
{literal}

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
<body>
<div id="container container">
    <div class="row">
        <!--Main Start-->
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">{l t='Additional Info'} : {$var_bizname}</h3>
            </div>

                {if $msg}
                    <div class="panel-body">
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <h3 class="text-center">{$msg}</h3>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p class="text-center">[ <a href="javascript:parent.jQuery.fancybox.close();">OK</a> ]</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                    </div>
                {else}
                    <form id="fbusiness" method="post" action="" onsubmit="return formCheck(this)" class="form-horizontal list-group">
                        <ul class="list-group" style="margin-bottom: 0" id="features">
                            {foreach from=$var_items item=i}
                                <li class="list-group-item-info">
                                    <div align="right"><b>{l t=$i.title}{if $i.required == '1'}*{/if}</b>:</div>
                                    <div>
                                        {if $i.type eq 'radio'}
                                            {foreach from=$i.value_array item=j}
                                                <div class="radio">
                                                    {if $j eq $i.chosen}
                                                        <label><input type="radio" checked="checked" name="iii_{$i.id}" value="{$j}" />{l t=$j}</label>
                                                    {else}
                                                        <label><input type="radio" name="iii_{$i.id}" value="{$j}" />{l t=$j}</label>
                                                    {/if}
                                                </div>
                                            {/foreach}

                                        {elseif $i.type eq 'checkbox'}
                                            {foreach from=$i.value_array item=j}
                                                {foreach from=$i.chosen item=m}
                                                    {if $j eq $m}
                                                        {assign var='checked' value='checked=\"checked\"'}

                                                    {/if}
                                                {/foreach}
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" {$checked} name="ch_{$i.id}_{$j}" value="{$j}" />{l t=$j}
                                                    </label>
                                                    {assign var='checked' value=''}
                                                </div>
                                            {/foreach}
                                            <input type="hidden" name="ch_{$i.id}" value="" />
                                        {else}
                                            <input class="form-control" type="text" name="t_{$i.id}" value="{$i.chosen}" />
                                        {/if}
                                    </div>
                                </li>
                            {/foreach}

                            <li class="list-group-item">
                                <div class="text-center">
                                    <input type="hidden" value="{$var_biz_id}" name="business_id" />
                                    <div id="tssip" style="display:none"></div>
                                    <input type="submit" value="{l t='Submit'}" id="business_feature_submit" class="btn btn-primary" />
                                </div>
                            </li>
                        </ul>
                    </form>
                    {l t='* Required Fields'}
                {/if}

        </div>
        <!-- End .content .detail -->
    </div>
    <!--Main End-->
</div>
</body>
</html>