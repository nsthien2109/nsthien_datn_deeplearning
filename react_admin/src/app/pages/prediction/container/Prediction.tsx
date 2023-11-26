import React from 'react';
import {Link} from "react-router-dom";
import {Breadcrumb, Button} from "antd";
import {FileSearchOutlined} from "@ant-design/icons";
import InputImage from "../components/InputImage";
import PreviewInputImage from "../components/PreviewInputImage";
import OutputList from "../components/OutputList";
import BestPrediction from "../components/BestPrediction";

const Prediction = () => {
    return  <>
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
                <Button
                    type="primary"
                    className="bg-[#212B36]"
                    icon={ <FileSearchOutlined />}
                    onClick={()=>{}}
                >
                    Predicted
                </Button>


            </div>
            <div className="prediction-wrapper flex gap-5">
                <div className="prediction-input w-[500px]">
                    <h3 className="mt-3 mb-1 font-medium">Image Input</h3>
                    <InputImage/>
                    <h3 className="mt-3 mb-1 font-medium">Preview Image Input</h3>
                    <PreviewInputImage/>
                </div>
                <div className="prediction-output flex-1">
                    <h3 className="mt-3 mb-1 font-medium">Output Birds</h3>
                    <OutputList/>
                    <h3 className="mt-3 mb-1 font-medium">Best Prediction</h3>
                    <BestPrediction/>
                </div>
            </div>
           <div className="flex justify-end item-center mt-5">
               <Button>Save to history</Button>
           </div>
        </div>
    </>
}

export default Prediction;