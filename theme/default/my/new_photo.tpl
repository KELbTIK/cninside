{include file="header.tpl"}
<!--Main Start-->
<div id="main">
    <div class="content container">
        <div class="row">
            <div class="col-sm-8 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title pull-left">{l t='Upload my new photo'}</h3>
                        <div id="btns" class="pull-right">
                            <a href="./gallery.php?id={$var_me.user_id}" class="btn btn-danger red_link btn-xs">
                                <i class="fa fa-reply"></i>
                                {l t='Back to Gallery'}
                            </a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-body">

                        <form action="?f=submit" method="post" name="frm" id="frm" enctype="multipart/form-data" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-4 text-right">{l t='Attach Picture'}</label>
                                <div class="col-sm-8">
                                    <input type="file" name="file" id="file" />
                                    (Type: JPEG GIF)
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <input type="button" name="button" id="button" value="{l t='Upload'}" class="btn btn-primary" onclick="this.disabled=true;submit()"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 hidden-xs">
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