{include file="header.tpl"}
<!--Main Start-->
<div id="main">
    <div class="container">
        <br/>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">{l t='Write a Review'}</h3>
            </div>
            <div class="panel-body">
                <form class="form-horizontal" action="../search.php" method="get">
                    <div class="form-group">
                        <label for="biz_name" class="col-md-4 control-label">
                            {if $smarty.const._MULTI_SEARCH_ENABLE_}
                                {l t='Search'}
                            {else}
                                {l t='Search Business'}
                            {/if}
                        </label>
                        <div class="col-md-4">
                            <input class="form-control" name="searchtext" type="text" id="biz_name" size="30" />
                            <input name="f" type="hidden" id="f" value="review" />
                        </div>
                        <div class="col-md-4">
                            <em>{l t='e.g. McDonald\'s.'}<br />
                                {l t='Or Leave Empty to list all.'}</em>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="biz_name" class="col-md-4 control-label">
                            {l t='Near'}
                        </label>
                        <div class="col-md-8">
                            <label>
                                <select class="form-control" name="city">
                                    <option value="" selected>{l t='All Cities'}</option>
                                    {$get_getcitylist}
                                </select>
                            </label>
                            <div class="clearfix"></div>
                            <br/>
                            <label>
                                <input class="btn button-blue" type="submit" value="     {l t='Look it Up'}      " name="Submit" />
                            </label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">{l t='Add Business'}</h3>
            </div>
            <div class="panel-body text-center">
                <h3>{l t='A business which isn\'t listed'} ?</h3>
                <a href="../new.php" class="btn button-blue">{l t='Add Business'}</a>
            </div>
        </div>
    </div>
</div>
<!--Main End-->
{include file="footer.tpl"}