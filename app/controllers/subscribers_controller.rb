class SubscribersController < ApplicationController

  def create
    flash[:info]="You subscribed to our mail list"
    Subscriber.create(email:params[:email])
  end
end
