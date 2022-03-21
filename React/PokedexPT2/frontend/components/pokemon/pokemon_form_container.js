import { connect } from "react-redux";
import PokemonForm from "./pokemon_form";
import { createNewPokemon } from "../../actions/pokemon_actions";

const mapStateToProps = state => ({
  errors: state.ui.errors
})

const mapDispatchToProps = dispatch => ({
  createPokemon: poke => dispatch(createNewPokemon(poke))
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonForm)