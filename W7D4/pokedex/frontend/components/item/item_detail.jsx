import React from 'react';

export class ItemDetail extends React.Component {
  render() {
    console.log("rendering item detail");
    console.log(this.props);
    return (
    <section>
      <h3>{this.props.item.name}</h3>
      <ul>
        <li>Happiness: {this.props.item.happiness}</li>
        <li>Price: {this.props.item.price}</li>
      </ul>
    </section>
  );
  }
}
