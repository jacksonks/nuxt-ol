<template>
  <div ref="map-default" style="width: 100%; height: 800px; margin: 0; padding: 0" />
</template>

<script>
/* eslint-disable */
import View from 'ol/View'
import Map from 'ol/Map'
import TileLayer from 'ol/layer/Tile'
import OSM from 'ol/source/OSM'
import 'ol/ol.css'
export default {
  name: 'MapDefault',
  data: () => ({
    //
  }),
  mounted() {
    // this is where we create the OpenLayers map
    new Map({
      // the map will be created using the 'map-root' ref
      target: this.$refs['map-default'],
      layers: [
        // adding a background tiled layer
        new TileLayer({
          source: new OSM() // tiles are served by OpenStreetMap
        }),
      ],

      // the map view will initially show the whole world
      view: new View({
        zoom: 0,
        center: [0, 0],
        constrainResolution: true
      }),
    })
  }
}
</script>
<style scoped></style>
