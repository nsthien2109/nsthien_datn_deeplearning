import React from 'react';
import { Card } from 'antd';

const { Meta } = Card;

const BirdItem: React.FC = () => (
  <Card
    hoverable
    style={{ width: '100%' }}
    cover={<img alt="example" src="https://i.pinimg.com/736x/69/e2/e9/69e2e9cd082c665dd0dff0fd98f79503.jpg" />}
  >
    <Meta title="Europe Street beat" description="www.instagram.com" />
  </Card>
);

export default BirdItem;
