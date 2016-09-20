function placeMakers(data) {
  markers = handler.addMarkers(data);
  var image = 'https://hydra-media.cursecdn.com/towns.gamepedia.com/a/a3/Chicken.png?version=63a5ce4282724abcc17a7348252c0177';
  markers[markers.length-1].serviceObject.icon = image;
  handler.bounds.extendWith(markers);
  handler.fitMapToBounds();
}

function showLocations(data) {
  if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
      // Add our position to the collection of markers
      data[data.length] = {
        lat: position.coords.latitude,
        lng: position.coords.longitude,
        infowindow: "You!",
      };
      placeMakers(data);
    });
  } else {
      alert("Geolocation is not available.");
      placeMakers(data)
  }
}

function createGmap(data) {
  handler = Gmaps.build('Google');
  handler.buildMap({
      provider: {},
      internal: {id: 'map'}
    },
    function() {
      showLocations(data);
    }
  );
};

function loadAndCreateGmap() {
  // Only load map data if we have a map on the page
  if ($('#map').length > 0) {
    // Access the data-apartment-id attribute on the map element
    var apartmentId = $('#map').attr('data-apartment-id');

    $.ajax({
      dataType: 'json',
      url: '/apartments/' + apartmentId + '/map_location',
      method: 'GET',
      data: '',
      success: function(data) {
        createGmap(data);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Getting map data failed: " + errorThrown);
      }
    });
  }
};

// Create the map when the page loads the first time
$(document).on('ready', loadAndCreateGmap);
// Create the map when the contents is loaded using turbolinks
// To be 'turbolinks:load' in Rails 5
$(document).on('page:load', loadAndCreateGmap);
