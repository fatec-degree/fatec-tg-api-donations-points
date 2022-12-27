package fatec.tg.donations.controllers;

import fatec.tg.donations.controllers.dto.request.DonationPointRequestDto;
import fatec.tg.donations.models.DonationPoint;
import fatec.tg.donations.services.DonationPointService;
import lombok.AllArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;


@AllArgsConstructor
@RestController
@RequestMapping(path = "/api/donations-points")
public class DonationPointController {

    private DonationPointService donationPointService;
    private ModelMapper modelMapper;

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    @CacheEvict(value = "findAll", allEntries = true)
    public DonationPoint save(@RequestBody DonationPointRequestDto donationPointRequestDto){
        return donationPointService.save(modelMapper.map(donationPointRequestDto, DonationPoint.class));
    }

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    @Cacheable(value = "findAll")
    public Page<DonationPoint> findAll(@PageableDefault(
            size = 20,
            sort = {"state", "city", "district", "street", "number"},
            direction = Sort.Direction.ASC) Pageable pageable){
        return donationPointService.findAll(pageable);
    }

}
