import React from 'react';
import MarkerManager from '../util/marker_manager';
import { withRouter } from 'react-router-dom';

class BenchMap extends React.Component {
  constructor(props) {
    super(props)
  }

  componentDidMount() {
    const mapOptions = {
      center: { lat: 37.7758, lng: -122.435},
      zoom: 13
    }

    this.map = new google.maps.Map(this.mapNode, mapOptions);
    this.MarkerManager = new MarkerManager(this.map);
    this.MarkerManager.updateMarkers(this.props.benches);

    this.map.addListener('idle', () => {
      const bounds = this.map.getBounds().toJSON();
      this.props.updateFilter("bounds", bounds)     
    });
 
    this.map.addListener("click", (e) => {
      this._handleClick(e.latLng.toJSON());
    })

  }

  _handleClick(coords) {
    this.props.history.push({
      pathname: "benches/new",
      search: `lat=${coords.lat}&lng=${coords.lng}`
    })
  }

  componentDidUpdate() {
    this.MarkerManager.updateMarkers(this.props.benches); 
  }

  render() {
    return (
      <div id="map-container" ref={map => this.mapNode = map}>
        <p>MAP</p>
      </div>
    )
  }
}

export default withRouter(BenchMap);