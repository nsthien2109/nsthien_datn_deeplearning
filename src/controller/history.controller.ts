import { Request, Response } from "express";
import { HistoryService } from "../services/history.service";
import { UserService } from "../services/user.service";
import { User } from "../entity";

export class HistoryController {
  private historyService = new HistoryService();
  private userService = new UserService();

  async getAll(request: Request, response: Response) {
    try {
      const result = await this.historyService.findAll();
      return response.status(200).json(result);
    } catch (error) {
      return response.status(500).json({ error: error });
    }
  }

  async findByUser(request: Request, response: Response) {
    const auth = request["user"];
    const user = await this.userService.findById(auth.id);
    if (user) {
      const histories = await this.historyService.findByUser(user);
      return response.status(200).json(histories);
    }

    return response.status(500).json({ error: "You're not permission !" });
  }

  async remove(request: Request, response: Response) {
    const id: number = parseInt(request.params.id);
    try {
      await this.historyService.remove(id);
      return response.status(200).json({ message: "Delete successfully !" });
    } catch (error) {
      return response.status(500).json({ error: error });
    }
  }
}
