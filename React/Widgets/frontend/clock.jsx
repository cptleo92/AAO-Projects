import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      time: new Date()
    }

    this.tick = this.tick.bind(this);
  }

  tick() {
    this.setState({ time: new Date() });    
  }

  componentDidMount() {
    this.ticking = setInterval(() => {
      this.tick();
    }, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.ticking);
  }

  render() {
    const { time } = this.state;
    const [hour, minutes, seconds, day, year] = [
      time.getHours(), 
      (time.getMinutes() < 10 ? '0' : '') + time.getMinutes(), 
      (time.getSeconds() < 10 ? '0' : '') + time.getSeconds(), 
      time.getDate(), 
      time.getFullYear()
    ]; 
    const monthName = new Intl.DateTimeFormat('en-US', {month: 'long'}).format();

    return (
      <div className="clockWidget">
        <h1>WHAT TIME IS IT??</h1>   
        <div className="clock">
        <section className="line">
          <span>Time: </span><span>{hour}:{minutes}:{seconds}</span>
        </section>
        <section className="line">          
          <span>Date: </span><span>{monthName} {day}, {year}</span>         
        </section>
        </div>
      </div>
    )
  }
}

export default Clock;