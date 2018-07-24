# Jungle

(This project is a work in progress.)
A mini e-commerce application built with Rails 4.2 for purposes of learning Rails by example.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Run `bin/rake db:reset` to create, load and seed db
4. Sign up for a Stripe account
5. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Known Issues

Cart doesn't update (empty) when a user logs out.

## Screenshots

!["Screenshot code for creating a new category (accessible by admins only)."](https://github.com/TheresaCampbell/jungle/blob/master/docs/admin-create-category-CODE.png?raw=true)
!["Screenshot of creating a new category (accessible by admins only)."](https://github.com/TheresaCampbell/jungle/blob/master/docs/admin-create-category.png?raw=true)
!["Screenshot of homepage.""](https://github.com/TheresaCampbell/jungle/blob/master/docs/homepage.png?raw=true)
!["Screenshot of code for product reviews."](https://github.com/TheresaCampbell/jungle/blob/master/docs/product-reviews.png?raw=true)
