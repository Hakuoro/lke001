<?php if (isset($_SERVER['HTTP_USER_AGENT']) && !strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE 6')) echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>"
      xml:lang="<?php echo $lang; ?>">
<head>
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>"/>
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>"/>
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>
    <?php if ($icon) { ?>
    <link href="<?php echo $icon; ?>" rel="icon"/>
    <?php } ?>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/lite_blue_152_1/stylesheet/stylesheet.css"/>
    <?php foreach ($styles as $style) { ?>
    <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>"
          media="<?php echo $style['media']; ?>"/>
    <?php } ?>
    <script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css"/>
    <script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/lightbox.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>


    <link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/css/lightbox.css" media="screen"/>
    <script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/common.js"></script>
    <?php foreach ($scripts as $script) { ?>
    <script type="text/javascript" src="<?php echo $script; ?>"></script>
    <?php } ?>
    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/lite_blue_152_1/stylesheet/ie7.css"/>
    <![endif]-->
    <!--[if lt IE 7]>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/lite_blue_152_1/stylesheet/ie6.css"/>
    <script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('#logo img');
    </script>
    <![endif]-->

    <script type="text/javascript" src="catalog/view/javascript/stickyfloat.min.js"></script>


    <?php echo $google_analytics; ?>
    <!-- Yandex.Metrika counter --><script type="text/javascript">(function (d, w, c) { (w[c] = w[c] || []).push(function() { try { w.yaCounter14471137 = new Ya.Metrika({id:14471137, enableAll: true, webvisor:true}); } catch(e) {} }); var n = d.getElementsByTagName("script")[0], s = d.createElement("script"), f = function () { n.parentNode.insertBefore(s, n); }; s.type = "text/javascript"; s.async = true; s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js"; if (w.opera == "[object Opera]") { d.addEventListener("DOMContentLoaded", f); } else { f(); } })(document, window, "yandex_metrika_callbacks");</script><noscript><div><img src="//mc.yandex.ru/watch/14471137" style="position:absolute; left:-9999px;" alt="" /></div></noscript><!-- /Yandex.Metrika counter -->
</head>

<?php

$bodyBackground = array(

    'bear26.jpg',
    'bear27.jpg',

    'dety06.jpg',
    'dety14.jpg',
    'dety15.jpg',
    'dety16.jpg',

    'dom02.jpg',
    'dom05.jpg',
    'dom08.jpg',
    'dom09.jpg',
    'dom14.jpg',
    'dom26.jpg',
    'dom27.jpg',
    'dom31.jpg',
    'dom38.jpg',
    'dom39.jpg',
    'dom42.jpg',
    'dom44.jpg',
    'dom45.jpg',
    'dom50.jpg',
    'dom51.jpg',
    'dom53.jpg',
    'dom54.jpg',
    'dom55.jpg',

    'inter12.jpg',
    'inter13.jpg',
    'inter14.jpg',
    'inter18.jpg',
    'inter19.jpg',
    'inter22.jpg',
    'inter27.jpg',
    'inter31.jpg',
    'inter33.jpg',
    'inter36.jpg',
    'inter44.jpg',
    'inter46.jpg',
    'inter47.jpg',
    'inter48.jpg',
    'inter55.jpg',
    'inter56.jpg',


    'loshad02.jpg',
    'loshad09.jpg',
    'loshad27.jpg',


    'more08.jpg',
    'more09.jpg',
    'more19.jpg',
    'more23.jpg',
    'more24.jpg',
    'more37.jpg',
    'more39.jpg',
    'more41.jpg',
    'more42.jpg',
    'more43.jpg',
    'more46.jpg',
    'more56.jpg',
    'more58.jpg',
    'more59.jpg',
    'more64.jpg',

    'ptitsy02.jpg',
    'ptitsy03.jpg',
    'ptitsy12.jpg',
    'ptitsy15.jpg',
    'ptitsy23.jpg',
    'ptitsy24.jpg',
    'ptitsy40.jpg',
    'ptitsy51.jpg',
    'ptitsy53.jpg',
    'ptitsy54.jpg',


    'razcat03.jpg',
    'razcat13.jpg',
    'razcat27.jpg',

    'redcat08.jpg',
    'sercat04.jpg',

    'rybka01.jpg',
    'rybka25.jpg',


);

?>

<body
    style="background: url('/catalog/view/theme/lite_blue_152_1/image/<?=$bodyBackground[rand(0, count($bodyBackground) - 1)]?>')  fixed">

<div id="container">


    <div id="header">

        <?php echo $cart; ?>
        <script type="text/javascript">
            jQuery('#cart').stickyfloat({duration: 100, lockBottom: false});
        </script>


        <div onclick="document.location.href = 'http://lke.su/';" style="margin-top:10px; cursor:pointer; width:170px; height:79px; float:left; background: url('/catalog/view/theme/lite_blue_152_1/image/menu/begin.png')"> </div>
        <div onclick="document.location.href = 'http://lke.su/index.php?route=account/login';" style="margin-top:5px; cursor:pointer; width:170px; height:62px; float:left; background: url('/catalog/view/theme/lite_blue_152_1/image/menu/enter.png')"> </div>
        <div onclick="document.location.href = 'http://lke.su/index.php?route=checkout/cart';" style="margin-top:10px; cursor:pointer; width:170px; height:79px; float:left; background: url('/catalog/view/theme/lite_blue_152_1/image/menu/buy.png')"> </div>
        <div onclick="document.location.href = 'http://lke.su/about_us';" style="margin-top:5px; cursor:pointer; width:170px; height:62px; float:left; background: url('/catalog/view/theme/lite_blue_152_1/image/menu/about.png')"> </div>

        <!--div style="margin-top:5px; width:270px; height:62px; float:left; text-align: right;
        -webkit-box-shadow: 0px 2px 2px #67A6C6;	-moz-box-shadow: 0px 2px 2px #67A6C6;	box-shadow: 0px 2px 2px #67A6C6; ">
            <span style="color: white;">+7 (929) 6382703</span>
        </div-->



        <!--div id="menu">
            <ul>
                <li><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
                <li><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a></li>
                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                <li><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
                <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
            </ul>

            <div id="welcome">
                <ul>
                    <li><a href="#"><?php echo $text_home; ?></a></li>
                </ul>

                <?php if (!$logged) { ?>
                <?php echo $text_welcome; ?>
                <?php } else { ?>
                <?php echo $text_logged; ?>
                <?php } ?>
            </div>

            <div id="search">
                <div class="button-search"></div>
                <?php if ($filter_name) { ?>
                <input type="text" name="filter_name" value="<?php echo $filter_name; ?>"/>
                <?php } else { ?>
                <input type="text" name="filter_name" value="<?php echo $text_search; ?>" onclick="this.value = '';"
                       onkeydown="this.style.color = '#000000';"/>
                <?php } ?>
            </div>
        </div-->
    </div>
    <div id="notification"></div>
