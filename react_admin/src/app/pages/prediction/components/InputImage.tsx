import React, {useRef} from 'react';
import {CloudUploadOutlined} from "@ant-design/icons";

type InputImageProps = {
  photoPreview: string | undefined;
  setPhotoPreview: (value: string) => void;
  setFile?: (file: any) => void;
}
const InputImage = ({photoPreview,setPhotoPreview } :InputImageProps) => {

    const coverImageRef = useRef<HTMLInputElement>(null);
    const clickSelectCover = () => {
        coverImageRef.current?.click();
    };

  const handleUploadCover = (e: React.ChangeEvent<HTMLInputElement>) => {
      const file = e.target.files![0];
      if (file) {
        const previewUrl = URL.createObjectURL(file);
        setPhotoPreview(previewUrl);
      } else {
        setPhotoPreview('');
      }
  };



  return (
        <div className="image-input w-full h-32 rounded border-2 border-dotted flex item-center justify-center flex-column cursor-pointer mb-2" onClick={clickSelectCover} >
            <CloudUploadOutlined/>
            <p className="mt-3 font-medium">Upload image</p>
            <input type="file" ref={coverImageRef} onChange={handleUploadCover} hidden/>
        </div>
    );
};

export default InputImage;