import { AuthState, UserInfo } from '../../models';
import { StorageKey } from '../../shared/constants';
import { getLocalStorage, setLocalStorage } from '../../shared/utils';
import { RootAction } from '../../store/store';
import { ACTION_TYPES } from '../../store/types';

const initState: AuthState = {
  userInfo: getLocalStorage(StorageKey.ACCOUNT, {} as UserInfo) || {},
  isLoading: false,
  isError: false,
  isSuccess: false,
  message: '',
};

export const authReducer = (state = initState, action: RootAction): AuthState => {
  switch (action.type) {
    case ACTION_TYPES.LOGIN: {
      return {
        ...state,
        isLoading: true,
        isError: false,
        isSuccess: false,
        message: '',
      };
    }
    case ACTION_TYPES.LOGIN_SUCCESS: {
      setLocalStorage(StorageKey.ACCOUNT, action.payload.userInfo);
      setLocalStorage(StorageKey.ACCESS_TOKEN, action.payload.accessToken);
      return {
        ...state,
        isLoading: false,
        isSuccess: true,
        userInfo: action.payload.userInfo,
      };
    }
    case ACTION_TYPES.LOGIN_FAILURE: {
      return {
        ...state,
        isLoading: false,
        isSuccess: false,
        isError: true,
        message: action.payload,
      };
    }
    default: {
      return state;
    }
  }
};
