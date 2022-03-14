import React from "react";

class StepListItem extends React.Component {
  constructor(props) {
    super(props);
    
  }

  render() {
    const {removeStep, receiveStep, step} = this.props;
    const {title, body, todo_id} = step;

    const toggleDone = function() {
      receiveStep({
        ...step,
        done: !step.done
      })
    }

    const isDone = step.done ? "Undo" : "Done";

    return (
      <li>        
       <div className="step-list-item-text">
         <h4>{title}</h4>
         <p>{body}</p>
       </div>
       <div className="step-list-item-buttons">
          <button onClick={toggleDone}>{isDone}</button>
          <button onClick={() => removeStep(step)}>Delete</button>
        </div>
      </li>
    )
  }
}

export default StepListItem;