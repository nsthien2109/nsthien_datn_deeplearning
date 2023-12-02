import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { Breadcrumb, Button, Spin } from 'antd';
import { FileSearchOutlined, LoadingOutlined } from '@ant-design/icons';
import InputImage from '../components/InputImage';
import PreviewInputImage from '../components/PreviewInputImage';
import OutputList from '../components/OutputList';
import BestPrediction from '../components/BestPrediction';
import { useDispatch, useSelector } from 'react-redux';
import { RootState } from '../../../store/store';
import { predictionBirdAction } from '../prediction.actions';

const Prediction = () => {
  const [photoPreview, setPhotoPreview] = useState<string>();

  const { predictions, isLoading, isSuccess, isError } = useSelector((state: RootState) => state.prediction);

  const dispatch = useDispatch();

  const handlePrediction = (file: File) => {
    console.log(file);
    dispatch(predictionBirdAction(file) as any);
  };

  return (
    <>
      <div className="prediction">
        <div className="flex items-center justify-between mb-7">
          <Breadcrumb
            items={[
              {
                title: <Link to="/">Dashboard</Link>,
              },
              {
                title: 'Prediction',
              },
            ]}
          />
          <Button type="primary" className="bg-[#212B36]" icon={<FileSearchOutlined />} onClick={() => {}}>
            Predicted
          </Button>
        </div>
        <div className="flex gap-5 prediction-wrapper">
          <div className="prediction-input w-[500px]">
            <h3 className="mt-3 mb-1 font-medium">Image Input</h3>
            <InputImage
              photoPreview={photoPreview}
              setPhotoPreview={setPhotoPreview}
              handlePrediction={handlePrediction}
            />
            <h3 className="mt-3 mb-1 font-medium">Preview Image Input</h3>
            {photoPreview && <PreviewInputImage photoPreview={photoPreview} />}
          </div>
          {predictions.length > 0 && !isLoading && (
            <div className="flex-1 prediction-output">
              <h3 className="mt-3 mb-1 font-medium">Output Birds</h3>
              <OutputList predictions={predictions} />
              <h3 className="mt-3 mb-1 font-medium">Best Prediction</h3>
              <BestPrediction bird={predictions[0]} />
            </div>
          )}
          {isLoading && <Spin indicator={<LoadingOutlined style={{ fontSize: 24 }} spin />} />}
        </div>
      </div>
    </>
  );
};

export default Prediction;
