import { Route, RouterProvider, createBrowserRouter, createRoutesFromElements } from 'react-router-dom';
import { authRoutes } from './pages/auth/auth.router';
import { RouteType } from './types/router.type';

function App() {
  const router = createBrowserRouter(
    createRoutesFromElements(
      <>
        {authRoutes.map((route: RouteType, index: number) => (
          <Route key={index} path={route.path} element={<route.component />} />
        ))}
      </>
    )
  );
  return (
    <>
      <RouterProvider router={router} />
    </>
  );
}

export default App;
