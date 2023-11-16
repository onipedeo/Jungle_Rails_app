require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it 'is not valid without a password' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com'
      )
      expect(user).to_not be_valid
    end

    it 'is not valid without matching password and password_confirmation' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'differentpassword'
      )
      expect(user).to_not be_valid
    end

=begin
    it 'is not valid without an email' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        password: 'password',
        password_confirmation: 'password',
        email: nil
      )
      expect(user).to_not be_valid
    end
=end
  end
end
