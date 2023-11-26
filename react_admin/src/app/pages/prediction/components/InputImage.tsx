import React, {useRef} from 'react';
import {CloudUploadOutlined} from "@ant-design/icons";

const InputImage = () => {

    const coverImageRef = useRef<HTMLInputElement>(null);
    const clickSelectCover = () => {
        coverImageRef.current?.click();
    };


    return (
        <div className="image-input w-full h-32 rounded border-2 border-dotted flex item-center justify-center flex-column cursor-pointer mb-2" onClick={clickSelectCover} >
            <CloudUploadOutlined/>
            <p className="mt-3 font-medium">Upload image</p>
            <input type="file" ref={coverImageRef} hidden/>
        </div>
    );
};

export default InputImage;