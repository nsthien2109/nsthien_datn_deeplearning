import React, { ReactNode, useEffect, useState } from 'react';
import {
  HistoryOutlined,
  UserOutlined,
  YuqueOutlined,
  DashboardOutlined,
  CaretRightOutlined,
  CaretLeftOutlined,
} from '@ant-design/icons';
import { Layout, Menu, Button, theme, Divider } from 'antd';

import logo from '../../assets/svgs/logo.svg';
import userAccount from '../../assets/svgs/user-account.svg';
import { Link, Outlet, useLocation } from 'react-router-dom';

const { Header, Sider, Content } = Layout;

const LayoutApp = () => {
  const [collapsed, setCollapsed] = useState(false);
  const [openDropdown, setOpenDropdown] = useState(false);

  let location = useLocation();

  const [current, setCurrent] = useState(location.pathname);

  useEffect(() => {
    setCurrent(location.pathname);
  }, [location]);

  function handleClick(e: any) {
    setCurrent(e.key);
  }
  const {
    token: { colorBgContainer },
  } = theme.useToken();

  return (
    <Layout className="layout min-h-screen">
      <Sider trigger={null} collapsible collapsed={collapsed} theme="light" width={279} className="px-4">
        <img src={logo} alt="Njha detection" className="w-[90px]" />
        {!collapsed && <h4 className="label mt-5 mb-1 uppercase">Overview</h4>}
        <Menu
          theme="light"
          mode="inline"
          onClick={handleClick}
          defaultSelectedKeys={[current]}
          className="py-2"
          items={[
            {
              key: '/',
              icon: <DashboardOutlined />,
              label: <Link to={'/'}>Dashboard</Link>,
            },
            {
              key: '/user',
              icon: <UserOutlined />,
              label: <Link to={'/user'}>Users</Link>,
            },
            {
              key: '/birds',
              icon: <YuqueOutlined />,
              label: <Link to={'/birds'}>Birds</Link>,
            },
            {
              key: '/history',
              icon: <HistoryOutlined />,
              label: <Link to={'/history'}>History</Link>,
            },
          ]}
        />
      </Sider>
      <Layout>
        <Header style={{ padding: 0, background: colorBgContainer }}>
          <div className="flex justify-between">
            <Button
              type="text"
              icon={collapsed ? <CaretRightOutlined /> : <CaretLeftOutlined />}
              onClick={() => setCollapsed(!collapsed)}
              style={{
                fontSize: '16px',
                width: 64,
                height: 64,
              }}
            />
            <Button
              className="rounded-full border border-[#00a76f]"
              type="text"
              onClick={() => setOpenDropdown(!openDropdown)}
              style={{
                fontSize: '16px',
                width: 64,
                height: 64,
              }}
            >
              <div className="settings relative">
                <img src={userAccount} alt="Nguyen Si Thien" />
                <div
                  className={`settings-dropdown ${
                    !openDropdown && 'hidden'
                  } absolute bg-white top-[110%] right-2 w-[200px] p-5 rounded-md`}
                >
                  <ul className="setting-list text-start">
                    <li className="setting-item">
                      <div className="infomation">
                        <h5 className="username font-bold text-sm">Nguyen Si Thien</h5>
                        <p className="email text-xs">nsthien@gmail.com</p>
                      </div>
                    </li>
                    <Divider className="my-2" />
                    <li className="setting-item text-red-500 font-bold">Logout</li>
                  </ul>
                </div>
              </div>
            </Button>
          </div>
        </Header>
        <Content
          style={{
            margin: '24px 16px',
            padding: 24,
            minHeight: 280,
            background: colorBgContainer,
          }}
        >
          <Outlet />
        </Content>
      </Layout>
    </Layout>
  );
};

export default LayoutApp;
