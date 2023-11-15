import { Card, Divider } from 'antd';
import BirdCarousel from '../components/BirdCarousel';
import { ApartmentOutlined, InfoCircleFilled } from '@ant-design/icons';

const BirdDetail = () => {
  return (
    <div className="bird-detail">
      <div className="bird-detail-wrapper">
        <div className="flex">
          <div className="flex-1 bird-carousel">
            <BirdCarousel />
          </div>
          <div className="flex-1 px-10 bird-summary">
            <h4 className="text-4xl font-bold bird-name">Chim vanh khuyen</h4>
            <p className="my-5 text-base font-semibold bird-order">
              {' '}
              <ApartmentOutlined className="mr-3 text-xl text-green-500" />
              Passeriformes - Bộ Sẻ
            </p>
            <p className="my-5 text-base font-semibold bird-status">
              <InfoCircleFilled className="mr-3 text-xl text-blue-500" />
              De doa
            </p>
            <Divider />
            <p className="text-gray-500 bird-desc">
              Abbott's Babbler là một loài chim nhỏ thuộc họ Pellorneidae. Chim có kích thước trung bình từ 16 đến 18
              cm. Chim trưởng thành có lưng và đầu màu nâu xám, bụng và ngực màu trắng với vạch nâu sẫm. Chim non có màu
              sắc tương tự nhưng màu sắc của chúng mờ hơn. Loài này có tiếng kêu đặc trưng là tiếng kêu kết hợp giữa
              tiếng hót và tiếng tru trầm.
            </p>
          </div>
        </div>
        <Card className="mt-5">
          <div className="bird-information ">
            <ul className="bird-info-list">
              <li className="my-3 bird-info-item">
                <h5 className="text-xl font-bold bird-info-title">Scientific Name</h5>
                <p className="bird-info-subtitle">Malacocincla abbotti</p>
              </li>
              <li className="my-3 bird-info-item">
                <h5 className="text-xl font-bold bird-info-title">Bird Family</h5>
                <p className="bird-info-subtitle">Pellorneidae - Họ Chuối tiêu</p>
              </li>
              <li className="my-3 bird-info-item">
                <h5 className="text-xl font-bold bird-info-title">Distribution</h5>
                <p className="bird-info-subtitle">
                  Abbott's Babbler sinh sống trong rừng nhiệt đới và rừng thưa ở miền nam Lào và miền bắc Thái Lan.
                  Chúng sống ẩn náu trong bụi cây và thường đi cặp hoặc nhóm nhỏ.{' '}
                </p>
              </li>
              <li className="my-3 bird-info-item">
                <h5 className="text-xl font-bold bird-info-title">Diet</h5>
                <p className="bird-info-subtitle">Abbott's Babbler thức ăn chủ yếu là côn trùng và sâu bọ.</p>
              </li>
              <li className="my-3 bird-info-item">
                <h5 className="text-xl font-bold bird-info-title">Class name</h5>
                <p className="bird-info-subtitle">ABBOTTS BABBLER</p>
              </li>
            </ul>
          </div>
        </Card>
      </div>
    </div>
  );
};

export default BirdDetail;
