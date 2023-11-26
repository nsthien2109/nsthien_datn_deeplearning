import { RouteType } from "../types/route.type";
import {StatsController} from "../controller/stats.controller";

export const StatsRoutes: RouteType[] = [
    {
        method: "get",
        route: "/stats",
        controller: StatsController,
        action: "getStats",
    },
];
