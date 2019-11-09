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


//var mapcode;
//var diag;
//function initialize() {
//    mapcode = new google.maps.Geocoder();
//    var lnt = new google.maps.LatLng(-34.397, 150.644);
//    var diagChoice = {
//        zoom: 9,
//        center: lnt,
//    }
//    diag = new google.maps.Map(document.getElementById('mapinweb'), diagChoice);
//}


//function getmap() {
//    var completeaddress = document.getElementById('searchtxt').value;
//    mapcode.geocode({ 'address': completeaddress }, function (results, status) {
//        if (status == google.maps.GeocoderStatus.OK) {
//            diag.setCenter(results[0].geometry.location);
//            var hint = new google.maps.Marker
//                ({
//                    diag: diag,
//                    position: results[0].geometry.location
//                });
//        }
//        else {
//            alert('Location Not Tracked. ' + status);
//        }
//    });
//    google.maps.event.addDomListener(window, 'load', initialize);


    //infoWindow = new google.maps.infoWindow;
    //if (navigator.geolocation) {
    //    navigator.geolocation.getCurrentPosition(function (p) {
    //        var position = {
    //            lat: p.coords.latitude,
    //            lng: p.coords.longitude
    //        };
    //        infoWindow.setCenter(position);
    //        infoWindow.setPosition("Your Location");
    //        infoWindow.open(map);
    //    }, function () {
    //        handleLocationError('Geolocation service failed', map.center());
    //        })
    //}
    //else
    //{
    //    handleLocationError('No Geolocation avaliable', map.center());
    //}

    //var input = document.getElementById('search');
    //var searchBox = new google.maps.places.searchBox(input);

    //map.addDomListener('bounds_changed', function () {
    //    searchBox.setBounds(map.getBounds());
    //});

    //var markers = [ ];

    //searchbox.addDomListener('Places_changed', function () {
    //    var places = searchBox.getPlaces();

    //    if (places.length === 0)
    //        return;
    //    markers.forEach(function (m) { m.setMap(null); });
    //    markers = [];

    //    var bounds = new google.maps.LatLngBounds();

    //    places.forEach(function (p) {
    //        if (!p.geometry)
    //            return;
    //        makers.push(new google.maps.Marker({
    //            map: map,
    //            title: p.name,
    //            position: p.geometry.location
    //        }));

    //        if (p.geometry.viewport)
    //            bounds.union(p.geometry.viewport);
    //        else
    //            bounds.extend(p.geometry.location);
    //    });
    //    map.fitBounds(bounds);
    //});
//function handleLocationError(content, position) {
//    infoWindow.setCenter(content);
//    infoWindow.setPosition(position);
//    infoWindow.open(map);
//}