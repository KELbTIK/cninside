function del_business(biz_id)
{
	var a=confirm("CAUTION:\nSure to delete this business?\nAll reviews, special offers, photos and related bookmarks for it will be removed permanently.");
	if(a==0) return ;
	
	
	//Delete Business
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'business',
	where:'business_id',
	equal:biz_id
	},function(data){tips('Business deleted.');nav();});
	//Delete Reviews
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'business_reviews',
	where:'business_id',
	equal:biz_id
	},function(data){});
	//Delete Photos
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'business_photo',
	where:'business_id',
	equal:biz_id
	},function(data){});
	//Delete Claims
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'business_claim',
	where:'business_id',
	equal:biz_id
	},function(data){});
	//Delete bookmark
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'bookmark',
	where:'business_id',
	equal:biz_id
	},function(data){}); 
	//Delete list_item
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'list_item',
	where:'business_id',
	equal:biz_id
	},function(data){}); 
	//Delete special_offer
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'special_offer',
	where:'business_id',
	equal:biz_id
	},function(data){});
    //Delete biz cat items
    $.post("/mgt/func/delete_all.php?"+Math.random(), {
    sheet:'business_feature_item',
    where:'business_id',
    equal:biz_id
    },function(data){});
	
}


function delselected_business(childitem)
{
   var selected_ids='';
   var obj=$("input:checked[class='"+childitem+"']");       
    $.each(obj, function(i,item){           
       selected_ids+= $(item).val() +',';
     });   
	if(selected_ids)
	{
		var a=confirm("CAUTION!\nYou are going to delete a quantity of businesses.\n\rAll reviews, special offers, photos and related bookmarks for them will be removed permanently.");
	if(a==0) return ;
	}
	else
	{
		alert('You have not selected any item.');
		return;
	}
		
	//Delete Business
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'business',
	where:'business_id',
	equal:selected_ids
	},function(data){tips('Businesses deleted.');nav();});
	//Delete Reviews
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'business_reviews',
	where:'business_id',
	equal:selected_ids
	},function(data){});
	//Delete Photos
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'business_photo',
	where:'business_id',
	equal:selected_ids
	},function(data){});
	//Delete Claims
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'business_claim',
	where:'business_id',
	equal:selected_ids
	},function(data){});
	//Delete bookmark
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'bookmark',
	where:'business_id',
	equal:selected_ids
	},function(data){}); 
	//Delete list_item
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'list_item',
	where:'business_id',
	equal:selected_ids
	},function(data){}); 
	//Delete special_offer
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'special_offer',
	where:'business_id',
	equal:selected_ids
	},function(data){});
        //Delete biz cat items
    $.post("/mgt/func/delete_all.php?"+Math.random(), {
    sheet:'business_feature_item',
    where:'business_id',
    equal:selected_ids
    },function(data){});
}


function del_bizreview(review_id)
{
	var a=confirm("CAUTION:\nSure to delete this review?");
	if(a==0) return ;
	
	
	$.post("/mgt/body/business_review_del_ajax.php?"+Math.random(), {
	id:review_id
	},function(data){tips('Review deleted.');nav();});
}


function delselected_bizreview(childitem)
{
   var selected_ids='';
   var obj=$("input:checked[class='"+childitem+"']");       
    $.each(obj, function(i,item){           
       selected_ids+= $(item).val() +',';
     });   
	if(selected_ids)
	{
		var a=confirm("CAUTION!\nYou are going to delete a quantity of reviews.\nSure to delete?");
	if(a==0) return ;
	}
	else
	{
		alert('You have not selected any item.');
		return;
	}
	
	$.post("/mgt/body/business_review_del_ajax.php?"+Math.random(), {
	id:selected_ids
	},function(data){tips('Reviews deleted.');nav();});
}






function judge_accept(user_id,business_id,id)
{
	$.post("/mgt/func/update_submit.php?"+Math.random(), {
	sheet:'business',
	field:'user_id',
	value:user_id,
	where:'business_id',
	equal:business_id
	},function(data){judge_finish(id)});	
	
	$.post("/mgt/body/business_claim_feedback_ajax.php?"+Math.random(), {
		id:id,
		result:'1' //accept
		});	
	
}
function judge_reject(id)
{
	judge_finish(id);
	$.post("/mgt/body/business_claim_feedback_ajax.php?"+Math.random(), {
		id:id,
		result:'0' //reject
		});	
}
function judge_finish(id)
{
	$.post("/mgt/func/update_submit.php?"+Math.random(), {
	sheet:'business_claim',
	field:'state',
	value:'1',
	where:'id',
	equal:id
	},function(data){
        jQuery.fancybox.close();
		tips('Claim Judged.');
	});	
}


function business_approve(biz_id)
{
	update('business','approved','1','business_id',biz_id);
	$.post("/mgt/body/business_approve_feedback_ajax.php?"+Math.random(), {
		id:biz_id,
		type:'1' //business
		});	
}
function business_review_approve(review_id,business_id)
{
	update('business_reviews','approved','1','review_id',review_id);
	// Count stars and review numbers
	$.post("/mgt/body/business_review_approve_feedback_ajax.php?"+Math.random(), {
		review_id:review_id,
		business_id:business_id
		});	
}
function business_review_unapprove(review_id,business_id)
{
	update('business_reviews','approved','0','review_id',review_id);
	// Count stars and review numbers
	$.post("/mgt/body/business_review_approve_feedback_ajax.php?"+Math.random(), {
		review_id:review_id,
		business_id:business_id
		});	
}
function event_approve(event_id)
{
	update('event','approved','1','id',event_id)
	$.post("/mgt/body/business_approve_feedback_ajax.php?"+Math.random(), {
		id:event_id,
		type:'2' //event
		});	
}



function generate_thumbnails(id,sheet)
{
	$.post("/mgt/body/thumbnails_generate.php?"+Math.random(), {
	id:id,
	sheet:sheet
	},function(data){
		tips('Thumbnails Regenerated!');
	});	
	
}

function multi_generate_thumbnails(sheet,childitem)
{
   var selected_ids='';
   var obj=$("input:checked[class='"+childitem+"']");       
    $.each(obj, function(i,item){           
       selected_ids+= $(item).val() +',';
     });   
	
if(selected_ids)
{
	var a=confirm("CAUTION! You are going to regenerate a quantity of thumbnails. \n\rThis may take a few second.\n\rPlease be patient and wait for the succeess notice!\n\rSure to regenerate these items?");
if(a==0) return ;
}
else
{
	alert('You have not selected any item.');
	return;
}
	
	
	$.post("/mgt/body/thumbnails_generate.php?"+Math.random(), {
	id:selected_ids,
	sheet:sheet
	},function(data){
		tips('Thumbnails Regenerated!');
		nav();
	});	


}



function multi_generate_maps(sheet,childitem)
{
   var selected_ids='';
   var obj=$("input:checked[class='"+childitem+"']");       
    $.each(obj, function(i,item){           
       selected_ids+= $(item).val() +',';
     });   
	
if(selected_ids)
{
	//var a=confirm("CAUTION! You are going to regenerate a quantity of thumbnails. \n\rThis may take a few second.\n\rPlease be patient and wait for the succeess notice!\n\rSure to regenerate these items?");
	//if(a==0) return ;
}
else
{
	alert('You have not selected any item.');
	return;
}
	
	$('#multi_generate_maps_link').attr('href','./body/business_map_autogen.php?bizids='+selected_ids);
	$("#multi_generate_maps_link").fancybox(
	{
		
		'hideOnContentClick': false,
		'zoomSpeedIn': 300,
		'zoomSpeedOut': 300,
		'frameWidth' : 350,
		'frameHeight': 520,
		'padding':0,
		'overlayShow': true,
		'enableEscapeButton': true,
		}
	).trigger('click');


}





//==================CATEGORY===============
var ajax = new Array();

function getCatloc(sel,child)
{
    var countryCode = sel.options[sel.selectedIndex].value;
    var id=sel.value;
    document.getElementById(child).options.length = 0;
    if(countryCode.length>0){
        var index = ajax.length;
        ajax[index] = new sack();
        
        ajax[index].requestFile = '/biz/func/getcatloc.php?cat='+id;    
        ajax[index].onCompletion = function(){ createSubCat(sel,index,child) };    
        ajax[index].runAJAX();
    }
}

function getCatPrice(sel,child)
{
    var countryCode = sel.options[sel.selectedIndex].value;
    var id=sel.value;
    document.getElementById(child).options.length = 0;
    if(countryCode.length>0){
        var index = ajax.length;
        ajax[index] = new sack();
        
        ajax[index].requestFile = '/biz/func/getcatprice.php?cat='+id;    
        ajax[index].onCompletion = function(){ createSubCat(sel,index,child) };    
        ajax[index].runAJAX();
    }
}

function getCatHours(sel,child)
{
    var countryCode = sel.options[sel.selectedIndex].value;
    var id=sel.value;
    document.getElementById(child).options.length = 0;
    if(countryCode.length>0){
        var index = ajax.length;
        ajax[index] = new sack();
        
        ajax[index].requestFile = '/biz/func/getcathours.php?cat='+id;    
        ajax[index].onCompletion = function(){ createSubCat(sel,index,child) };    
        ajax[index].runAJAX();
    }
}

function createSubCat(sel,index,child)
{
    var obj = document.getElementById(child);
 
    eval(ajax[index].response);
    restore();check_cat_dup();

}

function restore()
{
    for(i=1; i<=5; i++)
    $('#err'+i).hide();
    
        $('#biz_name').css('background-color','#fff');
        $('#biz_add1').css('background-color','#fff');
        $('#dhtmlgoodies_city').css('background-color','#fff');
        $('#dhtmlgoodies_city2').css('background-color','#fff');
        $('#dhtmlgoodies_city3').css('background-color','#fff');
}

////////////
function check_cat_dup()
{

    //don't allow same subcat
    if($('#dhtmlgoodies_city2').val() && $('#dhtmlgoodies_city2').val() == $('#dhtmlgoodies_city').val())
        {
            $('#err4').show();
            $('#dhtmlgoodies_city2').css('background-color','#fdd');
            return true;
        }
    if($('#dhtmlgoodies_city3').val() && ( $('#dhtmlgoodies_city3').val() == $('#dhtmlgoodies_city').val() || $('#dhtmlgoodies_city3').val() == $('#dhtmlgoodies_city2').val() ) )
        {
            $('#err4').show();
            $('#dhtmlgoodies_city3').css('background-color','#fdd');
            return true;
        }
    
    return false;
}
function getCat(sel,child)
{
	var countryCode = sel.options[sel.selectedIndex].value;
	var id=sel.value;
	document.getElementById(child).options.length = 0;
	if(countryCode.length>0){
		var index = ajax.length;
		ajax[index] = new sack();
		
		ajax[index].requestFile = '/biz/func/getcat.php?cat='+id;	
		ajax[index].onCompletion = function(){ createCities(index,child) };	
		ajax[index].runAJAX();
	}
}
function getState(sel,child)
{
	var countryCode = sel.options[sel.selectedIndex].value;
	var id=sel.value;
	document.getElementById(child).options.length = 0;
	if(countryCode.length>0){
		var index = ajax.length;
		ajax[index] = new sack();
		
		ajax[index].requestFile = '/biz/func/getstate.php?state='+id;	
		ajax[index].onCompletion = function(){ createCities(index,child) };	
		ajax[index].runAJAX();
	}
}

function getCountry(sel,child)
{
    var countryCode = sel.options[sel.selectedIndex].value;
    var id=sel.value;
    document.getElementById(child).options.length = 0;
    if(countryCode.length>0){
        var index = ajax.length;
        ajax[index] = new sack();
        
        ajax[index].requestFile = '/biz/func/getcountry.php?country='+id;    
        ajax[index].onCompletion = function(){ createCities(index,child) };    
        ajax[index].runAJAX();
    }
}

function createCities(index,child)
{
    var obj = document.getElementById(child);
 
    if(is_int(ajax[index].response)){
        var id = ajax[index].response;
        $('#state').css('display','none');
        $('#state_lbl').css('display','none');
        eval("obj.options[obj.options.length] = new Option('---','"+id+"');\n");
    }else{
        $('#state').css('display','');
        $('#state_lbl').css('display','');
        eval(ajax[index].response);
    }
}

function getNoState(sel,child)
{
    var countryCode = sel.options[sel.selectedIndex].value;
    var id=sel.value;
    document.getElementById(child).options.length = 0;
    if(countryCode.length>0){
        var index = ajax.length;
        ajax[index] = new sack();
        ajax[index].requestFile = '/biz/func/getnostate.php?country='+id;    
        ajax[index].onCompletion = function(){ createCities3(sel,index,child) };
        $('#state').css('display','none');    
        ajax[index].runAJAX();
    }
}

function getState2(sel,child)
{
    var countryCode = sel.options[sel.selectedIndex].value;
    var id=sel.value;
    document.getElementById(child).options.length = 0;
    if(countryCode.length>0){
        var index = ajax.length;
        ajax[index] = new sack();
        
        ajax[index].requestFile = '/biz/func/getstate.php?state='+id;    
        ajax[index].onCompletion = function(){ createCities2(sel,index,child) };    
        ajax[index].runAJAX();
    }
}

function getCountry2(sel,child)
{
    var countryCode = sel.options[sel.selectedIndex].value;
    var id=sel.value;
    document.getElementById(child).options.length = 0;
    if(countryCode.length>0){
        var index = ajax.length;
        ajax[index] = new sack();
        
        ajax[index].requestFile = '/biz/func/getcountry.php?country='+id;    
        ajax[index].onCompletion = function(){ createCities2(sel,index,child) };    
        ajax[index].runAJAX();
    }
}


function createCities2(sel,index,child)
{
    var obj = document.getElementById(child);
 
    if(is_int(ajax[index].response)){
        $('#state').css('display','none');
        $('#state_lbl').css('display','none');
       getNoState(sel,'biz_city');
    }else{
        $('#state').css('display','');
        $('#state_lbl').css('display','');
        eval(ajax[index].response);
    }
}

function createCities3(sel,index,child)
{
    var obj = document.getElementById(child);

    eval(ajax[index].response);
}

function is_int(value){
  if((parseFloat(value) == parseInt(value)) && !isNaN(value)){
      return true;
  } else {
      return false;
  }
}

// del biz pricing
function del_biz_pricing(id)
{
    var a=confirm("CAUTION:\nSure to delete this business pricing record?");
    if(a==0) return ;
    
    $.post("/mgt/func/delete_all.php?"+Math.random(), {
    sheet:'business_pricing',
    where:'price_id',
    equal:id
    },function(data){tips('Business price record deleted.');nav();});
       
}

// add biz pricing
function add_biz_pricing()
{
var title=$('#title').val();
var price=$('#price').val();
var duration=$('#duration').val();
var status=$('#status').val();

if(title=='')
{
    alert("Please input title");
    return false;
}

if(price=='')
{
    alert("Please input price");
    return false;
}

if(duration=='')
{
    alert("Please input duration");
    return false;
}

if(status=='')
{
    alert("Please input status");
    return false;
}

$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'business_pricing',
field:'title,price,duration,status',
value: title+','+price+','+duration+','+status
},function(data){tips('New pricing added.');nav()});

}

// del biz payment
function del_bizpayment(id)
{
    var a=confirm("CAUTION:\nSure to delete this record?");
    if(a==0) return ;
    
    $.post("/mgt/func/delete_all.php?"+Math.random(), {
    sheet:'transactions',
    where:'txn_id',
    equal:id
    },function(data){tips('Record deleted.');nav();});
       
}

function delselected_business_payment(childitem)
{
   var selected_ids='';
   var obj=$("input:checked[class='"+childitem+"']");       
    $.each(obj, function(i,item){           
       selected_ids+= $(item).val() +',';
     });   
    if(selected_ids)
    {
        var a=confirm("CAUTION!\nSure to delete these records?");
    if(a==0) return ;
    }
    else
    {
        alert('You have not selected any records.');
        return;
    }
        
    //Delete Business
    $.post("/mgt/func/delete_all.php?"+Math.random(), {
    sheet:'transactions',
    where:'txn_id',
    equal:selected_ids
    },function(data){tips('Records deleted.');nav();});

}