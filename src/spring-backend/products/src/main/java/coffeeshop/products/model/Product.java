package coffeeshop.products.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(schema = "product", name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "price")
    private float price;

    @Column(name = "image")
    private String image;

    public Product() {

    }

    public Product(
            String name,
            float price,
            String image) 
    {
        this.name = name;
        this.price = price;
        this.image = image;
    }

    public long getId() { return this.id; }

    public String getName() { return this.name; }

    public float getPrice() { return this.price; }

    public String getimage() { return this.image; }

    public void setName(String name) { this.name = name; }

    public void setPrice(float price) { this.price = price; }

    public void setImage(String image) { this.image = image; }

    @Override
    public String toString() 
    {
        return "{ id:" + this.id + ", name:" + this.name + ", price: " + this.price + ", image:" + this.image + " }";
    }


}
