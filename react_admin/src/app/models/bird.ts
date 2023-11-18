export interface Bird {
  id: number;
  common_name: string;
  vietnamese_name: string;
  scientific_name: string;
  bird_order: string;
  family: string;
  description: string;
  distribution: string;
  diet: string;
  conservation_status: string;
  class_name: string;
}

export interface BirdState {
  birds: Bird[];
  currentPage: number;
  isLoading: boolean;
  isError: boolean;
  isSuccess: boolean;
  message: string;
}
