
{include file="header.tpl"}
{literal}

<style type="text/css">
<!--

#main .content { padding:5px; margin:0 10px;}
#main .content .left { float:left; width:59%; border-right:1px #ccc solid; padding-right:10px;}
#main .content .right {float:left; width:38%; margin-left:10px;}
#main .content .con{  padding-top:10px; padding-bottom:10px;; border-bottom:#ccc 1px solid;}

	.multipleSelectBoxControl span{	/* Labels above select boxes*/
		font-family:arial;
		font-size:11px;
		font-weight:bold;
	}
	.multipleSelectBoxControl div select{	/* Select box layout */
		font-family:arial;
		height:100%;
	}
	.multipleSelectBoxControl input{	/* Small butons */
		width:25px;	
	}
	
	.multipleSelectBoxControl div{
		float:left;
	}

-->
 </style>
{/literal}
 <!--Main Start-->  
 
 <div id="main">
        <div class="content">
                       <div class="con" style="height:55px; padding-top:10px; padding-left:10px;">
            		    <h1>{l t='Edit Your List'} </h1>
                        <h4>{l t='Make a list of your favorite spots to eat, secret places to score great deals, or anything you can think of! Your lists will appear on your About Me page. You can update or delete your lists at any time.'}</h4>
         				</div>
                        <div class="con"  style="height:auto;; padding-top:10px; padding-left:10px;">    
                        <h2>{$var.list_name}</h2>
                        <p>{$var.list_desc}</p>
                        <h5>[ <a href="edit.php?id={$var.id}">{l t='Edit Title And Description'}</a> ] &nbsp; &nbsp; [ <a href="del.php?id={$var.id}">{l t='Delete This List'}</a> ]</h5>
						</div>
                        <div class="con" style="height:auto; padding-top:10px; padding-left:10px;">
                        <h3>{l t='Here\'s my bookmark item'}</h3>
{literal}
	<script type="text/javascript">
	
	/************************************************************************************************************
	(C) www.dhtmlgoodies.com, October 2005
	
	This is a script from www.dhtmlgoodies.com. You will find this and a lot of other scripts at our website.	
	
	Terms of use:
	You are free to use this script as long as the copyright message is kept intact. However, you may not
	redistribute, sell or repost it without our permission.
	
	Thank you!
	
	www.dhtmlgoodies.com
	Alf Magne Kalleland
	
	************************************************************************************************************/
	
		
	var fromBoxArray = new Array();
	var toBoxArray = new Array();
	var selectBoxIndex = 0;
	var arrayOfItemsToSelect = new Array();
	
	
	function moveSingleElement()
	{
		var selectBoxIndex = this.parentNode.parentNode.id.replace(/[^\d]/g,'');
		var tmpFromBox;
		var tmpToBox;
		if(this.tagName.toLowerCase()=='select'){			
			tmpFromBox = this;
			if(tmpFromBox==fromBoxArray[selectBoxIndex])tmpToBox = toBoxArray[selectBoxIndex]; else tmpToBox = fromBoxArray[selectBoxIndex];
		}else{
		
			if(this.value.indexOf('>')>=0){
				tmpFromBox = fromBoxArray[selectBoxIndex];
				tmpToBox = toBoxArray[selectBoxIndex];			
			}else{
				tmpFromBox = toBoxArray[selectBoxIndex];
				tmpToBox = fromBoxArray[selectBoxIndex];	
			}
		}
		
		for(var no=0;no<tmpFromBox.options.length;no++){
			if(tmpFromBox.options[no].selected){
				tmpFromBox.options[no].selected = false;
				tmpToBox.options[tmpToBox.options.length] = new Option(tmpFromBox.options[no].text,tmpFromBox.options[no].value);
				
				for(var no2=no;no2<(tmpFromBox.options.length-1);no2++){
					tmpFromBox.options[no2].value = tmpFromBox.options[no2+1].value;
					tmpFromBox.options[no2].text = tmpFromBox.options[no2+1].text;
					tmpFromBox.options[no2].selected = tmpFromBox.options[no2+1].selected;
				}
				no = no -1;
				tmpFromBox.options.length = tmpFromBox.options.length-1;
											
			}			
		}
		
		
		var tmpTextArray = new Array();
		for(var no=0;no<tmpFromBox.options.length;no++){
			tmpTextArray.push(tmpFromBox.options[no].text + '___' + tmpFromBox.options[no].value);			
		}
		tmpTextArray.sort();

		var tmpTextArray2 = new Array();
		for(var no=0;no<tmpToBox.options.length;no++){
			tmpTextArray2.push(tmpToBox.options[no].text + '___' + tmpToBox.options[no].value);			
		}		
		tmpTextArray2.sort();
		
		for(var no=0;no<tmpTextArray.length;no++){
			var items = tmpTextArray[no].split('___');
			tmpFromBox.options[no] = new Option(items[0],items[1]);
			
		}		
		
		for(var no=0;no<tmpTextArray2.length;no++){
			var items = tmpTextArray2[no].split('___');
			tmpToBox.options[no] = new Option(items[0],items[1]);			
		}
	}
	
	function sortAllElement(boxRef)
	{
		var tmpTextArray2 = new Array();
		for(var no=0;no<boxRef.options.length;no++){
			tmpTextArray2.push(boxRef.options[no].text + '___' + boxRef.options[no].value);			
		}		
		tmpTextArray2.sort();		
		for(var no=0;no<tmpTextArray2.length;no++){
			var items = tmpTextArray2[no].split('___');
			boxRef.options[no] = new Option(items[0],items[1]);			
		}		
		
	}
	function moveAllElements()
	{
		var selectBoxIndex = this.parentNode.parentNode.id.replace(/[^\d]/g,'');
		var tmpFromBox;
		var tmpToBox;		
		if(this.value.indexOf('>')>=0){
			tmpFromBox = fromBoxArray[selectBoxIndex];
			tmpToBox = toBoxArray[selectBoxIndex];			
		}else{
			tmpFromBox = toBoxArray[selectBoxIndex];
			tmpToBox = fromBoxArray[selectBoxIndex];	
		}
		
		for(var no=0;no<tmpFromBox.options.length;no++){
			tmpToBox.options[tmpToBox.options.length] = new Option(tmpFromBox.options[no].text,tmpFromBox.options[no].value);			
		}	
		
		tmpFromBox.options.length=0;
		sortAllElement(tmpToBox);
		
	}
	
	
	/* This function highlights options in the "to-boxes". It is needed if the values should be remembered after submit. Call this function onsubmit for your form */
	function multipleSelectOnSubmit()
	{
		for(var no=0;no<arrayOfItemsToSelect.length;no++){
			var obj = arrayOfItemsToSelect[no];
			for(var no2=0;no2<obj.options.length;no2++){
				obj.options[no2].selected = true;
			}
		}
		
	}
	
	function createMovableOptions(fromBox,toBox,totalWidth,totalHeight,labelLeft,labelRight)
	{		
		fromObj = document.getElementById(fromBox);
		toObj = document.getElementById(toBox);
		
		arrayOfItemsToSelect[arrayOfItemsToSelect.length] = toObj;

		
		fromObj.ondblclick = moveSingleElement;
		toObj.ondblclick = moveSingleElement;

		
		fromBoxArray.push(fromObj);
		toBoxArray.push(toObj);
		
		var parentEl = fromObj.parentNode;
		
		var parentDiv = document.createElement('DIV');
		parentDiv.className='multipleSelectBoxControl';
		parentDiv.id = 'selectBoxGroup' + selectBoxIndex;
		parentDiv.style.width = totalWidth + 'px';
		parentDiv.style.height = totalHeight + 'px';
		parentEl.insertBefore(parentDiv,fromObj);
		
		
		var subDiv = document.createElement('DIV');
		subDiv.style.width = (Math.floor(totalWidth/2) - 15) + 'px';
		fromObj.style.width = (Math.floor(totalWidth/2) - 15) + 'px';

		var label = document.createElement('SPAN');
		label.innerHTML = labelLeft;
		subDiv.appendChild(label);
		
		subDiv.appendChild(fromObj);
		subDiv.className = 'multipleSelectBoxDiv';
		parentDiv.appendChild(subDiv);
		
		
		var buttonDiv = document.createElement('DIV');
		buttonDiv.style.verticalAlign = 'middle';
		buttonDiv.style.paddingTop = (totalHeight/2) - 50 + 'px';
		buttonDiv.style.width = '30px';
		buttonDiv.style.textAlign = 'center';
		parentDiv.appendChild(buttonDiv);
		
		var buttonRight = document.createElement('INPUT');
		buttonRight.type='button';
		buttonRight.value = '>';
		buttonRight.size = '30';
		buttonDiv.appendChild(buttonRight);	
		buttonRight.onclick = moveSingleElement;	
		
		var buttonAllRight = document.createElement('INPUT');
		buttonAllRight.type='button';
		buttonAllRight.value = '>>';
		buttonAllRight.onclick = moveAllElements;
		buttonDiv.appendChild(buttonAllRight);		
		
		var buttonLeft = document.createElement('INPUT');
		buttonLeft.style.marginTop='10px';
		buttonLeft.type='button';
		buttonLeft.value = '<';
		buttonLeft.onclick = moveSingleElement;
		buttonDiv.appendChild(buttonLeft);		
		
		var buttonAllLeft = document.createElement('INPUT');
		buttonAllLeft.type='button';
		buttonAllLeft.value = '<<';
		buttonAllLeft.onclick = moveAllElements;
		buttonDiv.appendChild(buttonAllLeft);
		
		var subDiv = document.createElement('DIV');
		subDiv.style.width = (Math.floor(totalWidth/2) - 15) + 'px';
		toObj.style.width = (Math.floor(totalWidth/2) - 15) + 'px';

		var label = document.createElement('SPAN');
		label.innerHTML = labelRight;
		subDiv.appendChild(label);
				
		subDiv.appendChild(toObj);
		parentDiv.appendChild(subDiv);		
		
		toObj.style.height = (totalHeight - label.offsetHeight) + 'px';
		fromObj.style.height = (totalHeight - label.offsetHeight) + 'px';

			
		selectBoxIndex++;
		
	}
	
	
	
	</script>	
{/literal}
<form method="post" action="?f=submit&id={$var.id}" onsubmit="multipleSelectOnSubmit()">

<select multiple name="fromBox" id="fromBox">
{foreach from=$var_list item=i}
	<option value="{$i.id}">{$i.name}, {$i.location}</option>
{/foreach}
</select>

<select multiple name="toBox[]" id="toBox">
{foreach from=$var_listlist item=i}
	<option value="{$i.id}">{$i.name}, {$i.location}</option>
{/foreach}
</select>


<script type="text/javascript">
var t_yourbookmarks='{l t='Your Bookmarks'}';
var t_listitems='{l t='List Items'}';
createMovableOptions("fromBox","toBox",850,200,t_yourbookmarks,t_listitems);
</script>
<p>{l t='You move elements by clicking on the buttons or by double clicking on select box items'}</p>
<div align="center">
  <input type="image" src="../../theme/{$get_theme}/images/btn_done.gif">
  </td>
  
</div>
</form>
</div>
<div class="con">
            <h1>{l t='Nothing in the list? Bookmark a listing and it will be added to this list.'}</h1>
            <p style="height:auto; padding-top:10px; padding-left:10px; font-weight: bold;"><a href="../../business/review/new.php">{l t='Go to add a business to my bookmark'} &gt;&gt;</a></p>
           </div>
          </div>
        </div>
 </div>
 <!--Main End-->
  {include file="footer.tpl"} 
