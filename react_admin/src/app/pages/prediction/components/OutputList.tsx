import React from 'react';
import OutputItem from './OutputItem';

import { Prediction } from '../../../models/prediction';

type OutputListProps = {
  predictions: Prediction[];
};

const OutputList = ({ predictions }: OutputListProps) => {
  return (
    <div className="grid grid-cols-5 gap-3 output-list">
      {predictions.map((item, index) => (
        <OutputItem key={index} bird={item} />
      ))}
    </div>
  );
};

export default OutputList;
