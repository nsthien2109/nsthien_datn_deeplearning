import React from 'react';
import { Button, Form, Input, Modal, Radio } from 'antd';

interface Values {
  title: string;
  description: string;
  modifier: string;
}

interface CollectionCreateFormProps {
  open: boolean;
  onCreate: (values: Values) => void;
  onCancel: () => void;
}

const UserCreateForm: React.FC<CollectionCreateFormProps> = ({ open, onCreate, onCancel }) => {
  const [form] = Form.useForm();

  return (
    <Modal
      open={open}
      title="Create a new user"
      onCancel={onCancel}
      footer={[
        <Button
          type="primary"
          className="bg-black"
          onClick={() => {
            form
              .validateFields()
              .then((values) => {
                form.resetFields();
                onCreate(values);
              })
              .catch((info) => {
                console.log('Validate Failed:', info);
              });
          }}
        >
          Create{' '}
        </Button>,
        <Button type="primary" className="bg-red-500" onClick={onCancel}>
          Cancel
        </Button>,
      ]}
    >
      <Form form={form} className="mt-5" layout="vertical" name="form_in_modal" initialValues={{ modifier: 'public' }}>
        <Form.Item
          name="username"
          label="Username"
          rules={[{ required: true, message: 'Please input the username !' }]}
        >
          <Input placeholder="Username" />
        </Form.Item>

        <Form.Item name="email" label="Email" rules={[{ required: true, message: 'Please input the email !' }]}>
          <Input type="email" placeholder="Email" />
        </Form.Item>

        <Form.Item
          name="password"
          label="Password"
          rules={[{ required: true, message: 'Please input the password !' }]}
        >
          <Input placeholder="Password" type="password" />
        </Form.Item>

        <Form.Item name="modifier" label="Role" className="collection-create-form_last-form-item">
          <Radio.Group>
            <Radio value="public">Admin</Radio>
            <Radio value="private">User</Radio>
          </Radio.Group>
        </Form.Item>
      </Form>
    </Modal>
  );
};

export default UserCreateForm;
