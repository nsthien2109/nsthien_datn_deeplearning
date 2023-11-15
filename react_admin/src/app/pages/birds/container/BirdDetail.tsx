import { Card, Divider } from 'antd';
import BirdCarousel from '../components/BirdCarousel';
import { ApartmentOutlined, InfoCircleFilled } from '@ant-design/icons';

const BirdDetail = () => {
  return (
    <div className="bird-detail">
      <div className="bird-detail-wrapper">
        <div className="flex">
          <div className="bird-carousel flex-1">
            <BirdCarousel />
          </div>
          <div className="bird-summary flex-1 px-10">
            <h4 className="bird-name font-bold text-4xl">Chim vanh khuyen</h4>
            <p className="bird-order my-5 font-semibold text-base">
              {' '}
              <ApartmentOutlined className="text-green-500 text-xl mr-3" />
              Passeriformes - Bộ Sẻ
            </p>
            <p className="bird-status my-5 font-semibold text-base">
              <InfoCircleFilled className="text-blue-500 text-xl mr-3" />
              De doa
            </p>
            <Divider />
            <p className="bird-desc text-gray-500">
              Abbott's Babbler là một loài chim nhỏ thuộc họ Pellorneidae. Chim có kích thước trung bình từ 16 đến 18
              cm. Chim trưởng thành có lưng và đầu màu nâu xám, bụng và ngực màu trắng với vạch nâu sẫm. Chim non có màu
              sắc tương tự nhưng màu sắc của chúng mờ hơn. Loài này có tiếng kêu đặc trưng là tiếng kêu kết hợp giữa
              tiếng hót và tiếng tru trầm.
            </p>
          </div>
        </div>
        <Card className="mt-5">
          <div className="bird-information ">
            <h5 className="bird-info-title font-bold text-xl">Scientific Name</h5>
            <h5 className="bird-info-title font-bold text-xl">Bird Family</h5>
            <h5 className="bird-info-title font-bold text-xl">Distribution</h5>
            <h5 className="bird-info-title font-bold text-xl">Diet</h5>
            <h5 className="bird-info-title font-bold text-xl">Class name</h5>
          </div>
        </Card>
      </div>
    </div>
  );
};

export default BirdDetail;
