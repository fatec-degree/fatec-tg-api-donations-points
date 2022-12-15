package fatec.tg.donations.controllers;

import fatec.tg.donations.models.DonationPoint;
import fatec.tg.donations.services.DonationPointService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;


@AllArgsConstructor
@RestController
@RequestMapping(path = "/api/donations-points")
public class DonationPointController {

    private DonationPointService donationPointService;

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public Page<DonationPoint> findAll(@PageableDefault(
            size = 20,
            sort = {"state", "city", "district", "street", "number"},
            direction = Sort.Direction.ASC) Pageable pageable){
        return donationPointService.findAll(pageable);
    }

}
