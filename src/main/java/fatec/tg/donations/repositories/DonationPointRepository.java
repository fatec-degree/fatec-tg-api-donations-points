package fatec.tg.donations.repositories;

import fatec.tg.donations.models.DonationPoint;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DonationPointRepository extends JpaRepository<DonationPoint, Long> {
}
