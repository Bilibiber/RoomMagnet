var geocoder = new google.maps.Geocoder();

var map;

var dataTable1;

var chart1;

var click = false;

function initMap() {
    if (click === false) {
        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 10,
            center: { lat: 38.4495688, lng: -78.8689156 },
        });
    }
    else {
        var inputvalue = document.getElementById('address').value;
        if (isNaN(inputvalue)) {
            PageMethods.QueryToJsonForCityState(addressmap)
        }
        else {
            PageMethods.QueryToJsonForZip(addressmap)
        }
    }
}

function geocodeAddress() {
    click = true;
}
function addressmap(response) {
    dataTable1 = eval(response);
    dataTable1 = google.visualization.arrayToDataTable(dataTable1);
    map = new google.maps.Map(document.getElementById('map'), {
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        zoom: 6
    });
    var latlng = new google.maps.LatLng(38.5, -78.9);
    map.setCenter(latlng);

    var address = dataTable1.getValue(0);
    var cities = dataTable1.getValue(0, 1);
    var stateProvince = dataTable1.getValue(0, 2);

    for (var i = 0; i < cities.length; i++) {
        var newaddress = address + "," + cities + "," + stateProvince;
        geocoder.geocode({ 'address': newaddress }, onGeocodeResponse);
    }
}
function onGeocodeResponse(response, status) {
    // the Geocode service has sent its response. We can now use it for the map
    if (status == google.maps.GeocoderStatus.OK) {
        // center the map at the location returned from the geocoding service
        map.setCenter(response[0].geometry.location);

        // set up the store names for the city to display in marker tool tip
        var storesInCity = "\n";
        for (var i = 0; i < dataTable1.getNumberOfRows(); i++) {
            if (response[0].address_components[0].long_name == dataTable1.getValue(i, 1))
                storesInCity += "\n" + dataTable1.getValue(i, 0);
        }

        // put a marker at the specified location
        var marker = new google.maps.Marker({
            map: map,
            position: response[0].geometry.location,
            title: response[0].address_components[0].long_name + storesInCity
        });
    }
    else {
        alert('Geocode was not successful for the following reason: ' + status);
    }
}
window.onload = initMap;