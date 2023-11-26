import React from 'react';
import {Image} from "antd";

const BestPrediction = () => {
  return (
    <div className="best-prediction">
      <div className="flex gap-10">

        <div className="pre-info flex-1">
          <ul className="pre-info-list border border-dotted p-4 rounded bg-gray-300">
            <li className="pre-info-item mb-4"><span className="font-semibold">Common Name : </span>Abbott's Babbler</li>
            <li className="pre-info-item mb-4"><span className="font-semibold">Vietnamese Name : </span>Chim Tòng quạ</li>
            <li className="pre-info-item mb-4"><span className="font-semibold">Scientific Name : </span>Zosterops maderaspatanus</li>
            <li className="pre-info-item mb-4"><span className="font-semibold">Bird Order : </span>Passeriformes - Bộ Sẻ</li>
            <li className="pre-info-item mb-4"><span className="font-semibold">Family : </span>Zosteropidae - Họ Vành khuyên</li>
            <li className="pre-info-item mb-4"><span className="font-semibold">Description : </span>Malagasy White-eye là một loài chim nhỏ, có kích thước trung bình đến nhỏ. Chúng có lông màu xanh lá cây trên lưng và màu trắng trên bụng, ngực và mặt dưới. Mắt của chim có vòng trắng xung quanh, tạo nên vẻ đặc trưng cho loài chim này.</li>
            <li className="pre-info-item mb-4"><span className="font-semibold">Distribution : </span>Loài chim này được tìm thấy ở các khu vực rừng ẩm ướt và cận nhiệt đới trên đảo Madagascar, nơi chúng sinh sống trong các khu rừng, cánh đồng và vùng cây bụi.</li>
            <li className="pre-info-item mb-4"><span className="font-semibold">Diet : </span>Malagasy White-eye chủ yếu ăn hoa, mật, trái cây và côn trùng nhỏ. Chúng thường di chuyển trong nhóm nhỏ để tìm kiếm nguồn thức ăn trên cây và bụi.</li>
            <li className="pre-info-item mb-4"><span className="font-semibold">Status : </span>Least Concern - Ít quan tâm</li>
          </ul>
        </div>

        <div className="pre-image w-[150px] h-[150px]">
          <Image
            className="object-cover rounded"
            width={150}
            height={150}
            src="https://images.kienthuc.net.vn/zoom/800/Uploaded/quocquan/2022_01_22/img_61e7d53e16140_TPTQ.jpg"
          />
        </div>
      </div>
    </div>
  );
};

export default BestPrediction;