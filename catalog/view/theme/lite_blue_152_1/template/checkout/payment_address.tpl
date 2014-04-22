<?php if ($addresses) { ?>
<input type="radio" name="payment_address" value="existing" id="payment-address-existing" checked="checked"/>
<label for="payment-address-existing"><?php echo $text_address_existing; ?></label>
<div id="payment-existing">
    <select name="address_id" style="width: 100%; margin-bottom: 15px;" size="5">
        <?php foreach ($addresses as $address) { ?>
        <?php if ($address['address_id'] == $address_id) { ?>
            <option value="<?php echo $address['address_id']; ?>"
                    selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['country']; ?>, <?php echo $address['city']; ?>, <?php echo $address['address_1']; ?>
                </option>
            <?php } else { ?>
            <option
                value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['country']; ?>, <?php echo $address['city']; ?>, <?php echo $address['address_1']; ?></option>
            <?php } ?>
        <?php } ?>
    </select>
</div>
<?php } ?>
<p>
    <input type="radio" name="payment_address" value="new" id="payment-address-new"/>
    <label for="payment-address-new"><?php echo $text_address_new; ?></label>
</p>
<div id="payment-new" style="display: none;">
    <table class="form">
        <tr>
            <td><span class="required">*</span> <?php echo $entry_firstname; ?></td>
            <td><input type="text" name="firstname" value="" class="large-field"/></td>
        </tr>
        <tr>
            <td><span class="required">*</span> <?php echo $entry_lastname; ?></td>
            <td><input type="text" name="lastname" value="" class="large-field"/></td>
        </tr>
        <tr>
            <td><span class="required">*</span> <?php echo $entry_city; ?></td>
            <td><input type="text" name="city" value="" class="large-field"/></td>
        </tr>
        <tr>
            <td><span class="required">*</span> <?php echo $entry_postcode; ?></td>
            <td><input type="text" name="postcode" value="" class="large-field"/></td>
        </tr>
        <tr>
            <td><span class="required">*</span> <?php echo $entry_address_1; ?></td>
            <td><input type="text" name="address_1" value="" class="large-field"/></td>
        </tr>
        <input type="hidden" name="country_id" value="<?=$country_id?>">
        <input type="hidden" name="zone_id" value="<?=$zone_id?>">
    </table>
</div>
<br/>
<div class="buttons">
    <div class="right"><input type="button" value="<?php echo $button_continue; ?>" id="button-payment-address"
                              class="button"/></div>
</div>
<script type="text/javascript"><!--
//$('#payment-address select[name=\'zone_id\']').load('index.php?route=checkout/payment_address/zone&country_id=<?php echo $country_id; ?>');

$('#payment-address input[name=\'payment_address\']').live('change', function () {
    if (this.value == 'new') {
        $('#payment-existing').hide();
        $('#payment-new').show();
    } else {
        $('#payment-existing').show();
        $('#payment-new').hide();
    }
});
//--></script> 