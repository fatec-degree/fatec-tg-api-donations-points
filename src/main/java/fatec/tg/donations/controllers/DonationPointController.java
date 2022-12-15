package fatec.tg.donations.controllers;

import fatec.tg.donations.models.DonationPoint;
import fatec.tg.donations.services.DonationPointService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping(path = "/api/donations-points")
public class DonationPointController {

    private DonationPointService donationPointService;

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public List<DonationPoint> findAll(){
        return donationPointService.findAll();
    }

}
