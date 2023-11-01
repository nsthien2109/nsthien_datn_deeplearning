import { AppDataSource } from "../data-source";
import { User } from "../entity/user";

export class UserService {
  constructor(private userRepository = AppDataSource.getRepository(User)) {}

  async findAll() {
    return await this.userRepository.find({
      relations: {
        role: true,
        histories: true,
      },
    });
  }

  async findById(id: number) {
    return await this.userRepository.findOne({ where: { id } });
  }

  async findByEmail(email: string) {
    return await this.userRepository.findOne({
      where: { email },
      relations: { role: true },
    });
  }

  async findByUsername(username: string) {
    return await this.userRepository.findOne({ where: { username } });
  }

  async findByEmailAndPassword(email: string, password: string) {
    return await this.userRepository.findOne({ where: { email, password } });
  }

  async save(data: User) {
    return await this.userRepository.save(data);
  }

  async update(id: number, updateData: User) {
    await this.userRepository.update(id, updateData);
    return await this.userRepository.findOne({
      where: { id },
    });
  }

  async remove(id: number) {
    return await this.userRepository.delete(id);
  }
}
