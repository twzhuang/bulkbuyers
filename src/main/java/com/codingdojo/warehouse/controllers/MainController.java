package com.codingdojo.warehouse.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.warehouse.models.Category;
import com.codingdojo.warehouse.models.Order;
import com.codingdojo.warehouse.models.Orderproduct;
import com.codingdojo.warehouse.models.Product;
import com.codingdojo.warehouse.models.User;
import com.codingdojo.warehouse.services.MainService;

@Controller
public class MainController {
	private final MainService mainService;

	public MainController(MainService mainService) {
		this.mainService = mainService;
	}
	
	@RequestMapping(value= {"/","/home"})
	public String homePage(Model model, HttpSession session, @ModelAttribute("u") User u, @ModelAttribute("orderProduct") Orderproduct orderproduct) {
		if (session.getAttribute("id") != null) {
			System.out.println("user logged in");
			User user = mainService.findUserById((Long) session.getAttribute("id"));
			List<Orderproduct> cart = user.getCart();
			System.out.println(cart);
			List<Long> temp = new ArrayList<Long>();
			for (Orderproduct op : cart) {
				temp.add(op.getId());
			}
			session.setAttribute("cart", temp);
		}
		else if (session.getAttribute("cart") == null) {
			List<Long> cart = new ArrayList<Long>();
			session.setAttribute("cart", cart);
		}
		List<Product> products = mainService.findAllProducts();
		model.addAttribute("products", products);
		return "homePage.jsp";
	}
	
	@PostMapping("/{path}/register")
	public String registerUser(@PathVariable("path") String path,@Valid @ModelAttribute("u") User user, BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			return "homePage.jsp";
		}
		else {
			User newUser = mainService.registerUser(user);
			session.setAttribute("id", newUser.getId());
			session.setAttribute("user", newUser);
			return "redirect:/"+path;
		}
	}
	
	@PostMapping("/{path}/login")
	public String loginUser(@PathVariable("path") String path, @RequestParam("email") String email, @RequestParam("password") String password, HttpSession session, RedirectAttributes redirectAttributes) {
		if (mainService.authenticateUser(email, password)) {
			User user = mainService.findByEmail(email);
			session.setAttribute("id", user.getId());
			session.setAttribute("user", user);
			return "redirect:/" + path;
		}
		else {
			redirectAttributes.addFlashAttribute("error", "User could not be authenticated, please try again.");
    		return "redirect:/";
		}
	}
	
	@RequestMapping("/category/{id}")
	public String showCategoryProduct(@ModelAttribute("orderproduct") Orderproduct orderproduct, @PathVariable("id") Long id, Model model, HttpSession session, @ModelAttribute("u") User u) {
		List<Category> categories = mainService.findAllCategories();
		Category category = mainService.findCategoryById(id);
		model.addAttribute("category", category);
		model.addAttribute("categories", categories);
		for (Category cat : categories) {
			System.out.println(cat.getName());
		}
		return "shoppingPage.jsp";
	}
	
	@RequestMapping("/products/{id}")
	public String showProduct(@PathVariable("id") Long id, Model model, @ModelAttribute("orderProduct") Orderproduct orderProduct, @ModelAttribute("u") User u) {
		Product product = mainService.findProductById(id);
		model.addAttribute("product", product);
		return "product.jsp";
	}
	
	@RequestMapping("/products/{id}/remove")
	public String removeFromCart(@PathVariable("id") Long id, HttpSession session) {
		Long userid = (Long) session.getAttribute("id");
		if (userid != null) {
			User user = mainService.findUserById(userid);
			
			List<Orderproduct> cart = user.getCart();
			List<Long> temp = (List<Long>)session.getAttribute("cart");
			
			Orderproduct p = mainService.findOrderProductById(id);
			
			temp.remove(p.getId());
			cart.remove(p);
			
			session.setAttribute("cart", temp);
			user.setCart(cart);
			mainService.createUser(user);
		}
		else {
			List<Long> cart = (List<Long>)session.getAttribute("cart");
			Orderproduct p = mainService.findOrderProductById(id);
			cart.remove(p.getId());
			session.setAttribute("cart", cart);
		}
		return "redirect:/cart";
	}
	
	@RequestMapping("/cart")
	public String showCart(Model model, HttpSession session, @ModelAttribute("order") Order order) {
		List<Long> cart = (List<Long>) session.getAttribute("cart");
		List<Orderproduct> cartItems = new ArrayList<Orderproduct>();
		Double total = 0.0;
		for (Long id : cart) {
			Orderproduct op = mainService.findOrderProductById(id);
			cartItems.add(op);
			total += op.getProduct().getPrice() * op.getQuantity();
		}
		model.addAttribute("total", total);
		model.addAttribute("cart", cartItems);
		return "cart.jsp";
	}
	
	@PostMapping("/addCart")
	public String addCart(@ModelAttribute("orderProduct") Orderproduct orderProduct, HttpSession session, @ModelAttribute("user") User u) {
		Long userid = (Long) session.getAttribute("id");
		if (userid != null) {
			User user = mainService.findUserById(userid);
			List<Orderproduct> cart = user.getCart();
			List<Long> temp = (List<Long>) session.getAttribute("cart");
			Orderproduct op = mainService.createOrderProduct(orderProduct);
			cart.add(op);
			temp.add(op.getId());
			System.out.println("Product was added to cart!");
			System.out.println(cart);
			session.setAttribute("cart", temp);
			mainService.createUser(user);
		}
		else {
			List<Long> cart = (List<Long>) session.getAttribute("cart");
			Orderproduct op = mainService.createOrderProduct(orderProduct);
			cart.add(op.getId());
			session.setAttribute("cart", cart);
		}
		return "redirect:/category/"+ orderProduct.getProduct().getCategory().getId();
	}
	
	@PostMapping("/checkout")
	public String checkoutCart(HttpSession session, @ModelAttribute("order") Order order) {
		Long userid = (Long) session.getAttribute("id");
		User user = mainService.findUserById(userid);
		List<Orderproduct> cart = user.getCart();
		List<Orderproduct> orderCart = new ArrayList<Orderproduct>();
		
		for (Orderproduct op : cart) {
			Product p = op.getProduct();
			p.setNumPurchased(p.getNumPurchased()+op.getQuantity());
			if(p.getNumPurchased()>p.getCap()) {
				p.setNumPurchased(0);
			}
			mainService.createProduct(p);
			orderCart.add(op);
		}
		order.setOrderProducts(orderCart);
		mainService.createOrder(order);

//		clear session
//		clear cart
		user.setCart(new ArrayList<Orderproduct>());
		mainService.createUser(user);
		session.setAttribute("cart", new ArrayList<Orderproduct>());
		return "redirect:/cart";
	}
	
	@RequestMapping("/logout")
	public String logoutUser(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}
}
