import React from 'react';
import { ItemDetail } from './item_detail';
import { connect } from 'react-redux';
import { selectItem } from '../../reducers/selectors';

const mapStateToProps = (state, ownProps) => {
  console.log('ownprops: ', ownProps);
  const currentItem = selectItem(parseInt(ownProps.match.params.itemId, 10),
                                 state.entities.items);
  return ({
    item: currentItem,
    ui: state.ui
  });
};




export default connect(
  mapStateToProps,
  null
)(ItemDetail);
