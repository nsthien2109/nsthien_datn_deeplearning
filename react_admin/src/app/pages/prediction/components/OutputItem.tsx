import React from 'react';

const OutputItem = () => {
  return (
    <div className="flex flex-column border border-solid p-1 rounded hover:shadow cursor-pointer">
      <div className="output-item-img h-[100px] w-full mb-4">
        <img className="w-full h-full object-cover" src="https://rungasia.com/wp-content/uploads/2022/03/chim-se-cap-doi.jpg" alt="Image of output item"/>
      </div>
      <div className="output-item-content p-1">
        <h4 className="font-semibold text-sm truncate uppercase">Chim ser</h4>
        <p className="font-light text-md truncate text-gray-400">Ten tieng viet</p>
      </div>
    </div>
  );
};

export default OutputItem;