{include file="header.tpl"}
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/7026.css" />
 {literal}
 <script language="javascript" type="text/javascript">  
function get(nothing,page,opt)
{
    if(!opt)
    {document.form1.page.value=page;
    nav();}
    else
    {
        $('#cmt').animate({'opacity':0.3},"fast",function(){
        $.get("./comment.php", { page: page, id:id},function(data){
                           $('#cmt').empty();
                           $('#cmt').append(data);
                           $('#cmt').animate({'opacity':1},"fast");
                                                             });
        });
    }
}

///////////////////////////////
function nav()
{
var d=document.form1;
var page=d.page.value;


location='?page='+page;
}

</script>
 {/literal} 
 <!--Main Start-->  
 
 <div id="main">
     <div class="content">
            <div class="left">
                      <div class="con" style="height:25px;">
                                 <div style="float:left">
                                   <h3>{l t='Payments'}</h3>
                              </div>
                              <div style=" float:right">
                                <h5>[ <a href="account.php">&laquo; {l t='Back to Account'}</a> ]</h5>
                              </div>
                     </div>
                     <div class="con">
                              <div > 

<!--loop-->
{if $var_paymentlists.found}
<form id="form1" name="form1">
<input name="page" type="hidden" id="page" value="1" />
<table class="listing1"><tr class="header">
    <th align="center">{l t='ID'}</td>
    <th align="center">{l t='Description'}</td>
    <th align="center">{l t='Amount'}</td>
    <th align="center">{l t='Paid Date'}</td>
</tr>
{foreach from=$var_paymentlist item=i}
<tr><td>{$i.txn_txn_id}</td>
<td>{$i.txn_description} {if $i.txn_business_id} ({l t='Business ID'}: {$i.txn_business_id}){/if}</td>
<td>{$i.txn_amount_paid}</td>
<td>{$i.txn_date}</td>
 </tr>
{/foreach}
</table>
</form>
<!--/loop--> 
        <div style="float:left; margin-top:20px;">{l t='Show'} {$var_paymentlists.limitfrom} {l t='to'} {$var_paymentlists.limitto} / {$var_paymentlists.itemsnum} {l t='items'}.</div>
        {/if}
        {if !$var_paymentlists.found}
        <br id="clear"/><br/><br><br><center>
          {l t='No result found'}.</center><br><br><br>
        {else}
            {$var_paymentlists.pager}
        {/if}
                              </div>
              </div>
            </div>
                
            <div class="right" >
              <div class="con" style=" padding-left:10px; text-align:center;">
               <p align="center">
     {$ads->getAdCode(3)}
    </p>

              </div>
          </div>

    </div>
 </div>
 <!--Main End-->
 {include file="footer.tpl"}