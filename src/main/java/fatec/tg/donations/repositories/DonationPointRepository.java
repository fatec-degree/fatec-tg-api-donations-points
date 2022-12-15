package fatec.tg.donations.repositories;

import fatec.tg.donations.models.DonationPoint;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DonationPointRepository extends JpaRepository<DonationPoint, Long> {
}
