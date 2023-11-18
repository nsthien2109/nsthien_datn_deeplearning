import { Dispatch } from 'react';
import { Bird } from '../../models/bird';
import { ACTION_TYPES } from '../../store/types';
import { RootAction } from '../../store/store';
import { getBirds } from '../../shared/services/bird.services';

type PayloadSuccessData = {
  data: Bird[];
  page: number;
};

const getAllBird = () => {
  return {
    type: ACTION_TYPES.GET_ALL_BIRD,
  };
};

const getAllBirdSuccess = (data: PayloadSuccessData) => {
  return {
    type: ACTION_TYPES.GET_ALL_BIRD_SUCCESS,
    payload: data,
  };
};

const getAllBirdFailure = (message: string) => {
  return {
    type: ACTION_TYPES.GET_ALL_BIRD_FAILURE,
    payload: message,
  };
};

export const getBirdsAction = () => async (dispatch: Dispatch<RootAction>) => {
  dispatch(getAllBird());
  try {
    const data: any = await getBirds();
    console.log(data);

    dispatch(getAllBirdSuccess({ data: data.results, page: data.page }));
  } catch (error) {
    dispatch(getAllBirdFailure(`${error}`));
  }
};
