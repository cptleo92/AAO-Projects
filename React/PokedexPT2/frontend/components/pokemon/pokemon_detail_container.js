import { connect } from "react-redux"
import { requestSinglePokemon } from "../../actions/pokemon_actions"
import { selectAllPokemon, selectItems, selectMoves } from "../../reducers/selectors"
import PokemonDetail from "./pokemon_detail"

const mapStateToProps = state => ({
  items: selectItems(state),
  moves: selectMoves(state),
  pokemon: selectAllPokemon(state),
  loading: state.loading
})

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: id => dispatch(requestSinglePokemon(id))
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail)