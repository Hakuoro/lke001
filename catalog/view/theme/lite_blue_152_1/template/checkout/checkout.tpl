<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<style type="text/css">
    .mdl-textfield__label{
        color:rgba(0,0,0,.60);
        top: 12px;
	}

    .mdl-textfield--floating-label.is-focused .mdl-textfield__label{
        color:rgba(0,0,0,.50);
        top: -6px;
    }

    .mdl-textfield{
        padding-top: 8px;
    }

    .mdl-textfield--floating-label.is-dirty .mdl-textfield__label{
        top: -6px;
        color:rgba(0,0,0,.50);
    }




</style>
<div id="content"><?php echo $content_top; ?>
	<h3><?php echo $heading_title; ?></h3>
	<div class="checkout">
		<div id="checkout">
			<div class="checkout-content" style="display: block">
				<form id="checkout_form" onsubmit="return false;">
					<div class="left" style="padding-left: 8px;">

                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="text" id="in-firstname" name="firstname" value="<?php echo $firstname?>"/>
                            <label class="mdl-textfield__label" for="in-firstname"><span class="required">*</span> <?php echo $entry_firstname; ?></label>
                        </div>

                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="text" id="in-lastname" name="lastname" value="<?php echo $lastname?>"/>
                            <label class="mdl-textfield__label" for="in-lastname"><span class="required">*</span> <?php echo $entry_lastname; ?></label>
                        </div>

                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="text" id="in-telephone" name="telephone" value="<?php echo $telephone?>"/>
                            <label class="mdl-textfield__label" for="in-telephone"><span class="required">*</span> <?php echo $entry_telephone; ?></label>
                        </div>

                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="text" id="in-email" name="email" value="<?php echo $email?>"/>
                            <label class="mdl-textfield__label" for="in-email"><span class="required">*</span> <?php echo $entry_email; ?></label>
                        </div>

                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="text" id="in-postcode" name="postcode" value="<?php echo $postcode?>"/>
                            <label class="mdl-textfield__label" for="in-postcode"><span class="required">*</span> <?php echo $entry_postcode; ?></label>
                        </div>

                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="text" id="in-city" name="city" value="<?php echo $city?>"/>
                            <label class="mdl-textfield__label" for="in-city"><span class="required">*</span> <?php echo $entry_city; ?></label>
                        </div>

                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="text" id="in-address_1" name="address_1" value="<?php echo $address_1?>"/>
                            <label class="mdl-textfield__label" for="in-address_1"><span class="required">*</span> <?php echo $entry_address_1; ?></label>
                        </div>


                        <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                            <textarea class="mdl-textfield__input" type="text" rows= "3" id="in-comment" name="comment" ><?php echo $comment?></textarea>
                            <label class="mdl-textfield__label" for="in-comment"><?php echo $column_comment; ?></label>
                        </div>

					</div>
					<div class="right">
						<div class="shipping-content" style="display: block">
							<?php if(count($shipping_methods) > 1) { ?>
							<p><?php echo $text_shipping_method; ?></p>
							<table class="form">
								<?php foreach($shipping_methods as $shipping_method) { ?>
								<tr>
									<td colspan="3"><b><?php echo $shipping_method['title']; ?></b></td>
								</tr>
								<?php if(!$shipping_method['error']) { ?>
									<?php foreach($shipping_method['quote'] as $quote) { ?>
										<tr>
											<td style="width: 1px;"><?php if($quote['code'] == $shipping_code || !$shipping_code) { ?>
												<?php $shipping_code = $quote['code']; ?>
												<input type="radio" name="shipping_method"
													   value="<?php echo $quote['code']; ?>"
													   id="<?php echo $quote['code']; ?>" checked="checked"/>
												<?php } else { ?>
												<input type="radio" name="shipping_method"
													   value="<?php echo $quote['code']; ?>"
													   id="<?php echo $quote['code']; ?>"/>
												<?php } ?></td>
											<td><label
													for="<?php echo $quote['code']; ?>"><?php echo $quote['title']; ?></label>
											</td>
											<td style="text-align: right;"><label
													for="<?php echo $quote['code']; ?>"><?php echo $quote['text']; ?></label>
											</td>
										</tr>
										<?php } ?>
									<?php } else { ?>
									<tr>
										<td colspan="3">
											<div class="error"><?php echo $shipping_method['error']; ?></div>
										</td>
									</tr>
									<?php } ?>
								<?php } ?>
							</table>
							<?php } else if ($shipping_methods) { ?>
							<?php $shipping_method = array_shift($shipping_methods);?>
								<p><?php echo $text_shipping_method; ?></p>
							<table class="form">
								<tr>
									<td colspan="3"><b><?php echo $shipping_method['title']; ?></b></td>
								<?php foreach($shipping_method['quote'] as $quote) { ?>
									<td><label><?php echo $quote['title']; ?></label></td>
									<td style="text-align: right;"><label><?php echo $quote['text']; ?></label></td>
								<?php }?>
								</tr>
								</table>
							<?php } else { ?>
							
							<?php }?>
						</div>
						<div class="payment-content" style="display: block">
							<?php echo $payment_data?>
						</div>
					</div>
					<div style="clear: both;">

					<?php if ($text_agree) { ?>
					<div class="buttons">
					  <div class="right"><?php echo $text_agree; ?>
						<?php if ($agree) { ?>
						<input type="checkbox" name="agree" value="1" checked="checked" />
						<?php } else { ?>
						<input type="checkbox" name="agree" value="1" />
						<?php } ?>
					  </div>
					</div>
						<script type="text/javascript"><!--
								$('.colorbox').colorbox({
									width: 640,
									height: 480
								});

						//--></script>
					<?php }?>

						<div class="checkout-product">
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
								<?php foreach($products as $product) { ?>
								<tr>
									<td class="image"><?php if ($product['thumb']) { ?>
									  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
									  <?php } ?>
									</td>
									<td class="name"><a
											href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
										<?php foreach($product['option'] as $option) { ?>
											<br/>
											&nbsp;
											<small> - <?php echo $option['name']; ?>
												: <?php echo $option['value']; ?></small>
											<?php } ?></td>
									<td class="model"><?php echo $product['model']; ?></td>
									<td class="quantity"><?php echo $product['quantity']; ?></td>
									<td class="price"><?php echo $product['price_text']; ?></td>
									<td class="total"><?php echo $product['total_text']; ?></td>
								</tr>
									<?php } ?>
								<?php foreach($vouchers as $voucher) { ?>
								<tr>
									<td class="image"></td>
									<td class="name"><?php echo $voucher['description']; ?></td>
									<td class="model"></td>
									<td class="quantity">1</td>
									<td class="price"><?php echo $voucher['amount']; ?></td>
									<td class="total"><?php echo $voucher['amount']; ?></td>
								</tr>
									<?php } ?>
								</tbody>
								<tbody id="total_data">
									<?php echo $total_data?>
								</tbody>
								<tfoot>
								    <tr>
								      <td colspan="6">
									<a id="confirm" class="button"><span><?php echo $button_confirm?></span></a>
								      </td>
								    </tr>
								</tfoot>
							</table>
						</div>						
					</div>
				</form>
			</div>
		</div>
	</div>

<?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('#checkout_form select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#checkout_form select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#shipping-postcode-required').show();
			} else {
				$('#shipping-postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != undefined) {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('#checkout_form select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#checkout_form select[name=\'country_id\']').trigger('change');


	$('#confirm').live('click', function() {
		$.ajax({
			url: 'index.php?route=checkout/checkout',
			type: 'post',
			data: $('#checkout_form').serialize(),
			dataType: 'json',
			beforeSend: function() {
				$('#confirm').bind('click', false);
				$('#confirm').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
			},
			complete: function() {
				$('#confirm').unbind('click', false);
				$('.wait').remove();
			},
			success: function(json) {
				$('.warning').remove();
				$('.error').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json.errors) {
					for (var key in json.errors) {
						$('#checkout .checkout-content :input[name=\'' + key + '\']').
								after('<span class="error" >' + json.errors[key] + '</span>');
					}
					var eTop = $('#checkout').offset().top;
					$('html, body').animate({scrollTop: eTop}, 'slow');
				} else {
					if (json.result = "success") {
						var confirm_btn = $('#button-confirm');
						if (!confirm_btn){
							confirm_btn =$('.payment . buttons input.button')
						}
						confirm_btn.trigger('click');
					}
				}
			}
		});
	});

	$('input[name=payment_method]').live('change', function() {
		$(".checkout-product").mask();
		$.ajax({
			url: 'index.php?route=checkout/checkout/change_payment',
			type: 'post',
			data: 'payment_code='+$("input[name=payment_method]:checked").val(),
			dataType: 'json',
			success: function(json) {
				 if (json.payment){
					 $(".payment").html(json.payment);
				 }
				 $(".checkout-product").unmask();
			}
		})
	});

	$('input[name=shipping_method]').live('change', function() {
		$(".checkout-product").mask();
		$.ajax({
			url: 'index.php?route=checkout/checkout/change_shipping',
			type: 'post',
			data: 'shipping_method='+$("input[name=shipping_method]:checked").val(),
			dataType: 'json',
			success: function(json) {
				 $('#total_data').html(json['totals_data']);
				 $('.payment-content').html(json['payment_data']);
				 $(".checkout-product").unmask();
			}
		})
	});

	//--></script>
<?php echo $footer; ?>
