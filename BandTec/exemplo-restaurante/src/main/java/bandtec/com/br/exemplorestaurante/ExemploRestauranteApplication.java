package bandtec.com.br.exemplorestaurante;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Service;

@EnableScheduling
@Configuration
@SpringBootApplication
public class ExemploRestauranteApplication {

	public static void main(String[] args) {
		SpringApplication.run(ExemploRestauranteApplication.class, args);
	}

}
