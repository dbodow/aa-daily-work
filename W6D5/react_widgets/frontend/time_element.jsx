import React from 'react';
import leftPad from 'left-pad';

const TimeElement = ({date}) => {
  return (
    <div className="timedate">
      <span className="time">Time:</span>
      <span>{date.getHours()}:{date.getMinutes()}:{leftPad(date.getSeconds(), 2, 0)} PDT</span>
    </div>
  );
};

export default TimeElement;
