import { UserController } from "../controller/user.controller";
import { verifyAdmin } from "../shared/middlewares/auth.middleware";
import { RouteType } from "../types/route.type";

export const UserRoutes: RouteType[] = [
  {
    method: "get",
    route: "/users",
    controller: UserController,
    action: "getAll",
  },
  {
    method: "get",
    route: "/users/:id",
    controller: UserController,
    action: "findOne",
  },
];
