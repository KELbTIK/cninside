{include file="header.tpl"}
{literal}

<script>
function veri()
{
if(!document.postform.event_name.value)
{
alert('Please input event name');
return false;	
}
document.postform.btn.disabled=true;
return true;
}

</script>

{/literal}

<!--Main Start-->  

<div id="main">
    <div class="content container">
        <div class="row">
            <div class="col-sm-8 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='Add New Blog'}</h3>
                    </div>
                    <div class="panel-body">
                        <form action="?f=submit" method="post" name="postform" onSubmit="return veri()" id="postform" enctype="multipart/form-data" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">{l t='Blog Title'}</label>
                                <div class="col-sm-8">
                                    <input class="form-control" name="blog_title" type="text" id="blog_title" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <input type="submit" class="btn btn-primary" name="btn" id="btn" value="   {l t='Submit'} " />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 hidden-xs" >
                <div class="text-center">
                    <p align="center">
                        {$ads->getAdCode(5)}
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Main End-->
{include file="footer.tpl"}