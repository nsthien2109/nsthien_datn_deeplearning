import { RouteType } from '../../types/router.type';
import UserCreatePage from './container/UserCreate';
import UserPage from './container/index';
import UserList from './container/UserList';

export const userRoutes: RouteType[] = [
  {
    path: '/user',
    component: UserPage,
    children: [
      {
        path: '',
        component: UserList,
      },
      {
        path: 'create',
        component: UserCreatePage,
      },
    ],
  },
];
