// chatter_category Settings
function add_chatter_category()
{
var name=$('#name').val();
if(name=='')
{
	alert("Please input category name");
	return false;
}

$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'talk_cat',
field:'cat_name',
value:name
},function(data){tips('New category added.');nav()});
//setTimeout("nav()",5000)
}

// event_category Settings
function add_event_category()
{
var name=$('#name').val();
if(name=='')
{
	alert("Please input category name");
	return false;
}

$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'event_cat',
field:'cat_name',
value:name
},function(data){tips('New category added.');nav()});
//setTimeout("nav()",5000)
}


// deals_category Settings
function add_deals_category()
{
var cat_name=$('#cat_name').val();
if(cat_name=='')
{
	alert("Please input category name");
	return false;
}

$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'deals_cat',
field:'cat_name',
value:cat_name
},function(data){tips('New category added.');nav()});
//setTimeout("nav()",5000)
}


// sub_deals_category Settings
function add_deals_subcategory()
{
var sub_parent=$('#sub_parent').val();
var sub_name=$('#sub_name').val();

if(sub_parent=='')
{
	alert("Please select category name");
	return false;
}

if(sub_name=='')
{
	alert("Please input subcategory name");
	return false;
}

$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'deals_subcat',
field:'cat_id,subcat_name',
value:sub_parent+','+sub_name
},function(data){tips('New subcategory added.');nav()});
//setTimeout("nav()",5000)
}



// biz Settings
function add_biz_category()
{
var cat_name=$('#cat_name').val();
var cat_image=$('#cat_image').val();
var keywords=$('#cat_keywords').val();
var description=$('#cat_description').val();

if(cat_name=='')
{
	alert("Please input category name");
	return false;
}

if(cat_image=='')
{
	var a=confirm("You have not uploaded the category image.\n\rClick OK to use a Meeplace default ICON\n\ror Cancel to upload an ICON");
if(a==0) return ;
else cat_image='mp_16.png';
}

cat_image='icons/'+cat_image;
$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'business_category',
field:'cat_name,cat_image,keywords,description,permalink',
php_function:'$values[4]=biz_mark_convert($values[0]);',
value:cat_name+','+cat_image+','+keywords+','+description
},function(data){tips('New category added.');nav()});
//setTimeout("nav()",5000)
}


// sub_biz Settings
function add_biz_subcategory()
{
var sub_parent=$('#sub_parent').val();
var sub_name=$('#sub_name').val();
var keywords=$('#sub_keywords').val();
var description=$('#sub_description').val();

if(sub_parent=='')
{
	alert("Please select category name");
	return false;
}

if(sub_name=='')
{
	alert("Please input subcategory name");
	return false;
}

$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'business_sub_category',
field:'b_maincat_id,b_subcat_name,keywords,description,permalink',
php_function:'$values[4]=biz_mark_convert($values[1]);',
value:sub_parent+','+sub_name+','+keywords+','+description
},function(data){tips('New subcategory added.');nav()});
//setTimeout("nav()",5000)
}


////////////////
// biz category item
function add_biz_category_item()
{
var item_title=$('#item_title').val();
var item_type=$('#item_type').val();
var item_value=$('#item_value').val();
var item_status=$('#item_status').val();
var item_required=$('#item_required').val();
if(item_title=='')
{
    alert("Please input item name");
    return false;
}


if(item_value=='' && (item_type=='radio' || item_type=='checkbox'))
{
    alert("Please input item value");
    return false;
}

if(item_status=='')
{
    alert("Select whether you want to include this item in search filter");
    return false;
}

if(item_required=='')
{
    alert("Select whether you want this item to be a required field");
    return false;
}

$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'business_sub_category_item',
field:'title,type,value,status,required',
value: item_title+','+item_type+','+item_value+','+item_status+','+item_required
},function(data){tips('New business category item added.');nav()});
//setTimeout("nav()",5000)
}

// update category item
function assign_category_item(id)
{

var ids=id;
var ids_array=ids.split("-");
var id0 = ids_array[0];
var id1 = ids_array[1]; 

    $.post("/mgt/func/update_submit.php?"+Math.random(), {
    sheet:'business_category',
    field:'cate_item',
    value:id1,
    where:'cat_id',
    equal:id0
    },function(data){tips('Category Items Saved');nav()});     
}


// update sub-category item
function assign_sub_category_item(id)
{

var ids=id;
var ids_array=ids.split("-");
var id0 = ids_array[0];
var id1 = ids_array[1]; 

    $.post("/mgt/func/update_submit.php?"+Math.random(), {
    sheet:'business_sub_category',
    field:'cate_item',
    value:id1,
    where:'b_sub_cat_id',
    equal:id0
    },function(data){tips('Sub-Category Items Saved');nav()});     
}

function add_biz_rating_item()
{
var item_title=$('#item_title').val();

if(item_title=='')
{
    alert("Please input item name");
    return false;
}

$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'business_rating_items',
field:'title',
value: item_title
},function(data){tips('New rating item added.');nav()});

}

function assign_category_rating_item(id)
{

var ids=id;
var ids_array=ids.split("-");
var id0 = ids_array[0];
var id1 = ids_array[1]; 

    $.post("/mgt/func/update_submit.php?"+Math.random(), {
    sheet:'business_category',
    field:'cate_rating_item',
    value:id1,
    where:'cat_id',
    equal:id0
    },function(data){tips('Category Star Rating Items Saved');nav()});     
}

function assign_sub_category_rating_item(id)
{

var ids=id;
var ids_array=ids.split("-");
var id0 = ids_array[0];
var id1 = ids_array[1]; 

    $.post("/mgt/func/update_submit.php?"+Math.random(), {
    sheet:'business_sub_category',
    field:'cate_rating_item',
    value:id1,
    where:'b_sub_cat_id',
    equal:id0
    },function(data){tips('Sub-Category Star Rating Items Saved');nav()});     
}

////////////////
// ad zone/ position
function add_ad_zone()
{
var cat_name=$('#zone_name').val();

if(cat_name=='')
{
	alert("Please input zone name");
	return false;
}

$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'ad_zone',
field:'name',
value: cat_name
},function(data){tips('New zone added.');nav()});
//setTimeout("nav()",5000)
}


// sub_biz Settings
function add_ad_position()
{
var sub_parent=$('#sub_parent').val();
var sub_name=$('#sub_name').val();

if(sub_parent=='')
{
	alert("Please select zone");
	return false;
}

if(sub_name=='')
{
	alert("Please input position name");
	return false;
}

$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'ad_position',
field:'name,parentid',
value:sub_name+','+sub_parent
},function(data){tips('New position added.');nav()});
//setTimeout("nav()",5000)
}

// del biz_cat_item
function del_biz_cat_item(id)
{
    var a=confirm("CAUTION:\nSure to delete this business category's item? Removing this item will remove information from any listings using this item.");
    if(a==0) return ;
    
    
    //Delete category item
    $.post("/mgt/func/delete_all.php?"+Math.random(), {
    sheet:'business_sub_category_item',
    where:'id',
    equal:id
    },function(data){tips('Business category item deleted.');nav();});
    //Delete business feature item
    $.post("/mgt/func/delete_all.php?"+Math.random(), {
    sheet:'business_feature_item',
    where:'item_id',
    equal:id
    },function(data){});
       
}

function del_biz_rating_item(id)
{
    var a=confirm("CAUTION:\nSure to delete this star rating item?");
    if(a==0) return ;

   $.post("/mgt/func/delete_all.php?"+Math.random(), {
    sheet:'business_rating_items',
    where:'item_id',
    equal:id
    },function(data){tips('Star rating item deleted.');nav();}); 
       
}

