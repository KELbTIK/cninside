<div>
    <h2>
        <a href="javascript:;" onclick="get(determinCatOrSub(),WCurPage,0);" class="btn btn-danger red_link">
            <i class="fa fa-reply"></i><span>{l t=' Back to List'}</span>
        </a>
        <br/><br/>
    </h2>


    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">{$var_topic.name}</h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <br/>
                <p class="text-left col-md-6">{l t='Category'}: {$var_topic.catname} / {$var_topic.subcatname}</p>
                <p class="text-right col-md-6"><a href="#bottom">{l t='Page Bottom'} &dArr;</a></p>
                {*<i class="fa fa-star"></i>*}
                {*<i class="fa fa-users"></i>*}

                <div class="col-md-12">
                    <div class="pull-left" id="pv">
                        <i class="fa fa-users"></i>&nbsp;{$var_author.friendsnum}&nbsp;<br />
                        <i class="fa fa-star"></i>&nbsp;{$var_author.reviewsnum}
                    </div>

                    <div class="pull-right" >
                        <img class="img-responsive" src="../images/photos/{$var_author.picurl}_40x40" width="40" height="40" >
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <a href="../my/?id={$var_author.id}">{$var_author.name}</a>{l t=' says'}:
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6 text-right">
                            {if $var_topic.edit_btn}
                                <a href="/mgt/func/select.php?sheet=deals&where=id&equal={$var_topic.id}&field=id,title,cat_id,subcat_id,user_id,location,content,reply_num,topic_date,reply_time&text=ID,,Category ID,SubcategoryID,Submitter ID,City ID,,Reply Number,Topic Date (YYYYMMDDHHIISS),Last reply time (YYYYMMDDHHIISS)" class="fancybox iframe ctlbtn">
                                    <i class="fa fa-pencil-square-o"></i>
                                </a>
                                <a href="javascript:del('deals','id','{$var_topic.id}')" class="ctlbtn">
                                    <i class="fa fa-times"></i>
                                </a>
                            {/if}
                            {$var_topic.date}
                        </div>
                    </div>
                    <blockquote>
                        <h4 style="overflow: hidden">{$var_topic.message}</h4>
                    </blockquote>
                    <div class="clearfix"></div>
                    {if $var_topic.photo_url}
                        <div class="class-col-md-6">
                            <h3 id="clear">{l t='Classfied Photo'}:</h3>
                            <a href="/images/upload/{$var_topic.photo_url}" class="fancypic">
                                <img class="img-responsive" src="/images/upload/100x100_{$var_topic.photo_url}" ></a>
                            <div id="bigpic" style="display:none;">
                                <img src="/images/upload/{$var_topic.photo_url}" />
                            </div>
                        </div>
                    {/if}
                </div>
                <div class="clearfix"></div>


                <div>
                    <div class="col-md-12">
                        <br/>
                        <p  style="display:{$var_topic.options_avail};"><em>{l t='Other Stuff'}:</em></p>
                        <dd style="display:{$var_topic.option1_avail};"><i class="fa fa-check"></i>{l t=' Telecommuting'}</dd>
                        <dd style="display:{$var_topic.option2_avail};"><i class="fa fa-check"></i>{l t=' Part-time'}</dd>
                        <dd style="display:{$var_topic.option3_avail};"><i class="fa fa-check"></i>{l t=' Contract'}</dd>
                        <dd style="display:{$var_topic.option4_avail};"><i class="fa fa-check"></i> {l t=' Non-profit'}</dd>
                        <dd style="display:{$var_topic.option5_avail};"><i class="fa fa-check"></i> {l t=' Organization'}</dd>
                        <dd style="display:{$var_topic.option6_avail};"><i class="fa fa-check"></i> {l t=' Internship'}</dd>
                        <dd style="display:{$var_topic.option7_avail};"><i class="fa fa-check"></i> {l t=' Dogs'}</dd>
                        <p  style="display:{$var_topic.permis_avail}"><br/><em>{l t='Permissions'}</em></p>
                        <dd style="display:{$var_topic.permi1_avail};"><i class="fa fa-check"></i>{l t=' Direct contact by recruiters is ok'}</dd>
                        <dd style="display:{$var_topic.permi2_avail};"><i class="fa fa-check"></i>{l t=' Phone calls to you about this job are ok'}</dd>
                        <dd style="display:{$var_topic.permi3_avail};"><i class="fa fa-check"></i>{l t=' Ok for others to contact you about other services, products or commercial interests'}</dd>
                        <dd style="display:{$var_topic.permi4_avail};"><i class="fa fa-check"></i>{l t=' Ok to highlight this job opening for persons with disabilities '}</dd>
                        <br/>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <div class="row col-md-2 col-sm-3 col-xs-12">
                                <label for="link" class="for_padding_button pull-left">{l t='Direct Link'}:</label>
                            </div>
                            <div class="col-md-5 col-sm-9 col-xs-12">
                                <div class="row">
                                    <input name="link" class="form-control" id="link" value="{$var_topic.directlink}"/>
                                    <div class="visible-sm visible-xs">
                                        <br/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-2 col-sm-6 col-xs-12">
                                <input type="button" class="btn button-blue col-md-12 col-sm-6 col-xs-12" onclick="javascript:copyToClipboard('link');" value="Copy" >
                                <div class="visible-xs">
                                    <br/><br/><br/>
                                </div>
                            </div>

                            <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title" id="myModalLabel">{l t='Flag Request'}</h4>
                                        </div>
                                        <div class="modal-body">
                                            <iframe src="/flag.php" width="100%" height="300" frameborder="0"></iframe>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-2 col-sm-6 col-xs-12 pull-right">
                                <button type="button" class="btn button-blue" data-toggle="modal" data-target="#myModal">
                                    {l t='Flag this'}
                                </button>
                                {*<a href="/flag.php?topicid={$var_topic.id}&replyid=0&zone=1" class="iframe btn button-blue pull-right col-xs-12">*}
                                    {*{l t='Flag this'}*}
                                    {*<img src="../theme/{$get_theme}/images/btn/flag_button.gif" width="65" height="21" border="0" />*}
                                {*</a>*}
                                <div class="visible-xs">
                                    <br/><br/><br/>
                                </div>
                            </div>

                            <div class="visible-sm">
                                <br/><br/><br/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                    </div>
                    <div class="clearfix"></div>

                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <ul class="list-group">
                                <!--loop-->
                                {foreach from=$var_reply item=i}
                                    <li class="list-group-item">
                                        <div class="col-md-12">
                                            <div class="pull-left" id="pv">
                                                <i class="fa fa-users"></i>&nbsp;{$i.friendsnum}&nbsp;<br />
                                                <i class="fa fa-star"></i>&nbsp;{$i.reviewsnum}
                                            </div>
                                            <div class="pull-right" >
                                                <img class="img-responsive" src="../images/photos/{$var_author.picurl}_40x40" width="40" height="40" />
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <a href="../my/?id={$i.userid}">{$i.username}</a>{l t=' says'}:
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6 text-right">
                                            {if $i.edit_btn}
                                                <a href="/mgt/func/select.php?sheet=deals_reply&where=id&equal={$i.id}&field=id,content,user_id,topic_id,reply_date&text=ID,,Submitter ID,Topic ID,Reply date (YYYYMMDDHHIISS)" class="fancybox iframe ctlbtn">
                                                    <i class="fa fa-pencil-square-o"></i>
                                                </a>
                                                <a href="javascript:del('deals_reply','id','{$i.id}')" class="ctlbtn">
                                                    <i class="fa fa-times"></i>
                                                </a>
                                            {/if}
                                            {$i.date}
                                        </div>
                                            <h4 class="col-xs-12">{$i.message}</h4>

                                        <a href="/flag.php?topicid={$var_topic.id}&replyid={$i.id}&zone=1" class="iframe">
                                            <input type="button" class="btn button-blue pull-right" value="{l t='Flag this'}">
                                            {*<img src="../theme/{$get_theme}/images/btn/flag_button.gif" alt="" width="65" height="21" border="0"  style="float:right;"/>*}
                                        </a>
                                        <div class="clearfix"></div>
                                    </li>
                                {/foreach}
                                <!--/loop-->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>










<div id="replyTitle" class="pull-left col-xs-12">
    <a name="bottom"></a>
</div>

{$var_lists.pager}
<div class="clearfix"></div>

<form action="javascript:get({$var_topic.id},1,3);" name="reply" method="post">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">{l t='Reply'}</h3>
        </div>
        <div class="panel-body" id="replyTitle">
            <div class="form-group">
                <textarea class="form-control" rows="5" name="review" ></textarea>
            </div>
            <p class="pull-right"><a href="#top">{l t='Page Top'} &uArr;</a></p>
            <input type="submit" class="btn button-blue" name="button2"  id="button2" value="  {l t='Submit'} »  " >
        </div>
    </div>
</form>

<h2>
    <a href="javascript:;" onclick="get(determinCatOrSub(),WCurPage,0);" class="btn btn-danger red_link">
        <i class="fa fa-reply"></i><span>{l t=' Back to List'}</span></a>
</h2>



