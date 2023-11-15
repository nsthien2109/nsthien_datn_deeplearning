import React from 'react';
import { Carousel, Image } from 'antd';

const BirdCarousel: React.FC = () => {
  return (
    <>
      <Carousel dotPosition={'right'} autoplay className="rounded-md h-[400px]">
        {Array.from({ length: 5 }).map((item, index) => {
          return (
            <div className="carousel-images h-[400px] rounded-md" key={index}>
              <Image
                alt="Bird image"
                className="object-cover rounded-md"
                src="https://ontariospca.ca/wp-content/uploads/2019/03/Living-with-wildlife-birds.jpg"
              />
            </div>
          );
        })}
      </Carousel>
    </>
  );
};

export default BirdCarousel;
