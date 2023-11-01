import { AuthRoute } from "./routers/auth.routes";
import { BirdRoute } from "./routers/bird.routes";
import { PredictionRoutes } from "./routers/prediction.routes";
import { RoleRoutes } from "./routers/role.routes";
import { UserRoutes } from "./routers/user.routes";

export const Routes = [
  ...RoleRoutes,
  ...UserRoutes,
  ...AuthRoute,
  ...BirdRoute,
  ...PredictionRoutes,
];
