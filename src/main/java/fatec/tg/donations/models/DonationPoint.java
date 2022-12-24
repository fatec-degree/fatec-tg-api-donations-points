package fatec.tg.donations.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter @Setter
@Table(name = "tb_addresses")
@Entity
public class DonationPoint {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String cep;
    private String state;
    private String city;
    private String district;
    private String street;
    private String number;
    private Double lng;
    private Double lat;
    @Column(name = "creation_date")
    private LocalDateTime creationDate = LocalDateTime.now();

}
