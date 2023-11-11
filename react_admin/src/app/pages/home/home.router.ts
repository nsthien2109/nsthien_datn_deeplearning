import { RouteType } from '../../types/router.type';
import Home from './container/home';

export const authRoutes: RouteType[] = [
  {
    path: '/auth/login',
    component: Home,
  },
];
