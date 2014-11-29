{include file="header.tpl"}
<!--Main Start-->
<div id="main">
    <div class="container">
        <br/>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">{l t='Upload photo for %s' r=$var_biz.bizname}</h3>
            </div>
            <div class="panel-body">
                <form class="form-horizontal" action="?f=submit&id={$var_biz.id}" method="post" name="frm" id="frm" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="file" class="col-md-5 col-sm-5 col-xs-12 control-label">{l t='Attach Picture'}</label>
                        <div class="col-md-7 col-sm-7 col-xs-12">
                            <input type="file" name="file" id="file" >
                            <p class="help-block">(Type: JPEG GIF)</p>
                            <label>
                                <input type="button" name="button" id="button" value="{l t='Upload'}"  class="btn btn-primary" onclick="this.disabled=true;submit()"/>
                            </label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--Main End-->
{include file="footer.tpl"}