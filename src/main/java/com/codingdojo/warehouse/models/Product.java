package com.codingdojo.warehouse.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

@Entity
@Table(name="products")
public class Product {
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	private String name;
	private String description;
	private double price;
	private int cap;
	private int numPurchased = 0;
	private String image;
	private String brand;
	
	// list of users who purchased this product
	@OneToMany(mappedBy="product", fetch = FetchType.LAZY)
	private List<User> purchasers;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="category_id")
    private Category category;
	
	@OneToMany(mappedBy="product", fetch=FetchType.LAZY)
	private List<Orderproduct> orderproduct;

	@Column(updatable=false)
    private Date createdAt;
	private Date updatedAt;
	
	public Product() {	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getCap() {
		return cap;
	}
	public void setCap(int cap) {
		this.cap = cap;
	}
	public int getNumPurchased() {
		return numPurchased;
	}
	public void setNumPurchased(int numPurchased) {
		this.numPurchased = numPurchased;
	}
	public List<User> getPurchasers() {
		return purchasers;
	}
	public void setPurchasers(List<User> purchasers) {
		this.purchasers = purchasers;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
		
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public List<Orderproduct> getOrderproduct() {
		return orderproduct;
	}
	public void setOrderproduct(List<Orderproduct> orderproduct) {
		this.orderproduct = orderproduct;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
}
