import { Controller } from "@hotwired/stimulus"
import L from 'leaflet';

export default class extends Controller {
  static targets = ['map'];

  connect() {
    this.initializeMap();
  }

  async initializeMap() {
    const map = L.map(this.mapTarget).setView([-81.13390268058475, 32.07206917625161], 13);
    this.map = map;
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19,
    }).addTo(map);
    this.loadPolygonData()
  }

  loadPolygonData() {

    let geoData = this.data.get('polygon-coordinates');
    if (geoData) {      
      geoData = JSON.parse(geoData)
      console.log(geoData)
      const geojsonLayer = L.geoJSON(geoData, {
        onEachFeature: function (feature, layer) {
          // Add a popup with the properties
          layer.bindPopup(
            "<b>Name:</b> " + feature.properties.name + "<br>" +
            "<b>Address:</b> " + feature.properties.address + "<br>"
          );
        }
      })
      geojsonLayer.addTo(this.map);
      this.map.fitBounds(geojsonLayer.getBounds());
      geojsonLayer.eachLayer(function (layer) {
        layer.openPopup();
      });
      // const polygon = L.polygon(coordinates).addTo(this.map);
      // polygon.bindPopup('This is a dynamic polygon!');
      // this.map.fitBounds(polygon.getBounds());
    }
  }

  updatePolygon() {
    // You can update the polygon or perform other actions here based on the data attributes
    // For example, you can change the coordinates dynamically
    const newCoordinates = [
      [51.52, -0.06],
      [51.52, -0.04],
      [51.54, -0.04],
    ];

    const polygon = L.polygon(newCoordinates).addTo(this.map);
    polygon.bindPopup('Updated Polygon!');
    this.map.fitBounds(polygon.getBounds());
  }
}



// import { Controller } from "@hotwired/stimulus"
// import L from "leaflet"

// export default class extends Controller {
//   static targets = ["container", "address", "latitude", "longitude"]
//   containerTargetConnected() {
//     let defaultLocation = [50.29830444909283, 18.61384391784668]

//     if (this.latitudeTarget.value.length > 0 && this.longitudeTarget.value.length > 0) {
//       defaultLocation = [this.latitudeTarget.value, this.longitudeTarget.value]
//     }

//     this.map = L.map(this.containerTarget).setView(defaultLocation, 18);
//     // const provider = new GeoSearch.OpenStreetMapProvider();

//     L.tileLayer('//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(this.map);

//     // Define your polygon coordinates
//     var polygonCoordinates = [[50.29830444909283, 18.61384391784668],
//       [50.29619353058144, 18.620710372924805],
//       [50.29084727901576, 18.616890907287598],
//       [50.29125855046426, 18.61354351043701],
//       [50.2941373510724, 18.611998558044434],
//       [50.29830444909283, 18.61384391784668]];
//     console.log(polygonCoordinates)
//     var polygon = L.polygon(polygonCoordinates, { color: 'red' }).addTo(this.map);

//     // const search = new GeoSearch.GeoSearchControl({
//     //   style: 'bar',
//     //   provider: provider,
//     //   marker: {
//     //     draggable: true,
//     //   },
//     // });

//     this.map.addControl(polygon);

//     // this.map.on('geosearch/showlocation', (event) => {
//     //   let latLng = event.marker.getLatLng()

//     //   this.addressTarget.value = event.location.label
//     //   this.latitudeTarget.value = latLng.lat
//     //   this.longitudeTarget.value = latLng.lng
//     // });

//     // this.map.on('geosearch/marker/dragend', (event) => {
//     //   this.latitudeTarget.value = event.location.lat
//     //   this.longitudeTarget.value = event.location.lng
//     // })

//     // if (this.addressTarget.value.length > 0) {
//     //   let query = { query: this.addressTarget.value }

//     //   provider.search(query).then((result) => {
//     //     search.showResult(result[0], query)
//     //   });

//     //   search.searchElement.input.value = this.addressTarget.value
//     // }
//   }

//   disconnect(){
//     this.map.remove()
//   }
// }