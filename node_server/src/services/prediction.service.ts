import { AppDataSource } from "../data-source";

import { Bird, History, Prediction } from "../entity";
import { PredictionResult } from "../types/prediction.type";

import * as fs from "fs";
import * as csv from "csv-parser";

import axios from "axios";
import * as cloudinary from "cloudinary";

cloudinary.v2.config({
  cloud_name: "dmzvudfg5",
  api_key: "614921592645376",
  api_secret: "L98LhofuulpSFiErE_pB0G8in_g",
  secure: true,
});

export class PredictionService {
  constructor(
    private birdRepository = AppDataSource.getRepository(Bird),
    private historyRepository = AppDataSource.getRepository(History),
    private predictionRepository = AppDataSource.getRepository(Prediction)
  ) {}

  async fillData() {
    const csvFilePath = "http://localhost:3000/csv/birdss.csv";
    fs.createReadStream(csvFilePath)
      .pipe(csv())
      .on("data", async (row) => {
        const bird = new Bird();
        bird.id = row.id;
        bird.common_name = row.common_name;
        bird.vietnamese_name = row.vietnamese_name;
        bird.scientific_name = row.scientific_name;
        bird.bird_order = row.bird_order;
        bird.family = row.family;
        bird.description = row.description;
        bird.distribution = row.distribution;
        bird.diet = row.diet;
        bird.conservation_status = row.conservation_status;
        await this.birdRepository.save(bird);
      })
      .on("end", () => {
        console.log("CSV data import complete.");
      });
  }

  async prediction(url: string) {
    return await axios
      .post(process.env.FLASK_API_PREDICTION, {
        url,
      })
      .then(async (result) => {
        const predict = { ...result.data };

        if (predict.predicted_id) {
          const bird = await this.birdRepository.findOne({
            where: { id: predict.predicted_id },
          });
          const birdUrls = await cloudinary.v2.api.resources({
            type: "upload",
            prefix: `birds_upload/${predict.class_name}`, // add your folder
          });

          const imageUrl = { ...birdUrls.resources.map((item) => item.url) };

          predict.bird = { ...bird, images: { ...imageUrl } };
        } else {
          throw "Image not valid";
        }

        return { ...predict };
      })
      .catch((err) => {
        return err;
      });
  }
}
