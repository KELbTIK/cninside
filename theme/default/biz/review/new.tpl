{include file="header.tpl"}
{literal}
<style type="text/css">
.box{width:895px; margin:5px 15px; padding:5px;}
</style>
{/literal}
 <!--Main Start-->  
 
 <div id="main">

        <div class="box">
    <span class="coner c1"></span>
    <span class="coner c2"></span>
    <span class="coner c3"></span>
    <span class="coner c4"></span>
					   <div class="con" >
            		    <h2>{l t='Write a Review'}</h2>
					  </div>
						<div class="con"> 
                        <form action="../search.php" method="get">
                        <table width="70%" border="0" align="center">
                      <tr>
                                <td width="25%" height="40"><h3>
            {if $smarty.const._MULTI_SEARCH_ENABLE_}
            		{l t='Search'}
            	{else}
            		{l t='Search Business'}
            {/if}</h3></td>
<td width="35%">
                                  <input name="searchtext" type="text" id="biz_name" size="30" />
                                <input name="f" type="hidden" id="f" value="review" />                                </td>
                                <td width="40%"><em>{l t='e.g. McDonald\'s.'}<br />
                                  {l t='Or Leave Empty to list all.'}</em></td>
                          </tr>
                              <tr>
                                <td height="40"><h3>{l t='Near'} </h3></td>
                              <td><label>
                                  <select name="city">
                                  <option value="" selected>{l t='All Cities'}</option>
                                    {$get_getcitylist}
                                  </select>
                                </label></td>
                                <td><em></em></td>
                              </tr>
                              <tr>
                                <td height="53">&nbsp;</td>
  <td><label>
                                  <input type="submit" value="     {l t='Look it Up'} &gt;&gt;     " name="Submit" />
                                </label></td>
                                <td>&nbsp;</td>
                              </tr>
                        </table>
                          </form>
          </div>
          </div>
          <div class="box">
    <span class="coner c1"></span>
    <span class="coner c2"></span>
    <span class="coner c3"></span>
    <span class="coner c4"></span>
					    <h2>{l t='Add Business'}</h2>
						<div class="con">
                                <div align="center" style="height:80px; padding-top:20px; ">
				    		  <h3>{l t='A business which isn\'t listed'} ?</h3>
                              <a href="../new.php" class="Bbtn">{l t='Add Business'}</a></div>
                        </div>
        </div>
 </div>
 <!--Main End-->
 {include file="footer.tpl"}