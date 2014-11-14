//==================CATEGORY===============
var ajax = new Array();
function getCat(sel,child)
{
	var countryCode = sel.options[sel.selectedIndex].value;
	var id=sel.value;
	document.getElementById(child).options.length = 0;
	if(countryCode.length>0){
		var index = ajax.length;
		ajax[index] = new sack();
		
		ajax[index].requestFile = '/my/func/getstate.php?state='+id;	
		ajax[index].onCompletion = function(){ createCities(sel,index,child) };	
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
        
        ajax[index].requestFile = '/my/func/getcountry.php?country='+id;    
        ajax[index].onCompletion = function(){ createCities(sel,index,child) };    
        ajax[index].runAJAX();
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
        ajax[index].requestFile = '/my/func/getnostate.php?country='+id;    
        ajax[index].onCompletion = function(){ createCities(sel,index,child) };
        $('#state').css('display','none');    
        ajax[index].runAJAX();
    }
}

function createCities(sel,index,child)
{
	var obj = document.getElementById(child);
 
    if(ajax[index].response == 1){
       getNoState(sel,'city');
    }else{
        eval(ajax[index].response);
    }
}

function getCountry_event(sel,child)
{
    var countryCode = sel.options[sel.selectedIndex].value;
    var id=sel.value;
    document.getElementById(child).options.length = 0;
    if(countryCode.length>0){
        var index = ajax.length;
        ajax[index] = new sack();
        
        ajax[index].requestFile = '/my/func/getcountry.php?country='+id;    
        ajax[index].onCompletion = function(){ createCities_event(sel,index,child) };    
        ajax[index].runAJAX();
    }
}


function createCities_event(sel,index,child)
{
    var obj = document.getElementById(child);
 
    if(ajax[index].response == 1){
       getNoState(sel,'location');
    }else{
        eval(ajax[index].response);
    }
}


////////////////////////////////////
function restore()
{
		$('#err1').css('display','none');
		$('#erre1').css('display','none');
		$('#err2').css('display','none');
		$('#err3').css('display','none');
		$('#err4').css('display','none');
		$('#err5').css('display','none');
		$('#err6').css('display','none');
}

function verify()
{
var e;
e=false;
if(!$('#firstname').val())
	{
		$('#err1').css('display','');
		$('#firstname').css('background-color','#ffdddd');
		e=true;
	}
	/*
if(!document.form1.lastname.value)
	{
		document.getElementById('err2').style.display='';
		document.form1.lastname.style.backgroundColor='#fdd';
		e=true;
	}*/
if(!document.form1.email.value.match(/^[\w]{1}[\w\.\-_]*@[\w]{1}[\w\-_\.]*\.[\w]{2,4}$/i) )
	{
		$('#erre1').css('display','');
		document.form1.email.style.backgroundColor='#fdd';
		e=true;
	}
if(!document.form1.password.value)
	{
		$('#err3').css('display','');
		document.form1.password.style.backgroundColor='#fdd';
		e=true;
	}
if(document.form1.password.value != document.form1.rpassword.value || !document.form1.password.value )
	{
		$('#err4').css('display','');
		document.form1.rpassword.style.backgroundColor='#fdd';
		e=true;
	}
	/*
if(!document.form1.zip.value)
	{
		document.getElementById('err5').style.display='';
		document.form1.zip.style.backgroundColor='#fdd';
		e=true;
	}
	*/
if(!((document.form1.day.value=="00" && document.form1.year.value=="0000" && document.form1.month.value=="00") || (document.form1.day.value!="00" && document.form1.year.value!="0000" && document.form1.month.value!="00")))
	{
		$('#err6').css('display','');
		document.form1.day.style.backgroundColor='#fdd';
		document.form1.month.style.backgroundColor='#fdd';
		document.form1.year.style.backgroundColor='#fdd';
		e=true;
	}
	
if (e==false)
	{
		document.form1.submit();
	}
}

function tabclick(who,number)
{
	$('.tab').removeClass('ctab');
	$(who).addClass('ctab');
	if(number==1) $('.formdisp').animate({'left':'0px'},250);
	else if(number==2) $('.formdisp').animate({'left':'-360px'},250);
}
