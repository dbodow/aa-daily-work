import BenchesReducer from '../benches_reducer';
import { testBenches } from '../../testUtil/bench_helper';
import * as BenchActions from '../../actions/bench_actions';

/*
NOTE: Our frontend state shape looks like this:
{
  benches: {
    1: {
        id: 1,
        description: "...",
        lat: 0.0,
        lng: 0.0
      },
    2: {
      id: 2,
      description: "...",
      lat: 0.0,
      lng: 0.0
    },
    ...
  }
  ...
}
*/

describe('BenchesReducer', () => {

  test('should initialize with an empty object as the default state', () => {
    // Your code here
    const nullAction = {};
    expect(BenchesReducer(undefined, nullAction)).toEqual({});
  });

  describe('handling the RECEIVE_BENCHES action', () => {
    let action;

    beforeEach(() => {
      action = {
        type: BenchActions.RECEIVE_BENCHES,
        benches: testBenches
      };
    });

    test('should replace the state with the action\'s benches', () => {
      // Your code here
      expect(BenchesReducer(undefined, action)).toEqual(testBenches);
    });

    test('should not modify the old state', () => {
      // Your code here
      const oldState = {};
      BenchesReducer(oldState, action);
      expect(oldState).toEqual({});
    });
  });
});
