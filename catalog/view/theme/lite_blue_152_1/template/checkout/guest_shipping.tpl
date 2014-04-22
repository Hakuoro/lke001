<table class="form">
    <tr>
        <td><span class="required">*</span> <?php echo $entry_lastname; ?></td>
        <td><input type="text" name="lastname" value="<?php echo $lastname; ?>" class="large-field"/></td>

        <td><span class="required">*</span> <?php echo $entry_postcode; ?></td>
        <td><input type="text" name="postcode" value="<?php echo $postcode; ?>" class="large-field"/></td>
    </tr>
    <tr>
        <td><span class="required">*</span> <?php echo $entry_firstname; ?></td>
        <td><input type="text" name="firstname" value="<?php echo $firstname; ?>" class="large-field"/></td>
        <td><span class="required">*</span> <?php echo $entry_city; ?></td>
        <td><input type="text" name="city" value="<?php echo $city; ?>" class="large-field"/></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td><span class="required">*</span> <?php echo $entry_address_1; ?></td>
        <td><input type="text" name="address_1" value="<?php echo $address_1; ?>" class="large-field"/></td>

    </tr>
    <tr>

    </tr>
    <tr>

    </tr>
    <input type="hidden" name="country_id" value="<?=$country_id?>">
    <input type="hidden" name="zone_id" value="<?=$zone_id?>">
</table>
<br/>
<div class="buttons">
    <div class="right"><input type="button" value="<?php echo $button_continue; ?>" id="button-guest-shipping"
                              class="button"/></div>
</div>
<script type="text/javascript"><!--
$('#shipping-address select[name=\'zone_id\']').load('index.php?route=checkout/guest_shipping/zone&country_id=<?php echo $country_id; ?>&zone_id=<?php echo $zone_id; ?>');
//--></script> 