package fatec.tg.donations.services;

import fatec.tg.donations.models.DonationPoint;
import fatec.tg.donations.repositories.DonationPointRepository;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
public class DonationPointService {

    private DonationPointRepository repository;

    public Page<DonationPoint> findAll(Pageable pageable){
        return repository.findAll(pageable);
    }

}
