import React from 'react';

class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = { weather: "" };
    this.getWeather = this.getWeather.bind(this);
  }

  componentDidMount() {
    navigator.geolocation.getCurrentPosition(this.getWeather);
  }


  getWeather(location) {
    let url = `api.openweathermap.org/data/2.5/weather?
    lat=${location.coords.latitude}&lon=${location.coords.longitude}`;

    let apikey = '8be90699a5a337225c62343041bbcf4c';


  }


  render() {



  }

}

export default Weather;
