import React, { useState } from 'react';
import { Breadcrumb, Button, Space, Table, Tag } from 'antd';
import type { ColumnsType } from 'antd/es/table';
import { Link } from 'react-router-dom';

import { PlusOutlined } from '@ant-design/icons';
import UserCreateForm from '../components/UserCreateForm';

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
        {record.isActive === 1 ? 'Active' : 'Blocked'}
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

const data: DataType[] = [
  {
    key: '1',
    username: 'John Brown',
    email: '32',
    isActive: 1,
    role: 2,
  },
  {
    key: '3',
    username: 'John Brown',
    email: '32',
    isActive: 1,
    role: 1,
  },
  {
    key: '2',
    username: 'John Brown',
    email: '32',
    isActive: 1,
    role: 1,
  },
];

const UserList: React.FC = () => {
  const [openCreateModal, setOpenCreateModal] = useState(false);

  const onCreate = (values: any) => {
    console.log('Received values of form: ', values);
    onCreate(false);
  };

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
      <Table columns={columns} dataSource={data} />
    </>
  );
};

export default UserList;
