terraform {
  cloud {
    organization = "fatec-tg"

    workspaces {
      name = "fatec-tg-api-donations-points"
    }
  }
}
