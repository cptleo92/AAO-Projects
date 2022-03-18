import React from "react";

class ErrorList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div className="errors">
      {
        this.props.errors.map((err, idx) => <li key={idx}>{err}</li>)
      }
    </div>
    )
  }

}

export default ErrorList