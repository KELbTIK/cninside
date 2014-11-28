{include file="header.tpl"}
 <!--Main Start-->
 
<div id="main">
    <div class="content container">
        <div class="row">
            <div class="col-sm-8 col-xs-12">
                <div id="slider" class="con box change">
                    TEST1
                </div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        TEST2
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-xs-12" >
                <div class="panel panel-default">
                    <div class="panel-body">
                        <a href="new.php" class="btn button-blue">{l t='Add New Blog'}</a>
                    </div>
                </div>
                <div class="text-center hidden-xs">
                    <p align="center">
                        {$ads->getAdCode(8)}
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Main End-->
{include file="footer.tpl"}