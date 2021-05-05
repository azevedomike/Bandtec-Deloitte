package br.com.bandtec.projetoac3mike;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@Configuration
@EnableScheduling
public class ProjetoAc3MikeApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjetoAc3MikeApplication.class, args);
	}

}
