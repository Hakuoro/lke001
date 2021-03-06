<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
    <h1 style="background-image: url('view/image/shipping.png');"><?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
        <tr>
          <td>
              <?php echo $entry_min_total_for_free_delivery; ?>
          </td>
          <td><input type="text" name="courier_min_total_for_free_delivery" value="<?php echo $courier_min_total_for_free_delivery; ?>" /></td>
        </tr>
        <tr>
          <td> <?php echo $entry_delivery_price_zone1; ?></td>
          <td><input type="text" name="courier_delivery_price_zone1" value="<?php echo $courier_delivery_price_zone1; ?>" /></td>
		</tr>
		<tr>
		  <td> <?php echo $entry_delivery_price_zone2; ?></td>
          <td><input type="text" name="courier_delivery_price_zone2" value="<?php echo $courier_delivery_price_zone2; ?>" /></td>
		</tr>
		<tr>
		  <td> <?php echo $entry_delivery_price_zone3; ?></td>
          <td><input type="text" name="courier_delivery_price_zone3" value="<?php echo $courier_delivery_price_zone3; ?>" /></td>
		</tr>
        <tr>
          <td><?php echo $entry_geo_zone; ?></td>
          <td><select name="courier_geo_zone_id">
              <option value="0"><?php echo $text_all_zones; ?></option>
              <?php foreach ($geo_zones as $geo_zone) { ?>
              <?php if ($geo_zone['geo_zone_id'] == $courier_geo_zone_id) { ?>
              <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_status; ?></td>
          <td><select name="courier_status">
              <?php if ($courier_status) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_sort_order; ?></td>
          <td><input type="text" name="courier_sort_order" value="<?php echo $courier_sort_order; ?>" size="1" /></td>
        </tr>
      </table>
    </form>
  </div>
</div>
<?php echo $footer; ?>