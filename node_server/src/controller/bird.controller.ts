import { Request, Response } from 'express';
import { BirdService } from '../services/bird.service';

export class BirdController {
	private birdService = new BirdService();
	async getAll(request: Request, response: Response) {
		const page = Number(request.query.page) || 1;
		const pageSize = Number(request.query.pageSize) || 10;
		try {
			const [results, total] = await this.birdService.findAll(page, pageSize);
			const totalPages = Math.ceil(total / pageSize);
			return response.status(200).json({
				results,
				total,
				page,
				pageSize,
				totalPages
			});
		} catch (error) {
			return response.status(500).json({ error: error });
		}
	}
}
