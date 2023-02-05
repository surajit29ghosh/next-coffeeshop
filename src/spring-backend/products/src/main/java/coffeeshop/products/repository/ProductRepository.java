package coffeeshop.products.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import coffeeshop.products.model.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByNameContains(String partial);
    
}
