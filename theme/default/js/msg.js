function sltall(checkstatus)
{
	var d=document.form1;
	var i;
	for(i=0;i<d.elements.length;i++)
	{
		if(d.elements[i].type=="checkbox"&&d.elements[i].name!="checkall")
		{
			d.elements[i].checked=checkstatus;
		}
	}
}

function notall(a){
var d=document.form1;
if (a.checked==false)
d.checkall.checked=false;
}


function sfriend(name,id){
var d=document.formsend;
d.to.value=name;
d.id.value=id;
d.to.style.backgroundColor='#fff';
document.getElementById('caution').style.display='none';
document.getElementById('friends').style.background='#fff';
}
function submitsend()
{
var d=document.formsend;
if(!d.subject.value&&!d.message.value){
alert(t_plsfill);
return;}

if(d.id.value!='0')
{
d.submit();
}
else
{
d.to.style.backgroundColor='#fdd';
document.getElementById('friends').style.background='#ffc';
document.getElementById('caution').style.display='';
}
}
	
function veri()
{
var d=document.reply;
if(!d.message.value){
alert(t_plsfillmsg);
return;}
d.submit();

}


function confirmdel()
{
var a=confirm(t_suredel);
if(a!=0)
return true;
else return false;
}