import React from 'react';
import TimeElement from './time_element';
import DateElement from './date_element';

class Clock extends React.Component{
  render() {
    return (
      <div className="widget">
        <h1>Hertz</h1>
        <TimeElement date={ this.state.date } />
        <DateElement date={ this.state.date } />
      </div>
    );
  }

  constructor(madProps) {
    super(madProps);
    this.state = {
      date: new Date()
    };
  }

  tick() {
    this.setState( () => ( { date: new Date() } ));
  }

  componentDidMount() {
    this.handle = setInterval(this.tick.bind(this), 1000);
  }

  componentWillUnmount() {
    clearInterval(this.handle);
  }
}

export default Clock;
