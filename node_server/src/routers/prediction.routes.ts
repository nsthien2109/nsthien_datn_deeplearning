import { PredictionController } from "../controller/prediction.controller";
import { UserController } from "../controller/user.controller";
import { RouteType } from "../types/route.type";

export const PredictionRoutes: RouteType[] = [
  {
    method: "post",
    route: "/prediction",
    controller: PredictionController,
    action: "prediction",
  },
];
