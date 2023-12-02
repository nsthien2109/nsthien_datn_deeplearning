import React from 'react';
import { Prediction } from '../../../models/prediction';

type OutputItemProps = {
  bird: Prediction;
};
const OutputItem = ({ bird }: OutputItemProps) => {
  return (
    <div className="flex p-1 border border-solid rounded cursor-pointer flex-column hover:shadow">
      <div className="output-item-img h-[100px] w-full mb-4">
        <img aria-hidden className="object-cover w-full h-full" src={bird.images[0]} alt="Image of output item" />
        <p>{bird.confidence} %</p>
      </div>
      <div className="p-1 output-item-content">
        <h4 className="text-sm font-semibold uppercase truncate">{bird.common_name}</h4>
        <p className="font-light text-gray-400 truncate text-md">{bird.vietnamese_name}</p>
      </div>
    </div>
  );
};

export default OutputItem;
