<?php




class ControllerModulePowerplay extends Controller{
protected  $key='powerplay';
private $_mycat=0;

	public function callback()
	{
	
	$this->callback2($this->key,$this->session->data['mycat']);
	
	
	}

	protected function callback2($ck,$params)
	{
	
	$this->language->load('module/bestseller');

      	$this->data['heading_title'] = $this->language->get('heading_title');

		$this->load->model('catalog/product');
		$this->load->model('catalog/category');
		$this->load->model('setting/anim');
		//$this->load->model('tool/seo_url');
		$this->load->model('tool/image');

		$this->data['button_add_to_cart'] = $this->language->get('button_add_to_cart');

		

		$result=$this->model_setting_anim->getSetting($ck);
		$st=$ck.'_status';
		
		//print_r($result);
$ts=$result['thumb_scale'];
$ms=$result['main_scale'];
$lw=$result['link_window'];
$zoom=$result['image_zoom'];
$start='<?xml version="1.0" encoding="utf-8"?>';
$start.="<data>\n";
$start.="<settings>\n";
$start.="\n";
$start.='<backgroundColor type="gradient">';
$start.="\n\t";
$start.='<color code="'.$result['color1'].'" alpha="'.$result['alpha1'].'" />';
$start.='<color code="'.$result['color2'].'" alpha="'.$result['alpha2'].'" />';
$start.='</backgroundColor>';


$start.='<mainPanel>';
$start.="\n";
$start.='<textBar>';
$start.="\n";
$start.='<defaultTextColor>'.$result['mptc'].'</defaultTextColor>';
$start.="\n";
$start.='<backgroundColor type="plain">';
$start.="\n";
$start.='<color code="'.$result['textbar_bg'].'" alpha="'.$result['textbar_alpha'].'" />';
$start.="\n";
$start.='</backgroundColor>';
$start.="\n";
$start.='</textBar>';
$start.="\n";
$start.='<defaultAutoplay>'.$result['autoplay'].'</defaultAutoplay>';
$start.="\n";
$start.='<autoplayDisplayTime>'.$result['mpdt'].'</autoplayDisplayTime>';
			
	$start.='		<displayArrowThumbs>'.$result['display_arrow_thumbs'].'</displayArrowThumbs>';
	$start.="\n";
$start.='</mainPanel>';
$start.="\n";
$start.='<thumbsPanel>';
$start.="\n";
$start.='<height>'.$result['thumb_panel_height'].'</height>';
$start.="\n";
$start.='<backgroundColor type="gradient">';
$start.='<color code="'.$result['thumb_color1'].'" alpha="'.$result['thumb_alpha1'].'" />';
$start.="\n";
$start.='<color code="'.$result['thumb_color2'].'" alpha="'.$result['thumb_alpha2'].'" />';
$start.="\n";

$start.='</backgroundColor>';
$start.="\n";
$start.='<bar>';
$start.="\n";
$start.='<height>'.$result['bar_height'].'</height>';
$start.="\n";
$start.='<color>'.$result['bar_color'].'</color>';
$start.="\n";
$start.='<alpha>'.$result['bar_alpha'].'</alpha>';
$start.="\n";
$start.='</bar>';


$start.='<menuButtons>';
$start.="\n";
$start.='<background>';
$start.="\n";
$start.='<color>'.$result['menu_bg'].'</color>';
$start.="\n";				
	$start.='<alpha>'.$result['menu_alpha'].'</alpha>';	
	$start.="\n";			
			
$start.='</background>';
$start.="\n";
$start.='<upColor>';
$start.="\n";
$start.=$result['menu_up_color'];
$start.="\n";

$start.='</upColor>';
$start.="\n";
$start.='<overColor>'.$result['menu_over_color'].'</overColor>';
$start.="\n";
$start.='</menuButtons>';
$start.="\n";
$start.='<scrollbarEnabled>'.$result['scrollbar_enabled'].'</scrollbarEnabled>
			
			<controlsOverColor>'.$result['controls_over_color'].'</controlsOverColor>';
			$start.="\n";
			$start.='
			
			<thumb>
				<width>'.$result['thumb_width'].'</width>
				<height>'.$result['thumb_height'] .'</height>
			</thumb>
			
			<position>'.$result['thumb_position'].'</position>
			
			<defaultState>'.$result['thumb_default_state_opened'].'</defaultState>';			
$start.='</thumbsPanel>';
$start.="\n";

$start.='<priceTag enabled="'.$result['price_tag_enabled'].'">';
$start.="\n";
$start.='<position>'.$result["price_tag_position"].'</position>';
$start.="\n";
$start.='<textSize>'.$result["price_tag_text_size"].'</textSize>';

$start.="\n";
$start.='<currency>';
$start.="\n";
$start.='<base>';
$start.="<color code=\"".$result['currency_base_color1']."\" alpha=\"".$result['currency_base_alpha1']."\"/>";
$start.="<color code=\"".$result['currency_base_color2']."\" alpha=\"".$result['currency_base_alpha2']."\"/>";


$start.='</base>';
$start.="\n";

$start.='<label color="'.$result['currency_label_color'].'" alpha="'.$result['currency_label_alpha'].'" />';
$start.="\n";
$start.="<symbol>".$result['currency_symbol']."</symbol>";
$start.='</currency>';
$start.='<price>';
$start.="<base color=\"".$result['price_base_color']."\" alpha=\"".$result['price_base_alpha']."\"/>";
$start.="\n<label color=\"".$result['price_label_color']."\" alpha=\"".$result['price_label_alpha']."\"/>";


$start.='</price>';




$start.='</priceTag>';

$start.='<imageEffect>';
$start.='<type>'.$result['image_effect'].'</type>';
$start.='<time>'.$result['imtime'].'</time>';
$start.='<closingEffect>'.strtolower( $result['image_close_effect']) .'</closingEffect>';

$start.='</imageEffect>';
$start.='<descriptionEffect>';
$start.='<type>'.$result['description_effect'].'</type>';


$start.='</descriptionEffect>';

$start.='</settings>';
$start.="\n";
$start.='<images>';

$catpage=intval($params);

if($catpage==0):
$cats=unserialize($result['flash_home_category']);
$opencat=$result['flash_open_category'];

else:
$cats=array($catpage);
$opencat=$catpage;


endif;




//print_r($cats);
$index=0;
foreach($cats as $catid)
{

		$category=$this->model_catalog_category->getCategory($catid);
		if($index==0):
		
		$start.='<defaultSelectedCategory>'.$opencat.'</defaultSelectedCategory>';$start.='<categories>';
		
		endif;
		$index++;
		$start.='<category id="'.$catid.'">';
		$start.='<name><![CDATA['.$category['name'].']]></name>';
		$start.='<images>';
		
		
		
		
		
		
		
		$data = array(
				'filter_category_id' => $catid, 
				'sort'               => 'p.sort_order',
				'order'              => 'ASC',
				'start'              => 0,
				'limit'              => 100
			);
		
		
		//$products=$this->model_catalog_product->getProductsByCategoryId($catid);
		$products=$this->model_catalog_product->getProducts($data);
		foreach($products as $product):
		if ($product['image']) {
				$image = $product['image'];
			} else {
				$image = 'no_image.jpg';
			}
			$image1=$this->model_tool_image->resize($image,$this->config->get('config_image_popup_width'),$this->config->get('config_image_popup_height'));
				$thumb=$this->model_tool_image->resize($image, $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			
		//$start.='<image>';
		$start.='<image zoom="'.$zoom.'">';
		$start.="\n";
		$start.=' <main scale="'.$ms.'">'.$image1.'</main>';
		$start.="\n";
		$start.='<thumb scale="'.$ts.'">'.$thumb.'</thumb>';
		$start.="\n";	
		$start.='<label><![CDATA['.$product['name'].']]></label>';
		$start.="\n";		
		$start.='<description><![CDATA['.$product['meta_description'] .']]></description>';	
		$start.="\n";	
		//
		//$url=$this->model_tool_seo_url->rewrite(HTTP_SERVER . 'index.php?route=product/product&product_id=' . $product['product_id']);
			
			$url= $this->url->link('product/product&product_id=' . $product['product_id']);
			
			$url=str_replace('&','&amp;',$url);	
		$start.='<link window="'.$lw.'">'.$url.'</link>';
		$start.='<price>'.round($product['price'],2) .'</price>';
		
		$start.='</image>';
		$start.="\n";
		endforeach;
		
		$start.='</images>';
		$start.="\n";
		
		$start.='</category>';
		}
		$start.='</categories>';
		$start.='</images>';
		$start.='</data>';
	//	die($start);
	
	$this->response->setOutput($start, $this->config->get('config_compression'));
	
	
	
	}
	
	public function index()
	{
		
	if (isset($this->request->get['route'])) {
			$route = $this->request->get['route'];
		} else {
			$route = 'common/home';
		}
		
	
		
		if (substr($route, 0, 16) == 'product/category' && isset($this->request->get['path'])) {
			$path = explode('_', (string)$this->request->get['path']);
				$this->_mycat=end($path);
			//$layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));			
		}
	$this->session->data['mycat']=$this->_mycat;
		
		$this->load->model('setting/anim');
		
	$result=$this->model_setting_anim->getSetting($this->key);
		
	$this->document->addScript('catalog/view/javascript/AC_RunActiveContent.js');
		
	//print_r($result);
	$this->data['path']=HTTP_SERVER.'catalog/view/javascript/powerplay';
	$this->data['path2']=HTTP_SERVER.'index.php?route=module/'.$this->key.'/callback/';
	$this->data['height']=$result['movie_height'];
	$this->data['width']=$result['movie_width'];
	$this->data['wmode']=$result['movie_wmode'];
	$this->data['name']=$this->key;
	$this->data['bg']=$result['movie_bgcolor'];
	//$this->data['path2']=HTTP_SERVER.'catalog/view/theme/custom/image/lappu.xml';
	$this->id=$this->key;

	if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/anim.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/anim.tpl';
			} else {
				$this->template = 'default/template/module/anim.tpl';
			}
		

		$this->render();
	
	
	}
	
	
	
}
?>