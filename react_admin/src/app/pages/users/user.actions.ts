import { ACTION_TYPES } from '../../store/types';

const getAllUser = () => {
  return {
    type: ACTION_TYPES.GET_ALL_USERS,
  };
};

const getAllUserSuccess = (data: any) => {};

const getAllUserFailure = () => {};
