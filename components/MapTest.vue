<template>
  <div id="map"></div>
</template>

<script>
/* eslint-disable */
// import openlayer css for style
import "ol/ol.css";
// This is library of openlayer for handle map
import GeoJSON from "ol/format/GeoJSON";
import Map from "ol/Map";
import View from "ol/View";
import { defaults as defaultControls, ScaleLine } from "ol/control";
import { Tile as TileLayer, Vector as VectorLayer } from "ol/layer";
import { OSM, Vector as VectorSource } from "ol/source";
import { Fill, Stroke, Style, Icon, Circle } from "ol/style";
import Overlay from "ol/Overlay";
export default {
  name: 'MapTest',
  data: () => ({
    station_type_id: undefined,
    dialog: false,
    types: undefined,
    stations: undefined,
    //url: "https://raw.githubusercontent.com/jacksonks/geojson/master/station_list.geojson",
    vectorGeoJSON: new VectorLayer(),
    source: new VectorSource({
      format: new GeoJSON(),
      url: "https://raw.githubusercontent.com/jacksonks/geojson/master/station_list.geojson",
    }),
  }),
  async mounted() {
    await this.initiateMap();
  },
  computed: {},
  watch: {},
  methods: {
    initiateMap() {
      // create vector layer
      var source = new VectorSource();
      var vector = new VectorLayer({
        source: source,
      });
      // create title layer
      var raster = new TileLayer({
        source: new OSM(),
      });
      // Vector data source in GeoJSON format
      this.vectorGeoJSON = new VectorLayer({
        source: this.source,
      });
      // create map with 2 layer
      var map = new Map({
        controls: defaultControls().extend([
          new ScaleLine({
            units: "degrees",
          }),
        ]),
        target: "map",
        layers: [raster, vector, this.vectorGeoJSON],
        view: new View({
          projection: "EPSG:4326",
          center: [-51.815011395380765, -24.650150016322684],
          zoom: 5,
        }),
      });
    },
  },
}
</script>

<style scoped>
#map {
  position: absolute;
  padding: 0;
  margin-top: 0px;
  height: 600px;
  width: 50%;
}
</style>
