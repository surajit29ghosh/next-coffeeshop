import axios from "axios";

export class ProductService {

    public async getAllProducts(): Promise<any> {
        const response = await axios.get(process.env.REACT_APP_SERVER_URL + '/api/getall');
        return response.data;
    }
}