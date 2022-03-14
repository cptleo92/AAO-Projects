import React from "react";
import { stepsByTodoId } from "../../reducers/selectors";
import StepListItemContainer from "./step_list_item_container";
import StepForm from "./step_form";

class StepList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {    
    const steps = stepsByTodoId(this.props.steps, this.props.todo_id);

    return (
      <div className="step-list-container">
        <h3>Steps</h3>
        <ul className="step-list">
          {
            steps.map((step, idx) => <StepListItemContainer step={step} key={idx}/>)
          }
        </ul>        
        <StepForm todo_id={this.props.todo_id} receiveStep={this.props.receiveStep}/>
      </div>
    )
  }
}

export default StepList