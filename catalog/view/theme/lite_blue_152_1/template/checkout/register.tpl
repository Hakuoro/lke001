    <table border="0" width="100%">
        <tr>
            <td colspan="2"><h2><?php echo $text_your_details; ?></h2></td>
            <td colspan="2"><h2><?php echo $text_your_address; ?></h2></td>
        </tr>
        <tr>
            <td><span class="required">*</span> <?php echo $entry_lastname; ?></td>
            <td><input type="text" name="lastname" value="" class="large-field"/></td>
            <td><span class="required">*</span> <?php echo $entry_postcode; ?></td>
            <td><input type="text" name="postcode" value="" class="large-field"/></td>
        </tr>
        <tr>
            <td><span class="required">*</span> <?php echo $entry_firstname; ?></td>
            <td><input type="text" name="firstname" value="" class="large-field"/></td>
            <td><span class="required">*</span> <?php echo $entry_zone; ?></td>
            <td><select name="zone_id" class="large-field"></select></td>
        </tr>
        <tr>
            <td><span class="required">*</span> <?php echo $entry_email; ?></td>
            <td><input type="text" name="email" value="" class="large-field"/></td>
            <td><span class="required">*</span> <?php echo $entry_city; ?></td>
            <td><input type="text" name="city" value="" class="large-field"/></td>

        </tr>

        <tr>
            <td><span class="required">*</span> <?php echo $entry_telephone; ?></td>
            <td><input type="text" name="telephone" value="" class="large-field"/></td>
            <td><span class="required">*</span> <?php echo $entry_address_1; ?></td>
            <td><input type="text" name="address_1" value="" class="large-field"/></td>
        </tr>

        <tr>
            <td colspan="4"><h2><?php echo $text_your_password; ?></h2></td>
        </tr>
        <tr>
            <td><span class="required">*</span> <?php echo $entry_password; ?></td>
            <td colspan="3"><input type="password" name="password" value="" class="large-field"/></td>
        </tr>
        <tr>
            <td><span class="required">*</span> <?php echo $entry_confirm; ?></td>
            <td colspan="3"><input type="password" name="confirm" value="" class="large-field"/></td>
        </tr>
    </table>

    <input type="hidden" name="country_id" value="<?=$country_id?>">




<div style="clear: both; padding-top: 15px; border-top: 1px solid #EEEEEE;">
    <input type="checkbox" name="newsletter" value="1" id="newsletter"/>
    <label for="newsletter"><?php echo $entry_newsletter; ?></label>
    <br/>
    <?php if ($shipping_required) { ?>
    <input type="checkbox" name="shipping_address" value="1" id="shipping" checked="checked"/>
    <label for="shipping"><?php echo $entry_shipping; ?></label>
    <br/>
    <?php } ?>
    <br/>
    <br/>
</div>
<?php if ($text_agree) { ?>
<div class="buttons">
    <div class="right"><?php echo $text_agree; ?>
        <input type="checkbox" name="agree" value="1"/>
        <input type="button" value="<?php echo $button_continue; ?>" id="button-register" class="button"/>
    </div>
</div>
<?php } else { ?>
<div class="buttons">
    <div class="right"><input type="button" value="<?php echo $button_continue; ?>" id="button-register"
                              class="button"/></div>
</div>
<?php } ?>
<script type="text/javascript"><!--
$('#payment-address select[name=\'zone_id\']').load('index.php?route=checkout/register/zone&country_id=<?php echo $country_id; ?>');
//--></script>
<script type="text/javascript"><!--
$('.colorbox').colorbox({
    width:560,
    height:560
});
//--></script> 