<?php
class ModelLocalisationZone extends Model {
	public function getZone($zone_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone WHERE zone_id = '" . (int)$zone_id . "' AND status = '1'");
		
		return $query->row;
	}		
	
	public function getZonesByCountryId($country_id) {
		$zone_data = $this->cache->get('zone.' . (int)$country_id);

		if (!$zone_data) {
			//$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone WHERE country_id = '" . (int)$country_id . "' AND status = '1' ORDER BY name");
	
			//$zone_data = $query->rows;

            $urlRussia = 'http://emspost.ru/api/rest/?method=ems.get.locations&type=regions&plain=true';
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_URL, $urlRussia);
            $outRussia = curl_exec($ch);
            $RussiaList = json_decode($outRussia, TRUE);

            $zone_data = array();
            foreach ($RussiaList['rsp']['locations'] as $key => $val) {
               $zone_data[$key]["zone_id"] = $val['value'];
               $zone_data[$key]["country_id"] = $country_id;
               $zone_data[$key]["code"] = $val['value'];
               $zone_data[$key]["name"] = $val['name'];
               $zone_data[$key]["status"] = 1;
            }


			$this->cache->set('zone.' . (int)$country_id, $zone_data);
		}
	
		return $zone_data;
	}
}
?>