import React from 'react';

const DateElement = ({date}) => {
  const Days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  const Months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  return (
    <div className="timedate">
      <span className="date">Date:</span>
      <span>{Days[date.getDay()]} {Months[date.getMonth()]} {date.getDate()} {date.getFullYear()}</span>
    </div>
  );
};

export default DateElement;
