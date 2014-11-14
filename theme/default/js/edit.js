function restore()
{
		$('#err4').css('display','none');
		$('#err5').css('display','none');
		$('#err6').css('display','none');
		$('#password').css('background-color','#fff');
		$('#rpassword').css('background-color','#fff');
		$('#zip').css('background-color','#fff');
}

function verify()
{
var e;
e=false;
if($('#password').val() && ($('#password').val() != $('#rpassword').val()))
	{
		$('#err4').css('display','');
		$('#password').css('background-color','#fdd');
		$('#rpassword').css('background-color','#fdd');
		e=true;
	}
	/*
if($('#day').val() =="00"||$('#password').val() =="0000"||$('#month').val() =="00")
	{
		$('#err6').css('display','');
		$('#day').css('background-color','#fdd');
		$('#month').css('background-color','#fdd');
		$('#year').css('background-color','#fdd');
		e=true;
	}
	*/
if (e)
{
$('#replyTitle').ScrollTo(1400);
}
if (e==false)
	{
		document.form1.button.disabled=true;
		document.form1.submit();
	}
}

// Get City
var ajax = new Array();
function getCat(sel,child)
{
    var countryCode = sel.options[sel.selectedIndex].value;
    var id=sel.value;
    document.getElementById(child).options.length = 0;
    if(countryCode.length>0){
        var index = ajax.length;
        ajax[index] = new sack();
        
        ajax[index].requestFile = 'func/getstate.php?state='+id;    
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
        
        ajax[index].requestFile = 'func/getcountry.php?country='+id;    
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
