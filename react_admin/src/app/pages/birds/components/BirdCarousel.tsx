import React from 'react';
import { Carousel } from 'antd';

const BirdCarousel: React.FC = () => {
  return (
    <>
      <Carousel dotPosition={'right'} className="rounded-md h-[300px]">
        <div className="carousel-images h-[300px] rounded-md">
          <img
            src="https://ontariospca.ca/wp-content/uploads/2019/03/Living-with-wildlife-birds.jpg"
            alt="Bird image"
            className="object-cover rounded-md"
          />
        </div>
        <div className="carousel-images  h-[300px] rounded-md">
          <img
            src="https://ontariospca.ca/wp-content/uploads/2019/03/Living-with-wildlife-birds.jpg"
            alt="Bird image"
            className="object-cover rounded-md"
          />
        </div>
        <div className="carousel-images h-[300px] rounded-md">
          <img
            src="https://ontariospca.ca/wp-content/uploads/2019/03/Living-with-wildlife-birds.jpg"
            alt="Bird image"
            className="object-cover rounded-md"
          />
        </div>
        <div className="carousel-images h-[300px] rounded-md">
          <img
            src="https://ontariospca.ca/wp-content/uploads/2019/03/Living-with-wildlife-birds.jpg"
            alt="Bird image"
            className="object-cover rounded-md"
          />
        </div>
      </Carousel>
    </>
  );
};

export default BirdCarousel;
