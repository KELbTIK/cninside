// City Choice Slide

function $$(element)
{
	return element = document.getElementById(element);
}
function $$D()
{
	var d=$$('slide');
	var h=d.offsetHeight;
	var maxh=100;
	function dmove()
	{
			h+=5; //设置层展开的速度
			if(h>=maxh)
			{
					d.style.height=maxh;
					clearInterval(iIntervalId);
			}
			else
			{
					d.style.display='block';
					d.style.height=h+'px';
			}
	}
	iIntervalId=setInterval(dmove,2);
}
function $$D2()
{
		var d=$$('slide');
		var h=d.offsetHeight;
		var maxh=100;
		function dmove()
		{
				h-=5;//设置层收缩的速度
				if(h<=0)
				{
						d.style.display='none';
						clearInterval(iIntervalId);
				}
				else
				{
						d.style.height=h+'px';
				}
		}
		iIntervalId=setInterval(dmove,2);
}
function $$use()
{
var d=$$('slide');
var sb=$$('more');
		if(d.style.display=='none')
		{
				$$D();
				sb.innerHTML='« Close';
		}
		else
		{
				$$D2();
				sb.innerHTML='More »';
		}
}