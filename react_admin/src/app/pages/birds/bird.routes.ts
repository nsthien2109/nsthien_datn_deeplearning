import { RouteType } from '../../types/router.type';
import BirdPage from './container/Bird';

export const birdRoutes: RouteType[] = [
  {
    path: '/birds',
    component: BirdPage,
  },
];
