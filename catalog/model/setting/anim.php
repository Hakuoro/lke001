<?php
class ModelSettingAnim extends Model {
	public function getSetting($group) {
		$data = array(); 
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `group` = '" . $this->db->escape($group) . "'");
		
		foreach ($query->rows as $result) {
			$data[$result['key']] = $result['value'];
		}
				
		return $data;
	}
	
	public function getSettingLike($post,$tc='',$group='flash_')
	   {
	   
	   $data = array(); 
		
		$query = $this->db->query("SELECT `group` FROM " . DB_PREFIX . "setting WHERE `group`  like '" . $this->db->escape($group) . "%' and `key`='home_status' and `value`='1'");
		
		foreach ($query->rows as $result) {
		
		$data2=$this->getSetting($result['group']);
		if($tc!=''):
		if($data2['tcontroller']!=$tc)
		continue;
		endif;
		
		 if($data2['cposition']==$post)
			$data[] = $result['group'];
	   
	   
	   }
	return $data;
	
}
public function getSetting2($post,$tc='',$group='flash_')
	   {
	   
	   $data = array(); 
		$sql="SELECT `group` FROM " . DB_PREFIX . "setting WHERE `group`  = '" . $this->db->escape($group) . "' and `key`='".$group.'_status'."' and `value`='1'";
		$query = $this->db->query($sql);
		//echo $sql;
		foreach ($query->rows as $result) {
		
		$data2=$this->getSetting($result['group']);
		
		if($tc!='' ):
		 if(stristr($data2['tcontroller'],':'))
		 {
		
		$tcun=@unserialize($data2['tcontroller']);
		 if(is_array($tcun) && count($tcun)>0):
		     if(!in_array($tc,$tcun)):
			 
			 continue;
			endif;
			 
		         
		 else:
		 if($data2['tcontroller']!=$tc)
		continue;
		 
		 endif;
		 }
		 else
		 {
		 
		  if($data2['tcontroller']!=$tc)
		continue;
		 
		 }
		
		
		endif;
		
		 if($data2['cposition']==$post)
			$data[] = $result['group'];
	   
	   
	   }
	return $data;
	
}




}
?>