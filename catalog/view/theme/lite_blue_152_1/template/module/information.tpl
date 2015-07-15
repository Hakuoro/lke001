<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content" style="white-space:nowrap;">
    <ul style=" padding: 0;  margin-bottom: 3px; margin-top: 3px; list-style: none;">
      <?php foreach ($informations as $information) { ?>
      <li><a style="font-size: 14px;" href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul>
  </div>
</div>
