package com.codingdojo.warehouse.services;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.codingdojo.warehouse.models.Category;
import com.codingdojo.warehouse.models.Order;
import com.codingdojo.warehouse.models.Orderproduct;
import com.codingdojo.warehouse.models.Product;
import com.codingdojo.warehouse.models.User;
import com.codingdojo.warehouse.repositories.CategoryRepository;
import com.codingdojo.warehouse.repositories.OrderProductRepository;
import com.codingdojo.warehouse.repositories.OrderRepository;
import com.codingdojo.warehouse.repositories.ProductRepository;
import com.codingdojo.warehouse.repositories.UserRepository;

@Service
public class MainService {
	private final UserRepository userRepo;
	private final OrderRepository orderRepo;
	private final ProductRepository productRepo;
	private final CategoryRepository categoryRepo;
	private final OrderProductRepository orderProductRepo;
	
	public MainService(UserRepository userRepo, OrderRepository orderRepo, ProductRepository productRepo,
			CategoryRepository categoryRepo, OrderProductRepository orderProductRepo) {
		this.userRepo = userRepo;
		this.orderRepo = orderRepo;
		this.productRepo = productRepo;
		this.categoryRepo = categoryRepo;
		this.orderProductRepo = orderProductRepo;
	}
	
	public User findUserById(Long id) {
		return userRepo.findById(id).get();
	}
	
	public Order findOrderById(Long id) {
		return orderRepo.findById(id).get();
	}
	
	public Category findCategoryById(Long id) {
		return categoryRepo.findById(id).get();
	}
	
	public Product findProductById(Long id) {
		return productRepo.findById(id).get();
	}
	
	public Orderproduct findOrderProductById(Long id) {
		return orderProductRepo.findById(id).get();
	}
	
	public User createUser(User u) {
		return userRepo.save(u);
	}
	
	public Order createOrder(Order o) {
		return orderRepo.save(o);
	}
	
	public Category createCategory(Category c) {
		return categoryRepo.save(c);
	}
	
	public Product createProduct(Product p) {
		return productRepo.save(p);
	}

	public Orderproduct createOrderProduct(Orderproduct o) {
		return orderProductRepo.save(o);
	}
	
	public List<Product> findAllProducts(){
		return productRepo.findAll();
	}
	
	public List<Category> findAllCategories(){
		return categoryRepo.findAll();
	}
	
	public User registerUser(User user) {
		String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashed);
		return userRepo.save(user);
	}
	
	public User findByEmail(String email) {
		return userRepo.findByEmail(email);
	}
	
	public boolean authenticateUser(String email, String password) {
		User user = userRepo.findByEmail(email);
		if (user == null) {
			return false;
		}
		else {
			if (BCrypt.checkpw(password, user.getPassword())) {
				return true;
			}
			else {
				return false;
			}
		}
	}
	
}
