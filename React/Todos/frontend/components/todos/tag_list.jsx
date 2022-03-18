import React from "react";

class TagList extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {   
    return (
      <ul className="form-tag-list">
      {             
        this.props.tags.map((tag, idx) => <li key={idx} onClick={() => this.props.removeTag(idx)}>{tag}</li>)
      }
    </ul>
    )
  }
}

export default TagList