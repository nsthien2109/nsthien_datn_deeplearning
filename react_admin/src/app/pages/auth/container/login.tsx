import { Button, Divider, Input, Space } from 'antd';

const Login = () => {
  return (
    <div className="login">
      <div className="login-wrapper max-h-[100vh] max-w-[500px] rounded-[16px] m-auto bg-white p-10 flex flex-column gap-3">
        <h3>Sign in to Njha</h3>
        <Input className="p-3" placeholder="Email or username" />
        <Input className="p-3" placeholder="Password" />
        <Button className="bg-black w-full" type="primary">
          Login
        </Button>
      </div>
    </div>
  );
};

export default Login;
