
$(document).ready(function() {
	fancybox();
 	scrollpage();
 	if(weatherWidgetEnabled=='1')
 		weatherinit();
	if(googleMapEnabled=='1' && cat_map_enabled=='1')
		initialize();
});





function scrollpage()
{
   jQuery(function( $ ){

				$.easing.elasout = function(x, t, b, c, d) {
				var s=1.70158;var p=0;var a=c;
				if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
				if (a < Math.abs(c)) { a=c; var s=p/4; }
				else var s = p/(2*Math.PI) * Math.asin (c/a);
				return a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*(2*Math.PI)/p ) + c + b;
				};


				$('#replyBtn').click(function(){
					$.scrollTo( '#replyTitle', 800  );
					return false;
				});

				  $('#replyBtn2').click(function(){
					$.scrollTo( '#replyTitle', 800  );
					return false;
					});
				  $('#reviewBtn').click(function(){
					//$.scrollTo( '#reviewTitle', 800 , {easing:'elasout'} );
					$.scrollTo( '#reviewTitle', 800 );
					return false;
					});
				  $('#topBtn').click(function(){
					$.scrollTo( '#container', 800);
					return false;
					});
		});
}
//////
 function fancybox()
 {
 $(".iframe").fancybox({
  'overlayShow'    : true,
  'zoomSpeedIn'    : 600,
  'frameWidth' : 600,
  'frameHeight': 400,
  'callbackOnShow' : function(){$('object').css('display','block');},
  'callbackOnClose' : function(){$('object').css('display','none');},
  'zoomSpeedOut'    : 500,
  'easingIn'    : 'easeOutBack',
  'easingOut'    : 'easeInBack',
  'padding':0
  });
  $("#videobox").fancybox({
   'overlayShow'    : true,
  'zoomSpeedIn'    : 600,
  'callbackOnShow' : function(){$('object').css('display','block');},
  'callbackOnClose' : function(){$('object').css('display','none');},
  'zoomSpeedOut'    : 500,
  'easingIn'    : 'easeOutBack',
  'easingOut'    : 'easeInBack',
  'frameWidth' : 853,
  'frameHeight': 505,
  'scrolling':'no',
  'hideOnOverlayClick':false,
  'hideOnContentClick':false
  });

  }


function showreply(reviewid)
{
	$('#ownerreplytext_'+reviewid).show();
	$('#ownerreplybtn_'+reviewid).show();
	$('#ownerreplylink_'+reviewid).hide();
}

function submitreply(id,reviewid)
{
	 	  var replytext=$('#ownerreplytext_'+reviewid).val();
		  replytext=replytext.replace(/\n/g,"[br]");
		  if(!replytext)
		  {
			  alert("Please input your reply!");
			  return;
		   }
		   if (!( $.browser.msie && parseInt($.browser.version)==6 ))
			$('#sr').css('opacity',0.3);
			$.post("/biz/func/getreview.php?"+Math.random(), {
			id:id,
			reviewid:reviewid,
			page:'1',
			order:'time',
			replytext:replytext
			},function(data){
					tips('Reply submitted.');
					nav(data);
			});
}

function check_login(who)
{
    if(!temp)
    {
		alert(t_loginfirst);
    		who.blur();
	}
}

function owner(who)
{

        alert(t_owner);
            who.blur();
}


function get(id,pg,changepage) {
/*
$('#sr').hide();
$('#wait').show();
*/
  if(changepage=="reviewrating")  ///// send comment!!   with multiple ratings
  {
		  var comment=$('#review').val();
		  comment=comment.replace(/\n/g,"[br]");
		  if(!comment)
		  {
			  alert("Please input your review!");
			  return;
		   }

           var rating = {};
           var has_ratings = 1;
           $.each($('#reviewform').serializeArray(), function(i, field) {
                if (field.name.substring(0,6)== 'rating'){
                    if (!field.value){
                        alert("Please rate!");
                        has_ratings = 0;
                        return;
                    }else{
                        rating[field.name] = field.value;
                    }
                }
           });


          rating=$.param(rating);
		  if(!temp)
			{
				alert("Please Login!");
				return;
			}
			if (!( $.browser.msie && parseInt($.browser.version)==6 ))
			$('#reviewTitle').ScrollTo(30);
			$('#sr').css('opacity',0.3);
			$('#review').val('');
			if (has_ratings == 1){
			    $.post("/biz/func/getreview.php?"+Math.random(), {
			    id:id,
			    page:'1',
			    order:'time',
			    comment:comment,
			    rating:rating
			    },function(data){
				    nav(data);
				    tips(t_reviewsubmitted);
			     });
            }

 }else if(changepage=="review"){       // comments with single rating

        var comment=$('#review').val();
          comment=comment.replace(/\n/g,"[br]");
          if(!comment)
          {
              alert("Please input your review!");
              return;
           }
          var rating=$('#rating').val();
          if(!rating)
          {
              alert("Please rate!");
              return;
           }


          if(!temp)
            {
                alert("Please Login!");
                return;
            }
            if (!( $.browser.msie && parseInt($.browser.version)==6 ))
            $('#reviewTitle').ScrollTo(30);
            $('#sr').css('opacity',0.3);
            $('#review').val('');

            $.post("/biz/func/getreview.php?"+Math.random(), {
            id:id,
            page:'1',
            order:'time',
            comment:comment,
            rating:rating
            },function(data){
                nav(data);
                tips(t_reviewsubmitted);
             });

 }else //not review
  {
	  if (!( $.browser.msie && parseInt($.browser.version)==6 ))
	  	$('#sr').css('opacity',0.3);
	  var order=$('#sortby').val();
	  var searchtext = $('#searchreviewtext').val();
	  if(!searchtext||searchtext==t_defaultsearchtext) searchtext='';
			$.post("/biz/func/getreview.php?"+Math.random(), {
			id:id,
			page:pg,
			order:order,
			searchtext:searchtext
			},function(data){
				nav(data);
				});
  }
}

function nav(data)
{
	$('#sr').html(data);
	if (!( $.browser.msie && parseInt($.browser.version)==6 ))
	$('#sr').css('opacity',1);
	/*
	$('#sr').show();

	$('#wait').hide();
	*/
	fancybox();
}



function sele_item(a,orderby){
for(var i=0;i<document.getElementsByTagName("span").length;i++){
if(document.getElementsByTagName("span")[i].id=="itemid"){
document.getElementsByTagName("span")[i].className='Sitem';
document.getElementById("sortby").value=orderby;
}
}
a.className='SitemS';
get(biz_id,1);
}

function showflag(topicid,replyid,zone){
var d=document.flag;
d.topicid.value=topicid;
d.replyid.value=replyid;
d.zone.value=zone;
document.getElementById('flagform').style.display='';
}


function code2img(code){
     return "http://l.yimg.com/us.yimg.com/i/us/we/52/"+code+".gif";
  }

function weather2html(weather,cat,alt){  //cat =1 now   2 tomorrow ...
var imgurl = code2img(weather.code);
var text = weather.text;
var _temp = weather.temp;
var temp = "";
var date= weather.date;
  //"date":"21 May 2009",
  //"text":"Mostly Clear",
  //"day":"Thu",
if (_temp==undefined) {
   var high = weather.high;
   var low = weather.low;
   temp = low+" F ~ "+high+" F";
}
else {
   temp = _temp+" F";
}
  switch(cat)
  {
  case '1':
  $('#current_title').text("Current Weather");
       $('#current_img').attr("src",imgurl);
       $('#current_img').attr("title",alt);
       $('#current_stat').text(text);
       $('#current_text').text(temp+"");
       break;
  case '2':
  var day=weather.day;
  $('#tomorrow_title').text(day);
       $('#tomorrow_img').attr("src",imgurl);
       $('#tomorrow_img').attr("title",text);
       $('#tomorrow_stat').text(text);
       $('#tomorrow_text').text(temp+"");
  break;
  case '3':
  var day=weather.day;
  $('#after_title').text(day);
       $('#after_img').attr("src",imgurl);
       $('#after_img').attr("title",text);
       $('#after_stat').text(text);
       $('#after_text').text(temp+"");
  break;
  }
}

function weatherinit()
{

// Weather Forecast Init.
var zipcode=biz_zip;
var url ="http://pipes.yahoo.com/pipes/pipe.run?_id=2eb187fcae6192aee203f670109a40f7&_render=json&u=f&p="+zipcode+"&_callback=?";

    $.getJSON(url, function(data){
    var _item = data.value.items[0];
    var alt=_item['y:title'];
  var y_id=_item['y:id']['value'];
  if(y_id!=null){
       weather2html(_item["yweather:condition"],'1',alt);
       weather2html(_item["yweather:forecast"][0],'2','');
       weather2html(_item["yweather:forecast"][1],'3','');
       $('.weather').slideDown('slow');
  }
    });

}


function initialize() {
//Google Map init.
if(zoom==0)
{
  document.getElementById("map_canvas").innerHTML="<br /><br /><br /><br /><br /><center>No Map</center>";
}
else
{
$('#map_direction_btn').show();

    var myLatlng = new google.maps.LatLng(y,x);
    var myOptions = {
      zoom: zoom,
      center: myLatlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

    var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title:"Map"
    });

}}


var tipsTimer;
 function tips(content)
{
	$('#tips').html(content);

		var scrolltop = window.pageYOffset  || document.documentElement.scrollTop  || document.body.scrollTop || 0;
		var _clientheight=0;
  			  _clientheight = Math.min(document.body.clientHeight , document.documentElement.clientHeight);
   		if(_clientheight==0)
    		  _clientheight= Math.max(document.body.clientHeight , document.documentElement.clientHeight);
        var _clientwidth= document.documentElement.clientWidth || document.body.clientWidth;
        var _pageheight =  Math.max(document.body.scrollHeight,document.documentElement.scrollHeight);

		var msgtop = (scrolltop+(_clientheight)/2)-250+"px";
		var msgleft = ((_clientwidth-650)/2)+"px";

		$('#tips').css('top', msgtop);
		$('#tips').css('left',  msgleft);

		setTimeout("$('#tips').show()",200);
		clearTimeout(tipsTimer);
		tipsTimer=setTimeout("$('#tips').hide()",2800);
}

function vote(review_id,type)
{
	$('.vote'+review_id).text("Posting...");
	$.post("/biz/func/vote.php?"+Math.random(), { review_id:review_id, type:type},function(data){chgstate(data.state);},"json");
	function chgstate(state){$('.vote'+review_id).html(state);}
}





/*   Special Offers   */

//var currentOfferId;   located in page

function offerDelete(offerId,businessId)
{
	var a=confirm("Sure to delete this special offer?");
	if(a==0){
		return;
	}
	else{
	$.post("/offer/func.ajax.php?"+Math.random(), {
			type:'delete',
			businessId:businessId,
			offerId:offerId
			},function(data){
				if(data.S=='1')
				{
					$('.create_offer_div').hide();
					$('.edit_offer_div').hide();
					tips('Special Offer Deleted.');
					offerLoad(businessId);
					currentOfferId=data.offerId;
				}
				else if(data.S=='0')
				{	//restore as new
					$('.create_offer_div').hide();
					$('.edit_offer_div').hide();
					$('.preview_offer').hide();
					$('.delete_offer').hide();
					tips('Special Offer Deleted.');
				}
				else
					tips(data.S);
			},"json");
	}
}

function offerUpdate(offerId,businessId)
{
	var offerDescription=$('#offer_update_desc').val();
	var offerUrl=$('#offer_update_url').val();
	var offerPhone=$('#offer_update_phone').val();
    var offerTitle=$('#offer_update_title').val();
	if(!offerDescription)
	{
		alert('Please input description');
		return;
	}


	$.post("/offer/func.ajax.php?"+Math.random(), {
			type:'update',
			businessId:businessId,
			offerId:offerId,
			offerDescription:offerDescription,
			offerUrl:offerUrl,
            offerTitle:offerTitle,
			offerPhone:offerPhone
			},function(data){
				if(data.S==1)
				{
					$('.edit_offer_div').hide();
					tips('Special Offer Updated.');
					offerLoad(businessId);
					currentOfferId=data.offerId;
				}
				else
					tips(data.S);
			},"json");
}


function offerInsert(businessId)
{
	var offerDescription=$('#offer_insert_desc').val();
	var offerUrl=$('#offer_insert_url').val();
	var offerPhone=$('#offer_insert_phone').val();
    var offerTitle=$('#offer_insert_title').val();
	if(!offerDescription)
	{
		alert('Please input description');
		return;
	}

	$.post("/offer/func.ajax.php?"+Math.random(), {
			type:'insert',
			businessId:businessId,
			offerDescription:offerDescription,
			offerUrl:offerUrl,
            offerTitle:offerTitle,
			offerPhone:offerPhone
			},function(data){
				if(data.S==1)
				{
					$('.create_offer_div').hide();
					tips('Special Offer Created.');
					offerLoad(businessId);
					$('.create_offer').show();
					$('.delete_offer').show();
					currentOfferId=data.offerId;
				}
				else
					tips(data.S);
			},"json");
}


function offerLoad(businessId)
{
	$.post("/offer/func.ajax.php?"+Math.random(), {
			type:'load',
			businessId:businessId
			},function(data){
				if(data.S==1)
				{
					currentOfferId=data.offer_id;
					$('.preview_offer').hide();
					var html=offerHtml(data.title,data.offer_description,data.offer_url,data.offer_phone,data.offer_submit_time);
					$('.preview_offer').html(html);
					$('.preview_offer').css('display','block');
					$('.delete_offer').css('display','block');
					$('#offer_update_desc').val(data.offer_descriptionNoTag);
					$('#offer_update_url').val(data.offer_url);
					$('#offer_update_phone').val(data.offer_phone);
                    $('#offer_update_title').val(data.title);

				}
				else
					tips(data.S);
			},"json");
}
function offerHtml(title,desc,url,phone,date)
{
	var output;
	output=title + "<br />"+desc;
	if(url)	output+="<br /><a href="+url+" target=_blank>"+url+"</a>";
	if(phone) output+="<br />"+phone;
	output+="<br /><em>"+date+"</em>";
	return output;
}