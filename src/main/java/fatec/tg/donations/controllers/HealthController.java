package fatec.tg.donations.controllers;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import fatec.tg.donations.controllers.dto.response.HealthDto;

@RestController
@RequestMapping
public class HealthController {
    
    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public HealthDto health(){
        return new HealthDto("up");
    }

}
