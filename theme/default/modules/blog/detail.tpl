{include file="header.tpl"}
{literal}
<style type="text/css">
<!--
#main .content { padding:5px; margin:0 10px;}
#main .content .left {float:left; width:77%; }
#main .content .right { float:left; width:20%; margin-left:10px;}
#main .content .con{  padding-top:10px; padding-bottom:10px;; border-bottom:#ccc 1px solid;}
#main .content .con ul.cat{list-style:none; padding:0; margin:0; margin-left:5px; margin-right:5px;}
#main .content .con ul.cat li {float:left; width:260px; height:20px;}
td{ border-bottom:1px #ccc dashed;}
td p{padding:3px; margin:0;}
-->
</style>

<script>
function veri()
{
if(!document.postform.blog_title.value)
{
alert('Please input blog title');
return false;    
}
document.postform.btn.disabled=true;
return true;
}

</script>

{/literal}

<!--Main Start-->  

<div id="main">

<div class="content">
<div class="left">
<div class="con box" style=" padding:5px; ">
<h2>{l t='Blog'} : {$page_title}</h2>
<span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
CONTENT GOES HERE
</div>
</div>

<div class="right" >
<div class="con box" style="text-align:center; width:200px;">
<span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
<p align="center">
{$ads->getAdCode(5)}
</p>

</div> 
</div>
</div>
</div>
<!--Main End-->
 {include file="footer.tpl"}