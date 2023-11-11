import { RouteType } from '../../types/router.type';
import Login from './container/login';

export const authRoutes: RouteType[] = [
  {
    path: '/auth/login',
    component: Login,
  },
];
