<?php
class ControllerExtensionModuleSoinstagramgallery extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/so_instagram_gallery');
		$data['heading_title'] = $this->language->get('heading_title');
		$this->load->model('tool/image');
		$this->document->addStyle('catalog/view/javascript/so_instagram_gallery/css/style.css');

		if (!defined ('OWL_CAROUSEL'))
		{
			$this->document->addStyle('catalog/view/javascript/so_instagram_gallery/css/animate.css');
			$this->document->addStyle('catalog/view/javascript/so_instagram_gallery/css/owl.carousel.css');
			$this->document->addScript('catalog/view/javascript/so_instagram_gallery/js/owl.carousel.js');
			define( 'OWL_CAROUSEL', 1 );
		}

		if (!defined ('FANCYBOX'))
		{
			$this->document->addStyle('catalog/view/javascript/so_instagram_gallery/css/jquery.fancybox.css');
			$this->document->addScript('catalog/view/javascript/so_instagram_gallery/js/jquery.fancybox.js');
			define( 'FANCYBOX', 1 );
		}
		
		$default = array(
			'objlang'				=> $this->language,
			'name' 					=> '',
			'head_name' 			=> '',
			'action' 				=> '',
			'module_description'	=> array(),
			'disp_title_module'		=> '1',
			'status'				=> '1',
			
			'class_suffix'			=> '',
			'type_show'				=> 'simple',
			'row'					=> '1',
			'nb_column0'			=> '4',
			'nb_column1'			=> '4',
			'nb_column2'			=> '3',
			'nb_column3'			=> '2',
			'nb_column4'			=> '1',
			
			'users_id'				=> '2104313612',
			'access_token'			=> '2104313612.1677ed0.2a631e32ce344b4580477470faa0517c',
			'limit_image'			=> '7',
			'show_fullname'			=> '1',
			
			'margin'				=> '5',
			'slideBy'				=> '1',
			'autoplay'				=> '0',
			'autoplay_timeout'		=> '5000',
			'pausehover'			=> '0',
			'autoplaySpeed'			=> '1000',
			'button_page'			=> 'under',
			'startPosition'			=> '0',
			'mouseDrag'				=> '1',
			'touchDrag'				=> '1',
			'dots'					=> '1',
			'dotsSpeed'				=> '500',
			'loop'					=> '1',
			'navs'					=> '1',
			'navSpeed'				=> '500',
			'effect'				=> 'starwars',
			'duration'				=> '800',
			'delay'					=> '500',
			
			'post_text'				=> '',
			'pre_text'				=> '',
			
			'direction'				=> ($this->language->get('direction') == 'rtl' ? 'true' : 'false'),
			'direction_class'		=> ($this->language->get('direction') == 'rtl' ? 'so-instagram-gallery-rtl' : 'so-instagram-gallery-ltr')
		);
		$module_info =  array_merge($default,$setting);
		
		$data = $module_info;
		
		if (isset($setting['module_description'][$this->config->get('config_language_id')])) {
			$data['head_name'] 			= html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['head_name'], ENT_QUOTES, 'UTF-8');
		}else{
			$data['head_name']  		= $setting['head_name'];
		}
		// caching
		$use_cache = (int)$setting['use_cache'];
		$cache_time = (int)$setting['cache_time'];
		$folder_cache = DIR_CACHE.'so/Instagram_gallery/';
		if(!file_exists($folder_cache))
			mkdir ($folder_cache, 0777, true);
		if (!class_exists('Cache_Lite'))
			require_once (DIR_SYSTEM . 'library/so/instagram_gallery/Cache_Lite/Lite.php');

		$options = array(
			'cacheDir' => $folder_cache,
			'lifeTime' => $cache_time
		);
		$Cache_Lite = new Cache_Lite($options);
		if ($use_cache){
			$this->hash = md5( serialize($setting));
			$_data = $Cache_Lite->get($this->hash);
			if (!$_data) {
				$_data = $this->load->view('extension/module/so_instagram_gallery/default.tpl', $data);
				$Cache_Lite->save($_data);
				return  $_data;
			} else {
				return  $_data;
			}
		}else{
			if(file_exists($folder_cache))
				$Cache_Lite->_cleanDir($folder_cache);
			return $this->load->view('extension/module/so_instagram_gallery/default.tpl', $data);
		}
	}
}