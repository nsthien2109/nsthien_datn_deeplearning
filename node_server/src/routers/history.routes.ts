import { HistoryController } from "../controller/history.controller";
import {
  verifyAdmin,
  verifyToken,
} from "../shared/middlewares/auth.middleware";
import { RouteType } from "../types/route.type";

export const HistoryRoute: RouteType[] = [
  {
    method: "get",
    route: "/histories",
    controller: HistoryController,
    action: "getAll",
    middleware: [verifyAdmin],
  },
  {
    method: "get",
    route: "/user-histories",
    controller: HistoryController,
    action: "findByUser",
    middleware: [verifyToken],
  },
  {
    method: "delete",
    route: "/history",
    controller: HistoryController,
    action: "remove",
    middleware: [verifyToken],
  },
];
