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
#main .form-group input{margin-top: 1px;}
.for_padding{padding-top: 7px;}

#main .content .con ul{list-style:none; padding:0; margin:0; margin-left:5px; margin-right:5px;}
#main .content .con ul li {float:left; width:260px;}
-->
 </style>
{/literal}

<div id="main">
    <br/>
    <div class="container">
        <div class="row">
            <div class="col-md-3 text-center hidden-xs col-sm-3">
                <!-- START 160x600 Code -->
                <p align="center">
                    {$ads->getAdCode(7)}
                </p>
                <!-- END Code -->
            </div>

            <div class="col-md-9 col-sm-9" >
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='New Posting'}</h3>
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" action="?f=submit" method="post" name="postform" id="postform" onsubmit="return veri()" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="topic" class="col-md-2 col-sm-2 control-label">{l t='Posting Title'}</label>
                                <div class="col-md-7 col-sm-10">
                                    <input  type="text"  name="topic" class="form-control" id="topic">
                                </div>
                            </div>
                            <div class="clearfix"></div>

                            <div class="form-group">
                                <label for="dhtmlgoodies_country" class="col-md-2 col-sm-2 control-label">{l t='Category'}</label>
                                <div class="col-md-4 col-sm-5">
                                    <select class="form-control" id="dhtmlgoodies_country" name="dhtmlgoodies_country" onchange="getCat2(this)">
                                        <option value="">{l t='Select Category'}</option>
                                        {$get_cat}
                                    </select>
                                </div>
                                <div class="hidden-lg hidden-md hidden-sm">
                                    <br/>
                                </div>
                                <div class=" col-md-4 col-sm-5">
                                    <select class="form-control" id="dhtmlgoodies_city" name="dhtmlgoodies_city">
                                        <option value="">{l t='Select Subcategory'}</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="country" class="col-md-2 col-sm-2 control-label">{l t='Location'}</label>
                                <div class="col-md-3 col-sm-4">
                                    <select class="form-control" id="country" name="country" onChange="getCountry_event(this,'state');">
                                        <option value="">{l t='Select Country'}</option>
                                        {$var_country}
                                    </select>
                                </div>
                                <div class="hidden-lg hidden-md hidden-sm">
                                    <br/>
                                </div>
                                <div class="col-md-3 col-sm-3">
                                    <select class="form-control" id="state" name="state" onChange="getCat(this,'location');">
                                        <option value="">{l t='Select State'}</option>
                                    </select>
                                </div>
                                <div class="hidden-lg hidden-md hidden-sm">
                                    <br/>
                                </div>
                                <div class="col-md-3 col-sm-3">
                                    <select class="form-control" name="location" id="location">
                                        <option value="">{l t='Select City'}</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">
                                    {l t='Other Stuff'}
                                </label>
                                <div class="row col-md-10 col-sm-9">
                                    <div class="col-md-12 col-sm-12 checkbox">
                                        <label >
                                            <input type="checkbox" name="s1" id="s1" value="Telecommuting">
                                            {l t='Telecommuting'}
                                        </label>
                                    </div>
                                    <div class="col-md-12 col-sm-12 checkbox">
                                        <label>
                                            <input type="checkbox" name="s2" id="s2" value="Part-time">
                                            {l t='Part-time'}
                                        </label>
                                    </div>
                                    <div class="col-md-12 col-sm-12 checkbox">
                                        <label >
                                            <input type="checkbox" name="s3" id="s3" value="Contract">
                                            {l t='Contract'}
                                        </label>
                                    </div>
                                    <div class="col-md-12 col-sm-12 checkbox">
                                        <label>
                                            <input type="checkbox" name="s4" id="s4" value="Non-profit">
                                            {l t='Non-profit'}
                                        </label>
                                    </div>
                                    <div class="col-md-12 col-sm-12 checkbox">
                                        <label >
                                            <input type="checkbox" name="s5" id="s5" value="Organization">
                                            {l t='Organization'}
                                        </label>
                                    </div>
                                    <div class="col-md-12 col-sm-12 checkbox">
                                        <label>
                                            <input type="checkbox" name="s6" id="s6" value=Internship">
                                            {l t='Internship'}
                                        </label>
                                    </div>
                                    <div class="col-md-12 col-sm-12 checkbox">
                                        <label>
                                            <input type="checkbox" name="s7" id="s7" value="Dogs">
                                            {l t='Dogs'}
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">{l t='Permissions'}</label>
                                <div class="row col-md-10 col-sm-9">
                                    <div class="col-md-12 col-sm-12 checkbox">
                                        <label>
                                            <input type="checkbox" name="f1" id="f1" value="Direct contact by recruiters is ok">
                                            {l t='Direct contact by recruiters is ok'}
                                        </label>
                                    </div>
                                    <div class="col-md-12 col-sm-12 checkbox">
                                        <label>
                                            <input type="checkbox"  name="f2" id="f2" value="Phone calls to you about this job are ok">
                                            {l t='Phone calls to you about this job are ok'}
                                        </label>
                                    </div>
                                    <div class="col-md-12 col-sm-12 checkbox">
                                        <label>
                                            <input type="checkbox"  name="f3" id="f3" value="Ok for others to contact you about other services, products or commercial interests">
                                            {l t='Ok for others to contact you about other services, products or commercial interests'}
                                        </label>
                                    </div>
                                    <div class="col-md-12 col-sm-12 checkbox">
                                        <label>
                                            <input type="checkbox" name="f4" id="f4" value="Ok to highlight this job opening for persons with disabilities">
                                            {l t='Ok to highlight this job opening for persons with disabilities'}
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="content" class="col-md-2 col-sm-2 control-label">{l t='Description'}</label>
                                <div class="col-md-6 col-sm-10 for_padding">
                                    <textarea class="form-control" name="content"  id="content" rows="5"></textarea>
                                </div>
                            </div>



                            <div class="form-group">
                                <label for="file" class="col-md-2 col-sm-2 control-label ">{l t='Photo'}</label>
                                <div class="col-md-6 col-sm-10 for_padding">
                                    <input type="file" name="file" id="file" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="btn" class="col-md-2 col-sm-2 control-label"></label>
                                <div class="col-md-10 col-sm-6">
                                    <input type="submit" class="btn button-blue col-md-2 col-sm-5 col-xs-6" name="btn" id="btn" value="{l t='Submit'}" >
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
 </div>
 <!--Main End-->
 {include file="footer.tpl"}