function del_business(biz_id)
{
    var a=confirm("CAUTION:\nSure to delete this business?\nAll reviews and related data will be removed permanently.");
    if(a==0) return ;

    //Delete Business
    $.post("/mgt/func/delete_all.php?"+Math.random(), {
    sheet:'business',
    where:'business_id',
    equal:biz_id
    },function(data){});
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
    },function(data){alert('Business deleted!');location.reload();});
    
}


function del_business_detail(biz_id)
{
    var a=confirm("CAUTION:\nSure to delete this business?\nAll reviews and related data will be removed permanently.");
    if(a==0) return ;
    
    
    //Delete Business
    $.post("/mgt/func/delete_all.php?"+Math.random(), {
    sheet:'business',
    where:'business_id',
    equal:biz_id
    },function(data){});
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
    },function(data){alert('Business deleted!');});
    
    $(location).attr('href','/');
   
}