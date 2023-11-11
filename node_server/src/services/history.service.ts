import { AppDataSource } from "../data-source";
import { History, User } from "../entity";

export class HistoryService {
  constructor(
    private historyRepository = AppDataSource.getRepository(History)
  ) {}

  async findAll() {
    return await this.historyRepository.find({
      relations: {
        predictions: true,
        user: true,
      },
    });
  }

  async count() {
    return await this.historyRepository.count({});
  }

  async create(data: History) {
    return await this.historyRepository.save(data);
  }

  async findByUser(user: User) {
    return this.historyRepository.findBy({ user: user });
  }

  async remove(id: number) {
    return await this.historyRepository.delete(id);
  }
}
