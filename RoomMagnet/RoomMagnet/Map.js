var mapcode;
var diag;
function initialize() {
    mapcode = new google.maps.Geocoder();
    var lnt = new google.maps.LatLng(-34.397, 150.644);
    var diagChoice = {
        zoom: 9,
        center: lnt,
    }
    diag = new google.maps.Map(document.getElementById('map_populate'), diagChoice);
}
function getmap() {
    var completeaddress = document.getElementById('txt_location').value;
    mapcode.geocode({ 'address': completeaddress }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            diag.setCenter(results[0].geometry.location);
            var hint = new google.maps.Marker
                ({
                    diag: diag,
                    position: results[0].geometry.location
                });
        }
        else {
            alert('Location Not Tracked. ' + status);
        }
    });
}
google.maps.event.addDomListener(window, 'load', initialize);