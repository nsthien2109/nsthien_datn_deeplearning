import { User, UserState } from '../../models/user';
import { RootAction } from '../../store/store';
import { ACTION_TYPES } from '../../store/types';

const initState: UserState = {
  users: [] as User[],
  userDetail: {} as User,
  isLoading: false,
  isError: false,
  isSuccess: false,
  message: '',
};

export const userReducer = (state = initState, action: RootAction): UserState => {
  switch (action.type) {
    case ACTION_TYPES.GET_ALL_USERS:
      return {
        ...state,
        isLoading: true,
        isSuccess: false,
        isError: false,
      };

    case ACTION_TYPES.GET_ALL_USERS_SUCCESS:
      return {
        ...state,
        isLoading: false,
        isSuccess: true,
        users: action.payload,
      };

    case ACTION_TYPES.GET_ALL_USERS_FAILURE:
      return {
        ...state,
        isLoading: false,
        isSuccess: false,
        isError: true,
        message: action.payload,
      };

    default:
      return state;
  }
};
