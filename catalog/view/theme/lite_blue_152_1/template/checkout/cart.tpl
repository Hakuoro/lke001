<?php echo $header; ?>
<?php if ($attention) { ?>
<div class="attention"><?php echo $attention; ?><img src="catalog/view/theme/default/image/close.png" alt=""
                                                     class="close"/></div>
<?php } ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close"/>
</div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?><img src="catalog/view/theme/default/image/close.png" alt=""
                                                       class="close"/></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
    <!--div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a
            href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div-->
    <h3><?php echo $heading_title; ?>
        <?php if ($weight) { ?>
            &nbsp;(<?php echo $weight; ?>)
            <?php } ?>
    </h3>

    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="product-form">
        <div class="cart-info">
            <table>
                <thead>
                <tr>
                    <td class="image"><?php echo $column_image; ?></td>
                    <td class="name"><?php echo $column_name; ?></td>
                    <td class="model"><?php echo $column_model; ?></td>
                    <td class="quantity"><?php echo $column_quantity; ?></td>
                    <td class="price"><?php echo $column_price; ?></td>
                    <td class="total"><?php echo $column_total; ?></td>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($products as $product) { ?>
                <tr>
                    <td class="image"><?php if ($product['thumb']) { ?>
                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"
                                                                       alt="<?php echo $product['name']; ?>"
                                                                       title="<?php echo $product['name']; ?>"/></a>
                        <?php } ?></td>
                    <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                        <?php if (!$product['stock']) { ?>
                            <span class="stock">***</span>
                            <?php } ?>
                        <div>
                            <?php foreach ($product['option'] as $option) { ?>
                            -
                            <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br/>
                            <?php } ?>
                        </div>
                        <?php if ($product['reward']) { ?>
                            <small><?php echo $product['reward']; ?></small>
                            <?php } ?></td>
                    <td class="model"><?php echo $product['model']; ?></td>
                    <td class="quantity">
                            <div class="mdl-textfield mdl-js-textfield" style="width: 30px;">
                                <input  class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="sample[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" name="quantity[<?php echo $product['key']; ?>]" size="1"/>
                                <label class="mdl-textfield__label" for="sample[<?php echo $product['key']; ?>]"><?php echo $product['quantity']; ?></label>
                                <span class="mdl-textfield__error">!</span>
                            </div>
                            <i class="material-icons" style="cursor: pointer;" id="i-reload" >loop</i>
                            <i class="material-icons" style="cursor: pointer; color: #ef3c79;" id="i-clear" onclick="document.location.href = '<?php echo $product['remove']; ?>';">clear</i>
                    </td>
                    <td class="price"><?php echo $product['price']; ?></td>
                    <td class="total"><?php echo $product['total']; ?></td>
                </tr>
                    <?php } ?>
                <?php foreach ($vouchers as $vouchers) { ?>
                <tr>
                    <td class="image"></td>
                    <td class="name"><?php echo $vouchers['description']; ?></td>
                    <td class="model"></td>
                    <td class="quantity"><input type="text" name="" value="1" size="1" disabled="disabled"/>
                        &nbsp;<a href="<?php echo $vouchers['remove']; ?>"><img
                            src="catalog/view/theme/default/image/remove.png" alt="<?php echo $text_remove; ?>"
                            title="<?php echo $button_remove; ?>"/></a></td>
                    <td class="price"><?php echo $vouchers['amount']; ?></td>
                    <td class="total"><?php echo $vouchers['amount']; ?></td>
                </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </form>
    <?php if (false &&( $coupon_status || $voucher_status || $reward_status /*|| $shipping_status*/)) { ?>
        <h2><?php echo $text_next; ?></h2>
        <div class="content">
            <p><?php echo $text_next_choice; ?></p>
            <table class="radio">
                <?php if ($coupon_status) { ?>
                <tr class="highlight">
                    <td><input type="radio" name="next" value="coupon" id="use_coupon"/></td>
                    <td><label for="use_coupon"><?php echo $text_use_coupon; ?></label></td>
                </tr>
                <?php } ?>
                <?php if ($voucher_status) { ?>
                <tr class="highlight">
                    <td><input type="radio" name="next" value="voucher" id="use_voucher"/></td>
                    <td><label for="use_voucher"><?php echo $text_use_voucher; ?></label></td>
                </tr>
                <?php } ?>
                <?php if ($reward_status) { ?>
                <tr class="highlight">
                    <td><input type="radio" name="next" value="reward" id="use_reward"/></td>
                    <td><label for="use_reward"><?php echo $text_use_reward; ?></label></td>
                </tr>
                <?php } ?>
                <?php if ($shipping_status) { ?>
                <tr class="highlight">
                    <td><input type="radio" name="next" value="shipping" id="shipping_estimate"/></td>
                    <td><label for="shipping_estimate"><?php echo $text_shipping_estimate; ?></label></td>
                </tr>
                <?php } ?>
            </table>
        </div>
        <div class="cart-module">
            <div id="coupon" class="content">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <?php echo $entry_coupon; ?>&nbsp;
                    <input type="text" name="coupon" value="<?php echo $coupon; ?>"/>
                    <input type="hidden" name="next" value="coupon"/>
                    &nbsp;
                    <input type="submit" value="<?php echo $button_coupon; ?>" class="button"/>
                </form>
            </div>
            <div id="voucher" class="content">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <?php echo $entry_voucher; ?>&nbsp;
                    <input type="text" name="voucher" value="<?php echo $voucher; ?>"/>
                    <input type="hidden" name="next" value="voucher"/>
                    &nbsp;
                    <input type="submit" value="<?php echo $button_voucher; ?>" class="button"/>
                </form>
            </div>
            <div id="reward" class="content">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <?php echo $entry_reward; ?>&nbsp;
                    <input type="text" name="reward" value="<?php echo $reward; ?>"/>
                    <input type="hidden" name="next" value="reward"/>
                    &nbsp;
                    <input type="submit" value="<?php echo $button_reward; ?>" class="button"/>
                </form>
            </div>
            <div id="shipping" class="content">
                <p><?php echo $text_shipping_detail; ?></p>
                <table>
                    <tr>
                        <td><span class="required">*</span> <?php echo $entry_country; ?></td>
                        <td><select name="country_id"
                                    onchange="$('select[name=\'zone_id\']').load('index.php?route=checkout/cart/zone&country_id=' + this.value + '&zone_id=<?php echo $zone_id; ?>');">
                            <option value=""><?php echo $text_select; ?></option>
                            <?php foreach ($countries as $country) { ?>
                            <?php if ($country['country_id'] == $country_id) { ?>
                                <option value="<?php echo $country['country_id']; ?>"
                                        selected="selected"><?php echo $country['name']; ?></option>
                                <?php } else { ?>
                                <option
                                    value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                <?php } ?>
                            <?php } ?>
                        </select></td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span> <?php echo $entry_zone; ?></td>
                        <td><select name="zone_id">
                        </select></td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span> <?php echo $entry_postcode; ?></td>
                        <td><input type="text" name="postcode" value="<?php echo $postcode; ?>"/></td>
                    </tr>
                </table>
                <input type="button" value="<?php echo $button_quote; ?>" id="button-quote" class="button"/>
            </div>

        </div>
        <?php } ?>
    <div class="cart-total">
        <table id="total">
            <?php foreach ($totals as $total) { ?>
            <tr>
                <td colspan="5" class="right"><b><?php echo $total['title']; ?>:</b></td>
                <td class="right"><?php echo $total['text']; ?></td>
            </tr>
            <?php } ?>
        </table>
    </div>
    <div class="buttons">
        <div class="right">
            <button onclick="document.location.href = '<?php echo $checkout; ?>';" class="mdl-button--accent mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
                <?php echo $button_checkout; ?>
            </button>

            <!--a href="<?php echo $checkout; ?>" class="button"><?php echo $button_checkout; ?></a-->
        </div>
        <div class="right" style="padding-right: 8px;">
            <button onclick="document.location.href = '<?php echo $continue; ?>';" class="mdl-button mdl-js-button mdl-js-ripple-effect">
                <?php echo $button_shopping; ?>
            </button>
            <!--a href="<?php echo $continue; ?>" class="button"><?php echo $button_shopping; ?></a-->
        </div>
    </div>
    <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('input[name=\'next\']').bind('change', function () {
    $('.cart-module > div').hide();

    $('#' + this.value).show();
});

<?php if ($next == 'coupon') { ?>
$('#use_coupon').trigger('click');
    <?php } ?>
<?php if ($next == 'voucher') { ?>
$('#use_voucher').trigger('click');
    <?php } ?>
<?php if ($next == 'reward') { ?>
$('#use_reward').trigger('click');
    <?php } ?>
<?php if ($next == 'shipping') { ?>
$('#shipping_estimate').trigger('click');
    <?php } ?>
//--></script>
<?php if ($shipping_status) { ?>
<script type="text/javascript"><!--

    $('#i-reload').click(function(){
        $("#product-form").submit();
    });

$('#button-quote').live('click', function () {
    $.ajax({
        url:'index.php?route=checkout/cart/quote',
        type:'post',
        data:'country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val() + '&postcode=' + encodeURIComponent($('input[name=\'postcode\']').val()),
        dataType:'json',
        beforeSend:function () {
            $('#button-quote').attr('disabled', true);
            $('#button-quote').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
        },
        complete:function () {
            $('#button-quote').attr('disabled', false);
            $('.wait').remove();
        },
        success:function (json) {
            $('.success, .warning, .attention, .error').remove();

            if (json['error']) {
                if (json['error']['warning']) {
                    $('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

                    $('.warning').fadeIn('slow');

                    $('html, body').animate({ scrollTop:0 }, 'slow');
                }

                if (json['error']['country']) {
                    $('select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
                }

                if (json['error']['zone']) {
                    $('select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
                }

                if (json['error']['postcode']) {
                    $('input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
                }
            }

            if (json['shipping_method']) {
                html = '<h2><?php echo $text_shipping_method; ?></h2>';
                html += '<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">';
                html += '  <table class="radio">';

                for (i in json['shipping_method']) {
                    html += '<tr>';
                    html += '  <td colspan="3"><b>' + json['shipping_method'][i]['title'] + '</b></td>';
                    html += '</tr>';

                    if (!json['shipping_method'][i]['error']) {
                        for (j in json['shipping_method'][i]['quote']) {
                            html += '<tr class="highlight">';

                            if (json['shipping_method'][i]['quote'][j]['code'] == '<?php echo $shipping_method; ?>') {
                                html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" checked="checked" /></td>';
                            } else {
                                html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" /></td>';
                            }

                            html += '  <td><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['title'] + '</label></td>';
                            html += '  <td style="text-align: right;"><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['text'] + '</label></td>';
                            html += '</tr>';
                        }
                    } else {
                        html += '<tr>';
                        html += '  <td colspan="3"><div class="error">' + json['shipping_method'][i]['error'] + '</div></td>';
                        html += '</tr>';
                    }
                }

                html += '  </table>';
                html += '  <br />';
                html += '  <input type="hidden" name="next" value="shipping" />';
                html += '  <input type="submit" value="<?php echo $button_shipping; ?>" class="button" />';
                html += '</form>';

                $.colorbox({
                    overlayClose:true,
                    opacity:0.5,
                    width:'600px',
                    height:'400px',
                    href:false,
                    html:html
                });
            }
        }
    });
});
//--></script>
<script type="text/javascript"><!--
$('select[name=\'zone_id\']').load('index.php?route=checkout/cart/zone&country_id=<?php echo $country_id; ?>&zone_id=<?php echo $zone_id; ?>');
//--></script>
<?php } ?>
<?php echo $footer; ?>