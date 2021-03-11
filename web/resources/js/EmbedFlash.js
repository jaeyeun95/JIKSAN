////////////////ÇÃ·¡½Ã////////////////////////////////
function flash(width,height,flash_name) {
 var flash_tag = "";
 flash_tag = '<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" ';
 flash_tag +='codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0" ';
 flash_tag +='WIDTH="'+width+'" HEIGHT="'+height+'" >';
 flash_tag +='<param name="movie" value="'+flash_name+'">';
 flash_tag +='<param name="quality" value="high">';
 flash_tag +='<param name="wmode" value="transparent">';
 flash_tag +='<embed src="'+flash_name+'" wmode="transparent" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" ';
 flash_tag +='type="application/x-shockwave-flash"  WIDTH="'+width+'" HEIGHT="'+height+'"></embed></object>'
 document.write(flash_tag);
}
//////////////////////////////////////////////////////////////