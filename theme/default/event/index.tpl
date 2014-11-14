{include file="header.tpl"}
{literal}
<style type="text/css">
<!--
#main .content { padding:5px; margin:0 10px;}
#main .content .left { float:left; width:72%; _width:71%; padding-right:10px;}
#main .content .right {float:left; width:25.5%; margin-left:10px; _overflow:hidden;}
#main .content .con{  padding-top:10px; padding-bottom:10px;; border-bottom:#ccc 1px solid; float:left; width:100%;}

ul.navigation {    list-style: none;    margin: 0;    padding: 0;    padding-bottom: 9px;}
ul.navigation li {	font-family:Arial, Helvetica, sans-serif;    display: inline;	margin:0;    padding-right: 5px;	padding-left:5px;	border-left:1px solid #999;}
#slider {    position: relative;  margin-bottom:10px;}
.scroll { margin-left:10px; height: 260px;    width: 98%;    overflow: auto;    overflow-x: hidden;    position: relative;    clear: left;    background: scroll left bottom;}
.scrollContainer div.panel {    padding-right:10px;    height: auto;    width: 630px;	font-size:12px;	line-height:18px;}
.panel .item {width:50%; float:left;}
.incon {width:98%; float:left; 1border-bottom:px #ccc dashed; padding:5px;}
.right .item{ margin-left:10px;}
.eventTitleComment{ font-size:11px;}
-->
 </style>
{/literal}

 <!--Main Start-->
 
 <div id="main">

        <div class="content" style=" float:left; width:97%;">
				<div class="left">
                       <div id="slider" class="con box change" style=" padding:5px;">
                       <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
            		    <h2>{l t='Popular Events'}
                        <em class="eventTitleComment">{l t='Events which have highest interested rate.'}</em></h2>
                        <ul class="navigation">
                        	{l t='See Events For:'}
                          <li style="border:0;"><a href="javascript:;">{l t='Today'}</a></li>
                          <li><a href="javascript:;">{l t='Tomorrow'}</a></li>
                          <li><a href="javascript:;">{l t='This Weekend'}</a></li>
                          <li><a href="javascript:;">{l t='This Week'}</a></li>
                          <li><a href="javascript:;">{l t='Next Week'}</a></li>
                          <li><a href="javascript:;">{l t='This Month'}</a></li>
                        </ul>
                        <div class="scroll">
    			            <div class="scrollContainer">
  				              <div class="panel">
<!--loop-->
 {foreach from=$var_today item=i}
  <div class="item">
            <div style="float:left; padding-top:8px; width:33%;"><div class="photoBox"><img src="../images/event/{$i.picurl}_100x100" width="100" height="100" /></div></div>
            <div style="float:left; padding-left:5px; width:63%; padding-right:5px;">
             <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
             <h4>{$i.date}<br />{$i.whatwhy}<br /> <em>{$i.reviewsnum} {l t='reviews'}</em></h4>
    </div>
</div>
{/foreach}
<!--loop-->
<div style="float:right; clear:both;" >&raquo; <a href="search.php">{l t='See More Events'}...</a></div>
  				              </div>
                               <div class="panel">
<!--loop-->
 {foreach from=$var_tomorrow item=i}
  <div class="item">
            <div style="float:left; padding-top:8px; width:33%;"><div class="photoBox"><img src="../images/event/{$i.picurl}_100x100" width="100" height="100" /></div></div>
            <div style="float:left; padding-left:5px; width:63%; padding-right:5px;">
             <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
             <h4>{$i.date}<br />{$i.whatwhy}<br /> <em>{$i.reviewsnum} {l t='reviews'}</em></h4>
    </div>
</div>
{/foreach}
<!--loop-->
<div style="float:right;clear:both;">&raquo; <a href="search.php">{l t='See More Events'}...</a></div>
</div>
<div class="panel">
<!--loop-->
 {foreach from=$var_thisweekend item=i}
  <div class="item">
            <div style="float:left; padding-top:8px; width:33%;"><div class="photoBox"><img src="../images/event/{$i.picurl}_100x100" width="100" height="100" /></div></div>
            <div style="float:left; padding-left:5px; width:63%; padding-right:5px;">
             <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
             <h4>{$i.date}<br />{$i.whatwhy}<br /> <em>{$i.reviewsnum} {l t='reviews'}</em></h4>
    </div>
</div>
{/foreach}
<!--loop-->
                                        
      <div style="float:right;clear:both;">&raquo; <a href="search.php">{l t='See More Events'}...</a></div>
    </div>
    <div class="panel">
<!--loop-->
 {foreach from=$var_thisweek item=i}
  <div class="item">
            <div style="float:left; padding-top:8px; width:33%;"><div class="photoBox"><img src="../images/event/{$i.picurl}_100x100" width="100" height="100" /></div></div>
            <div style="float:left; padding-left:5px; width:63%; padding-right:5px;">
             <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
             <h4>{$i.date}<br />{$i.whatwhy}<br /> <em>{$i.reviewsnum} {l t='reviews'}</em></h4>
    </div>
</div>
{/foreach}
<!--loop-->
<div style="float:right;clear:both;">&raquo; <a href="search.php">{l t='See More Events'}...</a></div>
  				              </div>
                              <div class="panel">
  <!--loop-->
 {foreach from=$var_nextweek item=i}
  <div class="item">
            <div style="float:left; padding-top:8px; width:33%;"><div class="photoBox"><img src="../images/event/{$i.picurl}_100x100" width="100" height="100" /></div></div>
            <div style="float:left; padding-left:5px; width:63%; padding-right:5px;">
             <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
             <h4>{$i.date}<br />{$i.whatwhy}<br /> <em>{$i.reviewsnum} {l t='reviews'}</em></h4>
    </div>
</div>
{/foreach}
<!--loop-->
<div style="float:right;clear:both;">&raquo; <a href="search.php">{l t='See More Events'}...</a></div>
  				              </div>
                              <div class="panel">
  <!--loop-->
 {foreach from=$var_thismonth item=i}
  <div class="item">
            <div style="float:left; padding-top:8px; width:33%;"><div class="photoBox"><img src="../images/event/{$i.picurl}_100x100" width="100" height="100" /></div></div>
            <div style="float:left; padding-left:5px; width:63%; padding-right:5px;">
             <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
             <h4>{$i.date}<br />{$i.whatwhy}<br /> <em>{$i.reviewsnum} {l t='reviews'}</em></h4>
    </div>
</div>
{/foreach}
<!--loop-->

<div style="float:right;clear:both;">&raquo; <a href="search.php">{l t='See More Events'}...</a></div>
  				              </div>
                                </div>
                        </div>
                  	</div>   
                    <div class="con box" style=" padding:5px;">
        <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
       	        <h2>{l t='Popular Events This Week'}
                       <em class="eventTitleComment">{l t='Events which have the highest review rate this week.'}</em></h2>
  <!--loop-->
{foreach from=$var_hotthisweek item=i}
                        <div class="incon">
                        	<div style="padding-top:8px; float:left; width:21%;"><div class="photoBox"><img src="../images/event/{$i.picurl}_100x100" width="100" height="100" /></div>
                       	  </div>
                            <div style="float:left; width:78%;">
                              <h3><a href="detail.php?id={$i.id}">{$i.name} </a></h3>
                              {$i.date}<br />{$i.catname}<br />{$i.where}<br />
                               <h4>{$i.whatwhy}</h4>
                                <div style="float:left;"><em>{$i.reviewsnum} {l t='reviews'}</em></div><div style="float:right"><em>{l t='Submitted by:'} <a href="../my/?id={$i.userid}" target="_blank">{$i.username}</a></em></div>
                          </div>
                    	</div>
{/foreach}
<!--loop-->

                        <script src="../theme/{$get_theme}/js/coda-slider.js" type="text/javascript" ></script>
<div class="incon">
                        		<div style="float:left; padding-top:3px;"><a href="new.php" class="Bbtn">{l t='Add Event'}</a></div>
                        		<div style="float:right; padding-top:10px;">&raquo; <a href="search.php">{l t='See More Events'}...</a></div>
                      </div>
                    </div>
                </div>
				<div class="right" >
                  <div class="con box" style="height:auto; padding-top:10px;text-align:center; margin-bottom:10px;">
                          <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
        <a href="new.php" class="Bbtn">{l t='Add Event'}</a>              </div> 
                  <div class="con box" style=" padding:5px; width:95%;">
                          <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
                  <h2>{l t='Recently Added Events'}</h2>
  <!--loop-->
  {foreach from=$var_newevent item=i}
                                  <div id="clear"></div>
                                        <div class="item">
                                        		<div class="pic"><div class="photoBox"><img src="../images/event/{$i.picurl}_40x40" width="40" height="40" /></div></div>
                                                <div class="t"><h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>{$i.date}<br />{$i.whatwhy}</div>
                                        </div>
{/foreach}
                        <div class="incon">
                        		<div style="float:right; padding-top:10px;">&raquo; <a href="search.php">{l t='See More Events'}...</a></div>
                        </div>
                  </div>
                  <div class="con" style="text-align:center; border:0;"> 
                  
                  <p align="center">
 	{$ads->getAdCode(8)}
</p>
                  
                  </div>
          </div>

        </div>
 </div>
 <!--Main End-->
 {include file="footer.tpl"}