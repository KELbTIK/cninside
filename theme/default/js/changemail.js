function clearw()
{
document.getElementById('err1').style.display='none';
document.getElementById('err2').style.display='none';
}
function verify()
{

if(!document.form1.changeto.value.match(/^[\w]{1}[\w\.\-_]*@[\w]{1}[\w\-_\.]*\.[\w]{2,4}$/i) )
	{
		document.getElementById('err1').style.display='';
	}
else if(document.form1.changeto.value != document.form1.again.value)
	{
		document.getElementById('err2').style.display='';
	}
else
	{
		document.form1.submit();
	}
}