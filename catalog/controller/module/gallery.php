<?php  
class ControllerModuleGallery extends Controller {
	protected function index($setting) {
		static $module = 0;
		
		$this->load->model('design/banner');
		$this->load->model('tool/image');
		
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/gallery.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/gallery.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/gallery.css');
		}
		
		$this->data['thumb_width'] = $setting['thumb_width'];
		$this->data['thumb_height'] = $setting['thumb_height'];
		$this->data['view_width'] = $setting['view_width'];
		$this->data['view_height'] = $setting['view_height'];
		$this->data['use_table'] = $setting['use_table'];
		$this->data['use_title'] = $setting['use_title'];
		$this->data['thumb_outside_border'] = $setting['thumb_outside_border'];
		$this->data['thumb_inside_border'] = $setting['thumb_inside_border'];
		$this->data['thumb_title_background'] = $setting['thumb_title_background'];
		$this->data['thumb_title_textcolor'] = $setting['thumb_title_textcolor'];
		
		$overwrite_css = '<style type="text/css">';
		if($setting['hide_breadcrumbs']) {$overwrite_css .= '#content .breadcrumb{display:none;} ';}
		if($setting['hide_heading']) {$overwrite_css .= '#content h1{display:none;} ';}
		if($setting['hide_content']) {$overwrite_css .= '#content .content{display:none;} ';}
		if($setting['hide_buttons']) {$overwrite_css .= '#content .buttons{display:none;} ';}
		$overwrite_css .= '</style>';
		$this->data['overwrite_css'] = $overwrite_css;
		
		$this->data['banners'] = array();
		
		if (isset($setting['banner_id'])) {
			$results = $this->model_design_banner->getBanner($setting['banner_id']);
			  
			foreach ($results as $result) {
				if (file_exists(DIR_IMAGE . $result['image'])) {
					$this->data['banners'][] = array(
						'title' => $result['title'],
						'link'  => $result['link'],
						'thumbnail' => $this->model_tool_image->resize($result['image'], $setting['thumb_width'], $setting['thumb_height']),
						'image' => $this->model_tool_image->resize($result['image'], $setting['view_width'], $setting['view_height'])
					);
				}
			}
		}
		
		$this->data['module'] = $module++;
						
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/gallery.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/gallery.tpl';
		} else {
			$this->template = 'default/template/module/gallery.tpl';
		}
		
		$this->render();
	}
}
?>