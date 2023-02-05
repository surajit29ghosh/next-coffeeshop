using Microsoft.EntityFrameworkCore;

public class ProductContext:DbContext
    {
        public ProductContext(DbContextOptions<ProductContext> options):base(options) {  }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("product");
            base.OnModelCreating(modelBuilder);
        }
        public DbSet<Product> Products { get; set; }
 
    }
