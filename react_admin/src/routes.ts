import { birdRoutes } from './app/pages/birds/bird.routes';
import { dashboardRoutes } from './app/pages/dashboard/dashboard.routes';
import { historyRoutes } from './app/pages/history/history.routes';
import { userRoutes } from './app/pages/users/user.routes';
import { RouteType } from './app/types/router.type';

export const routes: RouteType[] = [...dashboardRoutes, ...birdRoutes, ...userRoutes, ...historyRoutes];
