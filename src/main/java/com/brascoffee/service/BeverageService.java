package com.brascoffee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brascoffee.entity.Beverage;
import com.brascoffee.repository.BeverageRepository;

@Service
public class BeverageService {
	@Autowired
	BeverageRepository beverageRepository;

	public Beverage addBeverage(Beverage beverage) {
		return beverageRepository.save(beverage);
	}

	public List<Beverage> getAllBeverages() {
		return beverageRepository.findAll();

	}
	

}
