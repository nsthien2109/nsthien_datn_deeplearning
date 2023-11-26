import React from 'react';

const PreviewInputImage = () => {
    return (
      <div className="w-full h-[400px] rounded border-2 border-dotted p-4">
        <div className="border rounded border-gray-700 w-full h-full">
          <img className="object-cover w-full h-full rounded" src="https://sohanews.sohacdn.com/thumb_w/660/2018/2/15/free-download-house-sparrow-hd-wallpapers-15186894077141975585804.jpg" alt="Image preview of input" />
        </div>
      </div>
    );
};

export default PreviewInputImage;