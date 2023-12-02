import { ACTION_TYPES } from '../../store/types';
import { Prediction } from '../../models/prediction';
import { Dispatch } from 'react';
import { RootAction } from '../../store/store';
import { prediction } from '../../shared/services/prediction.services';

const predictionBird = () => {
  return {
    type: ACTION_TYPES.PREDICTION_BIRD,
  };
};

const predictionBirdSuccess = (data: Prediction[]) => {
  return {
    type: ACTION_TYPES.PREDICTION_BIRD_SUCCESS,
    payload: data,
  };
};

const predictionBirdFailure = (message: string) => {
  return {
    type: ACTION_TYPES.PREDICTION_BIRD_FAILURE,
    payload: message,
  };
};

export const predictionBirdAction = (input: File) => async (dispatch: Dispatch<RootAction>) => {
  dispatch(predictionBird());
  const formData = new FormData();
  formData.append('file', input);
  try {
    const data = await prediction(formData);
    dispatch(predictionBirdSuccess(data as Prediction[]));
  } catch (error) {
    dispatch(predictionBirdFailure(`${error}`));
  }
};
