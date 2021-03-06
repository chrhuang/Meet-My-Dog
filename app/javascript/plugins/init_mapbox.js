import mapboxgl from 'mapbox-gl'
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css'

const myApiKey = 'pk.eyJ1IjoiY2hyaHVhbmciLCJhIjoiY2twODVmcHB3MDJ6MTJwdDdtNjA2YnRmOSJ9.UASVCzlZa34egBDU9JgA8Q'

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/chrhuang/ckqglr1jegknj17p8r4bblye9',
    center: [2.35183, 48.85658],
    zoom: 12
  })
}

const addMarkersToMap = (map, markers) => {
  if (markers.length !== 0) {
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      const element = document.createElement('div')
      element.className = 'marker'
      element.style.backgroundImage = 'url("https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624887621/Mapbox_Marker_iw3wvw.png")'
      element.style.backgroundSize = 'contain'
      element.style.width = '50px'
      element.style.height = '50px'
      element.style.backgroundRepeat = 'no-repeat'
      new mapboxgl.Marker(element)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map)
    })
  }
}

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds()
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]))
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, minZoom: 5, duration: 0 })
}

const insertCoordinates = (coordinates, map) => {
  const longitude = coordinates[0]
  const latitude = coordinates[1]
  if (coordinates !== undefined) {
    new mapboxgl.Marker()
      .setLngLat([`${longitude}`, `${latitude}`])
      .addTo(map)
  }
}

const fetchLocalisation = (search, map) => {
  const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${search}.json?access_token=${myApiKey}`
  fetch(url)
    .then(reponse => reponse.json())
    .then((data) => {
      map.jumpTo({
        center: [
          data.features[0].geometry.coordinates[0],
          data.features[0].geometry.coordinates[1]
        ],
        essential: true // this animation is considered essential with respect to prefers-reduced-motion
      })
      insertCoordinates(data.features[0].geometry.coordinates, map) // Le marqueur bonhomme
    })
}

const initMapbox = () => {
  const mapElement = document.getElementById('map')
  if (mapElement) {
    const map = buildMap(mapElement)
    const markers = JSON.parse(mapElement.dataset.markers)
    const params = new URLSearchParams(window.location.search)
    // fetchLocalisation(params.get('query'), map)
    addMarkersToMap(map, markers)
    fitMapToMarkers(map, markers)
  }
}

export { initMapbox }
