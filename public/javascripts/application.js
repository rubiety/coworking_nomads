// Coworking Nomads Application 
$(function() {
  CoworkingNomads.initialize();
});

var CoworkingNomads = {
  initialize: function() {
    if ($("body.cities section#map")) {
      CoworkingNomads.map.initialize();
    }
  },
  
  map: {
    initialize: function() {
      $('#google-map').jMapping({
        side_bar_selector: "#google-map-locations",
        metadata_options: {type: "html5"}
      });
    }
  }
};
