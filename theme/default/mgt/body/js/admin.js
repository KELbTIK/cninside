// Admin Settings
function add_admin()
{
var adminuser=$('#adminuser').val();
var password=$('#adminpass').val();
if(adminuser=='')
{
	alert("Please input admin name");
	return false;
}
if(password=='')
{
	alert("Please input admin password");
	return false;
}

$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'admin',
field:'adminuser,password',
value:adminuser+','+hex_md5(password)
},function(data){tips('New administrator added.');nav()});
//setTimeout("nav()",5000)
}

