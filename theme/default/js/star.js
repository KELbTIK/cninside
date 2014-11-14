

//===========STAR==================

var sArray = new Object;

sArray[0] = new Image;

sArray[0].src = "/theme/default/images/star/star_big_grey.gif";

for (var i=1; i<6; i++) {

	sArray[i] = new Image();

	sArray[i].src = "/theme/default/images/star/star_big_" + i + ".gif";

}

var starTimer;

function showStars(starNum) {

	clearStarTimer();

	greyStars();

	colorStars(starNum);
	

}

function showStarsnew(starNum,j) {

    clearStarTimer();

    greyStarsnew(j);

    colorStarsnew(starNum,j);
    

}

function colorStars(starNum) 

{

	for (var i=1; i <= starNum; i++) {

		var tmpStar = document.getElementById('star_' + i);

		tmpStar.src = sArray[starNum].src;

	}
	$('#rate'+starNum).show();
}

function colorStarsnew(starNum,j) 

{

    for (var i=1; i <= starNum; i++) {

        var tmpStar = document.getElementById(j+'star_' + i);

        tmpStar.src = sArray[starNum].src;

    }
    $('#'+j+'rate'+starNum).show();
}

function greyStars() {
    
	for (var i=1; i<6; i++) {

		var tmpStar = document.getElementById('star_' + i);

		tmpStar.src = sArray[0].src;

	}
	
	
	for( i=1; i<6; i++)
	{
		$('#rate'+i).hide();
	}

}

function greyStarsnew(j) {

    for (var i=1; i<6; i++) {

        var tmpStar = document.getElementById(j+'star_' + i);

        tmpStar.src = sArray[0].src;

    }
    
    
    for( i=1; i<6; i++)
    {
        $('#'+j+'rate'+i).hide();
    }

}

function setStars(starNum) {

	clearStarTimer();

	var rating = document.getElementById('rating');

	rating.value = starNum;

		showStars(starNum);

 //document.getElementById('frm').action='profile.php?page=add_biz&response='+starNum; 

}

function setStarsnew(starNum,j) {
    var j=j;
    clearStarTimer();

    var rating = document.getElementById('rating'+j);

    rating.value = starNum;

        showStarsnew(starNum,j);

 //document.getElementById('frm').action='profile.php?page=add_biz&response='+starNum; 

}

function clearStars() {

	starTimer = setTimeout("resetStars()", 300);

}

function clearStarsnew(j) {

    starTimer = setTimeout('resetStarsnew('+j+')', 300);

}

function resetStars() {

	clearStarTimer();

	var rating = document.getElementById('rating');

	if (rating.value != '') {

		setStars(rating.value);

	} else {

		greyStars();

	}

}

function resetStarsnew(j) {

    clearStarTimer();

    var rating = document.getElementById('rating'+j);

    if (rating.value != '') {

        setStarsnew(rating.value,j);

    } else {

        greyStarsnew(j);

    }

}

function clearStarTimer() {

	if (starTimer) {

		clearTimeout(starTimer);

		starTimer = null;

	}

}

function replaceStars(){

var str ='';

for(var i=1;i<6;i++)

	{	 

		str+='<a href="#" onmouseover="showStars('+i+');return false" onmouseout="clearStars();return false" onclick="setStars('+i+');return false" ><img src="/theme/default/images/star/star_big_grey.gif" id="star_'+i+'" border="0" width="17" height="18"></a>';	

	}

document.getElementById('starRating').innerHTML=str;

}

function replaceStarsnew(j){

var str ='';
var j=j;

for(var i=1;i<6;i++)

    {     

        str+='<a href="#" onmouseover="showStarsnew('+i+','+j+');return false" onmouseout="clearStarsnew('+j+');return false" onclick="setStarsnew('+i+','+j+');return false" ><img src="/theme/default/images/star/star_big_grey.gif" id="'+j+'star_'+i+'" border="0" width="17" height="18"></a>';    

    }

document.getElementById('starRating'+j).innerHTML=str;

}

