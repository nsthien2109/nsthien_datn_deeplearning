import React from 'react';
import { Breadcrumb, Button, Space, Table, Tag } from 'antd';
import type { ColumnsType } from 'antd/es/table';
import { Link } from 'react-router-dom';

import { PlusOutlined } from '@ant-design/icons';

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
    render: (text) => <a>{text}</a>,
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
  },
  {
    title: 'Role',
    key: 'role',
    dataIndex: 'role',
  },
  {
    title: 'Action',
    key: 'action',
    render: (_, record) => (
      <Space size="middle">
        <a>Edit {record.key}</a>
        <a>Delete</a>
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
    role: 1,
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

const UserList: React.FC = () => (
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
      <Button type="primary" className="bg-[#212B36]" icon={<PlusOutlined />}>
        New User
      </Button>
    </div>
    <Table columns={columns} dataSource={data} />
  </>
);

export default UserList;
