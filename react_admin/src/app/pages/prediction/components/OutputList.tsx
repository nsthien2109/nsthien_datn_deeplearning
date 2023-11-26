import { Card } from 'antd';
import React from 'react';
import OutputItem from "./OutputItem";
const { Meta } = Card;

const OutputList = () => {
  return (
    <div className="output-list grid grid-cols-5 gap-3">
      <OutputItem/>
      <OutputItem/>
      <OutputItem/>
      <OutputItem/>
      <OutputItem/>
    </div>
  );
};

export default OutputList;