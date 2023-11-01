import "reflect-metadata";
import { DataSource } from "typeorm";
import { User } from "./entity/user";
import { Role } from "./entity/role";
import { Bird, History, Prediction } from "./entity";

export const AppDataSource = new DataSource({
  type: "mysql",
  host: "localhost",
  port: 3306,
  username: "root",
  password: "Bame12345@",
  database: "njha-api",
  synchronize: true,
  logging: false,
  entities: [User, Role, History, Prediction, Bird],
  migrations: [],
  subscribers: [],
});
