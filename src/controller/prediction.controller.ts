import { PredictionService } from '../services/prediction.service';
import { Request, Response } from 'express';

export class PredictionController {
	private predictionService = new PredictionService();

	async fillData(request: Request, response: Response) {
		try {
			const result = await this.predictionService.fillData();
			return response.send('Completed');
		} catch (error) {
			return response.status(500).json({ error: error });
		}
	}

	async prediction(request: Request, response: Response) {}
}
