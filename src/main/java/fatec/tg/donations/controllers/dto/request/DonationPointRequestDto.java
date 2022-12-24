package fatec.tg.donations.controllers.dto.request;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class DonationPointRequestDto {
    
    private String name;
    private String cep;
    private String state;
    private String city;
    private String district;
    private String street;
    private String number;
    private Double lng;
    private Double lat;

}
