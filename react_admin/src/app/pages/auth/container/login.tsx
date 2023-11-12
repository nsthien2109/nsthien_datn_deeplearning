import react, { useState } from 'react';
import { Button, Divider, Input, Space } from 'antd';
import { FacebookOutlined, GoogleOutlined } from '@ant-design/icons';

import type { SizeType } from 'antd/es/config-provider/SizeContext';

import { Link } from 'react-router-dom';
import banner from '../../../../assets/images/login-bg.jpg';

const Login = () => {
  const [size] = useState<SizeType>('large'); // default is 'middle'

  return (
    <div className="login">
      <div className="container">
        <div className="flex py-6 flex-column login-wrapper gap-7">
          <div className="login-banner">
            <div className="banner-image h-[180px]">
              <img src={banner} alt="Banner of login" className="object-cover h-full" />
            </div>
          </div>
          <div className="login-form">
            <form action="">
              <h3 className="mb-4 text-2xl font-bold login-title bold">Welcome back 🖐️</h3>
              <p className="text-[12px] login-subtitle font-medium mb-6">
                Today is a new day. It's your day. You shape it. Sign in to start managing your projects.
              </p>
              <div className="mb-4 form-input">
                <label htmlFor="email-username">Email or username</label>
                <Input id="email-username" placeholder="Example@gmail.com" />
              </div>
              <div className="mb-4 form-input">
                <label htmlFor="password">Password</label>
                <Input id="password" placeholder="Enter yoour password" />
              </div>
              <Link to="/">Forgot password ?</Link>
              <Button className="w-full mt-4 mb-6 text-white bg-black" size={size}>
                Sign In
              </Button>
            </form>
            <p className="p-3 text-center">Or sign in with</p>
            <div className="flex gap-4">
              <Button className="flex-1 bg-[#F3F9FA]" size={size} icon={<FacebookOutlined />}>
                Facebook
              </Button>
              <Button className="flex-1  bg-[#F3F9FA]" size={size} icon={<GoogleOutlined />}>
                Google
              </Button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Login;
