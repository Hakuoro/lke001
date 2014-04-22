<?php 
class ControllerModulePowerPlay extends Controller {
var $errors=array();
//var $arr=
protected  $key='powerplay';

protected $defarr=array('color1'=>'#262626','alpha1'=>'1','alpha2'=>'1','color2'=>'#ffffff','mpdt'=>'5',
'mptc'=>'#000000','textbar_bg'=>'#000000','textbar_alpha'=>'0.5','thumb_color1'=>'#ffffff','thumb_color2'=>'#cccccc',
'thumb_alpha1'=>'1','thumb_alpha2'=>'1','thumb_panel_height'=>'80','bar_color'=>'#000000','bar_alpha'=>'0.4','bar_height'=>'24','menu_bg'=>'#000000','menu_alpha'=>'0.4','menu_up_color'=>'#FFFFFF','menu_over_color'=>'#B5FF00','controls_over_color'=>'#B5FF00','thumb_height'=>'70',
'thumb_width'=>'90','thumb_position'=>'bottom','link_window'=>'current',
'price_tag_enabled'=>'yes',
'price_tag_post'=>'TL',
'price_tag_text_size'=>22,
'currency_base_color1'=>'#FFFFFF',
'currency_base_alpha1'=>'0.8',
'currency_base_alpha2'=>'0.8',
'currency_base_color2'=>'#CECECE',
'currency_label_color'=>'#FF00CC',
'currency_label_alpha'=>'0.8',
'currency_price_base_color'=>'#FF00CC',
'currency_price_base_alpha'=>'0.8',
'price_label_alpha'=>'0.8',
'price_label_color'=>'#101010',
'price_base_color'=>'#FF00CC',
'price_base_alpha'=>'0.5',
'penabled'=>'yes',
'imclose'=>'fade',
'imtime'=>200,
'currency_symbol'=>'$',
'movie_wmode'=>'opaque',
'movie_height'=>'650',
'movie_width'=>'872',
'movie_bgcolor'=>'#ffffff'
);
protected $descarr=array('Plain'=>1,'Linear Fade'=>'2','Linear Drop'=>'3','Linear Elastic Drop'=>'4','Linear Pop'=>5,
'Linear Elastic Pop'=>6,
'Random Elastic Drop'=>'7',
'Random Elastic Pop'=>'8'


);
protected $defmodules=array(1);
protected $defm=array('1'=>array('position'=>'content_top','sort_order'=>'2','layout_id'=>'1','status'=>'1'));

protected $postarr=array('Top Left'=>'TL','Top Right'=>'TR','Bottom Left'=>'BL','Bottom Right'=>'BR');
protected $wmodearr=array('opaque'=>'opaque','window'=>'window','transparent'=>'transparent');
protected $imarr=array('Fade'=>1,'Zoom Out'=>'2','Elastic Zoom In'=>'3','Blur Zoom Out'=>'4','Elastic Slide'=>5,
'Squares'=>6,
'Triple Squares'=>'7',
'Horizontal Stripes'=>'8',
'Vertical Stripes'=>'9',
'Waves'=>'10',
'Scales Bars'=>'11',
'Bounce Slide'=>12,
'Iris'=>13,
'Alpha Mask'=>14,
'Intersected Bars'=>15


);



	public function index() {
	$this->imarr=array_flip($this->imarr);
		$this->descarr=array_flip($this->descarr);
	$key1=$this->key;
		$this->data = array_merge($this->data, $this->load->language('module/powerplay'));
         $this->load->library('pwfunction');
		$this->document->setTitle($this->language->get('heading_title')); 
		$yarr=array('yes'=>'Yes','no'=>'No');
		$closearr=array('opened'=>'Opened','closed'=>'Closed');
		$postarr=array('top'=>'top','bottom'=>'bottom');
		$alphaarr=range(0,1,0.1);
		$windarr=array('new'=>'new','current'=>'current');
		$zoomarr=array('disabled'=>'disabled','enabled'=>'enabled');
		$contarr=array('home'=>'home','product'=>'product');
		$cpostarr=array('header'=>'header','content'=>'content');
		$this->load->model('setting/setting');
		
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			//$this->load->model('setting/setting');
			$post=$this->request->post;
		
			 $post["flash_home_category"]=serialize($post["flash_home_category"]);
			
			
			$this->model_setting_setting->editSetting($key1, $post);				
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect(HTTPS_SERVER . 'index.php?route=module/powerplay&token=' . $this->session->data['token']);
		}
		
		
		
		
		 if(isset($this->errors) && count($this->errors)>0)
		 {
		 
		 
		 foreach($this->errors as $key1=>$v)
		      {
			  
			  $key='error_'.$key1;
			  $this->data[$key]=$v;
			  
			  }
			 
			 
			  
		 
		 
		 }
		 else
		 {
		 
		 $arr2=array('color1','alpha1','alpha2','color2','mptc','mpdt','textbar_bg','textbar_alpha','thumb_color1','thumb_alpha1','thumb_alpha2','thumb_panel_height',
		'thumb_color2','bar_height','bar_color','menu_bg','menu_alpha','menu_up_color','menu_over_color','controls_over_color','thumb_height','thumb_width',
		'thumb_position','bar_alpha','flash_open_category','flash_home_category',
		'price_tag_text_size',
		'currency_base_color1',
		'currency_base_color2',
	
		'currency_label_color',
		'currency_price_base_color',
		'currency_base_alpha1',
		'currency_base_alpha2',
		'price_label_color',
		'price_label_alpha',
		'price_base_color',
		'price_base_alpha',
		'price_tag_enabled',
		'image_close_effect',
		'imtime',
		'currency_symbol',
		'movie_wmode',
		'movie_height',
		'movie_width',
		'movie_bgcolor'
		
		
		
		);
		 
		  foreach($arr2 as $v1)
		      {
			  
			  $key2='error_'.$v1;
			  
			  $this->data[$key2]='';
			  
			  }
		 
		 
		 
		 }

/*
       $this->data['entry_color1']=$this->language->get('entry_color1');
       $this->data['entry_color2']=$this->language->get('entry_color2');
        $this->data['entry_alpha1']=$this->language->get('entry_alpha1');
       $this->data['entry_alpha2']=$this->language->get('entry_alpha2');
	    $this->data['entry_mp_display_time']=$this->language->get('entry_mp_display_time');
		 $this->data['entry_mp_alpha']=$this->language->get('entry_mp_alpha');
		 $this->data['entry_mp_autoplay']=$this->language->get('entry_mp_autoplay');
		$this->data['entry_mp_default_text_color']=$this->language->get('entry_mp_default_text_color');
		$this->data['entry_mp_display_arrow_thumbs']=$this->language->get('entry_mp_display_arrow_thumbs');
	   $this->data['tab_general']=$this->language->get('tab_general');*/
       $this->data['postarr']=$postarr;
	   $this->data['alphaarr']=$alphaarr;
	   $this->data['zoomarr']=$zoomarr;
	   $this->data['windarr']=$windarr;
	   $this->data['contarr']=$contarr;
	   $this->data['cpostarr']=$cpostarr;
	   $this->data['closeeffect']=array_values($this->imarr);
        $this->data['tab_thumbs']=$this->language->get('tab_thumbs');
		$this->data['ppostarr']=$this->postarr;
		$this->data['imarr']=$this->imarr;
		$this->data['wmodearr']=$this->wmodearr;
		$this->data['descarr']=$this->descarr;
/* this loads captions defined in language page*/
$captarr=array('entry_bar_color','entry_bar_alpha','entry_bar_height','entry_menu_bg','entry_menu_alpha','entry_menu_up_color','entry_menu_over_color','entry_scrollbar_enabled','entry_controls_over_color','entry_thumb_panel_height','entry_thumb_height','entry_thumb_width','entry_thumb_position','entry_thumb_default_state_opened','entry_link_window','entry_thumb_color1','entry_thumb_color2','entry_thumb_alpha1','entry_thumb_alpha2','tab_category','entry_category','entry_text_bar_alpha','entry_text_bar_bg','entry_image_zoom','entry_main_scale','entry_thumb_scale','entry_link_window','entry_position_control','entry_controller','entry_open_category','entry_tip_open_category',
'entry_price_tag_position',
'entry_price_tag_text_size',
'entry_currency_base_color1',
'entry_currency_base_color2',
'entry_currency_base_alpha2',
'entry_currency_base_alpha1',
'entry_currency_label_color',
'entry_currency_label_alpha',
'entry_image_effect',
'entry_description_effect',
'tab_price',
'entry_price_base_color',
'entry_price_label_color',
'entry_price_base_alpha',
'entry_image_close_effect',
'entry_price_tag_enabled',
'entry_image_time',
'entry_currency_symbol',
'entry_price_label_alpha',
'entry_wmode',
'entry_movie_height',
'entry_movie_width',
'entry_movie_bgcolor'



);
/*
foreach($captarr as $value)
{

$this->data[$value]=$this->language->get($value);


}*/


$this->load->model('catalog/category');
$cats=$this->model_catalog_category->getCategories(0);
$this->data['categories'] = $cats;
$this->preload($cats);



       $this->data['yarr']=$yarr;
       $this->data['closearr']=$closearr;
		
		

		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_data_feed'] = $this->language->get('entry_data_feed');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['tab_general'] = $this->language->get('tab_general');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} 
		elseif (isset($this->errors['warning']))
		   {
		$this->data['error_warning'] = $this->errors['warning'];
			
			}
			
		else{
			$this->data['error_warning'] = '';
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][]= array(
       		'href'      => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->data['breadcrumbs'][]= array(
       		'href'      => HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_feed'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=module/powerplay&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
			
		
		################## forlayout
		
		
		$defmodule=0;

        if (isset($this->request->post['powerplay_module'])) {
			$modules = explode(',', $this->request->post['powerplay_module']);
		} elseif ($this->config->get('powerplay_module') != '') { 
			$modules = explode(',', $this->config->get('powerplay_module'));
		} else {
		$defmodule=1;
			$modules = $this->defmodules;
		}		
		
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
				
		foreach ($modules as $module) {
			if (isset($this->request->post['powerplay_' . $module . '_layout_id'])) {
				$this->data['powerplay_' . $module . '_layout_id'] = $this->request->post['powerplay_' . $module . '_layout_id'];
			} else {
				$this->data['powerplay_' . $module . '_layout_id'] = $this->config->get('powerplay_' . $module . '_layout_id');
			}	
			
			if (isset($this->request->post['powerplay_' . $module . '_position'])) {
				$this->data['powerplay_' . $module . '_position'] = $this->request->post['powerplay_' . $module . '_position'];
			} else {
				$this->data['powerplay_' . $module . '_position'] = $this->config->get('powerplay_' . $module . '_position');
			}	
			
			if (isset($this->request->post['powerplay_' . $module . '_status'])) {
				$this->data['powerplay_' . $module . '_status'] = $this->request->post['powerplay_' . $module . '_status'];
			} else {
				$this->data['powerplay_' . $module . '_status'] = $this->config->get('powerplay_' . $module . '_status');
			}	
						
			if (isset($this->request->post['powerplay_' . $module . '_sort_order'])) {
				$this->data['powerplay_' . $module . '_sort_order'] = $this->request->post['powerplay_' . $module . '_sort_order'];
			} else {
				$this->data['powerplay_' . $module . '_sort_order'] = $this->config->get('powerplay_' . $module . '_sort_order');
			}				
		}
		// some default module 
		if($defmodule==1):
		foreach ($this->defmodules as $module) {
		
				$this->data['powerplay_' . $module . '_layout_id'] = $this->defm[$module]['layout_id'];
				$this->data['powerplay_' . $module . '_position'] = $this->defm[$module]['position'];
				$this->data['powerplay_' . $module . '_status'] = $this->defm[$module]['status'];
				$this->data['powerplay_' . $module . '_sort_order'] = $this->defm[$module]['sort_order'];
					
		}
		
		
		
		endif;
		
		//some default module
		
		$this->data['modules'] = $modules;
		
		if (isset($this->request->post['powerplay_module'])) {
			$this->data['powerplay_module'] = $this->request->post['powerplay_module'];
		} else {
			$this->data['powerplay_module'] = $this->config->get('powerplay_module');
		}

		
		
		
		##########################3
		
		
			
			
			
				
		$this->data['action'] = HTTPS_SERVER . 'index.php?route=module/powerplay&token=' . $this->session->data['token'];
		
		$this->data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->session->data['token'];
		$param1=$this->key.'_status';
		if (isset($this->request->post['powerplay_status'])) {
			$this->data['status'] = $this->request->post['powerplay_status'];
		} else {
			$this->data['status'] = $this->config->get('powerplay_status');
		}
		
		$this->data['data_feed'] = HTTP_CATALOG . 'index.php?route=module/powerplay';
		
		$this->template = 'module/gallery1.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	} 
	private function preload($cats)
	{
	 $arr1=array();
	$arr=array('color1','alpha1','alpha2','color2','mptc','mpdt','display_arrow_thumbs','autoplay','flash_gallery_home_status','thumb_color1','thumb_alpha1','thumb_alpha2','thumb_panel_height',
		'thumb_color2','bar_height','bar_color','bar_alpha','menu_bg','menu_alpha','menu_up_color','menu_over_color','controls_over_color','thumb_height','thumb_width',
		'thumb_position','display_arrow_thumbs','autoplay','scrollbar_enabled','home_status','thumb_default_state_opened','textbar_bg','textbar_alpha','image_zoom','main_scale','thumb_scale','link_window','flash_open_category','tcontroller','cposition','price_tag_position',
'price_tag_text_size',
'currency_base_color1',
'currency_base_color2',
'currency_base_alpha1',
'currency_base_alpha2',
'currency_label_color',
'currency_label_alpha',
'price_label_color',
'price_label_alpha',
'image_effect',
'description_effect',
'image_close_effect',
'price_base_color',
'price_base_alpha',
'price_tag_enabled'	,
'imtime',
'currency_symbol',
'movie_wmode',
'movie_width',
'movie_height'	,
'movie_bgcolor'
		
		
		
		);
		
		$setarr=$this->model_setting_setting->getSetting($this->key);
		 if(is_array($setarr) && array_key_exists('flash_home_category',$setarr)):
		 $fcategories=unserialize($setarr['flash_home_category']);
		  
		 else:
		 $fcategories=array();
		 endif;
		  
		 
		  if(!is_array($fcategories)|| empty($fcategories))
		  {
		  
		  //for selecting all categories by default
		 
		  foreach($cats as $cate)
		  {
		  $arr1[]=$cate['category_id'];
		  
		  
		  }
		  //$fcategories=array();
		  
		  $fcategories=$arr1;
		  }
		 $this->data['fcategories']=$fcategories;
		//echo "<br/>";
		//print_r($setarr);
		//echo "<br/>";
	    foreach($arr as $v)
		    {
			 if(isset($this->request->post[$v])):
			 $this->data[$v]=$this->request->post[$v];
			 elseif(is_array($setarr) && array_key_exists($v,$setarr)):
			 
			 $this->data[$v]=$setarr[$v];
			 else:
			  if(array_key_exists($v,$this->defarr))
			 $this->data[$v]=$this->defarr[$v];
			 else
			 $this->data[$v]='';
			 
			 endif;
			
			
			
			}
			if($this->data['flash_open_category']=='' && is_array($arr1) &&!empty($arr1))
			{
			$this->data['flash_open_category']=$arr1[0];
			
			}
	
	
	}
	private function validate() {
	
		if (!$this->user->hasPermission('modify', 'module/powerplay')) {
			$this->errors['warning'] = $this->language->get('error_permission');
		}
		$fcats=$this->request->post['flash_home_category'];
		$this->request->post['flash_home_category']=$this->checkcats($fcats);
		$arr=array('color1','alpha1','alpha2','color2','mptc','mpdt','thumb_color1','thumb_alpha1','thumb_alpha2','thumb_panel_height',
		'thumb_color2','bar_height','bar_color','menu_bg','menu_alpha','menu_up_color','menu_over_color','controls_over_color','thumb_height','thumb_width',
		'thumb_position','textbar_bg','textbar_alpha','image_zoom','price_base_color','imtime','currency_symbol','movie_bgcolor','movie_width','movie_height'
		);
		$errors=array();
		$inc=$this->language->get('error_required');
		$hexerror=$this->language->get('error_color');
      foreach($arr as $v)
	   {
	   
	  // echo $this->request->post[$v] ;
	  // echo '<br/>'.$v;
	   if(strlen($this->request->post[$v])<1 )
	        {
			//echo "error occured for ".$v;
			$this->errors[$v]=$inc;
			
			}
	   
	   }
	   
	   if(!isset($this->request->post['flash_home_category']) or count($this->request->post['flash_home_category'])<1)
	     {
		 
		 $this->errors['flash_home_category']=$this->language->get('error_one_category');
		 
		 }
		 
		   if(isset($this->request->post['flash_home_category']) && ($this->request->post['flash_home_category'])>0)
		   {
		   
		   
		       $oc=$this->request->post['flash_open_category'];
			    if(!in_array($oc,$this->request->post['flash_home_category'])):
				
				$this->errors['flash_open_category']=$this->language->get('error_open_category');
				
				endif;
		   
		   }
		 
		 $hex='/^#([a-f]|[A-F]|[0-9]){3}(([a-f]|[A-F]|[0-9]){3})$/';
		 
		 $arr2=array('color1','color2','thumb_color1','textbar_bg',
		'thumb_color2','bar_color','menu_up_color','menu_over_color','controls_over_color',
		'price_label_color',
		'currency_label_color',
		'currency_base_color1',
		'currency_base_color2',
		'price_base_color',
		'price_label_color',
		'movie_bgcolor'
		
		
		);
		
	   
	   foreach($arr2 as $pa)
	     {
		 
		  if(!preg_match($hex,$this->request->post[$pa]) )
	        {
			//echo "error occured for ".$v;
			$this->errors[$pa]=$hexerror;
			
			}
		 
		 
		 }
	  
		if (count($this->errors)<1) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
	private function checkcats($catarr)
	{
	$this->load->model('catalog/product');
	if(!is_array($catarr) or empty($catarr))
	return $catarr;
	$carr=array();
	foreach($catarr as $catid)
	   {
	   
	 $prods=  $this->load->model_catalog_product->getProductsByCategoryId($catid);
	    if(count($prods)>1):
		$carr[]=$catid;
		
		endif;
	   
	   }
	return $carr;
	
	}	
	public function uninstall()
	{
	$this->load->model('setting/setting');
	
	$this->model_setting_setting->deleteSetting($this->key);
	}
}
?>