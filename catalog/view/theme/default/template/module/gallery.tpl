<div class="gallery">
  <div id="gallery<?php echo $module; ?>" class="dsGallery">
	<ul id="pictures">
	<?php
		if(strlen($thumb_outside_border)) {$output_tbloutstyle = 'border:' . $thumb_outside_border . 'px solid;';} else {$output_tbloutstyle ='';}
		if(strlen($thumb_inside_border)) {$output_tblinstyle = 'border:' . $thumb_inside_border . 'px solid;';} else {$output_tblinstyle = '';}
		$output_tbltitlestyle = '';
		if(strlen($thumb_title_background)) {$output_tbltitlestyle = 'background-color:' . $thumb_title_background . ';';}
		if(strlen($thumb_title_textcolor)) {$output_tbltitlestyle .= 'color:' . $thumb_title_textcolor . ';';}
	?>
    <?php foreach ($banners as $banner) { ?>
		<li>
			<?php if($use_table) {
				$output_thumbnail = '<table class="gallery_thumbnail" style="' . $output_tbloutstyle . '"><tbody>';
				if($use_title == 'title_above') {$output_thumbnail .= '<tr><td class="gallery_thumb_title" style="' . $output_tbltitlestyle . '">' . $banner['title'] . '</td></tr>';} 
				$output_thumbnail .= '<tr><td class="gallery_thumb_image" style="' . $output_tblinstyle . '"><a href="' . $banner['image'] . '" title="' . $banner['title'] . '" data-lightbox="roadtrip"><img src="' . $banner['thumbnail'] . '" title="' . $banner['title'] . '" alt="' . $banner['title'] .'" /></a></td></tr>';
				if($use_title == 'title_below') {$output_thumbnail .= '<tr><td class="gallery_thumb_title" style="' . $output_tbltitlestyle . '">' . $banner['title'] . '</td></tr>';}
				$output_thumbnail .= '</tbody></table>';
			} else {
				$output_thumbnail = '';
				if($use_title == 'title_above') {$output_thumbnail .= $banner['title'] . '<br/>';}
				$output_thumbnail .= '<td><tr><a href="' . $banner['image'] . '" title="' . $banner['title'] . '" data-lightbox="roadtrip"><img src="' . $banner['thumbnail'] . '" title="' . $banner['title'] . '" alt="' . $banner['title'] .'" /></a></tr></td>';
				if($use_title == 'title_below') {$output_thumbnail .= '<br/>' . $banner['title'];}	
			} ?>
			<?php echo $output_thumbnail; ?>
		</li>
    <?php } ?>
	</ul>
  </div>
</div>
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	overlayClose: true,
	opacity: 0.5
});
//--></script>
<?php echo $overwrite_css ?>