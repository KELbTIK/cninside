{include file="header.tpl"}
 <!--Main Start-->
 
 <div id="main">


<div class="content">
    <div class="left" style="padding-left:10px;">
    <div id="clear"></div>
    <div class="items">
    <span class="coner c1"></span>
    <span class="coner c2"></span>
    <span class="coner c3"></span>
    <span class="coner c4"></span>
    <!--loop-->
    {foreach from=$var_bestof item=i}
     <div class="per">
          <h2><a href="/{$smarty.const._CAT_DIR_}/{$i.catpermalink}/" >{$i.catname}</a></h2>
          {$i.reviewnum} {l t='reviews'}
          <div class="photoBox" style=" overflow:hidden; width:150px; height:100px;"><a href="/{$smarty.const._CAT_DIR_}/{$i.catpermalink}/" ><img src="/images/business/{$i.picurl}_150x95" /></a></div>
          <ol>
          {$i.bizli}
          </ol>
          <p align="right" style="padding-right:5px;"><a href="/{$smarty.const._CAT_DIR_}/{$i.catpermalink}/" class="Bbtn">{l t='More'}</a></p>
       </div>
       {/foreach}
    <!--/loop-->
	</div>
</div>
             <div class="right">
<div class="box catbox rightbox change">
             <span class="coner c1"></span>
            <span class="coner c2"></span>
            <span class="coner c3"></span>
            <span class="coner c4"></span>
               <h2>{l t='Browse by Category'}</h2>
               <ul>
                <li><a href="search.php">{l t='All Categories'}</a></li>
                {$var_category_li}
               </ul>
               </div>
               
                  <div class="box rightbox">
             <span class="coner c1"></span>
            <span class="coner c2"></span>
            <span class="coner c3"></span>
            <span class="coner c4"></span>
{$ads->getAdCode(4)}
</div>
             </div>
		</div>               
 </div>
 <!--Main End-->
 {include file="footer.tpl"}