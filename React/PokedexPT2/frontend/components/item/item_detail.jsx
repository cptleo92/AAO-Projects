import React from 'react';

class ItemDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const {item}= this.props;

    return (
      <ul>
        <li>{item.name}</li>
        <li>{item.price}</li>
        <li>{item.happiness}</li>
      </ul>
    )
  }
}

export default ItemDetail