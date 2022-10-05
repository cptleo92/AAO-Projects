import { connect } from "react-redux";
import Search from "./search";
import { fetchBenches } from "../actions/bench_actions";
import { updateFilter } from "../actions/filter_actions";

const mapStateToProps = state => ({
  benches: Object.values(state.entities.benches)
})

const mapDispatchToProps = dispatch => ({
  fetchBenches: filters => dispatch(fetchBenches(filters)),
  updateFilter: (filter, value) => dispatch(updateFilter(filter, value))
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Search)