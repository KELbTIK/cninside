{include file="header.tpl"}

{literal}
<style type="text/css">
<!--


-->
 </style>
<script type="text/javascript" language="javascript">
function veri()
{
if(!document.postform.topic.value)
{alert("Please input Topic Name"); return false;}
if(!document.postform.content.value)
{alert("Please input content"); return false;}
document.postform.btn.disabled=true;
return true;
}
</script>
 {/literal}

<div id="main">
    <br/>
    <div class="container">
        <div class="row">
            <div class="col-md-3 text-center hidden-xs col-sm-3">
                <!-- START 160x600 Code -->
                <p align="center">
                    {$ads->getAdCode(7)}
                </p>
                <!-- END Code -->
            </div>

            <div class="col-md-9 col-sm-9" >

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='New Conversation'}</h3>
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" action="?f=submit" method="post" name="postform" onsubmit="return veri();" id="postform">
                            <div class="form-group">
                                <label for="topic" class="col-md-3 col-sm-3 control-label">{l t='Topic'}</label>
                                <div class="col-md-6 col-sm-9">
                                <input  type="text"  name="topic" class="form-control" id="topic" placeholder="Enter topic">
                                </div>
                            </div>
                            <div class="clearfix"></div>

                            <div class="form-group">

                                <label class="col-md-3 col-sm-3 control-label">{l t='Category'}</label>
                                <div class="col-md-9 col-sm-9">
                                    <ul class="list-unstyled list-conversation">
                                        {$get_cat}
                                    </ul>
                                </div>
                            </div>

                            <div class="form-group">

                                <label for="content" class="col-md-3 col-sm-3 control-label">{l t='Content'}</label>
                                <div class="col-md-6 col-sm-9">
                                    <textarea  name="content"  id="content" class="form-control" rows="5"></textarea>
                                </div>
                            </div>

                            <div class="form-group text-center">
                                <input class="btn button-blue " type="submit" name="btn" id="btn" value="   {l t='Submit'} " />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Main End-->
{include file="footer.tpl"}