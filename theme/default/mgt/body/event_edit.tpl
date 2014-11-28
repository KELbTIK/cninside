<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="Generator" content="MeePlace {$smarty.const._VERSION_}" />
    <script src="/theme/{$get_theme}/js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="/theme/{$get_theme}/js/ajax.js" type="text/javascript"></script>
    <script src="/theme/{$get_theme}/mgt/body/js/biz.js" type="text/javascript"></script>
    <link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/biz_detail.css" />
    <link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/doc/styles/main.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/example/ui.core.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/example/ui.theme.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/example/css/timecntr/jquery-ui-1.7.1.custom.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/src/jquery.ptTimeSelect.css" media="screen" />
    <link href="/theme/{$get_theme}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/theme/{$get_theme}/css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="JavaScript" src="/theme/{$get_theme}/js/pt/src/jquery.ptTimeSelect.js"></script>
</head>

{literal}
    <style type="text/css">
        th{ background:#f0f7fe}
    </style>
    <script>
        /*
        var currentPermalink;


        function validate_permalink(permalink)
        {
            $('#biz_permalink').attr('disabled','disabled');
            $.post("/biz/biz_validate_ajax.php?"+Math.random(), {
                    f:'ajax_validatepermalink',
                    permalink:permalink
                    },function(data){
                            $('#biz_permalink').val(data.permalink);
                            $('#biz_permalink').removeAttr('disabled');
                            if(data.duplicate==1 && permalink!=currentPermalink) $('#biz_permalink_tips').slideDown();
                            else{
                                $('#biz_permalink_img').show();
                                $('#biz_permalink_tips').slideUp()
                                }
                    },"json");
        }
        */
    </script>
{/literal}

<body>
<div id="container">
<!--Main Start-->
    <div class="panel panel-info">
        <div class="panel-heading">
            <div class="panel-title text-center">
                {l t='Edit event '}{$var_event.bizname}
            </div>
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
            </div>
        {else}
            <form action="event_edit.php?id={$smarty.get.id}" method="post" class="form-horizontal list-group">
                <ul class="list-group" style="margin-bottom: 0">
                    <li class="list-group-item">
                        <label class="col-sm-3 control-label">{l t='Event name'}</label>
                        <div class="col-sm-8">
                            <input class="form-control" type="text" name="event_name" value="{$var_event.event_name}" />
                        </div>
                        <div class="clearfix"></div>
                    </li>

                    <li class="list-group-item">
                        <label class="col-sm-3 text-right">{l t='Submitter'}</label>
                        <div class="col-sm-8">
                            {$var_submitter.name} ({$var_submitter.email})
                        </div>
                        <div class="clearfix"></div>
                    </li>

                    <li class="list-group-item">
                        <label class="col-sm-3 control-label">{l t='Start'}</label>
                        <div class="col-sm-9 row">
                            <div class="col-sm-4">
                                <select class="form-control" name="monthF">{$var_date_from.monthoption}</select>
                            </div>
                            <div class="col-xs-12 visible-xs"><br/></div>
                            <div class="col-sm-4">
                                <select class="form-control" name="dayF">{$var_date_from.dayoption}</select>
                            </div>
                            <div class="col-xs-12 visible-xs"><br/></div>
                            <div class="col-sm-4">
                                <select class="form-control" name="yearF">{$var_date_from.yearoption}</select>
                            </div>
                            <div class="col-sm-12 col-xs-12 visible-xs visible-sm"><br/></div>
                            <div class="col-sm-4">
                                <select class="form-control" id="hourF" name="hourF">{$var_date_from.houroption}</select>
                            </div>
                            <div class="col-xs-12 visible-xs"><br/></div>
                            <div class="col-sm-4">
                                <select class="form-control" id="minuteF" name="minuteF">{$var_date_from.minuteoption}</select>
                            </div>
                            <div class="col-xs-12 visible-xs"><br/></div>
                            <div class="col-sm-4">
                                <select class="form-control" id="ampmF" name="ampmF">{$var_date_from.ampmoption}</select>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </li>

                    <li class="list-group-item">
                        <label class="col-sm-3 control-label">{l t='End'}</label>
                        <div class="col-sm-9 row">
                            <div class="col-sm-4 col-xs-12">
                                <select class="form-control" name="monthT">{$var_date_to.monthoption}</select>
                            </div>
                            <div class="col-xs-12 visible-xs"><br/></div>
                            <div class="col-sm-4 col-xs-12">
                                <select class="form-control" name="dayT">{$var_date_to.dayoption}</select>
                            </div>
                            <div class="col-xs-12 visible-xs"><br/></div>
                            <div class="col-sm-4 col-xs-12">
                                <select class="form-control" name="yearT">{$var_date_to.yearoption}</select>
                            </div>
                            <div class="col-sm-12 col-xs-12 visible-xs visible-sm"><br/></div>
                            <div class="col-sm-4">
                                <select class="form-control" id="hourT" name="hourT">{$var_date_to.houroption}</select>
                            </div>
                            <div class="col-xs-12 visible-xs"><br/></div>
                            <div class="col-sm-4">
                                <select class="form-control" id="minuteT" name="minuteT">{$var_date_to.minuteoption}</select>
                            </div>
                            <div class="col-xs-12 visible-xs"><br/></div>
                            <div class="col-sm-4">
                                <select class="form-control" id="ampmT" name="ampmT">{$var_date_to.ampmoption}</select>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </li>

                    <li class="list-group-item">
                        <label class="col-sm-3 text-right">{l t='Category'}</label>
                        <div class="col-sm-8">
                            <div id="cattd1">{$var_event.cat_name} &nbsp; &nbsp; <a href="javascript:void(0);" onclick="$('#cattd1').hide();$('#catchange1').show();">{l t='Change'}</a></div>
                            <div id="catchange1" style="display:none">
                                <select class="form-control" id="cat" name="cat">
                                    <option value="{$var_event.cat_id}">=={$var_event.cat_name}==</option>
                                    {$var_cat}
                                </select>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </li>

                    <li class="list-group-item">
                        <label class="col-sm-3 control-label">{l t='Where'}</label>
                        <div class="col-sm-8">
                            <input class="form-control" type="text" name="where" value="{$var_event.where}"/>
                        </div>
                        <div class="clearfix"></div>
                    </li>

                    <li class="list-group-item">
                        <label class="col-sm-3 control-label">{l t='Event Site URL'}</label>
                        <div class="col-sm-8">
                            <input class="form-control" type="text" name="site_url" value="{$var_event.site_url}"/>
                        </div>
                        <div class="clearfix"></div>
                    </li>

                    <li class="list-group-item">
                        <label class="col-sm-3 control-label">{l t='Ticket URL'}</label>
                        <div class="col-sm-8">
                            <input class="form-control" type="text" name="ticket_url" value="{$var_event.ticket_url}"/>
                        </div>
                        <div class="clearfix"></div>
                    </li>

                    <li class="list-group-item">
                        <label class="col-sm-3 control-label">{l t='Price'}</label>
                        <div class="col-sm-8 row">
                            <div class=" col-sm-3 col-xs-12">
                                <input class="form-control" type="text" name="priceFrom" value="{$var_event.priceFrom}"/>
                            </div>
                            <div class="col-sm-1 col-xs-12 text-center">-</div>
                            <div class="col-sm-3 col-xs-12">
                                <input class="form-control" type="text" name="priceTo" value="{$var_event.priceTo}" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </li>

                    <li class="list-group-item">
                        <label class="col-sm-3 text-right">{l t='State'} / {l t='City'}</label>
                        <div class="col-sm-8">
                            <div id="locationtd">
                                {if $var_event.c_name}{$var_event.c_name} / {/if} {if $var_event.province_name && $var_event.c_name != $var_event.province_name}{$var_event.province_name} / {/if} {$var_event.city_name} &nbsp; &nbsp;<a href="javascript:void(0);" onclick="$('#locationtd').hide();$('#locationchange').show();">{l t='Change'}</a>
                            </div>
                            <div id="locationchange" style="display:none">
                                <select class="form-control" id="country" name="country" onChange="getCountry2(this,'state')">
                                    <option value="{$var_biz.c_id}">=={$var_event.c_name}==</option>
                                    {$var_country}
                                </select><br/>
                                <select class="form-control" id="state" name="state" onChange="getState2(this,'biz_city')">
                                    <option value="{$var_event.province_id}">=={$var_event.province_name}==</option>
                                </select><br/>
                                <select class="form-control" name="location" id="biz_city">
                                    <option value="{$var_event.city_id}">=={$var_event.city_name}==</option>
                                </select>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </li>

                    <li class="list-group-item">
                        <label class="col-sm-3 control-label">{l t='What/Why'}</label>
                        <div class="col-sm-8">
                            <textarea name="whatwhy" class="form-control" rows="5"">{$var_event.whatwhy}</textarea>
                        </div>
                        <div class="clearfix"></div>
                    </li>

                    <li class="list-group-item">
                        <div class="col-sm-offset-3 col-sm-8">
                            <input class="btn btn-primary" type="button" value="  {l t='Submit Changes'}  " onclick="this.disabled=true; form.submit()" />

                        </div>
                        <div class="clearfix"></div>
                    </li>
                </ul>

                <!--
                <table class="table table_margin_bottom" cellspacing="0" border="0" cellpadding="0">
                    <!--
                	 <tr>
                	    <th width="30%">{l t='Permalink'}</th>
                	    <td width="70%">
                	    <span id="permalinkdiv">http://{$smarty.const._DOMAIN_}/{$smarty.const._BIZ_DIR_}/{$var_event.permalink} &nbsp;&nbsp; <a href="javascript:void(0)" onclick="$('#permalinkdiv').hide();$('#editpermalinkdiv').show(); currentPermalink='{$var_event.permalink|escape:"quotes"}'">{l t='Click to Edit'}</a></span>
                	    <label id="editpermalinkdiv" style="display:none;">
                	    http://{$smarty.const._DOMAIN_}/{$smarty.const._BIZ_DIR_}/
                	    <input name="permalink" id="biz_permalink"  onclick="$('#biz_permalink_tips').hide();$('#biz_permalink_img').hide()"  onblur="validate_permalink(this.value)" style="width:80px" value="{$var_event.permalink}" />
                	    <img src="/theme/{$smarty.const._THEME_}/images/b_success.png" border="0" style="display:none;vertical-align:bottom;" id="biz_permalink_img" /></label>
                	    <table width="100%" cellpadding="0" cellspacing="0"  id="biz_permalink_tips" style=" display:none;">
                	    <tr>
                	    <td>
                	    <span>{l t='This permalink name had been taken'}<br />{l t='because a same business name found in our site'}.<br />{l t='You may add a number or street name to it'}.<br />{l t='e.g. McDonald\'s2 or McDonald\'s(WallStreet)'}</span>
                	    </td>
                	    </tr></table>
                	    </td></tr>
                        -->

                    <!--
                    	<tr>
                    	<th>{l t='Owner'}<input type="hidden" value="{$var_owner.user_id}" id="ownerid" name="ownerid" /></th>
                    	<td id="ownertd">{$var_owner.name} ({$var_owner.email}) &nbsp; &nbsp; <a href="javascript:void(0)" onclick="$('#ownerid').val('0');$('#ownertd').html('NA') ">{l t='Assign to nobody'}</a></td>
                    	</tr>
                    	-->


                    <!--
                	<tr>
                	  <th>{l t='Category'} 2</th>
                	  <td id="cattd2">
                      {if $var_event.catid2==0}
                      NA
                      {else}
                      {$var_event.catname2} / {$var_event.subcatname2}
                      {/if}
                       &nbsp; &nbsp;<a href="javascript:void(0);" onclick="$('#cattd2').hide();$('#catchange2').show();">{l t='Change'}</a></td>
                      <td id="catchange2" style="display:none">
                      <select id="dhtmlgoodies_country2" name="dhtmlgoodies_country2" onChange="getCat(this,'dhtmlgoodies_city2')">
                        <option value="{$var_event.catid2}">=={$var_event.catname2}==</option>
                        <option value="0">==Delete to be NA==</option>
                              {$var_cat}
                      </select>&nbsp;&nbsp;
                      <select id="dhtmlgoodies_city2" name="dhtmlgoodies_city2">
                        <option value="{$var_event.subcatid2}">=={$var_event.subcatname2}==</option>
                      </select>
                      </td>
              	  </tr>
                	<tr>
                	  <th>{l t='Category'} 3</th>
                	  <td id="cattd3">
                      {if $var_event.catid3==0}
                      NA
                      {else}
                      {$var_event.catname3} / {$var_event.subcatname3}
                      {/if}
                       &nbsp; &nbsp;<a href="javascript:void(0);" onclick="$('#cattd3').hide();$('#catchange3').show();">{l t='Change'}</a></td>
                      <td id="catchange3" style=" display:none">
                      <select id="dhtmlgoodies_country3" name="dhtmlgoodies_country3" onChange="getCat(this,'dhtmlgoodies_city3')">
                        <option value="{$var_event.catid3}">=={$var_event.catname3}==</option>
                        <option value="0">==Delete to be NA==</option>
                              {$var_cat}
                      </select>&nbsp;&nbsp;
                      <select id="dhtmlgoodies_city3" name="dhtmlgoodies_city3">
                        <option value="{$var_event.subcatid3}">=={$var_event.subcatname3}==</option>
                      </select>
                      </td>
              	  </tr> -->


                    <!--
                    <tr>
                      <th>{l t='Zip Code'}</th>
                      <td><input type="text" name="zip" value="{$var_event.zip}" style="width:95%;"/></td>
                    </tr>
                    <tr>
	                	<th>{l t='Phone'}</th>
                        <td><input type="text" name="phone" value="{$var_event.phone}" style="width:95%;"/></td>
                    </tr>
                    <tr>
                      <th>{l t='Website'}</th>
                      <td><input type="text" name="web" value="{$var_event.web}" style="width:95%;"/></td>
                    </tr>
                    <tr>
                      <th>{l t='Video URL'}</th>
                      <td><input type="text" name="video" value="{$var_event.video_url}" style="width:95%;"/></td>
                    </tr>




                    <tr>
                      <th>{l t='Price Range'}</th>
                      <td>
                      	<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr>
                        <td style="border:0"><label><input type="radio" name="pricerange" value="0" {if $var_event.price_range==0}checked="checked"{/if}/>&nbsp; &nbsp;{l t='NA'}</label></td>
                        <td style="border:0"><label><input type="radio" name="pricerange" value="1" {if $var_event.price_range==1}checked="checked"{/if}/>&nbsp; &nbsp;{l t='$'}</label></td>
                        <td style="border:0"><label><input type="radio" name="pricerange" value="2" {if $var_event.price_range==2}checked="checked"{/if}/>&nbsp; &nbsp;{l t='$$'}</label></td>
                        <td style="border:0"><label><input type="radio" name="pricerange" value="3" {if $var_event.price_range==3}checked="checked"{/if}/>&nbsp; &nbsp;{l t='$$$'}</label></td>
                        <td style="border:0"><label><input type="radio" name="pricerange" value="4" {if $var_event.price_range==4}checked="checked"{/if}/>&nbsp; &nbsp;{l t='$$$$'}</label></td>
                        </tr></table>
                      </td>
                    </tr> -->

                    <!--
                    <tr>
                      <th>{l t='Business Cover Image'}</th>
                      <td><img src="/images/business/{$var_event.picurl}_100x100" style="vertical-align:middle" /> &nbsp; &nbsp;<a href="business_cover.php?id={$var_event.id}" onclick="if(confirm('You are going to Business Images Management Page without saving changes.\n\rSure to continue and abort changes?')==0) return false ;">{l t='Change Cover Image / Manage Images'}</a></td>
                    </tr>
                    <tr>
                      <th>{l t='Map Position'}</th>
                      <td><a href="../func/map.php?sheet=business&where=business_id&equal={$var_event.id}" onclick="if(confirm('You are going to Map Position Editing Page without saving changes.\n\rSure to continue and abort changes?')==0) return false ;">{l t='Adjust Map Position'}</a></td>
                    </tr>
                </table>
                -->

            </form>
        {/if}
        <!-- End .content .detail -->
    </div>

<!--Main End-->
</div>

<script>
 // $('#fromhour').ptTimeSelect();
 // $('#tohour').ptTimeSelect();
</script>
</body>
</html>