import React from 'react' ;

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = { index: 0 };
  }

  render(){
    return (
      <div className="widget">
        <h1>Tabs</h1>
        <ul>
        {this.props.arrTabs.map((el) => (
          <h2>{el['title']}</h2>
        ))}
        </ul>
      </div>
    );
  }
}

export default Tabs;
