// Basic Settings
function add_state()
{
var province_name=$('#province_name').val();
var c_id=$('#c_id').val();
var featured=$('#state_featured').val();
var abr=$('#state_abr').val();

if(province_name=='')
{
	alert("Please input state name");
	return false;
}
if(featured =='Y' || featured=='y')
{
    featured = 'Y';
}else{
    featured = 'N';
}
$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'province',
field:'province_name,country_id,province_short,featured',
value:province_name+','+c_id+','+abr+','+featured
},function(data){tips('New State Added.');nav()});
//setTimeout("nav()",5000)
}

function add_country()
{
    var country=$('#country').val();
    var abr=$('#abr').val();
    var featured=$('#featured').val();
    var has_state=$('#has_state').val();
    var sort=$('#sort').val();
    
    if(country=='')
    {
        alert("Please input country name");
        return false;
    }
    
    if(abr=='')
    {
        alert("Please input country name abbreviation");
        return false;
    }
    
    if(featured =='Y' || featured=='y')
    {
        featured = 'Y';
    }else{
        featured = 'N';
    }
    
    if(has_state=='Y' || has_state=='y')
    {
        has_state ='Y';
    }else{
        has_state ='N';
    }
    
    if(sort =='')
    {
        sort = 2;
    }
    
    if (has_state=='N'){
        $.post("/mgt/func/add.php?"+Math.random(), {
        sheet:'province',
        field:'province_name',
        value:country
        });
    }
    
    
    $.post("/mgt/func/add.php?"+Math.random(), {
    sheet:'country',
    field:'c_name,abr,featured,has_state,sort',
    value:country+','+abr+','+featured+','+has_state+','+sort
    },function(data){tips('New Country Added.');nav()});

}

function add_city()
{
var city_name=$('#city_name').val();
var state=$('#state').val();
var zipcode=$('#zipcode').val();
var featured=$('#city_featured').val();

if(city_name=='')
{
	alert("Please input city name");
	return false;
}

if(featured =='Y' || featured=='y')
{
    featured = 'Y';
}else{
    featured = 'N';
}
    
$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'city',
field:'city_name,city_state,featured,city_zip',
value:city_name+','+state+','+featured+','+zipcode
},function(data){tips('New City Added.');nav()});
}


function del_city(id)
{
	var a=confirm("CAUTION:\nSure to delete this city?\nAll businesses under it will be removed permanently.");
	if(a==0) return ;
	
	
	//Delete Business
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'city',
	where:'city_id',
	equal:id
	},function(data){tips('Citiy deleted.');nav();});
	//Delete Reviews
	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'business',
	where:'city_id',
	equal:id
	},function(data){});
	
}


function del_province(id)
{
	var a=confirm("CAUTION:\nSure to delete this state?");
	if(a==0) return ;


	$.post("/mgt/func/delete_all.php?"+Math.random(), {
	sheet:'province',
	where:'province_id',
	equal:id
	},function(data){tips('State deleted.');nav();});

}

function del_country(id)
{
    var a=confirm("CAUTION:\nSure to delete this?");
    if(a==0) return ;


    $.post("/mgt/func/delete_all.php?"+Math.random(), {
    sheet:'country',
    where:'c_id',
    equal:id
    },function(data){tips('Deleted.');nav();});

}