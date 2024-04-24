package com.cjay.ecom.userManagement;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class UserManagementApplication {

	public static void main(String[] args) {

		SpringApplication.run(UserManagementApplication.class, args);
	}

}
