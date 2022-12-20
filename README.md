# cash_register

* Ruby version 

    `3.1.3`

* Database creation

    `rake db:create`

    `rake db:migrate`

* Database seeding

    `rake db:seed`

* How to run the test suite

    `rspec`

* How to run CLI

    `rake calculate_order_total_price`

* Models

    `Product`

    `SalePromotion (GreaterOrEqualPromotion, LastInGroupPromotion)`

* Services

    `Orders:Parse`

    `Orders:GenerateSummary`

    `Orders:ApplyPromotions`

    `Orders:CalculateTotalPrice`
