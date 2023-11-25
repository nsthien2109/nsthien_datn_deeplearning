import { ACTION_TYPES } from '../../store/types';
import { Dispatch } from 'react';
import { RootAction } from '../../store/store';
import { createUser, getUser, getUsers } from '../../shared/services/user.services';
import { data } from '../dashboard/components/ChartStatistic';
import { message } from 'antd';
import { User } from '../../models/user';

const getAllUser = () => {
  return {
    type: ACTION_TYPES.GET_ALL_USERS,
  };
};

const getAllUserSuccess = (data: User[]) => {
  return {
    type: ACTION_TYPES.GET_ALL_USERS_SUCCESS,
    payload: data,
  };
};

const getAllUserFailure = (message: string) => {
  return {
    type: ACTION_TYPES.GET_ALL_USERS_FAILURE,
    payload: message,
  };
};

const getUserStart = () => {
  return {
    type: ACTION_TYPES.GET_USER,
  };
};

const getUserSuccess = (data: User) => {
  return {
    type: ACTION_TYPES.GET_USER_SUCCESS,
    payload: data,
  };
};

const getUserFailure = (message: string) => {
  return {
    type: ACTION_TYPES.GET_USER_FAILURE,
    payload: message,
  };
};

const createUserStart = () => {
  return {
    type: ACTION_TYPES.CREATE_USER,
  };
};

const createUserSuccess = (data: User) => {
  return {
    type: ACTION_TYPES.CREATE_USER_SUCCESS,
    payload: data,
  };
};

const createUserFailure = (message: string) => {
  return {
    type: ACTION_TYPES.CREATE_USER_SUCCESS,
    payload: message,
  };
};

export const getAllUsersAction = () => async (dispatch: Dispatch<RootAction>) => {
  dispatch(getAllUser());
  try {
    const data: any = await getUsers();
    dispatch(getAllUserSuccess(data));
  } catch (error) {
    dispatch(getAllUserFailure(`${error}`));
  }
};

export const getUserAction = (idUser: number) => async (dispatch: Dispatch<RootAction>) => {
  dispatch(getUserStart());
  try {
    const data = await getUser(idUser);
    dispatch(getUserSuccess(data as User));
  } catch (error) {
    dispatch(getUserFailure(`${error}`));
    message.open({
      type: 'error',
      content: `Get user failure !`,
    });
  }
};

export const createUserAction = (data: User) => async (dispatch: Dispatch<RootAction>) => {
  dispatch(createUserStart());
  try {
    const response = await createUser(data);
    dispatch(createUserSuccess(response as User));
  } catch (error) {
    dispatch(createUserFailure(`${error}`));
    message.open({
      type: 'error',
      content: `Create user failure !`,
    });
  }
};
