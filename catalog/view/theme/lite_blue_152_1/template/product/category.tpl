<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
    <!--div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a
            href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div-->
    <div class="typo-styles__demo mdl-typography--display-1" style="padding-bottom: 5px;"><?php echo $heading_title; ?></div>
    <?php if ($thumb || $description) { ?>
        <div class="category-info">
            <?php if ($thumb) { ?>
            <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>"/></div>
            <?php } ?>
            <?php if ($description) { ?>
            <?php echo $description; ?>
            <?php } ?>
        </div>
        <?php } ?>

    <?php if ($products) { ?>

    <style>
        .demo-card-square.mdl-card {
            width: 290px;
            height: 400px;
        }
    </style>
        <div class="mdl-grid" >

            <?php foreach ($products as $product) { ?>

                <div class="mdl-cell" >
                    <div class="mdl-card mdl-shadow--3dp demo-card-square">
                        <div onclick="document.location.href = '<?php echo $product['href']; ?>';" class="mdl-card__title mdl-card--expand" style="cursor:pointer; padding-bottom:0px; background:url('<?php echo $product['thumb']; ?>') top right 15% no-repeat white;">
                        </div>
                        <div class="mdl-card__supporting-text">
                            <div class="product-title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                        </div>
                        <div class="mdl-card__actions mdl-card--border">


                            <button style="padding-left: 16px;" onclick="document.location.href = '<?php echo $product['href']; ?>';"  class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                                <h1 class="mdl-card__title-text" style="font-weight: bold;color: #424242;"><?php echo $product['price']; ?></h1>
                            </button>
                            <button style="float:right; clear:right;" onclick="addToCart('<?php echo $product['product_id']; ?>'); return false;" class="mdl-button  mdl-button--accent mdl-button--raised mdl-js-button mdl-js-ripple-effect">
                                В корзину
                            </button>


                        </div>
                    </div>
                </div>



            <!--div>


                <?php if ($product['thumb']) { ?>
                <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"
                                                                                  title="<?php echo $product['name']; ?>"
                                                                                  alt="<?php echo $product['name']; ?>"/></a>
                </div>
                <?php } ?>
                <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                <div class="description" style="text-align: justify;"><?php echo $product['description']; ?></div>
                <?php if ($product['price']) { ?>
                <div class="price">
                    <?php if (!$product['special']) { ?>
                    <?php echo $product['price']; ?>
                    <?php } else { ?>
                    <span class="price-old"><?php echo $product['price']; ?></span> <span
                        class="price-new"><?php echo $product['special']; ?></span>
                    <?php } ?>
                    <?php if ($product['tax']) { ?>
                    <br/>
                    <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                    <?php } ?>
                </div>
                <?php } ?>
                <?php if ($product['rating']) { ?>
                <div class="rating"><img
                    src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png"
                    alt="<?php echo $product['reviews']; ?>"/></div>
                <?php } ?>
                <div class="cart">
                    <button onclick="addToCart('<?php echo $product['product_id']; ?>');"  class="mdl-button  mdl-button--accent mdl-button--raised mdl-js-button mdl-js-ripple-effect">
                        <?php echo $button_cart; ?>
                    </button>

                </div>

            </div-->


            <?php } ?>
        </div>
        <div class="pagination"><?php echo $pagination; ?></div>
        <?php } ?>
    <?php if (!$categories && !$products) { ?>
        <div class="content"><?php echo $text_empty; ?></div>
        <div class="buttons">
            <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a>
            </div>
        </div>
        <?php } ?>
    <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
function display(view) {
    if (view == 'list') {
        $('.product-grid').attr('class', 'product-list');

        $('.product-list > div').each(function (index, element) {
            html = '<div class="right">';
            html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
            html += '</div>';

            html += '<div class="left">';

            var image = $(element).find('.image').html();

            if (image != null) {
                html += '<div class="image">' + image + '</div>';
            }

            var price = $(element).find('.price').html();

            if (price != null) {
                html += '<div class="price">' + price + '</div>';
            }

            html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
            html += '  <div class="description">' + $(element).find('.description').html() + '</div>';

            var rating = $(element).find('.rating').html();

            if (rating != null) {
                html += '<div class="rating">' + rating + '</div>';
            }

            html += '</div>';


            $(element).html(html);
        });

        $('.display').html('<b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');

        $.cookie('display', 'list');
    } else {
        $('.product-list').attr('class', 'product-grid');

        $('.product-grid > div').each(function (index, element) {
            html = '';

            var image = $(element).find('.image').html();

            if (image != null) {
                html += '<div class="image">' + image + '</div>';
            }

            html += '<div class="name">' + $(element).find('.name').html() + '</div>';
            html += '<div class="description">' + $(element).find('.description').html() + '</div>';

            var price = $(element).find('.price').html();

            if (price != null) {
                html += '<div class="price">' + price + '</div>';
            }

            var rating = $(element).find('.rating').html();

            if (rating != null) {
                html += '<div class="rating">' + rating + '</div>';
            }

            html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';

            $(element).html(html);
        });

        $('.display').html('<b><?php echo $text_display; ?></b> <a onclick="display(\'list\');"><?php echo $text_list; ?></a> <b>/</b> <?php echo $text_grid; ?>');

        $.cookie('display', 'grid');
    }
}

view = $.cookie('display');

if (view) {
   // display(view);
} else {
   // display('grid');
}
//--></script>
<?php echo $footer; ?>