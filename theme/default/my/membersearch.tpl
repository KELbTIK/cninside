{include file="header.tpl"}
<script type="text/javascript">
var rank='{$rank}';
</script>
<script type="text/javascript" src="/theme/{$get_theme}/js/membersearch.js"></script>
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/7521.css" />
{literal}
<style type="text/css">
#sr .con{ border-bottom:1px #ccc dotted;}
</style>
{/literal}
 <!--Main Start-->  
 
 <div id="main">
		<div class="content">
				  <div class="con" style="height:auto; padding-left:10px; margin-bottom:10px;">
				  <h3>{l t='Member Search'}</h3>
						<form onsubmit="return false;">
                                <table cellspacing="0" cellpadding="0" width="920" border="0">
                                    <tbody>
                                      <tr>
                                        <td width="352">{l t='Keywords'}<br /></td>
                                        <td>&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td><label>
                                          <input size="50" name="name" id="search" />
                                        </label></td>
                                        <td width="389"><input type="button" value="{l t='Search'}" name="Submit"  onClick="get('','1')" /></td>
                                      </tr>
                                      <tr>
                                        <td height="20"><em>{l t='(e.g. New York or David)'} </em></td>
                                        <td height="20">&nbsp;</td>
                                      </tr>
                                    </tbody>
                                  </table>
                    </form>			</div>
                    
                    
                    
             <div class="left" style="padding-left:10px;">
             
         			{if $rank==''}
                    <h2>{l t='New Users List'}</h2>
                    {elseif $rank=='reviews_num'}
                    <h2>{l t='Top Reviewers List'}</h2>
                    {/if}
             
   			 <div id="sr"><div class="con" style="text-align:center; border:0;"><br />
   			     <br />
		         <br />
               <br />{l t='Search Keywords can be whatever from his/her name to his/her favorite movie'}...</br>
                 <br />
   			     <br />
   			     <br />
   			     <br />
   			     <br />
   			 </div></div>
          </div>  
             <div class="right" style="text-align:center;">
                <p align="center">
 	{$ads->getAdCode(3)}
</p>

             </div>
		</div>               
 </div>
 <!--Main End-->
 <script>
 get('','1');
 
 </script>
  {include file="footer.tpl"}
