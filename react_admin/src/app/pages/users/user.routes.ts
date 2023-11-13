import { RouteType } from '../../types/router.type';
import UserPage from './container/User';
import UserCreatePage from './container/UserCreate';

export const userRoutes: RouteType[] = [
  {
    path: '/user',
    component: UserPage,
    children: [
      {
        path: '/create',
        component: UserCreatePage,
      },
    ],
  },
];
