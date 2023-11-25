interface Role {
  id: number;
  name: string;
}

export interface User {
  id: number;
  username: string;
  email: string;
  isActive: string;
  createdAt: string;
  role: Role;
  histories: [];
}

export interface UserState {
  users: User[];
  userDetail: User;
  isLoading: boolean;
  isError: boolean;
  isSuccess: boolean;
  message: string;
}
