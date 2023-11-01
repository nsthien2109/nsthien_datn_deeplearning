import { AppDataSource } from '../data-source';
import { Bird } from '../entity';

import * as fs from 'fs';
import * as csv from 'csv-parser';

export class PredictionService {
	constructor(private birdRepository = AppDataSource.getRepository(Bird)) {}

	async fillData() {
		const csvFilePath = 'http://localhost:3000/csv/birdss.csv';
		fs.createReadStream(csvFilePath)
			.pipe(csv())
			.on('data', async (row) => {
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
			.on('end', () => {
				console.log('CSV data import complete.');
			});
	}
}
