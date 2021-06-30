import mapboxgl from 'mapbox-gl'
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder'
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css'

mapboxgl.accessToken = 'pk.eyJ1IjoiY2hyaHVhbmciLCJhIjoiY2twODVmcHB3MDJ6MTJwdDdtNjA2YnRmOSJ9.UASVCzlZa34egBDU9JgA8Q'

const setForm = (coords, data) => {
  document.getElementById('walk_coords').value = coords
  document.getElementById('walk_length').value = (data.distance / 100)
  document.getElementById('walk_duration').value = (data.duration / 60)
}

const setPoint = (map, coord) => {
  map.addLayer({
    id: 'point',
    type: 'circle',
    source: {
      type: 'geojson',
      data: {
        type: 'FeatureCollection',
        features: [{
          type: 'Feature',
          properties: {},
          geometry: {
            type: 'Point',
            coordinates: coord
          }
        }
        ]
      }
    },
    paint: {
      'circle-radius': 10,
      'circle-color': '#3887be'
    }
  })
}

const fetchLocalisation = (search, map) => {
  const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${search}.json?access_token=${mapboxgl.accessToken}`
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
      // set the bounds of the map
      const bounds = [
        [data.features[0].geometry.coordinates[0] - 0.02, data.features[0].geometry.coordinates[1] - 0.02], // Southwest coordinates
        [data.features[0].geometry.coordinates[0] + 0.02, data.features[0].geometry.coordinates[1] + 0.02] // Northeast coordinates
      ]
      map.setMaxBounds(bounds)
      // insertCoordinates(data.features[0].geometry.coordinates, map) // Le marqueur bonhomme
    })
}

const getRoute = (map, points) => {
  // make a directions request using cycling profile
  // an arbitrary start will always be the same
  // only the end or destination will change
  // const start = [2.35183, 48.85658]
  console.log(points.length)
  if (points.length > 1) {
    const coords = points.map(e => e.join(',')).join(';')
    const url = 'https://api.mapbox.com/directions/v5/mapbox/walking/' + coords + '?geometries=geojson&access_token=' + mapboxgl.accessToken
    // const url = 'https://api.mapbox.com/directions/v5/mapbox/walking/-73.98511192264077%2C40.73343495161794%3B-73.98468944723699%2C40.73398254407084%3B-73.98431885477805%2C40.73440657410444%3B-73.98386302605293%2C40.73422404495108%3B-73.9841780296437%2C40.73373542598327%3B-73.98455603395159%2C40.7331822151196%3B-73.98418544149266%2C40.733030572759816%3B-73.98344796249808%2C40.73413418426097%3B-73.98302178117021%2C40.73381405456536%3B-73.98363696465239%2C40.73294913505376%3B-73.98395567416803%2C40.73292666946165%3B-73.98514527596213%2C40.73342091072678?alternatives=false&geometries=geojson&steps=false&access_token=pk.eyJ1IjoiY2hyaHVhbmciLCJhIjoiY2twODVmcHB3MDJ6MTJwdDdtNjA2YnRmOSJ9.UASVCzlZa34egBDU9JgA8Q'
    // make an XHR request https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
    const req = new XMLHttpRequest()
    req.open('GET', url, true)
    req.onload = function () {
      const json = JSON.parse(req.response)
      // console.log(json)
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
      if (map.getSource('route')) {
        map.getSource('route').setData(geojson)
      } else { // otherwise, make a new request
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
            'line-color': '#3887be',
            'line-width': 5,
            'line-opacity': 0.75
          }
        })
        map.getSource('route').setData(geojson)
      }
      // add turn instructions here at the end
      setForm(coords, data)
    }
    req.send()
  }
}

const setCoords = (map, canvas) => {
  const points = []
  map.on('click', function (e) {
    const coordsObj = e.lngLat
    canvas.style.cursor = ''
    const coords = Object.keys(coordsObj).map(function (key) {
      return coordsObj[key]
    })
    points.push(coords)
    // const end = {
    //   type: 'FeatureCollection',
    //   features: [{
    //     type: 'Feature',
    //     properties: {},
    //     geometry: {
    //       type: 'Point',
    //       coordinates: coords
    //     }
    //   }
    //   ]
    // }
    // if (map.getLayer('end')) {
    //   map.getSource('end').setData(end)
    // } else {
    map.addLayer({
      id: `end_${points.length}`,
      type: 'circle',
      source: {
        type: 'geojson',
        data: {
          type: 'FeatureCollection',
          features: [{
            type: 'Feature',
            properties: {},
            geometry: {
              type: 'Point',
              coordinates: coords
            }
          }]
        }
      },
      paint: {
        'circle-radius': 5,
        'circle-color': '#f30'
      }
    })
    // }
    getRoute(map, points)
  })
}

const initCreateMapbox = () => {
  const mapElement = document.getElementById('mapCreate')
  if (mapElement) {
    const map = new mapboxgl.Map({
      container: 'mapCreate',
      style: 'mapbox://styles/chrhuang/ckqglr1jegknj17p8r4bblye9',
      center: [2.35183, 48.85658], // starting position
      zoom: 15
    })
    // set the bounds of the map
    // const bounds = [[-123.069003, 45.395273], [-122.303707, 45.612333]]
    // map.setMaxBounds(bounds)

    // initialize the map canvas to interact with later
    const canvas = map.getCanvasContainer()

    // an arbitrary start will always be the same
    // only the end or destination will change
    // const start = [2.35183, 48.85658]

    // create a function to make a directions request
    const site = document.getElementById('site').innerText
    fetchLocalisation(site, map)

    map.on('load', function () {
      // make an initial directions request that
      // starts and ends at the same location

      setCoords(map, canvas)
    })
  }
}

export { initCreateMapbox }
