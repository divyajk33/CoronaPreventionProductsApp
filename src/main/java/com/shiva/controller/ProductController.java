package com.shiva.controller;



import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.hibernate.cache.spi.support.AbstractReadWriteAccess.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;

import com.shiva.bindings.CartItem;
import com.shiva.bindings.Product;
import com.shiva.bindings.User;
import com.shiva.service.AdminServiceImpl;
import com.shiva.service.UserServiceImpl;



@Controller
@RequestMapping("/products")
public class ProductController {
	@Autowired
	AdminServiceImpl service;
	@Autowired
	UserServiceImpl service1;
	
	@RequestMapping(value={ "/", "/home" })
	public String Welcome() {
		return "index";
	}
	
	@RequestMapping(value="/userlogin")
	public String WelcomesUser() {
		return "home";
	}
	@RequestMapping(value = "/showkit", method = RequestMethod.GET)
	public String index() {
		return "showkit";
	}
	@RequestMapping(value = "/placeorder", method = RequestMethod.GET)
	public String indexs() {
		return "placeorder";
	}
@PostMapping(value = "/order")
public String handleOrderBtns(@RequestParam String fname,@RequestParam String email,@RequestParam String address,@RequestParam String city , @RequestParam String state,@RequestParam String zip,Model model)  {
model.addAttribute("fname", fname);
model.addAttribute("email",email);
model.addAttribute("address", address);
model.addAttribute("city", city);
model.addAttribute("state",state);
model.addAttribute("zip",zip);
		
		
return "ordersummary";
	

	}	
	@RequestMapping(value = "buy/{pid}", method = RequestMethod.GET)
	public String buy(@PathVariable("pid") String pid, HttpSession session) {
		Product productModel = new Product();
		if (session.getAttribute("cart") == null) {
			List<CartItem> cart = new ArrayList<CartItem>();
			cart.add(new CartItem(service.getProductById(pid), 1));
			session.setAttribute("cart", cart);
		} else {
			List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
			int index = this.exists(pid, cart);
			//int index=Integer.parseInt(qt);
			if (index == -1) {
				cart.add(new CartItem(service.getProductById(pid), 1));
			} else {
				int quantity = cart.get(index).getQuantity() + 1;
				cart.get(index).setQuantity(quantity);
			}
			session.setAttribute("cart", cart);
		}
		return "redirect:/products/showkit";
	}
	@RequestMapping(value = "remove/{pid}", method = RequestMethod.GET)
	public String remove(@PathVariable("pid") String pid, HttpSession session) {
		
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		int index = this.exists(pid, cart);
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "redirect:/products/showkit";
	}
	private int exists(String pid, List<CartItem> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getPt().getPid().equalsIgnoreCase(pid)) {
				return i;
			}
		}
		return -1;
	}

	
	@RequestMapping("/login")
	public String login(@RequestParam String username,@RequestParam String password) {
		
		if(service.login(username, password)) {
			return "admin";
		}
		
		else {
			return "error";
		}
	}
	@RequestMapping(value = "/addProduct")
	public String loadForm() {
		
		return "admin";
	}
	
	@PostMapping(value = "/add")
	
	public String handleaddProductBtn(@RequestParam String pname,@RequestParam double pcost,@RequestParam String pdesc,@RequestParam("image")MultipartFile file , Model model)  {
Product pb=new Product();
		
		try {
			byte[] files;
			files = file.getBytes();
			pb.setPname(pname);
			pb.setPcost(pcost);
			pb.setPdesc(pdesc);
			pb.setImage(files);
			boolean isSaved = service.addProduct(pb);
			
			String msg = "";
			if (isSaved) {
				msg = "Product Added Successfully";
			} else {
				msg = "Failed to add the product try again";
			}

			model.addAttribute("msg", msg);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
return "admin";
	

	}
@PostMapping(value = "/adds")
	
	public String handleaddContactBtns(@RequestParam String pname,@RequestParam String pemail,@RequestParam String pcontact,@RequestParam String username , @RequestParam String password,Model model)  {
User ub=new User();
		
		ub.setPname(pname);
			ub.setPemail(pemail);
			ub.setPcontact(pcontact);
			ub.setUsername(username);
			ub.setPassword(password);
			boolean isSaved = service1.addUsers(ub);
			
			String msg = "";
			if (isSaved) {
				msg = "User Added Successfully";
			} else {
				msg = "Failed to add the user try again";
			}

			model.addAttribute("msg", msg);

		
		
return "redirect:/products/home";
	

	}
	
	@RequestMapping(value="/listProducts")
	public String viewAllProducts(Model model) {
		List<Product> productList = service.getProducts();
		model.addAttribute("product",productList);
		return "listProducts";
	}
	
	@RequestMapping(value="/showproductstoadd")
	public String viewProducts(Model model) {
		List<Product> productList = service.getProducts();
		model.addAttribute("product",productList);
		return "showproductstoadd";
	}
	
	@RequestMapping(value = "/getProductPhoto/{pid}")
	public void getStudentPhoto(HttpServletResponse response, @PathVariable("pid") String id) throws Exception {
		response.setContentType("image/jpeg");
Product pt=service.getProductById(id);
		

		byte[] bytes = pt.getImage();
		InputStream inputStream = new ByteArrayInputStream(bytes);
		IOUtils.copy(inputStream, response.getOutputStream());
	}
	
	@RequestMapping("/editproduct/{pid}")
	public String edit(@PathVariable String pid, Model model) {
	
		model.addAttribute("product", service.getProductById(pid));
        return "editproduct";
		
	}

	
	  
	  @PostMapping(value="/editsave")
	  public String	  editsave(@RequestParam String pid,@RequestParam String pname,@RequestParam double pcost,@RequestParam String pdesc,@RequestParam("image")MultipartFile file,Model model ) 
	  {
		 
		 
		 			
		  Product pb=service.getProductById(pid);
			
			try {
				byte[] files;
				files = file.getBytes();
				
				pb.setPname(pname);
				pb.setPcost(pcost);
				pb.setPdesc(pdesc);
				pb.setImage(files);
				boolean isSaved = service.updateProduct(pb);
				
				String msg = "";
				if (isSaved) {
					msg = "Product Added Successfully";
				} else {
					msg = "Failed to add the product try again";
				}

				model.addAttribute("msg", msg);

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
			
	  return "redirect:/products/listProducts";
	  
	  }
	  @RequestMapping(value = "/deleteProduct")
		public String delete(@RequestParam String pid, Model m) {
		
			service.deleteProduct(pid);

			return "redirect:/products/listProducts";
		}

	  @RequestMapping(value="/user")
		public String Welcomes() {
			return "newuser";
		}
		@RequestMapping("/logins")
		public String logins(@RequestParam String username,@RequestParam String password) {
			
			if(service1.login(username, password)) {
				return "redirect:/products/showproductstoadd";
			}
			
			else {
				return "error";
			}
		}
	
}
		

	
		
	


