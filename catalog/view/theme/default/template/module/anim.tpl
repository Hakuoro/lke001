<script language="javascript">
	if (AC_FL_RunContent == 0) {
		alert("This page requires AC_RunActiveContent.js.");
	} else {
		AC_FL_RunContent(
			'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0',
			'width', '<?php echo $width?>',
			'height', '<?php echo $height?>',
			'src', '<?php echo $path?>',
			'quality', 'high',
			'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
			'align', 'middle',
			'play', 'true',
			'loop', 'true',
			'scale', 'showall',
			'wmode', '<?php echo $wmode?>',
			'devicefont', 'false',
			'id', 'gallery',
			'bgcolor', '<?php echo $bg?>',
			'name', 'gallery',
			'menu', 'true',
			'allowFullScreen', 'true',
			'allowScriptAccess','sameDomain',
			'movie', '<?php echo $path?>',
			'salign', '',
			'flashVars', 'XMLFile=<?php echo $path2?>'
			);
	}
</script>
<noscript>
	<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="<?php echo $width?>" height="<?php echo $height?>" id="gallery" align="middle">
	<param name="allowScriptAccess" value="sameDomain" />
	<param name="wmode" value="<?php echo $wmode?>" />
	<param name="allowFullScreen" value="true" />
	<param name="movie" value="<?php echo $path?>.swf" />
	<param name="quality" value="high" />
	<param name="bgcolor" value="<?php echo $bg?>" />
	<param name="flashVars" value="XMLFile=<?php echo $path2?>" />
	<embed src="<?php echo $path?>.swf" flashVars="XMLFile=<?php echo $path2?>" quality="high" bgcolor="#ffffff" width="872" height="650" name="gallery" align="middle" allowScriptAccess="sameDomain" allowFullScreen="true" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
	</object>
</noscript>