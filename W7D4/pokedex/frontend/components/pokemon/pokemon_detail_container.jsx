import { connect } from 'react-redux';
import { requestSinglePoke } from '../../actions/pokemon_actions';
import { PokemonDetail } from './pokemon_detail';

const mapStateToProps = state => {
  return {
    pokemon: state.entities.pokemon,
    items: state.entities.items,
    ui: state.ui
  };
};

const mapDispatchToProps = dispatch => {
  return {
    requestSinglePoke: (id) => dispatch(requestSinglePoke(id))
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
