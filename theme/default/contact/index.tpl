{include file="header.tpl"}
{literal}
<style type="text/css">
<!--
#main .content { padding:5px; margin:0 10px;}
#main .content .left { float:left; width:61%; padding-right:10px;}
#main .content .right {float:left; width:36%; margin-left:10px;}
#main .content .con{  padding-top:10px; padding-bottom:10px;; border-bottom:#ccc 1px solid;}
#contactForm { padding-left:20px;}
-->
</style>
{/literal}

<div id="main">

<div class="content">
<div class="left">

{if $var_f!='info'}
<div class="con box" style=" height:490px; padding:5px; width:98%;">
<span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
<h2>{l t='Contact us'}</h2>
<form action="?f=send" method="post">
<div id="contactForm">
<p>{l t='For feedback us, please fill out the form below:'}</p>
<p id="topics-paragraph">
<label>{l t='Topic'}</label>
<br />
<select id="topic" name="topic">
<option value="Unselected" selected="selected">{l t='Select topic'}</option>
<option>{l t='Advertise'}</option>
<option>{l t='Bugs'}</option>
<option>{l t='Business Development'}</option>
<option>{l t='Duplicate business listing'}</option>
<option>{l t='Employment'}</option>
<option>{l t='Help me use'}</option>
<option>{l t='Ideas to improve'}</option>
<option>{l t='New categories suggestion'}</option>
<option>{l t='Out of date business listing'}</option>
<option>{l t='Press'}</option>
<option>{l t='Suggest a Business Listing'}</option>
<option>{l t='Questionable content'}</option>
<option>{l t='Other'}</option>
</select>
</p>
<p id="subtopic-paragraph">
<label>{l t='Your name'} </label>
<br />
<input id="contact-name" name="contact_name" />
</p>
<p id="email-paragraph">
<label>{l t='Your email address'} </label>
<br />
<input id="contact_email" maxlength="64" name="contact_email" />
</p>
<p id="comments-paragraph">
<label>{l t='Comments'} </label>
<br />
<textarea id="comments" name="comments" rows="10" cols="40"></textarea>
</p>
<p id="submit-paragraph">
<input type="submit" name="button" id="button" value="       {l t='Submit'} &gt;&gt;       " onclick="this.disabled=true;form.submit();" />
<br />
</p>
</div>
</form>

</div>
{else}
<div class="con" align="center" style="border:0;">
<h1>&nbsp;</h1>
<h1>&nbsp;</h1>
<h1>&nbsp;</h1>
<h1>{l t='Thank you for contacting us!'}</h1>
<h1>{l t='We will reply your feedback soon!'}</h1>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</div>
{/if}

</div>

<div class="right" >
<div class="con box" style="height:auto; padding:10px; ">
           <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
<!-- START 300x300 Code -->
<p align="center">
{$ads->getAdCode(10)}
</p>
<!-- END Code -->

</div> 
</div>

</div>
</div>
<!--Main End-->
 {include file="footer.tpl"}
