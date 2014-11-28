{include file="header.tpl"}
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
    <div class="content container">
        <div class="row">
            <div class="col-md-9 col-sm-9 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            {l t='Payments'}
                            <div class="pull-right">
                                <h5>[ <a href="account.php">&laquo; {l t='Back to Account'}</a> ]</h5>
                            </div>
                            <div class="clearfix"></div>
                        </h3>
                    </div>
                    <div class="panel-body">
                        <!--loop-->
                        {if $var_paymentlists.found}
                            <form id="form1" name="form1">
                                <input name="page" type="hidden" id="page" value="1" />
                                <table class="table table-striped table-hover">
                                    <tr class="header">
                                        <th align="center">{l t='ID'}</th>
                                        <th align="center">{l t='Description'}</th>
                                        <th align="center">{l t='Amount'}</th>
                                        <th align="center">{l t='Paid Date'}</th>
                                    </tr>
                                    {foreach from=$var_paymentlist item=i}
                                        <tr>
                                            <td>{$i.txn_txn_id}</td>
                                            <td>{$i.txn_description} {if $i.txn_business_id} ({l t='Business ID'}: {$i.txn_business_id}){/if}</td>
                                            <td>{$i.txn_amount_paid}</td>
                                            <td>{$i.txn_date}</td>
                                        </tr>
                                    {/foreach}
                                </table>
                            </form>
                            <!--/loop-->
                            <div class="col-sm-6 col-xs-12 page_number">{l t='Show'} {$var_paymentlists.limitfrom} {l t='to'} {$var_paymentlists.limitto} / {$var_paymentlists.itemsnum} {l t='items'}.</div>
                        {/if}
                        {if !$var_paymentlists.found}
                            <div class="clearfix"></div>
                            <div class="text-center">{l t='No result found'}</div>
                        {else}
                            <div class="col-xs-12 text-right text-xs-right">{$var_paymentlists.pager}</div>
                        {/if}
                        <div class="clearfix"></div>
                    </div>
                </div>

            </div>

            <div class="col-md-3 col-sm-3 hidden-xs" >
                <div class="text-center">
                    <p align="center">
                        {$ads->getAdCode(3)}
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Main End-->
{include file="footer.tpl"}