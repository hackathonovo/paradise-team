jQuery(document).ready(function($){$(document).ready(function(){function e(){var e=new google.maps.LatLng(45.815,15.9819),i={zoomControl:!0,zoomControlOptions:{position:google.maps.ControlPosition.LEFT_TOP},center:e,scrollwheel:!1,zoom:13,styles:[{featureType:"landscape",stylers:[{saturation:20},{lightness:65},{visibility:"on"}]},{featureType:"poi",stylers:[{saturation:-100},{lightness:51},{visibility:"simplified"}]},{featureType:"road.highway",stylers:[{saturation:-100},{visibility:"simplified"}]},{featureType:"road.arterial",stylers:[{saturation:-100},{lightness:30},{visibility:"on"}]},{featureType:"road.local",stylers:[{saturation:-100},{lightness:40},{visibility:"on"}]},{featureType:"transit",stylers:[{saturation:-100},{visibility:"simplified"}]},{featureType:"administrative.province",stylers:[{visibility:"off"}]},{featureType:"water",elementType:"labels",stylers:[{visibility:"on"},{lightness:-25},{saturation:-100}]},{featureType:"water",elementType:"geometry",stylers:[{hue:"$background"},{lightness:-25},{saturation:-80}]}]},t='<div class="info_content"><h3>My Location</h3><p>This is where you put information about this address</p></div>',o=new google.maps.InfoWindow({content:'<div class="info_content"><h3>My Location</h3><p>This is where you put information about this address</p></div>'}),s=new google.maps.Marker({position:e,url:"/",animation:google.maps.Animation.DROP});google.maps.event.addListener(s,"click",function(){o.open(n,s)});var n=new google.maps.Map(document.getElementById("map-canvas"),i);s.setMap(n)}google.maps.event.addDomListener(window,"load",e)})});