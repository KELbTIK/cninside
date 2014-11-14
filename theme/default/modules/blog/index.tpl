{include file="header.tpl"}
{literal}
<style type="text/css">
<!--
#main .content { padding:5px; margin:0 10px;}
#main .content .left { float:left; width:72%; _width:71%; padding-right:10px;}
#main .content .right {float:left; width:25.5%; margin-left:10px; _overflow:hidden;}
#main .content .con{  padding-top:10px; padding-bottom:10px;; border-bottom:#ccc 1px solid; float:left; width:100%;}

ul.navigation {    list-style: none;    margin: 0;    padding: 0;    padding-bottom: 9px;}
ul.navigation li {	font-family:Arial, Helvetica, sans-serif;    display: inline;	margin:0;    padding-right: 5px;	padding-left:5px;	border-left:1px solid #999;}
#slider {    position: relative;  margin-bottom:10px;}
.scroll { margin-left:10px; height: 260px;    width: 98%;    overflow: auto;    overflow-x: hidden;    position: relative;    clear: left;    background: scroll left bottom;}
.scrollContainer div.panel {    padding-right:10px;    height: auto;    width: 630px;	font-size:12px;	line-height:18px;}
.panel .item {width:50%; float:left;}
.incon {width:98%; float:left; 1border-bottom:px #ccc dashed; padding:5px;}
.right .item{ margin-left:10px;}
.eventTitleComment{ font-size:11px;}
-->
 </style>
{/literal}

 <!--Main Start-->
 
 <div id="main">

        <div class="content" style=" float:left; width:97%;">
				<div class="left">
                       <div id="slider" class="con box change" style=" padding:5px;">
                       <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
            		  TEST1</div>  
  
                    <div class="con box" style=" padding:5px;">
        <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
       	       TEST2
                    </div>
                </div>
				<div class="right" >
                  <div class="con box" style="height:auto; padding-top:10px;text-align:center; margin-bottom:10px;">
                          <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
        <a href="new.php" class="Bbtn">{l t='Add New Blog'}</a>              </div> 

                  <div class="con" style="text-align:center; border:0;"> 
                  
                  <p align="center">
 	{$ads->getAdCode(8)}
</p>
                  
                  </div>
          </div>

        </div>
 </div>
 <!--Main End-->
 {include file="footer.tpl"}