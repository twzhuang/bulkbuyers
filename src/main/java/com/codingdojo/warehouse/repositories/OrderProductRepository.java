package com.codingdojo.warehouse.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.warehouse.models.Orderproduct;

@Repository
public interface OrderProductRepository extends CrudRepository<Orderproduct, Long>{
	List<Orderproduct> findAll();
}
