package fatec.tg.donations;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.web.config.EnableSpringDataWebSupport;

@EnableSpringDataWebSupport
@SpringBootApplication
public class DonationsApplication {

	public static void main(String[] args) {
		SpringApplication.run(DonationsApplication.class, args);
	}

}
