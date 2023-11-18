import { ApiService } from '.';
import { ENDPOINT } from '../constants';

export const getBirds = () => {
  const api = new ApiService();
  return api.get(ENDPOINT.birds.index);
};
