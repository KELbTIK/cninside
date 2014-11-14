// idea Settings
function add_idea()
{
var ideaname=$('#ideaname').val();
var ideadesc=$('#ideadesc').val();
if(ideaname=='')
{
	alert("Please input idea name");
	return false;
}
if(ideadesc=='')
{
	alert("Please input idea description");
	return false;
}

$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'list_sample',
field:'list_name,list_desc',
value:ideaname+','+ideadesc
},function(data){tips('New idea added.');nav()});
//setTimeout("nav()",5000)
}

function del_user2(id)      /** user on user profile page **/
{
    var a=confirm("CAUTION:\nSure to delete this user?\nAll other related records for this user will be removed permanently.");
    if(a==0) return ;
    
    
    //Delete user
    $.post("/mgt/func/delete_user.php?"+Math.random(), {
    equal:id
    },function(data){alert('User deleted.');});
    
    window.location = "/"
}


function del_user(id)
{
	var a=confirm("CAUTION:\nSure to delete this user?\nAll reviews, events, deals, lists, friend relationship for this user will be removed permanently.");
	if(a==0) return ;
	
	
	//Delete user
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'user',
	where:'user_id',
	equal:id
	},function(data){tips('User deleted.');nav();});
	//Delete photo
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'user_photo',
	where:'user_id',
	equal:id
	},function(data){});
	//Delete reviews
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'user_photo',
	where:'user_id',
	equal:id
	},function(data){});
	//Delete reviews
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'business_reviews',
	where:'user_id',
	equal:id
	},function(data){});
	//Delete business_claim
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'business_claim',
	where:'user_id',
	equal:id
	},function(data){});
	//Delete bookmark
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'bookmark',
	where:'user_id',
	equal:id
	},function(data){});
	//Delete comment
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'comment',
	where:'user_id',
	equal:id
	},function(data){});
	//Delete comment
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'comment',
	where:'target_id',
	equal:id
	},function(data){});
	
	//Delete compliment
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'compliment',
	where:'user_id',
	equal:id
	},function(data){});
	//Delete compliment
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'compliment',
	where:'target_id',
	equal:id
	},function(data){});
	
	//Delete deals
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'deals',
	where:'user_id',
	equal:id
	},function(data){});
	
	//Delete deals_reply
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'deals_reply',
	where:'user_id',
	equal:id
	},function(data){});
	
	//Delete event_cool
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'event_cool',
	where:'user_id',
	equal:id
	},function(data){});
	//Delete event_discuss
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'event_discuss',
	where:'user_id',
	equal:id
	},function(data){});
	//Delete event_in
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'event_in',
	where:'user_id',
	equal:id
	},function(data){});
	//Delete favorite
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'favorite',
	where:'user_id',
	equal:id
	},function(data){});
	
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'friend',
	where:'user_id',
	equal:id
	},function(data){});
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'friend',
	where:'friend_id',
	equal:id
	},function(data){});
	
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'list',
	where:'user_id',
	equal:id
	},function(data){});
	
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'masssge',
	where:'user_id',
	equal:id
	},function(data){});
	
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'talk',
	where:'user_id',
	equal:id
	},function(data){});
	
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'talk_reply',
	where:'user_id',
	equal:id
	},function(data){});
	
	
}


function delselected_user(childitem)
{
   var selected_ids='';
   var obj=$("input:checked[class='"+childitem+"']");       
    $.each(obj, function(i,item){           
       selected_ids+= $(item).val() +',';
     });   
	if(selected_ids)
	{
		var a=confirm("CAUTION!\nYou are going to delete a quantity of users.\n\rAll reviews, events, deals, lists, friend relationship for them will be removed permanently.");
		if(a==0) return ;
	}
	else
	{
		alert('You have not selected any item.');
		return;
	}
	
	
	//Delete user
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'user',
	where:'user_id',
	equal:selected_ids
	},function(data){tips('User deleted.');nav();});
	//Delete photo
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'user_photo',
	where:'user_id',
	equal:selected_ids
	},function(data){});
	//Delete reviews
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'user_photo',
	where:'user_id',
	equal:selected_ids
	},function(data){});
	//Delete reviews
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'business_reviews',
	where:'user_id',
	equal:selected_ids
	},function(data){});
	//Delete business_claim
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'business_claim',
	where:'user_id',
	equal:selected_ids
	},function(data){});
	//Delete bookmark
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'bookmark',
	where:'user_id',
	equal:selected_ids
	},function(data){});
	//Delete comment
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'comment',
	where:'user_id',
	equal:selected_ids
	},function(data){});
	//Delete comment
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'comment',
	where:'target_id',
	equal:selected_ids
	},function(data){});
	
	//Delete compliment
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'compliment',
	where:'user_id',
	equal:selected_ids
	},function(data){});
	//Delete compliment
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'compliment',
	where:'target_id',
	equal:selected_ids
	},function(data){});
	
	//Delete deals
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'deals',
	where:'user_id',
	equal:selected_ids
	},function(data){});
	
	//Delete deals_reply
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'deals_reply',
	where:'user_id',
	equal:selected_ids
	},function(data){});
	
	//Delete event_cool
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'event_cool',
	where:'user_id',
	equal:selected_ids
	},function(data){});
	//Delete event_discuss
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'event_discuss',
	where:'user_id',
	equal:selected_ids
	},function(data){});
	//Delete event_in
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'event_in',
	where:'user_id',
	equal:selected_ids
	},function(data){});
	//Delete favorite
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'favorite',
	where:'user_id',
	equal:selected_ids
	},function(data){});
	
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'friend',
	where:'user_id',
	equal:selected_ids
	},function(data){});
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'friend',
	where:'friend_id',
	equal:selected_ids
	},function(data){});
	
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'list',
	where:'user_id',
	equal:selected_ids
	},function(data){});
	
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'masssge',
	where:'user_id',
	equal:selected_ids
	},function(data){});
	
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'talk',
	where:'user_id',
	equal:selected_ids
	},function(data){});
	
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'talk_reply',
	where:'user_id',
	equal:selected_ids
	},function(data){});
	

}

// add points pricing
function add_points_pricing()
{
var title=$('#title').val();
var price=$('#price').val();
var status=$('#status:checked').val();
 

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

if(status=='')
{
    alert("Please input status");
    return false;
}

$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'points_pricing',
field:'title,price,status',
value: title+','+price+','+status
},function(data){tips('New pricing added.');nav()});

}

// del points pricing
function del_points_pricing(id)
{
    var a=confirm("CAUTION:\nSure to delete this record?");
    if(a==0) return ;
    
    $.post("/mgt/func/delete_all.php?"+Math.random(), {
    sheet:'points_pricing',
    where:'price_id',
    equal:id
    },function(data){tips('Record deleted.');nav();});
       
}

// promo code js added here

// del promo code
function del_promo_code(id)
{
    var a=confirm("CAUTION:\nSure to delete this record?");
    if(a==0) return ;
    
    $.post("/mgt/func/delete_all.php?"+Math.random(), {
    sheet:'coupons',
    where:'id',
    equal:id
    },function(data){tips('Record deleted.');nav();});
       
}

// add promo code
function add_promo_code()
{
    var coupon=$('#coupon').val();
    var amount=$('#amount').val();
    var expire=$('#expire').val();
    var status=$('#status:checked').val();
 

    if(coupon=='')
    {
        alert("Please input code");
        return false;
    }

    if(amount=='')
    {
        alert("Please input amount");
        return false;
    }

    if(expire=='')
    {
        alert("Please input expiration date");
        return false;
    }

    if(status=='')
    {
        alert("Please input status");
        return false;
    }

    $.post("/mgt/func/add.php?"+Math.random(), {
    sheet:'coupons',
    field:'coupon,amount,expire,status,c_type',
    value: coupon+','+amount+','+expire+','+status+',free_points'
    },function(data){tips('New code added.');nav()});

}