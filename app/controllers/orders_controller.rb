class OrdersController < ApplicationController
    def new
        @book= Book.find(params[:book_id])
        Stripe.api_key = 'sk_test_4LJhIs0T1hW84VMvYFFngE0L00jRQ02W8I'
        @session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: [{
                name: @book.title,
                description: "by #{@book.author.name}",
                images: ['https://example.com/t-shirt.png'],
                amount: (@book.price * 100).to_i,
                currency: 'aud',
                quantity: 1,
                }],
                success_url: 'http://localhost:3000/orders/complete',
                cancel_url: 'http://localhost:3000/orders/cancel',
                )
                
            end
        end

        