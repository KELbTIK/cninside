function getHTTPObject() {
  var xmlhttp;
 
  if(window.XMLHttpRequest){
    xmlhttp = new XMLHttpRequest();
  }
  else if (window.ActiveXObject){
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    if (!xmlhttp){
        xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
    
}

  return xmlhttp;

  
}
  
function get(wr,page) {
  var http = getHTTPObject();
  if(wr=='')
  {
  var ss=document.getElementById('search').value;
  var pg=page;
  }
  else
  {
  var ss=wr;
  var pg=page;
  }
 
 
  http.abort();
  http.open("GET", "func/membersearch_response.php?srm="+ss+"&page="+pg+"&rank="+rank, true);
  http.onreadystatechange=function() {
  if(http.readyState < 4) 
{
      document.getElementById('sr').innerHTML = "<div class=\"con\" style=\"text-align: center; border:0;\"><img src=../images/ajax-loader6.gif> <br /> <br />Searching...</div>";
}
   if (http.readyState == 4) {
   
				  if(http.status==200) {
      document.getElementById('sr').innerHTML = http.responseText;
	 
    }
  }
  }
  http.send(null);
}