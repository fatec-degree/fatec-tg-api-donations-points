package fatec.tg.donations.services;

import fatec.tg.donations.models.DonationPoint;
import fatec.tg.donations.repositories.DonationPointRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@AllArgsConstructor
@Service
public class DonationPointService {

    private DonationPointRepository repository;

    public List<DonationPoint> findAll(){
        return repository.findAll();
    }

}
