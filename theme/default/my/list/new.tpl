{include file="header.tpl"}

<script>
    var t_listnamecannotbeempty='{l t='List name cannot be empty!'}';
</script>

{literal}

<script type="text/javascript">
    function fillform(n,s){
        var d=document.postform;
        d.list_name.value=n;
        d.list_desc.value=s;
        d.btn.focus();
    }
    function veri(){
        var d=document.postform;
        d.list_name.value=d.list_name.value.replace(/(^\s*)|(\s*$)/g, "");
        if(d.list_name.value) d.submit();
        else{
            alert(t_listnamecannotbeempty);
            d.btn.disabled=false;
        }
    }
</script>
{/literal}
 <!--Main Start-->
<div id="main">
        <div class="content container">
            <div class="row">
                <div class="col-md-8 col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{l t='Create A New List'}</h3>
                            <h4>{l t='Show off your favorites. Choose one of the list ideas on the right, or come up with one of your own.'}</h4>
                        </div>
                        <div class="panel-body">
                            <form  class="form-horizontal" action="new.php?f=submit" method="post" name="postform" id="postform">
                                <div class="form-group">
                                    <label for="list_name" class="col-md-3 control-label">{l t='List Name'}</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="list_name" id="list_name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="list_desc" class="col-md-3 control-label">{l t='Description'}</label>
                                    <div class="col-md-9">
                                        <textarea class="form-control" name="list_desc" id="list_desc" rows="7"></textarea>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-3">
                                    </div>
                                    <div class="col-md-9">
                                        <input type="button" class="btn btn-primary col-md-2" name="btn" id="btn" value=" {l t='Create'} " onclick="this.disabled=true;veri();" >
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{l t='List Ideas'}</h3>
                            <h4>{l t='Try one of ours.'}</h4>
                        </div>
                        <div class="panel-body for_margin">
                            <!--loop-->
                            {foreach from=$var_list item=i}
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="radio" id="radio" value="radio" onclick="fillform('{$i.tempN}','{$i.tempD}')" >
                                        {$i.list_name}
                                    </label>
                                    <h4>{$i.list_desc}</h4>
                                    <br/>
                                </div>
                            {/foreach}
                            <!--/loop-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
 </div>
<!--Main End-->
{include file="footer.tpl"}
