<?php if ($modules) { ?>
<div id="column-left">
    <!--a target="_blank" href="http://clck.yandex.ru/redir/dtype=stred/pid=47/cid=2508/*http://grade.market.yandex.ru/?id=116195&action=link"><img style="border-radius: 7px 7px 0 0;" src="http://clck.yandex.ru/redir/dtype=stred/pid=47/cid=2507/*http://grade.market.yandex.ru/?id=116195&action=image&size=3" border="0" width="180" height="125" alt="Читайте отзывы покупателей и оценивайте качество магазина на Яндекс.Маркете" /></a-->

  <?php
    $i= 0;
    foreach ($modules as $module) {
        if ($i == 1){
            echo '<a target="_blank" href="http://clck.yandex.ru/redir/dtype=stred/pid=47/cid=1248/*http://market.yandex.ru/grade-shop.xml?shop_id=116195"><img width="180" src="http://clck.yandex.ru/redir/dtype=stred/pid=47/cid=1248/*http://img.yandex.ru/market/informer7.png" border="0" alt="Оцените качество магазина на Яндекс.Маркете." /></a><br/><br/>';
            //echo '<a href="http://clck.yandex.ru/redir/dtype=stred/pid=47/cid=2508/*http://market.yandex.ru/shop/116195/reviews"><img src="http://clck.yandex.ru/redir/dtype=stred/pid=47/cid=2507/*http://grade.market.yandex.ru/?id=116195&action=image&size=2" border="0" width="180" height="111" alt="Читайте отзывы покупателей и оценивайте качество магазина на Яндекс.Маркете" /></a><br/><br/>';
        }
        echo $module;
        $i++;
    }
  ?>
</div>
<?php } ?> 
