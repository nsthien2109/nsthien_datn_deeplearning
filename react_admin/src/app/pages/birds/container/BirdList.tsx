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
          <Search className="w-96 p-4" placeholder="input search birds here" loading={false} />
        </div>
        <div className="grid grid-cols-3 gap-5">
          {Array.from({ length: 10 }).map((item) => {
            return <BirdItem />;
          })}
        </div>

        <div className="pagination-box text-center mt-5">
          <Pagination className="w-full items-center" defaultCurrent={1} total={50} />
        </div>
      </div>
    </div>
  );
};

export default BirdList;
