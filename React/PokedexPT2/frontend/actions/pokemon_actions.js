import * as APIUtil from '../util/api_util';
import { receivePokemonItems } from './item_actions';
import { receivePokemonMoves } from './move_actions';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_SINGLE_POKEMON = "RECEIVE_SINGLE_POKEMON";
export const RECEIVE_POKEMON_ERRORS = "RECEIVE_POKEMON_ERRORS"
export const START_LOADING_ALL_POKEMON = "START_LOADING_ALL_POKEMON"
export const START_LOADING_SINGLE_POKEMON = "START_LOADING_SINGLE_POKEMON"

export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
})

export const receiveSinglePokemon = (pokemon) => ({
  type: RECEIVE_SINGLE_POKEMON,
  pokemon
})

export const receivePokemonErrors = (errors) => ({
  type: RECEIVE_POKEMON_ERRORS,
  errors
})

export const loadAllPokemon = () => ({
  type: START_LOADING_ALL_POKEMON
})

export const loadSinglePokemon = () => ({
  type: START_LOADING_SINGLE_POKEMON
})

export const requestAllPokemon = () => (dispatch) => {
  dispatch(loadAllPokemon())
  return APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
}

export const requestSinglePokemon = (pokeId) => (dispatch) => {
  dispatch(loadSinglePokemon())
  return APIUtil.fetchSinglePokemon(pokeId)
    .then(pokemon => {
        dispatch(receiveSinglePokemon(pokemon.pokemon))        
        dispatch(receivePokemonItems(pokemon.items))
        dispatch(receivePokemonMoves(pokemon.moves))
    })
}

const handleSuccess = pokemon => {
  dispatch(receiveSinglePokemon(pokemon))
  return pokemon.pokemon
}

export const createNewPokemon = pokemon => dispatch => (
    APIUtil.sendNewPokemon(pokemon).then(handleSuccess, errors => {
        console.log(errors)
        dispatch(receivePokemonErrors(errors.responseJSON))
    }
  )
)
