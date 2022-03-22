export default class MarkerManager {
  constructor(map) {
    this.map = map;
    this.markers = {};
  }

  updateMarkers(benches) {  
    const benchesObj = {}
    benches.forEach(bench => {
      if (this.markers[bench.id] === undefined) {
        this.createMarkerFromBench(bench)
      }
      benchesObj[bench.id] = bench
    })
    
    for (const benchId in this.markers) {
      if (benchesObj[benchId] === undefined) {
        console.log(this.markers)
        this.removeMarker(this.markers[benchId], benchId)
      }
    }
  }

  removeMarker(marker, id) {
    marker.setMap(null)
    delete this.markers[id]
  }

  createMarkerFromBench(bench) {
    this.markers[bench.id] = new google.maps.Marker({
      position: { lat: bench.lat, lng: bench.lng },
      map: this.map,
      title: bench.id + ": " + bench.description
    })
  }
}