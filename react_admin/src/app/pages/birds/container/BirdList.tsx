import { Breadcrumb, Input, Pagination } from 'antd';
import BirdItem from '../components/BirdItem';
import { Link } from 'react-router-dom';

const { Search } = Input;

const BirdList = () => {
  return (
    <div className="bird">
      <div className="bird-wrapper">
        <div className="flex items-center justify-between mb-7">
          <Breadcrumb
            items={[
              {
                title: <Link to="/">Dashboard</Link>,
              },
              {
                title: 'Birds',
              },
            ]}
          />
          <Search className="p-4 w-96" placeholder="input search birds here" loading={false} />
        </div>
        <div className="grid grid-cols-3 gap-5">
          {Array.from({ length: 10 }).map((item, index) => {
            return <BirdItem key={index} />;
          })}
        </div>

        <div className="mt-5 text-center pagination-box">
          <Pagination className="items-center w-full" defaultCurrent={1} total={50} />
        </div>
      </div>
    </div>
  );
};

export default BirdList;
