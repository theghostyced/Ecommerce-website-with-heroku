<?php
class ModelSoconfigSetting extends Model {
	public function createTableSoconfig(){
		$this->db->query('CREATE TABLE IF NOT EXISTS `' . DB_PREFIX . 'soconfig` (
          id int(11) auto_increment,
          `store_id` int(11) NOT NULL DEFAULT 0,
          `key` varchar(255) NOT NULL,
          `value` mediumtext NOT NULL,
          `serialized` tinyint(1) NOT NULL,
		   PRIMARY KEY(id)
        ) ENGINE=MyISAM DEFAULT CHARSET=utf8;');
	}
	
	public function getSetting($stores) {
		$setting_data = array();
		if (is_array($stores)) {
			foreach($stores as $store){
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "soconfig WHERE store_id = '" . (int)$store['store_id'] . "'");
				foreach ($query->rows as $result) {
					$setting_data[$result['key']][] = json_decode($result['value'], true);
				}
			}
		}
		return $setting_data;
	}
	
	public function editSetting($data, $store_id = 0) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "soconfig`");
		foreach ($data as $key => $value) {
			if (is_array($value)) {
				if($key == 'soconfig_advanced_store'){
					foreach($value as $storeId=>$val){
						$this->db->query("INSERT INTO " . DB_PREFIX . "soconfig SET store_id = '" . (int)$storeId . "' ,`key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape(json_encode($value[0], true)) . "', serialized = '1'");
					}
				}else{
					foreach($value as $storeId=>$val){	
						$this->db->query("INSERT INTO " . DB_PREFIX . "soconfig SET store_id = '" . (int)$storeId . "' ,`key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape(json_encode($val, true)) . "', serialized = '1'");
					}
				}
			}
		}
	}
	
	/* Chua on dinh
	public function editSetting($data, $stores) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "soconfig`");
		if (is_array($stores)) {
			foreach($stores as $store){
				foreach ($data as $key => $value) {
					if (is_array($value)) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "soconfig SET store_id = '" . (int)$store['store_id'] . "' ,`key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape(json_encode($value[$store['store_id']], true)) . "', serialized = '1'");
					}
				}
			}
		}
	}*/
	
	public function deleteSetting() {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "soconfig`");
	}
	
	public function getSettingValue($key, $store_id = 0) {
		$query = $this->db->query("SELECT value FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `key` = '" . $this->db->escape($key) . "'");

		if ($query->num_rows) {
			return $query->row['value'];
		} else {
			return null;	
		}
	}
	
	public function editSettingValue($code = '', $key = '', $value = '', $store_id = 0) {
		if (!is_array($value)) {
			$this->db->query("UPDATE " . DB_PREFIX . "setting SET `value` = '" . $this->db->escape($value) . "', serialized = '0'  WHERE `code` = '" . $this->db->escape($code) . "' AND `key` = '" . $this->db->escape($key) . "' AND store_id = '" . (int)$store_id . "'");
		} else {
			$this->db->query("UPDATE " . DB_PREFIX . "setting SET `value` = '" . $this->db->escape(json_encode($value)) . "', serialized = '1' WHERE `code` = '" . $this->db->escape($code) . "' AND `key` = '" . $this->db->escape($key) . "' AND store_id = '" . (int)$store_id . "'");
		}
	}
}
