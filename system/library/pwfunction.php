<?php
 function writeOptions($arr,$sel='')
   {
   
    if(!is_array($arr) || empty($arr))
	return;
	$cont='';
	foreach($arr as $key=>$val)
	{
	
	 $sel1=($key==$sel)?'selected="selected"':'';
	$cont.="<option value='$key' $sel1>$val</option>";
	
	
	}
   
   return $cont;
   
   }
function writeOptions2($arr,$sel='')
   {
   
    if(!is_array($arr) || empty($arr))
	return;
	$cont='';
	foreach($arr as $val)
	{
	 
	 $sel1=(strval($val)==strval($sel))?'selected="selected"':'';
	$cont.="<option value='$val' $sel1>$val</option>";
	
	
	}
   
   return $cont;
   
   }
   function writeOptions3($arr,$arr2)
   {
   
    if(!is_array($arr) || empty($arr))
	return;
	$cont='';
	foreach($arr as $val)
	{
	 
	 $sel1=(in_array($val,$arr2))?'selected="selected"':'';
	$cont.="<option value='$val' $sel1>$val</option>";
	
	
	}
   
   return $cont;
   
   }

function ifinarr($key,$arr)
{
if(!is_array($arr) || empty($arr))
return false;
foreach($arr as $val)
  {
  
   if(stristr($key,$val))
   return true;
  
  }
return false;

}
?>