import { connect } from "react-redux";
import StepList from "./step_list";
import { receiveStep } from "../../actions/step_actions";

const mapStateToProps = (state, ownProps) => ({
  steps: state.steps,
  todo_id: ownProps.todo_id
})

const mapDispatchToProps = dispatch => ({
  receiveStep: step => dispatch(receiveStep(step))
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(StepList);
