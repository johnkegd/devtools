package com.example.Hulk;

import org.springframework.beans.factory.UnsatisfiedDependencyException;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
public class HulkApplication {

	public static void main(String[] args) {
		try {
			SpringApplication.run(HulkApplication.class, args);
		} catch (UnsatisfiedDependencyException e) {
			System.out.println("Error en: " + e);
		}
		
		
	}

}
