public class ProductRepository: IProductRepository
{

    private ProductContext context;
    public ProductRepository(ProductContext c)
    {
        this.context = c;
    }

    public List<Product> GetProducts(string name = "")
    {

        List<Product> products;

        if (String.IsNullOrWhiteSpace(name))
        {
            products = context.Products.ToList();
        }
        else
        {
            products = (from p in context.Products
                        where p.Name.Contains(name)
                        select p).ToList<Product>();

        }

        return products;
    }
}

public interface IProductRepository {

    List<Product> GetProducts(String name="");
}