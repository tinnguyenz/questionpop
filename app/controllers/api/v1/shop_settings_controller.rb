module Api
  module V1
    class ShopSettingsController < ApplicationController
      protect_from_forgery except: :info
      def info
        setting = Setting.where(shop_domain: params[:shop_domain])[0]

        render json: setting, :callback => params[:callback]
      end

      def questions
      	questions = Question.all
      	render json: questions, :callback => params[:callback]
      end

      def contacts
        contacts = Contact.all
        render json: contacts, :callback => params[:callback]
      end

      def settings
        settings = Setting.all
        render json: settings, :callback => params[:callback]
      end

      def shops
      	shops = Shop.all
      	render json: shops, :callback => params[:callback]
      end

      def customers
        customers = Customer.all
        render json: customers, :callback => params[:callback]
      end
    end
  end
end
