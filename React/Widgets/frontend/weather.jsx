import React from 'react';

export default class Weather extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      location: "",
      temperature: 0,
    }

    this.loadXMLDoc = this.loadXMLDoc.bind(this);
  }

  loadXMLDoc(lat, lon) {
    const xmlhttp = new XMLHttpRequest();

    xmlhttp.onreadystatechange = () => {
      if (xmlhttp.readyState == XMLHttpRequest.DONE) {
        if (xmlhttp.status == 200) {
          const resp = JSON.parse(xmlhttp.response);
          this.setState( {
            location: resp.name,
            temperature: resp.main.temp
          })
        } 
        else if (xmlhttp.status == 400) {
          alert("There was an error 400");          
        }
        else {
          alert("some other error");
        }
      }
    }

    const locUrl = "http://api.openweathermap.org/data/2.5/weather?lat=" + lat + "&lon=" + 
    lon + "&appid=5cf4e68116729434009ac54176e7a4b4&units=imperial"
    xmlhttp.open("GET", locUrl, true)
    xmlhttp.send();
  }

  componentDidMount () {
    navigator.geolocation.getCurrentPosition( (pos) => {      
      const latitude = pos.coords.latitude;
      const longitude = pos.coords.longitude;
      this.loadXMLDoc(latitude, longitude)
    }) 
  }

  render() {
    return (
      <>
      <h1>WHAT WEATHER IS IT??</h1>
      <div className="weather">        
        <p>{this.state.location}</p>
        <p>{this.state.temperature}</p>
      </div>
      </>
    )
  }
}
