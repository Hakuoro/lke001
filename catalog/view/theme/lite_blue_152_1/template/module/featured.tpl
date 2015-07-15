<style>
    .feature-card-square.mdl-card {
        width: 240px;
        height: 360px;
    }
</style>

<div class="box">
  <div class="box-content-new">
    <div class="box-product">
      <?php foreach ($products as $product) { ?>

        <div class="mdl-cell mdl-cell--4-col">
            <div class="mdl-card mdl-shadow--3dp feature-card-square">
                <div onclick="document.location.href = '<?php echo $product['href']; ?>';" class="mdl-card__title mdl-card--expand" style="cursor:pointer; padding-bottom:0px; background:url('<?php echo $product['thumb']; ?>') top right 15% no-repeat white;">
                </div>
                <div class="mdl-card__supporting-text">
                    <div class="product-title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                </div>
                <div class="mdl-card__actions mdl-card--border" style="padding-left: 0px;">
                    <button style="padding-left: 0px;" onclick="document.location.href = '<?php echo $product['href']; ?>';"  class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                        <h1 class="mdl-card__title-text" style="font-weight: bold;color: #424242;"><?php echo $product['price']; ?></h1>
                    </button>
                    <button onclick="addToCart('<?php echo $product['product_id']; ?>'); return false;" class="mdl-button  mdl-button--accent mdl-button--raised mdl-js-button mdl-js-ripple-effect">
                        В корзину
                    </button>


                </div>
            </div>
        </div>

      <!--div class="box-product-new">
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
        <div class="cart">
            <button id="button-cart" onclick="addToCart('<?php echo $product['product_id']; ?>');"  class="mdl-button  mdl-button--accent mdl-button--raised mdl-js-button mdl-js-ripple-effect">
                <?php echo $button_cart; ?>
            </button>
        </div>
      </div-->



      <?php } ?>
    </div>
  </div>
</div>
