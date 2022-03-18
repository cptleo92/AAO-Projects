import { connect } from "react-redux";
import StepListItem from "./step_list_item";
import { destroyStep, receiveStep, updateStep } from "../../actions/step_actions";

const mapDispatchToProps = dispatch => ({
  removeStep: step => dispatch(destroyStep(step)),
  updateStep: step => dispatch(updateStep(step))
})

export default connect(
  null,
  mapDispatchToProps
)(StepListItem);

