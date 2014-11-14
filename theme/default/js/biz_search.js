///////////////////////////////
function get(nothing,page)
{
	$('#page').val(page);
nav();
}

///////////////////////////////
function nav()
{
var searchtext=$('#searchtext').val();
var catname=$('#catname').val();
var subcatname=$('#subcatname').val();
var cityname=$('#cityname').val();
var page=$('#page').val();

var urlPage='';
var urlSearchtext='';
var urlCatname='';
var urlSubatname='';
var urlCityname='';

if(page)  urlPage="page="+page;
else  urlPage="page=1";
if(searchtext)  urlSearchtext="&searchtext="+searchtext;
if(catname)  urlCatname="&catname="+catname;
if(subcatname)  urlSubatname="&subcatname="+subcatname;
if(cityname)  urlCityname="&cityname="+cityname;

location='/search?'+urlSearchtext+urlCatname+urlSubatname+urlCityname;

}
