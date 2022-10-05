import { connect } from "react-redux";
import StepList from "./step_list";
import { receiveStep, fetchSteps, createStep } from "../../actions/step_actions";
import { allErrors } from "../../reducers/selectors";
import { clearErrors } from "../../actions/error_actions";

const mapStateToProps = (state, ownProps) => ({
  steps: state.steps,
  todo_id: ownProps.todo_id,
  errors: allErrors(state)
})

const mapDispatchToProps = dispatch => ({
  receiveStep: step => dispatch(receiveStep(step)),
  fetchSteps: () => dispatch(fetchSteps()),
  createStep: step => dispatch(createStep(step)),
  clearErrors: () => dispatch(clearErrors())
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(StepList);
