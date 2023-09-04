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
    }
  }
}