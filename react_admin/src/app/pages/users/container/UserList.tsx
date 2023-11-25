import React, { useEffect, useState } from 'react';
import { Breadcrumb, Button, Space, Table, Tag } from 'antd';
import type { ColumnsType } from 'antd/es/table';
import { Link } from 'react-router-dom';

import { PlusOutlined } from '@ant-design/icons';
import UserCreateForm from '../components/UserCreateForm';
import { useDispatch, useSelector } from 'react-redux';
import { getAllUsersAction } from '../user.actions';
import { RootState } from '../../../store/store';

interface DataType {
  key: string;
  username: string;
  email: string;
  isActive: number;
  role: number;
}

const columns: ColumnsType<DataType> = [
  {
    title: 'Username',
    dataIndex: 'username',
    key: 'username',
    render: (text) => <Link to="/">{text}</Link>,
  },
  {
    title: 'Email',
    dataIndex: 'email',
    key: 'email',
  },
  {
    title: 'Active',
    dataIndex: 'isActive',
    key: 'isActive',
    render: (_, record) => (
      <Tag color={record.isActive === 1 ? 'green' : 'orange-inverse'} key={record.key}>
        {record.isActive ? 'Active' : 'Blocked'}
      </Tag>
    ),
  },
  {
    title: 'Role',
    key: 'role',
    dataIndex: 'role',
    render: (_, record) => (
      <Tag color={record.role === 1 ? 'warning' : 'green'} key={record.key}>
        {record.role === 1 ? 'Admin' : 'User'}
      </Tag>
    ),
  },
  {
    title: 'Action',
    key: 'action',
    render: (_, record) => (
      <Space size="middle">
        <Button className="bg-blue-300">Edit</Button>
        <Button className="bg-red-500">Delete</Button>
      </Space>
    ),
  },
];

const UserList: React.FC = () => {
  const [openCreateModal, setOpenCreateModal] = useState(false);

  const dispatch = useDispatch();

  const users = useSelector((state: RootState) => state.users.users);

  const onCreate = (values: any) => {
    console.log('Received values of form: ', values);
    onCreate(false);
  };

  useEffect(() => {
    dispatch(getAllUsersAction() as any);
  }, []);

  const userData: DataType[] = users.map((item) => {
    return {
      key: `${item.id}`,
      username: item.username,
      email: item.email,
      isActive: parseInt(item.isActive),
      role: item.role.id,
    };
  });

  return (
    <>
      <div className="flex items-center justify-between mb-7">
        <Breadcrumb
          items={[
            {
              title: <Link to="/">Dashboard</Link>,
            },
            {
              title: 'Users',
            },
          ]}
        />
        <Button
          type="primary"
          className="bg-[#212B36]"
          icon={<PlusOutlined />}
          onClick={() => setOpenCreateModal(true)}
        >
          New User
        </Button>
        <UserCreateForm
          open={openCreateModal}
          onCreate={onCreate}
          onCancel={() => {
            setOpenCreateModal(false);
          }}
        />
      </div>
      <Table columns={columns} dataSource={userData} />
    </>
  );
};

export default UserList;
