<?php echo $header; ?>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table id="module" class="list">
        <thead>
          <tr>
            <td class="left" rowspan = "2"><?php echo $entry_banner; ?></td>
            <td class="left" rowspan = "1" colspan="2"><?php echo $entry_dimension; ?></td>
            <td class="left" rowspan = "2"><?php echo $entry_layout; ?></td>
            <td class="center" rowspan = "2"><?php echo $entry_position; ?></td>
            <td class="left" rowspan = "2"><?php echo $entry_status; ?></td>
            <td class="right" rowspan = "2"><?php echo $entry_sort_order; ?></td>
            <td rowspan = "2"></td>
          </tr>
		  <tr>
			<td class="left"><?php echo $entry_thumb_dimension; ?></td>
			<td class="left"><?php echo $entry_view_dimension; ?></td>
		  </tr>
        </thead>
        <?php $module_row = 0; ?>
        <?php foreach ($modules as $module) { ?>
        <tbody id="module-row<?php echo $module_row; ?>">
		  <tr><td height="3" style="background-color:#000000;" colspan="8"></td></tr>
          <tr>
            <td class="left" rowspan="6"><select name="gallery_module[<?php echo $module_row; ?>][banner_id]">
                <?php foreach ($banners as $banner) { ?>
                <?php if ($banner['banner_id'] == $module['banner_id']) { ?>
                <option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
            <td class="left"><input type="text" name="gallery_module[<?php echo $module_row; ?>][thumb_width]" value="<?php echo $module['thumb_width']; ?>" size="3" />
              <input type="text" name="gallery_module[<?php echo $module_row; ?>][thumb_height]" value="<?php echo $module['thumb_height']; ?>" size="3"/>
              <?php if (isset($error_dimension[$module_row])) { ?>
              <span class="error"><?php echo $error_dimension[$module_row]; ?></span>
              <?php } ?></td>
            <td class="left"><input type="text" name="gallery_module[<?php echo $module_row; ?>][view_width]" value="<?php echo $module['view_width']; ?>" size="3" />
              <input type="text" name="gallery_module[<?php echo $module_row; ?>][view_height]" value="<?php echo $module['view_height']; ?>" size="3"/>
              <?php if (isset($error_dimension[$module_row])) { ?>
              <span class="error"><?php echo $error_dimension[$module_row]; ?></span>
              <?php } ?></td>  
            <td class="left"><select name="gallery_module[<?php echo $module_row; ?>][layout_id]">
                <?php foreach ($layouts as $layout) { ?>
                <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
            <td class="left"><select name="gallery_module[<?php echo $module_row; ?>][position]">
                <?php if ($module['position'] == 'content_top') { ?>
                <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                <?php } else { ?>
                <option value="content_top"><?php echo $text_content_top; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'content_bottom') { ?>
                <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                <?php } else { ?>
                <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'column_left') { ?>
                <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                <?php } else { ?>
                <option value="column_left"><?php echo $text_column_left; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'column_right') { ?>
                <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                <?php } else { ?>
                <option value="column_right"><?php echo $text_column_right; ?></option>
                <?php } ?>
              </select></td>
            <td class="left"><select name="gallery_module[<?php echo $module_row; ?>][status]">
                <?php if ($module['status']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
            <td class="right"><input type="text" name="gallery_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
            <td class="left" rowspan="6"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
          </tr>
		  <tr>
				<td class="left" colspan="6"><?php echo $text_table_option; ?></td>
		  </tr>		  
		  <tr>
				<td class="left" colspan="1"></td>
				<td class="left" colspan="2"><?php echo $entry_thumb_usetable; ?>
					<select name="gallery_module[<?php echo $module_row; ?>][use_table]">
						<?php if ($module['use_table']) { ?>
							<option value="1" selected="selected"><?php echo $text_table_true; ?></option>
							<option value="0"><?php echo $text_table_false; ?></option>
						<?php } else { ?>
							<option value="1"><?php echo $text_table_true; ?></option>
							<option value="0" selected="selected"><?php echo $text_table_false; ?></option>
						<?php } ?>
					</select>
				</td>
				<td class="left" colspan="3"><?php echo $entry_thumb_usetitle; ?>
					<select name="gallery_module[<?php echo $module_row; ?>][use_title]">
						<?php if ($module['use_title'] == 'no_title') { ?>
							<option value="no_title" selected="selected"><?php echo $text_title_none; ?></option>
						<?php } else { ?>
							<option value="no_title"><?php echo $text_title_none; ?></option>
						<?php } ?>
						<?php if ($module['use_title'] == 'title_above') { ?>
							<option value="title_above" selected="selected"><?php echo $text_title_above; ?></option>
						<?php } else { ?>
							<option value="title_above"><?php echo $text_title_above; ?></option>
						<?php } ?>
						<?php if ($module['use_title'] == 'title_below') { ?>
							<option value="title_below" selected="selected"><?php echo $text_title_below; ?></option>
						<?php } else { ?>
							<option value="title_below"><?php echo $text_title_below; ?></option>
						<?php } ?>
					</select>
				</td>				
		  </tr>
		  <tr>
				<td class="left" colspan="6"><?php echo $text_table_format; ?></td>
		  </tr>	
			<tr>
				<td></td>
				<td><?php echo $entry_thumb_outsideborder; ?><input type="text" name="gallery_module[<?php echo $module_row; ?>][thumb_outside_border]" value="<?php echo $module['thumb_outside_border']; ?>" size="3" /></td>
				<td><?php echo $entry_thumb_insideborder; ?><input type="text" name="gallery_module[<?php echo $module_row; ?>][thumb_inside_border]" value="<?php echo $module['thumb_inside_border']; ?>" size="3" /></td>
				<td><?php echo $entry_thumb_title_background; ?><input type="text" name="gallery_module[<?php echo $module_row; ?>][thumb_title_background]" value="<?php echo $module['thumb_title_background']; ?>" size="5" /></td>
				<td colspan="2"><?php echo $entry_thumb_title_textcolor; ?><input type="text" name="gallery_module[<?php echo $module_row; ?>][thumb_title_textcolor]" value="<?php echo $module['thumb_title_textcolor']; ?>" size="5" /></td>
			</tr>
			
			<tr>
				<td class="left" colspan="2"><?php echo $text_hide_elements; ?></td>
				<td class="left">
					<?php echo $entry_hide_breadcrumbs; ?>
					<select name="gallery_module[<?php echo $module_row; ?>][hide_breadcrumbs]">
						<?php if ($module['hide_breadcrumbs']) { ?>
							<option value="1" selected="selected"><?php echo $text_table_true; ?></option>
							<option value="0"><?php echo $text_table_false; ?></option>
						<?php } else { ?>
							<option value="1"><?php echo $text_table_true; ?></option>
							<option value="0" selected="selected"><?php echo $text_table_false; ?></option>
						<?php } ?>
					</select>
				</td>
				<td class="left">
					<?php echo $entry_hide_h1; ?>
					<select name="gallery_module[<?php echo $module_row; ?>][hide_heading]">
						<?php if ($module['hide_heading']) { ?>
							<option value="1" selected="selected"><?php echo $text_table_true; ?></option>
							<option value="0"><?php echo $text_table_false; ?></option>
						<?php } else { ?>
							<option value="1"><?php echo $text_table_true; ?></option>
							<option value="0" selected="selected"><?php echo $text_table_false; ?></option>
						<?php } ?>
					</select>
				</td>				
				<td class="left">
					<?php echo $entry_hide_content; ?>
					<select name="gallery_module[<?php echo $module_row; ?>][hide_content]">
						<?php if ($module['hide_content']) { ?>
							<option value="1" selected="selected"><?php echo $text_table_true; ?></option>
							<option value="0"><?php echo $text_table_false; ?></option>
						<?php } else { ?>
							<option value="1"><?php echo $text_table_true; ?></option>
							<option value="0" selected="selected"><?php echo $text_table_false; ?></option>
						<?php } ?>
					</select>
				</td>				
				<td class="left">
					<?php echo $entry_hide_buttons; ?>
					<select name="gallery_module[<?php echo $module_row; ?>][hide_buttons]">
						<?php if ($module['hide_buttons']) { ?>
							<option value="1" selected="selected"><?php echo $text_table_true; ?></option>
							<option value="0"><?php echo $text_table_false; ?></option>
						<?php } else { ?>
							<option value="1"><?php echo $text_table_true; ?></option>
							<option value="0" selected="selected"><?php echo $text_table_false; ?></option>
						<?php } ?>
					</select>
				</td>
			</tr>
	
        </tbody>
        <?php $module_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="7"></td>
            <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
          </tr>
        </tfoot>
      </table>
    </form>
  </div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '<tr><td height="3" style="background-color:#000000;" colspan="8"></td></tr>';
	html += '  <tr>';
	html += '    <td class="left" rowspan="6"><select name="gallery_module[' + module_row + '][banner_id]">';
	<?php foreach ($banners as $banner) { ?>
	html += '      <option value="<?php echo $banner['banner_id']; ?>"><?php echo addslashes($banner['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><input type="text" name="gallery_module[' + module_row + '][thumb_width]" value="" size="3" /> <input type="text" name="gallery_module[' + module_row + '][thumb_height]" value="" size="3" /></td>';	
	html += '    <td class="left"><input type="text" name="gallery_module[' + module_row + '][view_width]" value="" size="3" /> <input type="text" name="gallery_module[' + module_row + '][view_height]" value="" size="3" /></td>';	
	html += '    <td class="left"><select name="gallery_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="gallery_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="gallery_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="gallery_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left" rowspan="6"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '  <tr>';
	html += '    <td class="left" colspan="6"><?php echo $text_table_option; ?></td>';
	html += '  </tr>';
	html += '  <tr>';
	html += '    <td class="left" colspan="1"></td>';
	html += '    <td class="left" colspan="2"><?php echo $entry_thumb_usetable; ?>';
	html += '       <select name="gallery_module[<?php echo $module_row; ?>][use_table]">';
	html += '  			<option value="1" selected="selected"><?php echo $text_table_true; ?></option>';
	html += '			<option value="0"><?php echo $text_table_false; ?></option>';
	html += '		</select>';
	html += '	</td>';
	html += '	<td class="left" colspan="3"><?php echo $entry_thumb_usetitle; ?>';
	html += '		<select name="gallery_module[<?php echo $module_row; ?>][use_title]">';
	html += '				<option value="no_title" selected="selected"><?php echo $text_title_none; ?></option>';
	html += '				<option value="title_above"><?php echo $text_title_above; ?></option>';
	html += '				<option value="title_below"><?php echo $text_title_below; ?></option>';
	html += '		</select>';
	html += '	</td>';		
	html += '  </tr>';
	html += ' <tr>';
	html += '	<td class="left" colspan="6"><?php echo $text_table_format; ?></td>';
	html += ' </tr>';
	html += ' <tr>';
	html += '	<td></td>';
	html += '	<td><?php echo $entry_thumb_outsideborder; ?><input type="text" name="gallery_module[<?php echo $module_row; ?>][thumb_outside_border]" value="" size="3" /></td>';
	html += '	<td><?php echo $entry_thumb_insideborder; ?><input type="text" name="gallery_module[<?php echo $module_row; ?>][thumb_inside_border]" value="" size="3" /></td>';
	html += '	<td><?php echo $entry_thumb_title_background; ?><input type="text" name="gallery_module[<?php echo $module_row; ?>][thumb_title_background]" value="" size="5" /></td>';
	html += '	<td colspan="2"><?php echo $entry_thumb_title_textcolor; ?><input type="text" name="gallery_module[<?php echo $module_row; ?>][thumb_title_textcolor]" value="" size="5" /></td>';
	html += ' </tr>';
	html += '	<tr>';
	html += '	<td class="left" colspan="2"><?php echo $text_hide_elements; ?></td>';
	html += '	<td class="left">';
	html += '		<?php echo $entry_hide_breadcrumbs; ?>';
	html += '		<select name="gallery_module[<?php echo $module_row; ?>][hide_breadcrumbs]">';
	html += '				<option value="1"><?php echo $text_table_true; ?></option>';
	html += '				<option value="0" selected="selected"><?php echo $text_table_false; ?></option>';
	html += '		</select>';
	html += '	</td>';
	html += '	<td class="left">';
	html += '		<?php echo $entry_hide_h1; ?>';
	html += '		<select name="gallery_module[<?php echo $module_row; ?>][hide_heading]">';
	html += '				<option value="1"><?php echo $text_table_true; ?></option>';
	html += '				<option value="0" selected="selected"><?php echo $text_table_false; ?></option>';
	html += '		</select>';
	html += '	</td>';
	html += '	<td class="left">';
	html += '		<?php echo $entry_hide_content; ?>';
	html += '		<select name="gallery_module[<?php echo $module_row; ?>][hide_content]">';
	html += '				<option value="1"><?php echo $text_table_true; ?></option>';
	html += '				<option value="0" selected="selected"><?php echo $text_table_false; ?></option>';
	html += '		</select>';
	html += '	</td>';
	html += '	<td class="left">';
	html += '		<?php echo $entry_hide_buttons; ?>';
	html += '		<select name="gallery_module[<?php echo $module_row; ?>][hide_buttons]">';
	html += '				<option value="1"><?php echo $text_table_true; ?></option>';
	html += '				<option value="0" selected="selected"><?php echo $text_table_false; ?></option>';
	html += '		</select>';
	html += '	</td>';
	html += ' </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}
//--></script>
<?php echo $footer; ?>