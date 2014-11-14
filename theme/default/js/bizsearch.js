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
  
function get_filter(wr,page,search,item_id,item_value,item_type) {
  var http = getHTTPObject();
  if(wr=='')
  {
      var ss=document.getElementById('searchtext').value;
  }else{
      var ss=wr;
  }
 
  var city=document.getElementById('searchcity').value;
  var pg=page;
  var search=search;
  var item_id = item_id;
  
  if(item_id){ 
      if(item_type == 'maincat'){
          if(document.getElementById('maincat_'+item_id).checked == true) {
              
              var item_checked = '1'; 
          }else{
              var item_checked = '0';
          }
      
      }else if(item_type == 'checkbox'){
      
            if(document.getElementById('item_'+item_id).checked == true) {

                var item_checked = '1'; 
          }else{
          
                var item_checked = '0';  
          }
      
      } else {
                var item_checked = '1'; 
      
      }
      
      var item_value = item_value; 
      var item_type = item_type; 
  
  }else{
  
    var item_value = '';
    var item_type = '';
    var item_checked = '';
  }
  
 
 
  http.abort();
  http.open("GET", "func/bizsearch_response.php?city="+city+"&search="+search+"&srm="+ss+"&page="+pg+"&item_id="+item_id+"&item_value="+item_value+"&item_checked="+item_checked+"&item_type="+item_type, true);
  http.onreadystatechange=function() {
  if(http.readyState < 4) 
{
      document.getElementById('sr').innerHTML = "<div class=\"con\" style=\"text-align: center; border:0;\"><img src=/images/ajax-loader6.gif> <br /> <br />Loading...</div>";
}
   if (http.readyState == 4) {
   
                  if(http.status==200) {
      document.getElementById('sr').innerHTML = http.responseText;

    }
  }
  }
  http.send(null);
}



function get(wr,page,search,item_id,item_value,item_type) {
  var http = getHTTPObject();
  if(wr=='')
  {
      var ss=document.getElementById('searchtext').value;
  }else{
      var ss=wr;
  }
 
  var city=document.getElementById('searchcity').value;
  var pg=page;
  var search='f';
  var item_id = item_id;
  
  if(item_id){ 
      if(item_type == 'maincat'){
          if(document.getElementById('maincat_'+item_id).checked == true) {
              
              var item_checked = '1'; 
          }else{
              var item_checked = '0';
          }
      
      }else if(item_type == 'checkbox'){
      
            if(document.getElementById('item_'+item_id).checked == true) {

                var item_checked = '1'; 
          }else{
          
                var item_checked = '0';  
          }
      
      } else {
                var item_checked = '1'; 
      
      }
      
      var item_value = item_value; 
      var item_type = item_type; 
  
  }else{
  
    var item_value = '';
    var item_type = '';
    var item_checked = '';
  }
  
 
 
  http.abort();
  http.open("GET", "func/bizsearch_response.php?city="+city+"&search="+search+"&srm="+ss+"&page="+pg+"&item_id="+item_id+"&item_value="+item_value+"&item_checked="+item_checked+"&item_type="+item_type, true);
  http.onreadystatechange=function() {
  if(http.readyState < 4) 
{
      document.getElementById('sr').innerHTML = "<div class=\"con\" style=\"text-align: center; border:0;\"><img src=/images/ajax-loader6.gif> <br /> <br />Searching...</div>";
}
   if (http.readyState == 4) {
   
                  if(http.status==200) {
      document.getElementById('sr').innerHTML = http.responseText;

    }
  }
  }
  http.send(null);
}