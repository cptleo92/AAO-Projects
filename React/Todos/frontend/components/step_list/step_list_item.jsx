import React from "react";

class StepListItem extends React.Component {
  constructor(props) {
    super(props);
    
  }

  render() {
    const {removeStep, updateStep, step} = this.props;
    const {title, body} = step;

    const toggleDone = function() {
      updateStep({
        ...step,
        done: !step.done
      })
    }

    const isDone = step.done ? "Undo" : "Done";
    const buttonStyle = {
      backgroundColor: step.done ? "lightgray" : ""
    }

    return (
      <li>        
       <div className="step-list-item-text">
         <h4>{title}</h4>
         <p>{body}</p>
       </div>
       <div className="step-list-item-buttons">
          <button style={buttonStyle} onClick={toggleDone}>{isDone}</button>
          <button className="button-delete" onClick={() => removeStep(step)}>Delete</button>
        </div>
      </li>
    )
  }
}

export default StepListItem;