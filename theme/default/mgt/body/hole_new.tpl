{include file="header.tpl"}
{literal}
<style type="text/css">
#main{ height:auto;
-moz-border-radius:6px;
-moz-box-shadow:0 4px 18px #C8C8C8;}
#main .content .detail { width:100%; clear:both; padding-top:10px; padding-bottom:10px; border-bottom: 1px #ccc solid;  height:auto; float:left}
#main .content .detail .info { width:550px; float:left;}
#main .content .detail .info .first{ width:310px; float:left; margin:0 10px;}
#main .content .detail .info .other { float:left;}
#main .content .detail .info .other .item{float:left; padding-top:20px; }

#main .content .detail .map {float:left; padding-left:5px; width:335px; height:340px;}

#main .content  .left{ margin:10px; margin-left:0;width:42%; float:left; border-right:#ccc 1px solid; padding-right:10px; overflow:hidden; padding-left:20%;}
#main .content .info .con, .right .con{  padding-top:10px; padding-bottom:10px;; border-bottom:#ccc 1px solid; float:left;}
#main .content .con ul {list-style:none; margin:0; padding:0; clear:both;}
#main .content .info .con ul li {float:left; width:33%;}
#main .content .right{ margin-top:10px; width:35%;  float:left;}

#main .content .left .con .item{ height:220px;  float:left; width:45%; padding-right:20px;}
#main .content .left .con .pic { float:left; width:20%; padding-top:10px; padding-left:10px; text-align:left;}
#main .content .left .con .t { float:left; width:75%; padding-left:10px;}
#main .content  .right .con {width:100%;}
#main .content  .right .con .photo {width:40%; text-align:center; height:auto; margin:0 5px; float:left;}
#main .content  .right .con .item{ height:auto;  float:left; width:98%; padding-top:10px; padding-left:10px;}
#main .content  .right .con .item .t{ padding-left:10px;}
#main .content  .right .con .item .pic{width:auto;}
#box{
	display:none;
	text-align:center;
	padding:5px;
	position:absolute;
	left: 330px;
	top: 43px;
	width: 250px;
	height: 250px;
	-moz-border-radius:6px;
-moz-box-shadow:0 4px 18px #C8C8C8;
background:#FFC;
border:1px #ccc solid;
}

</style>
<script>
function loadHole(holeid)
{
	$('tr').remove('.hole_stats_data');
		$.getJSON("hole_stats_json.php?id="+holeid,
        function(data){			
				////implement  hole stats data
				  $.each(data.stats, function(i,item){
						$('.tblModel tbody').append(
									'<tr class="hole_stats_data">'+
									'<td class="Tee">'+item.tee+'</td>'+
									'<td class="Slope">'+item.slope+'</td>'+
									'<td class="Yardage">'+item.yardage+'</td>'+
									'<td class="Ctrl"><a href="javascript:delstat('+item.id+')" style=" border:1px #cbd8ac solid; background:#eef4ea; display:block; padding:2px; width:30px;-moz-border-radius:10px;-moz-box-shadow:0 0 5px #C8C8C8; font-weight:bold; color:#000;text-shadow:1px 1px 0 #FFFFFF; margin:10px auto; text-align:center; float:right">X</a></td>'+
								'</tr>');
				  });
        });//for hole data
}
function ChangeValue(target,value) // for upload pic
{
	$('#upload_btn').css('display','none');
	$('#hole_picurl').css('display','inline');
	document.getElementById(target).value=value;
}
function showbox()
{
	$('#box').css('display','block');
}
function hidebox()
{
	$('#box').css('display','none');
}
</script>
{/literal}
<script type="text/javascript">
//public
var hole_id='{$var_hole.id}';
var business_id='{$var_biz.id}';
</script>
{literal}
<script type="text/javascript">
function sendbox()
{

	var tee=$('#hole_tee').val();
	var slope=$('#hole_slope').val();
	var yardage=$('#hole_yardage').val();
	
	$.post("../func/add.php?"+Math.random(), {
								   sheet:'business_hole_stats',
								   field:'hole_id,tee,slope,yardage',
								   value:hole_id+','+tee+','+slope+','+yardage
								   },
			function(data){
						loadHole(hole_id);
						$('#box').css('display','none');
			 },"json");
}
function delstat(id)
{
	$.post("../func/delete.php?"+Math.random(), {
								   sheet:'business_hole_stats',
								   where:'stats_id',
								   equal:id
								   },
			function(data){
						loadHole(hole_id);
			 },"json");
}
function submitform()
{
	var hole_tip=$('#hole_tip').val();
	var hole_par=$('#hole_par').val();
	var hole_no=$('#hole_no').val();
	var hole_picurl=$('#hole_picurl').val();
	$.post("../func/add.php?"+Math.random(), {
								   sheet:'business_hole',
								   field:'hole_id,hole_tip,hole_par,hole_no,hole_picurl,business_id',
								   value:hole_id+','+hole_tip+','+hole_par+','+hole_no+','+hole_picurl+','+business_id
								   },
			function(data){
					window.opener.parent.nav();
					alert('Hole added!');
					window.close();
			 },"json");
}
</script>
{/literal}
 <!--Main Start-->  
 <div id="main">

    <div class="content"  style=" position:relative">
        <div class="detail">
         <h1>Add hole tips for {$var_biz.bizname}</h1>
      </div> 
      <div id="clear"></div>
      <div class="info">
      <div id="box"><h3>Tee:</h3>
        <textarea id="hole_tee" name="hole_tee" cols="4" rows="1" style="width:200px;"></textarea>
        <h3>Slope:</h3>
        <textarea id="hole_slope" name="hole_slope" cols="4" rows="1" style="width:200px;"></textarea>
        <h3>Yardage:</h3>
        <textarea id="hole_yardage" name="hole_yardage" cols="4" rows="1" style="width:200px;"></textarea>
        <h3><a href="javascript:hidebox()" style=" border:1px #cbd8ac solid; background:#eef4ea; display:block; padding:2px; width:30px;-moz-border-radius:10px;-moz-box-shadow:0 0 5px #C8C8C8; font-weight:bold; color:#000;text-shadow:1px 1px 0 #FFFFFF; margin:10px auto; text-align:center; float:right">X</a> <a href="javascript:sendbox()" style=" border:1px #cbd8ac solid; background:#eef4ea; display:block; padding:2px; width:100px;-moz-border-radius:10px;-moz-box-shadow:0 0 5px #C8C8C8; font-weight:bold; color:#000;text-shadow:1px 1px 0 #FFFFFF; margin:10px auto; text-align:center; float:right">Add</a> </h3>
      </div>
      <!-- Left -->
      <div class="left" style=" padding-top:150px;min-height:250px;">
      	<h3>Hole No.</h3>
        <p>
          <input name="hole_no" id="hole_no" type="text" value="" />
        </p>
        <p>&nbsp; </p>
        <h3>Picture Upload</h3>
<input name="hole_picurl" id="hole_picurl" type="text" onFocus="this.blur()" value="nohole" style="display:none" /><a href="javascript:win=window.open('../new_photo.php?url=hole_picurl','','resizable=0,scrollbars=0,width=400,height=200');void(0);" style=" border:1px #cbd8ac solid; background:#eef4ea; display:block; padding:2px; width:100px;-moz-border-radius:10px;-moz-box-shadow:0 0 5px #C8C8C8; font-weight:bold; color:#000;text-shadow:1px 1px 0 #FFFFFF; margin-top:10px ; text-align:center;" id="upload_btn">Upload...</a> 
      </div>
      <!-- Right -->
      <div class="right">
      <div class="con tblModel">
      	<h3>Hole Stats</h3>
      	<table width="100%">
        	<tr>
            	<th>Tee</th>
                <th>Slope</th>
                <th>Yardage</th>
            	<th>&nbsp;</th>
            </tr>
        </table>
        <a href="javascript:showbox()" style=" border:1px #cbd8ac solid; background:#eef4ea; display:block; padding:2px; width:100px;-moz-border-radius:10px;-moz-box-shadow:0 0 5px #C8C8C8; font-weight:bold; color:#000;text-shadow:1px 1px 0 #FFFFFF; margin:10px auto; text-align:center">Add...</a>
      </div>
      <div class="con"><h3>Hole Par</h3>
      <textarea id="hole_par" name="hole_par" cols="4" rows="3" style="width:300px;"></textarea>
      </div>
      <div class="con" style="border:none"><h3>Hole Tip</h3>
      <textarea id="hole_tip" name="hole_tip" cols="4" rows="3" style="width:300px;"></textarea></div>      
      </div>
      </div>
      <div id="clear"></div>
</div>
<div id="detail" style="text-align:center; margin:30px auto;">
<a href="javascript:submitform()" style=" border:1px #cbd8ac solid; background:#eef4ea; display:block; padding:2px; width:100px;-moz-border-radius:10px;-moz-box-shadow:0 0 5px #C8C8C8; font-weight:bold; color:#000;text-shadow:1px 1px 0 #FFFFFF; margin:10px auto;">Submit</a> 
</div>
<div id="clear"></div>
      </div>
    </div>
    </div>
 </div>
 <script>loadHole(hole_id)</script>
 <!--Main End-->
{include file="footer.tpl"}