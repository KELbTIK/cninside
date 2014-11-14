{include file="header_admin.tpl"}
<link href="/theme/{$get_theme}/mgt/body/css/common.css" rel="stylesheet" />
<script type="text/javascript" src="/theme/{$get_theme}/mgt/body/js/common.js?100510"></script>
<script type="text/javascript" src="/theme/{$get_theme}/mgt/body/js/basic.js?100510"></script>
<script type="text/javascript" src="/theme/{$get_theme}/mgt/body/js/mail.js?100511"></script>
<script type="text/javascript" src="/theme/{$get_theme}/mgt/body/js/map.js?100510"></script>
<script type="text/javascript" src="/theme/{$get_theme}/mgt/body/js/city.js?100510"></script>
<script type="text/javascript" src="/theme/{$get_theme}/mgt/body/js/admin.js?100510"></script>
<script type="text/javascript" src="/theme/{$get_theme}/mgt/body/js/md5.js?100510"></script>
<script type="text/javascript" src="/theme/{$get_theme}/mgt/body/js/user.js?100510"></script>
<script type="text/javascript" src="/theme/{$get_theme}/mgt/body/js/category.js?100510"></script>
<script type="text/javascript" src="/theme/{$get_theme}/mgt/body/js/noti.js?100510"></script>
<script type="text/javascript" src="/theme/{$get_theme}/mgt/body/js/biz.js?100510"></script>
<script type="text/javascript" src="/theme/{$get_theme}/mgt/body/js/ad.js?100510"></script>
<script type="text/javascript" src="/theme/{$get_theme}/mgt/body/js/fancybox/jquery.fancybox-1.2.6.pack.js?100510"></script>
<script type="text/javascript" src="/theme/{$get_theme}/mgt/body/js/colorpicker/jquery.vreboton.colorpicker.js?100510"></script>
<link href="/theme/{$get_theme}/mgt/body/js/colorpicker/jquery.vreboton.colorpicker.css?100510" rel="stylesheet" />
<script type="text/javascript" src="/inc/ckeditor/ckeditor.js?100510"></script>
<script type="text/javascript" src="/inc/ckeditor/sample.js?100510"></script>
<link href="/theme/{$get_theme}/mgt/body/js/fancybox/jquery.fancybox-1.2.6.css" rel="stylesheet" />

 <!--Main Start-->  
 <div id="main">
 <input type="hidden" name="url" id="url" value="body/" />
      <input type="hidden" name="page" id="page" value="1" />
      <input type="hidden" name="q" id="q" />
      <input type="hidden" name="f" id="f" />
 	<div id="m">
    {include file="mgt/menu.tpl"}
    </div>
    <div id="sr">
   </div>
   <div id="wait" class="con"><br><br><br><br><br><img src="/theme/{$get_theme}/images/ajax-loader6.gif"> <br /> <br />Please wait...</div>
   <div id="tips"></div>
    <script>nav();</script>
    <div id="clear"></div>
 </div>
 <!--Main End-->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script> 
{include file="footer.tpl"}