import mapboxgl from 'mapbox-gl'
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css'

mapboxgl.accessToken = 'pk.eyJ1IjoiY2hyaHVhbmciLCJhIjoiY2twODVmcHB3MDJ6MTJwdDdtNjA2YnRmOSJ9.UASVCzlZa34egBDU9JgA8Q'

const fetchLocalisation = (search, map) => {
  const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${search}.json?access_token=${mapboxgl.accessToken}`
  console.log(search)
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
      // insertCoordinates(data.features[0].geometry.coordinates, map) // Le marqueur bonhomme
    })
}

const getRoute = (map, coords) => {
  // make a directions request using cycling profile
  // an arbitrary start will always be the same
  // only the end or destination will change
  // const start = [2.35183, 48.85658]
  // console.log(end)
  const url = 'https://api.mapbox.com/directions/v5/mapbox/walking/' + coords + '?geometries=geojson&access_token=' + mapboxgl.accessToken
  // const url = 'https://api.mapbox.com/directions/v5/mapbox/walking/-73.98511192264077%2C40.73343495161794%3B-73.98468944723699%2C40.73398254407084%3B-73.98431885477805%2C40.73440657410444%3B-73.98386302605293%2C40.73422404495108%3B-73.9841780296437%2C40.73373542598327%3B-73.98455603395159%2C40.7331822151196%3B-73.98418544149266%2C40.733030572759816%3B-73.98344796249808%2C40.73413418426097%3B-73.98302178117021%2C40.73381405456536%3B-73.98363696465239%2C40.73294913505376%3B-73.98395567416803%2C40.73292666946165%3B-73.98514527596213%2C40.73342091072678?alternatives=false&geometries=geojson&steps=false&access_token=pk.eyJ1IjoiY2hyaHVhbmciLCJhIjoiY2twODVmcHB3MDJ6MTJwdDdtNjA2YnRmOSJ9.UASVCzlZa34egBDU9JgA8Q'
  // make an XHR request https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
  console.log(url)
  const req = new XMLHttpRequest()
  req.open('GET', url, true)
  req.onload = function () {
    const json = JSON.parse(req.response)
    const data = json.routes[0]
    const route = data.geometry.coordinates
    const geojson = {
      type: 'Feature',
      properties: {},
      geometry: {
        type: 'LineString',
        coordinates: route
      }
    }
    // if the route already exists on the map, reset it using setData
    map.addLayer({
      id: 'route',
      type: 'line',
      source: {
        type: 'geojson',
        data: {
          type: 'Feature',
          properties: {},
          geometry: {
            type: 'LineString',
            coordinates: geojson
          }
        }
      },
      layout: {
        'line-join': 'round',
        'line-cap': 'round'
      },
      paint: {
        'line-color': '#EF4E72',
        'line-width': 5,
        'line-opacity': 0.75
      }
    })
    map.getSource('route').setData(geojson)
    // add turn instructions here at the end
  }
  req.send()
}

const initShowMapbox = () => {
  const mapElement = document.getElementById('mapShow')
  if (mapElement) {
    const map = new mapboxgl.Map({
      container: 'mapShow',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [2.35183, 48.85658], // starting position
      zoom: 15
    })
    // set the bounds of the map
    // const bounds = [[-123.069003, 45.395273], [-122.303707, 45.612333]]
    // map.setMaxBounds(bounds)

    // an arbitrary start will always be the same
    // only the end or destination will change
    // const start = [2.35183, 48.85658]

    // create a function to make a directions request
    const site = document.getElementById('site').innerText
    fetchLocalisation(site, map)
    const coords = document.querySelector('#mapShow').dataset.coords
    if (coords) {
      map.on('load', function () {
        getRoute(map, coords)
      })
    }
  }
}

export { initShowMapbox }
