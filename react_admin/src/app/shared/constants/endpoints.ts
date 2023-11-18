const BASE_URL = process.env.REACT_APP_BASE_API;

const RESOURCES = {
  users: 'users',
  auth: 'auth',
  birds: 'birds',
};

export const ENDPOINT = {
  auth: {
    login: `${BASE_URL}/${RESOURCES.auth}/login`,
    logout: `${BASE_URL}/${RESOURCES.auth}/logout`,
  },
  birds: {
    index: `${BASE_URL}/${RESOURCES.birds}`,
  },
};
