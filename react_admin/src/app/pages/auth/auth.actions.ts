import { ACTION_TYPES } from '../../store/types';

export const loginStart = () => {
  return {
    type: ACTION_TYPES.LOGIN,
  };
};

export const loginSuccess = (data: any) => {
  return {
    type: ACTION_TYPES.LOGIN_SUCCESS,
    payload: data,
  };
};

export const loginFailure = (error: string) => {
  return {
    type: ACTION_TYPES.LOGIN_FAILURE,
    payload: error,
  };
};
