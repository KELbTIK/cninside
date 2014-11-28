{include file="header.tpl"}
{literal}

<script>
function veri()
{
if(!document.postform.blog_title.value)
{
alert('Please input blog title');
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
                        <h3 class="panel-title">{l t='Blog'} : {$page_title}</h3>
                    </div>
                    <div class="panel-body">
                        CONTENT GOES HERE
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