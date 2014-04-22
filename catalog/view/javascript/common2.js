$(document).ready(function() {
	/* Search */
	$('.button-search').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
				 
		var filter_name = $('input[name=\'filter_name\']').attr('value')
		
		if (filter_name) {
			url += '&filter_name=' + encodeURIComponent(filter_name);
		}
		
		location = url;
	});
	
	$('#header input[name=\'filter_name\']').keydown(function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var filter_name = $('input[name=\'filter_name\']').attr('value')
			
			if (filter_name) {
				url += '&filter_name=' + encodeURIComponent(filter_name);
			}
			
			location = url;
		}
	});
	
	/* Ajax Cart */
	$('#cart > .heading a').bind('click', function() {
		$('#cart').addClass('active');
		
		$.ajax({
			url: 'index.php?route=checkout/cart/update',
			dataType: 'json',
			success: function(json) {
				if (json['output']) {
					$('#cart .content').html(json['output']);
				}
			}
		});			
		
		$('#cart').bind('mouseleave', function() {
			$(this).removeClass('active');
		});
	});
	
	/* Mega Menu */
	$('#menu ul > li > a + div').each(function(index, element) {
		// IE6 & IE7 Fixes
		if ($.browser.msie && ($.browser.version == 7 || $.browser.version == 6)) {
			var category = $(element).find('a');
			var columns = $(element).find('ul').length;
			
			$(element).css('width', (columns * 143) + 'px');
			$(element).find('ul').css('float', 'left');
		}		
		
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();
		
		i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());
		
		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});

	// IE6 & IE7 Fixes
	if ($.browser.msie) {
		if ($.browser.version <= 6) {
			$('#column-left + #column-right + #content, #column-left + #content').css('margin-left', '195px');
			
			$('#column-right + #content').css('margin-right', '195px');
		
			$('.box-category ul li a.active + ul').css('display', 'block');	
		}
		
		if ($.browser.version <= 7) {
			$('#menu > ul > li').bind('mouseover', function() {
				$(this).addClass('active');
			});
				
			$('#menu > ul > li').bind('mouseout', function() {
				$(this).removeClass('active');
			});	
		}
	}
	
	$('.success img, .warning img, .attention img, .information img').live('click', function() {
		$(this).parent().fadeOut('slow', function() {
			$(this).remove();
		});
	});	
});

function addToCart(product_id) {
	$.ajax({
		url: 'index.php?route=checkout/cart/update',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
			
			if (json['error']) {
				if (json['error']['warning']) {
					$('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
					$('.warning').fadeIn('slow');
					
					$('html, body').animate({ scrollTop: 0 }, 'slow');
				}
			}	 
			if (json['success']) {	
				html = '<div class="popup-cart-info"><div class="popup-close"><a alt="Close &amp; Continue" onclick="closeCart();" title="Close &amp; Continue" ><img src="catalog/view/javascript/jquery/fancybox/fancy_close.png"></a></div>';
				MainImg = $('a[onclick="addToCart(\'' + product_id + '\');"]').parents().find('.image a img');
				AltImg = $('a[onclick="addToCart(\'' + product_id + '\');"]').parent().parent().parent().find('.left .image a img');
				if(MainImg.length) {
					html += '<div class="cart-box-img"><img style="width:130px;" src="' + MainImg.attr('src') + '" /></div>';
				} else if(AltImg.length) {
					html += '<div class="cart-box-img"><img style="width:130px;" src="' + AltImg.attr('src') + '" /></div>';
				} else {
					html += '<div class="cart-box-img"><img style="width:130px;" src="image/no_image1.jpg" title="Image Unavailable" alt="Image Unavailable" /></div>';
				}
				html += '<div class="cart-box-succ-img"><img src="catalog/view/theme/default/image/success1.png"></div>';
				html +=	'<div class="cart-box-succ-det">' + json['success'] + '</div>';
				html +=	'<div class="cart-box-list">' + json['output']  +  '</div>';
				html +=	'<div class="popup-buttons"><div class="left"><a href="index.php?route=checkout/cart" class="button"><span>Перейти в корзину</span></a></div><div class="center"><a alt="Close &amp; Continue" onclick="closeCart();" title="Close &amp; Continue" class="button"><span>Продолжить покупки</span></a></div><div class="right"><a href="index.php?route=checkout/checkout" class="button"><span>Оформить заказ</span></a></div></div>';
				html += '</div>';
				$('#cart-success').html('<div class="cart-conf-popup">' + html + '</div>');

				var opaclayerHeight = $(document).height();
				var opaclayerWidth = $(window).width();

				$('#opaclayer').css('height', opaclayerHeight);			

				var winH = $(window).height();
				var winW = $(window).width();

				$('.cart-conf-popup').css('top',  winH/2-$('.cart-conf-popup').height()/2);
				$('.cart-conf-popup').css('left', winW/2-$('.cart-conf-popup').width()/2);				
				$('#opaclayer').fadeTo(500,0.8);
				$('.cart-conf-popup').fadeIn(500); 					
				$('#cart_total').html(json['total']);
			}	
		}
	});
}	
function closeCart() {
	$('#opaclayer').fadeOut(500, function() {
		$('#opaclayer').hide().css('opacity','1');
	});
	$('.cart-conf-popup').fadeOut(500, function() {
		$('.cart-conf-popup').remove();
	});
	$('.popup-close').fadeOut(500, function() {
		$('.popup-close').remove();
	});

}

function removeCart(key) {
	$.ajax({
		url: 'index.php?route=checkout/cart/update',
		type: 'post',
		data: 'remove=' + key,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
			
			if (json['output']) {
				$('#cart_total').html(json['total']);
				
				$('#cart .content').html(json['output']);

				$('#cart .cart-box-list').html(json['total']);
				$('.cart-box-list').html(json['output']);
			}			
		}
	});
}

function removeVoucher(key) {
	$.ajax({
		url: 'index.php?route=checkout/cart/update',
		type: 'post',
		data: 'voucher=' + key,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
			
			if (json['output']) {
				$('#cart_total').html(json['total']);
				
				$('#cart .content').html(json['output']);
			}			
		}
	});
}
function addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/update',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#cart-success').after('<div class="success" style="display: none;"><div class="success-details">' + json['success'] + '</div></div>');
				
				$('.success').fadeIn(1000).delay(3000).fadeOut(1500);
				
				$('#wishlist_total').html(json['total']);
			}	
		}
	});
}
function addToCompare(product_id) { 
	$.ajax({
		url: 'index.php?route=product/compare/update',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#cart-success').after('<div class="success" style="display: none;"><div class="success-details">' + json['success'] + '</div></div>');
				
				$('.success').fadeIn(1000).delay(3000).fadeOut(1500);
				
				$('#compare_total').html(json['total']);
			}	
		}
	});
}