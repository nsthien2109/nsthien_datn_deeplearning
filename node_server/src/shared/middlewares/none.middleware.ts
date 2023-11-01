import { NextFunction, Request, Response } from 'express';

export const noneMiddleware = async (req: Request, res: Response, next: NextFunction) => {
	try {
		next();
	} catch (error) {
		const message = Object.values(error[0].constraints)[0];
		res.status(400).send({ message });
	}
};
