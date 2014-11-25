{include file="header.tpl"}
<script type="text/javascript">
    var rank='{$rank}';
</script>
<script type="text/javascript" src="/theme/{$get_theme}/js/membersearch.js"></script>
 <!--Main Start-->

 <div id="main">
     <div class="content container">
         <div class="row">
             <div class="col-md-9 col-sm-9 col-xs-12">
                 <div class="panel panel-info">
                     <div class="panel-heading">
                         <h3 class="panel-title"><label>{l t='Member Search'}</label></h3>
                     </div>
                     <div class="panel-body">
                         <div class="row">
                             <form onsubmit="return false;">
                                 <div class="form-group col-md-6">
                                     <label for="exampleInputEmail1">{l t='Keywords'}</label>
                                     <input type="email" class="form-control" name="name" id="search">
                                     <em>{l t='(e.g. New York or David)'} </em>
                                 </div>
                                 <div class="col-md-6 text-center">
                                     <br/>
                                     <input type="button" class="btn button-blue" onClick="get('','1')"  value="{l t='Search'}" name="Submit" />
                                 </div>
                             </form>
                         </div>
                     </div>
                 </div>

                 {if $rank==''}
                     <h2>{l t='New Users List'}</h2>
                 {elseif $rank=='reviews_num'}
                     <h2>{l t='Top Reviewers List'}</h2>
                 {/if}
                 <div class="panel panel-default">
                     <div class="panel-body" id="sr">
                         <div class="con" style="text-align:center; border:0;">
                             <br />
                             <br />
                             <br />
                             <br />{l t='Search Keywords can be whatever from his/her name to his/her favorite movie'}...</br>
                             <br />
                             <br />
                             <br />
                             <br />
                             <br />
                         </div>
                     </div>
                 </div>
             </div>

             <div class="col-md-3 col-sm-3 hidden-xs text-center">
                 <p align="center">
                     {$ads->getAdCode(3)}
                 </p>
             </div>
         </div>
     </div>
 </div>

 <!--Main End-->
 <script>
    get('','1');
 </script>
{include file="footer.tpl"}
