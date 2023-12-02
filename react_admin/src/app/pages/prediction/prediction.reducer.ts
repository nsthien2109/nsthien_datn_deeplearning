import {PredictionState} from "../../models/prediction";
import {RootAction} from "../../store/store";
import {AuthState, UserInfo} from "../../models";
import {ACTION_TYPES} from "../../store/types";
import {removeLocalStorage, setLocalStorage} from "../../shared/utils";
import {StorageKey} from "../../shared/constants";

const initState: PredictionState = {
  predictions: [],
  isLoading: false,
  isError: false,
  isSuccess: false,
  message: ''
};


export const predictionReducer = (state = initState, action: RootAction): PredictionState => {
  switch (action.type) {
    case ACTION_TYPES.PREDICTION_BIRD: {
      return {
        ...state,
        isLoading: true,
        isError: false,
        isSuccess: false,
        message: '',
      };
    }
    case ACTION_TYPES.PREDICTION_BIRD_SUCCESS: {
      return {
        ...state,
        isLoading: false,
        isSuccess: true,
        predictions: action.payload,
      };
    }
    case ACTION_TYPES.PREDICTION_BIRD_FAILURE: {
      return {
        ...state,
        isLoading: false,
        isSuccess: false,
        isError: true,
        message: action.payload,
      };
    }


    default: {
      return state;
    }
  }
};
