import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {time: new Date()};
    this.tick = this.tick.bind(this);
  }

  tick() {
    this.setState({time: new Date()});
  }

  componentDidMount() {
    this.intervalId = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    this.intervalId.clearInterval();
  }


  render() {
    let hours = this.state.time.getHours();
    let minutes = this.state.time.getMinutes();
    let seconds = this.state.time.getSeconds();

    if (hours < 10) {
      hours = `0${hours}`;
    }
    if (minutes < 10) {
      minutes = `0${minutes}`;
    }
    if (seconds < 10) {
      seconds = `0${seconds}`;
    }

    return(
      <div>
        <h1>Clock</h1>
        <div className='clock'>
          <p>
            <span>Time: </span>
            <span>{hours}:{minutes}:{seconds}</span>
          </p>
          <p>
            <span>Date: </span>
            <span>{this.state.time.toDateString()}</span>
          </p>
        </div>
      </div>
    );
  }
}

export default Clock;
