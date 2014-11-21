var lang_height ;
$(document).ready(function() {
//    pagination
    if ($('#digg > span:first-child').text() == '|<'){
        $('#digg > span:first-child').text('«');
    }
    if ($('#digg > span:nth-child(2)').text() == '<'){
        $('#digg > span:nth-child(2)').text('‹');
    }
    if ($('#digg > a:first-child').text() == '|<'){
        $('#digg > a:first-child').text('«');
    }
    if ($('#digg > a:nth-child(2)').text() == '<'){
        $('#digg > a:nth-child(2)').text('‹');
    }

    if ($('#digg > span:last-child').text() == '>|'){
        $('#digg > span:last-child').text('»');
    }
    if ($('#digg > a:last-child').text() == '>|'){
        $('#digg > a:last-child').text('»');
    }

    if ($('#digg > span:nth-last-child(2)').text() == '>'){
        $('#digg > span:nth-last-child(2)').text('›');
    }
    if ($('#digg > a:nth-last-child(2)').text() == '>'){
        $('#digg > a:nth-last-child(2)').text('›');
    }
//language
	lang_height = $('.language_selector').height(); 
	$('.language_selector').css({'height':'12px','top':0}); 
	
//auto-complete	   		
	/*		   
	$("#Hsearchtext").keyup(function (){
		var keys = $(this).val();
		keys = keys.replace(/&/,"||sp_rp_and||");
		$.ajax({
		   type: "POST",
		   url: "/inc/func/search.ajax.php",
		   data: "action=ajax&keyword="+keys,
		   success: function(msg){
		     $("#srsr").html(msg);
		     $("#srsr").show();
		   }
		});
	});			 
						   
	$("#searchtext").keyup(function (){
		var keys = $(this).val();
		keys = keys.replace(/&/,"||sp_rp_and||");
		$.ajax({
		   type: "POST",
		   url: "/inc/func/search.ajax.php",
		   data: "type=keyword&keyword="+keys,
		   success: function(msg){
		     $("#searchtext_div").html(msg);
		     $("#searchtext_div").show();
		   }
		});
	});	  
	*/					   
	$("#Hsearchcity").keyup(function (){
		$.ajax({
		   type: "POST",
		   url: "/inc/func/search.ajax.php",
		   data: "type=city&cities="+$(this).val(),
		   success: function(msg){
		     $("#searchcity_div").html(msg);
		     $("#searchcity_div").show();
		   }
		});
	});	
	$('#Hsearchcity').click(function (){
		 if($(this).val()==t_AllCities)
		 {
			 $(this).val('');
			 $(this).removeClass('commentColor');
			 $('#Hcity').val('');
		 }
	});
	$('#Hsearchcity').blur(function(){
		if($(this).val()=='')
		{
			$(this).val(t_AllCities);
			$(this).addClass('commentColor');
			$('#Hcity').val('');
		}
	});
						   
	$("#searchcity").keyup(function (){
		$.ajax({
		   type: "POST",
		   url: "/inc/func/search.ajax.php",
		   data: "type=city&cities="+$(this).val(),
		   success: function(msg){
		     $("#searchcity_div2").html(msg);
		     $("#searchcity_div2").show();
		   }
		});
	});			   
	
	$("#Hsearchcity").blur(function (){
		setTimeout("$('#searchcity_div').hide();", 300);
	});
	$("#searchcity").blur(function (){
		setTimeout("$('#searchcity_div2').hide();", 300);
	});
	
	
});



function show_language_bar()
{
	$('.language_selector').stop().animate({'opacity':1,'height':lang_height},100);
}
function hide_language_bar()
{
	$('.language_selector').stop().animate({'opacity':0.5,'height':'12px'},100);
}




		

function fill(thisValue) {				  
		$("#Hsearchtext").val(thisValue);				  
		$("#srsr").hide();			  
		$("#searchtext").val(thisValue);				  
		$("#searchtext_div").hide();
		thisValue = thisValue.replace(/&/,"||sp_rp_and||");
		$.ajax({
		   type: "POST",
		   url: "/inc/func/search.ajax.php",
		   data: "action=ajax&module=get&cities="+thisValue,
		   success: function(msg){

	     if(msg!="")
			{
				var arr= new Array(); 
				arr = msg.split("---");
				if(arr[0]!="" && arr[1]!="")
				{		  
					$("#city_id").val(arr[0]);
					$("#Hsearchcity").val(arr[1]);	
					$("#searchcity").val(arr[1]);			  
				}
			}
	   }
	});
}

function fills(id, thisValue) {				  
	$(".cityname").val(thisValue);		  
	$("#Hsearchcity").val(thisValue);
	$('#Hsearchcity').removeClass('commentColor');
	$("#searchciy").val(thisValue);				  
	$("#searchcity_div").hide();
}

function save_item()
{
    ids = "";
    $(".items").each(function(i){
        if($(this).attr("checked"))
        {
            ids += $(this).val()+",";
        }
    });
    ids = ids.replace(/,$/,"");
    return ids;
    $("#items_save").val(ids);
    
}


function select_all_item(status) {
$(".items").each( function() {
$(this).attr("checked",status);
})
}

function del_account()
{
    var a=confirm("CAUTION:\nSure to delete this account?");
    if(a==0) return ;
    
    
    //Delete Account
    $.post("/my/delete_account.php", {
    sheet:'account'
    },function(data){
      window.location = "/"
    });   
}