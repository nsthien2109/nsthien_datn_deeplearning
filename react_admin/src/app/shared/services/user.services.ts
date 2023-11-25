import { ApiService } from '.';
import { UserInfo } from '../../models';
import { ENDPOINT } from '../constants';

export const getUsers = () => {
  const api = new ApiService();
  return api.get(ENDPOINT.users.index);
};

export const getUser = (userId: number) => {
  const api = new ApiService();
  return api.get(`${ENDPOINT.users.index}/${userId}`);
};

export const createUser = (data: any) => {
  const api = new ApiService();
  return api.post(`${ENDPOINT.auth.register}`, data);
};

export const updateUser = (data: UserInfo) => {};

export const deleteUser = (userId: number) => {};
