import { ACTION_TYPES } from '../../store/types';
import {UserInfo} from "../../models";

const getAllUser = () => {
  return {
    type: ACTION_TYPES.GET_ALL_USERS,
  };
};


const getAllUserSuccess = (data: UserInfo) => {
  return {
    type : ACTION_TYPES.GET_ALL_USERS_SUCCESS,
    payload : data
  }
};

const getAllUserFailure = (message : string) => {
  return {
    type : ACTION_TYPES.GET_ALL_USERS_FAILURE,
    payload : message
  }
};
