<?php
class ControllerExtensionModuleSodeals extends Controller {
	public function index($setting) {
		static $module = 1;
		$this->load->language('extension/module/so_deals');
		$data['heading_title'] = $this->language->get('heading_title');
		$this->load->model('design/banner');
		$this->load->model('tool/image');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('extension/module/so_deals');
		$this->document->addStyle('catalog/view/javascript/so_deals/css/style.css');
		$this->document->addStyle('catalog/view/javascript/so_deals/css/css3.css');
		if (!defined ('OWL_CAROUSEL'))
		{
			$this->document->addStyle('catalog/view/javascript/so_deals/css/animate.css');
			$this->document->addStyle('catalog/view/javascript/so_deals/css/owl.carousel.css');
			$this->document->addScript('catalog/view/javascript/so_deals/js/owl.carousel.js');
			define( 'OWL_CAROUSEL', 1 );
		}
		$default = array(
			'objlang'				=> $this->language,
			'name' 					=> '',
			'module_description'	=> array(),
			'disp_title_module'		=> '1',
			'status'				=> '1',
			'class_suffix'			=> '',
			'item_link_target'		=> '_blank',
			'nb_column0'			=> '4',
			'nb_column1'			=> '4',
			'nb_column2'			=> '3',
			'nb_column3'			=> '2',
			'nb_column4'			=> '1',
			'nb_row'				=> '1',
			'categorys'				=> array(),
			'child_category'		=> '1',	
			'category_depth'		=> '1',
			'product_sort'			=> 'p.price',
			'product_ordering'		=> 'ASC',
			'source_limit'			=> '6',
			'display_title'			=> '1',
			'title_maxlength'		=> '50',
			'display_description'	=> '1',
			'description_maxlength' => '100',
			'display_price'			=> '1',
			'display_addtocart'		=> '1',
			'display_wishlist' 		=> '1',
			'display_compare'		=> '1',
			'display_rating'		=> '1',
			'display_sale'			=> '1',
			'display_new'			=> '1',
			'date_day'				=> '7',
			'product_image_num' 	=> '1',
			
			'product_image'			=> '1',
			'product_get_image_data'=> '1',
			'product_get_image_image'=> '1',
			'width'					=> '200',
			'height'				=> '200',
			'placeholder_path'		=> 'nophoto.png',
			'margin'				=> '5',
			'slideBy'				=> '1',
			'autoplay'				=> '0',
			'autoplayTimeout'		=> '5000',
			'autoplayHoverPause'	=> '0',
			'autoplaySpeed'			=> '1000',
			'startPosition'			=> '0',
			'mouseDrag'				=> '1',
			'touchDrag'				=> '1',
			'loop'					=> '1',
			'button_page' 			=> 'top',
			'dots'					=> '1',
			'dotsSpeed'				=> '500',
			'navs'					=> '1',
			'navSpeed'				=> '500',
			'effect'				=> 'starwars',
			'duration'				=> '800',
			'delay'					=> '500',
			
			'post_text'				=> '',
			'pre_text'				=> '',
			'use_cache'				=> '1',
			'cache_time'			=> '3600',
			'direction'				=> ($this->language->get('direction') == 'rtl' ? 'true' : 'false'),
			'direction_class'		=> ($this->language->get('direction') == 'rtl' ? 'so-deals-rtl' : 'so-deals-ltr')
		);
		$data =  array_merge($default,$setting);//check data empty setting
		if (!isset($setting['limit'])) {
			$setting['limit'] = 3;
		}
		if (!isset($setting['start'])) {
			$setting['start'] = 0;
		}
		if (!isset($setting['width'])) {
			$setting['width'] = 100;
		}
		if (!isset($setting['height'])) {
			$setting['height'] = 200;
		}
		$data['nb_rows'] 			= $setting['nb_row'];
		$data['start'] 				= $setting['start'];
		$data['autoplay'] 				= ($setting['autoplay'] ==1 ? "true" : "false");
		$data['autoplay_hover_pause'] 	= ($setting['autoplayHoverPause'] ==1 ? "true" : "false");
		$data['mouseDrag'] 				= ($setting['mouseDrag'] == 1 ? "true" : "false" );
		$data['touchDrag'] 				= ($setting['touchDrag'] == 1 ? "true" : "false" );
		$data['loop'] 					= ($setting['loop'] == 1 ? "true" : "false" );
		$data['dots'] 					= ($setting['dots'] == 1 ? "true" : "false");
		$data['navs'] 					= ($setting['navs'] == 1 ? "true" : "false");
		if (isset($setting['module_description'][$this->config->get('config_language_id')])) {
			$data['head_name'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['head_name'], ENT_QUOTES, 'UTF-8');
		}else{
			$data['head_name']  = $setting['head_name'];
		}	
		//Default	
		$catids = $setting['category'];
		$list = array();
		$product_arr = array();
		$cats = array();
		$_catids = (array)self::processCategory($catids);
		if(count($_catids) != 0)
		{
			$category_id_list = self::getCategoryson($_catids,$setting);
			$product_arr = self::getProducts($category_id_list,$setting);
		}
		$data['list'] = $product_arr;
		
		$data['product_features'] = array();
		$data['product_feature_ids'] = array();
		if($setting['display_feature']){
			$data['product_feature_ids'] = $setting['product_feature'];
			if(count($setting['product_feature']) > 0){
				$filter_data = array(
					'filter_product_id'  => implode(',',$setting['product_feature']),
					'sort'         => $setting['product_sort'],
					'order'        => $setting['product_ordering'],
					'limit'        => $setting['source_limit'],
					'start' 	   => $setting['start']
				);
				$products_deals = $this->model_extension_module_so_deals->getDeals($filter_data);
				foreach($products_deals as $product)
				{
					$specialPriceToDate = '';
					if (strtotime ($product['date_start']) != false && strtotime ($product['date_end']) != false)
					{
						$current = date ('Y/m/d H:i:s');
						$start_date = date ('Y/m/d H:i:s', strtotime ($product['date_start']));
						$date_end = date ('Y/m/d H:i:s', strtotime ($product['date_end']));
						if (strtotime ($date_end) >= strtotime ($current) && strtotime ($start_date) <= strtotime ($date_end))
							$specialPriceToDate = $date_end;
					}
					
					$product_image = $this->model_catalog_product->getProductImages($product['product_id']);
					
					$product_info = $this->model_catalog_product->getProduct($product['product_id']);
					
					$product_image_first = array_shift($product_image);
					$image2 = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					if($product_image_first != null)
					{
						$image2 = $this->model_tool_image->resize($product_image_first['image'], $setting['width'], $setting['height']);
					}
					if ($product_info['image'] && $setting['product_get_image_data']) {
						$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
					}elseif(isset($product_image[0]['image']) && $setting['product_get_image_image']){
						$image = $this->model_tool_image->resize($product_image[0]['image'], $setting['width'], $setting['height']);
					} else {
						$url = file_exists("image/so_deals/images/".$setting['placeholder_path']);
						if ($url) {
							$image_name = "so_deals/images/".$setting['placeholder_path'];
						} else {
							$image_name = "no_image.png";
						}
						$image = $this->model_tool_image->resize($image_name, $setting['width'], $setting['height']);
					}
					
					if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$price = false;
					}

					if ((float)$product_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
						$discount = '-'.round((($product_info['price'] - $product_info['special'])/$product_info['price'])*100, 0).'%';
					} else {
						$special = false;
						$discount = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}
					
					$name = (($setting['title_maxlength'] != 0 && strlen($product_info['name']) > $setting['title_maxlength'] ) ? (utf8_substr(strip_tags(html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8')), 0, $setting['title_maxlength']) .'..') : $product_info['name']);
					$description = (($setting['description_maxlength'] != 0 && strlen($product_info['description']) > $setting['description_maxlength'] ) ? utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['description_maxlength']) . '..' : $product_info['description']);
					
					$datetimeNow = new DateTime();
					$datetimeCreate = new DateTime($product_info['date_available']);
					$interval = $datetimeNow->diff($datetimeCreate);
					$dateDay = $interval->format('%a');
					$productNew = ($dateDay <= $setting['date_day'] ? 1 : 0);
					
					
				
					$data['product_features'][] = array(
						'product_id'  		=> $product_info['product_id'],
						'thumb'       		=> $image,
						'thumb2'       		=> $image2,
						'name'        		=> $product_info['name'],
						'name_maxlength'    => $name,
						'description' 		=> $product_info['description'],
						'description_maxlength'	=> $description,
						'price'       		=> $price,
						'special'     		=> $special,
						'discount'			=> $discount,
						'productNew'		=> $productNew,
						'tax'         		=> $tax,
						'rating'      		=> $rating,
						'date_added'  		=> $product_info['date_added'],
						'model'  	  		=> $product_info['model'],
						'quantity'    		=> $product_info['quantity'],
						'href'        		=> $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
						'specialPriceToDate' => $specialPriceToDate,
					);
				}
			}
		} // display feature
		$data['module'] = $module++;

		// caching
		$use_cache = (int)$setting['use_cache'];
		$cache_time = (int)$setting['cache_time'];
		$folder_cache = DIR_CACHE.'so/Deals/';
		if(!file_exists($folder_cache))
			mkdir ($folder_cache, 0777, true);
		if (!class_exists('Cache_Lite'))
			require_once (DIR_SYSTEM . 'library/so/deals/Cache_Lite/Lite.php');

		$options = array(
			'cacheDir' => $folder_cache,
			'lifeTime' => $cache_time
		);
		$Cache_Lite = new Cache_Lite($options);
		if ($use_cache){
			$this->hash = md5( serialize($setting));
			$_data = $Cache_Lite->get($this->hash);
			if (!$_data) {
				$_data = $this->load->view('extension/module/so_deals/default.tpl', $data);
				$Cache_Lite->save($_data);
				return  $_data;
			} else {
				return  $_data;
			}
		}else{
			if(file_exists($folder_cache))
				$Cache_Lite->_cleanDir($folder_cache);
			return $this->load->view('extension/module/so_deals/default.tpl', $data);
		}
	}
	
	public function getCategoryson($category_list, $setting)
	{
		if($setting['child_category'] ==1)
		{
			for($i=1; $i<=$setting['category_depth'];$i++)
			{
				$filter_data = array(
					'category_id'  => implode(',',$category_list),
				);
				
				$categoryss = $this->model_extension_module_so_deals->getCategories_son_deals($filter_data);

				foreach ($categoryss as $category)
				{
					if(!in_array($category['category_id'],$category_list))
					{
						$category_list[] = $category['category_id'];
					}
				}
			}
		}
		return $category_list;
	}
	public function getProducts($category_id_list,$setting)
	{
		$list = array();
		$filter_data = array(
			'filter_category_id'  => implode(',',$category_id_list),
			'sort'         => $setting['product_sort'],
			'order'        => $setting['product_ordering'],
			'limit'        => $setting['source_limit'],
			'start' 	   => $setting['start']
		);
		$products_arr = $this->model_extension_module_so_deals->getProducts_deals($filter_data);
		if (count($products_arr) > 0) 
		{
			$cat['child'] = array();
			foreach($products_arr as $product)
			{
				$specialPriceToDate = '';
				if (strtotime ($product['date_start']) != false && strtotime ($product['date_end']) != false)
				{
					$current = date ('Y/m/d H:i:s');
					$start_date = date ('Y/m/d H:i:s', strtotime ($product['date_start']));
					$date_end = date ('Y/m/d H:i:s', strtotime ($product['date_end']));
					if (strtotime ($date_end) >= strtotime ($current) && strtotime ($start_date) <= strtotime ($date_end))
						$specialPriceToDate = $date_end;
				}
				
				$product_image = $this->model_catalog_product->getProductImages($product['product_id']);
				
				$product_info = $this->model_catalog_product->getProduct($product['product_id']);
				
				$product_image_first = array_shift($product_image);
				$image2 = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				$image_small = $this->model_tool_image->resize($product_image_first['image'], 110, 110);
				
				if($product_image_first != null)
				{
					$image2 = $this->model_tool_image->resize($product_image_first['image'], $setting['width'], $setting['height']);
				}
				if ($product_info['image'] && $setting['product_get_image_data']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
				}elseif(isset($product_image[0]['image']) && $setting['product_get_image_image']){
					$image = $this->model_tool_image->resize($product_image[0]['image'], $setting['width'], $setting['height']);
				} else {
					$url = file_exists("image/so_deals/images/".$setting['placeholder_path']);
					if ($url) {
						$image_name = "so_deals/images/".$setting['placeholder_path'];
					} else {
						$image_name = "no_image.png";
					}
				
					$image = $this->model_tool_image->resize($image_name, $setting['width'], $setting['height']);
					
				}
				
				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$discount = '-'.round((($product_info['price'] - $product_info['special'])/$product_info['price'])*100, 0).'%';
				} else {
					$special = false;
					$discount = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
				
				$name = (($setting['title_maxlength'] != 0 && strlen($product_info['name']) > $setting['title_maxlength'] ) ? (utf8_substr(strip_tags(html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8')), 0, $setting['title_maxlength']) .'..') : $product_info['name']);
				$description = (($setting['description_maxlength'] != 0 && strlen($product_info['description']) > $setting['description_maxlength'] ) ? utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['description_maxlength']) . '..' : $product_info['description']);
				
				$datetimeNow = new DateTime();
				$datetimeCreate = new DateTime($product_info['date_available']);
				$interval = $datetimeNow->diff($datetimeCreate);
				$dateDay = $interval->format('%a');
				$productNew = ($dateDay <= $setting['date_day'] ? 1 : 0);
			
				$cat['child'][] = array(
					'product_id'  		=> $product_info['product_id'],
					'thumb'       		=> $image,
					'thumbSmall'       		=> $image_small,
					'thumb2'       		=> $image2,
					'name'        		=> $product_info['name'],
					'name_maxlength'    => $name,
					'description' 		=> $product_info['description'],
					'description_maxlength'	=> $description,
					'price'       		=> $price,
					'special'     		=> $special,
					'discount'			=> $discount,
					'productNew'		=> $productNew,
					'tax'         		=> $tax,
					'rating'      		=> $rating,
					'date_added'  		=> $product_info['date_added'],
					'model'  	  		=> $product_info['model'],
					'quantity'    		=> $product_info['quantity'],
					'href'        		=> $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
					'specialPriceToDate' => $specialPriceToDate,
				);
			}
			$list = $cat['child'];
		}
		return $list;
	}
		
	private function processCategory($catids)
	{
		$category_list = array();
		foreach($catids as $category_item)
		{
			$checkCategory = $this->model_extension_module_so_deals->checkCategory($category_item);
			/*if(isset($checkCategory) && $checkCategory[0]['status'] == 1 && $checkCategory != null)
			{
				$category_list[] =  $category_item;
			}*/
			$category_list[] =  $category_item;
		}
		return $category_list;
	}	
}