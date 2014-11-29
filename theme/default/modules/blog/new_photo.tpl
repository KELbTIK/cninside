{include file="header.tpl"}
 <!--Main Start-->  
<div id="main">
    <div class="content container">
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">{l t='Upload photo for %s' r=$var_biz.bizname}</h3>
                </div>
                <div class="panel-body">
                    <form action="?f=submit&id={$var_biz.bizid}" method="post" name="frm" id="frm" enctype="multipart/form-data" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-4 text-right">{l t='Attach Picture'}</label>
                            <div class="col-sm-8">
                                <input type="file" name="file" id="file" />
                                (Type: JPEG GIF)
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <input type="button" name="button" id="button" value="{l t='Upload'}"  class="btn btn-primary" onclick="this.disabled=true;submit()"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
 <!--Main End-->
 {include file="footer.tpl"}