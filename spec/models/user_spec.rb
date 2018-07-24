require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    before :each do
      @user = User.create(
        first_name: 'Test',
        last_name: 'Tester',
        email: 'test@example.com',
        password: 'test-o',
        password_confirmation: 'test-o')
    end

    it 'should have a first name' do
      @no_first_name = User.new(last_name: 'Tester', email: 'test@example.com', password: 'test-o', password_confirmation: 'test-o')
      expect(@user.first_name).to be_present
      expect(@no_first_name).to be_invalid
    end

    it 'should have a last name' do
      @no_last_name = User.new(first_name: 'Test', email: 'test@example.com', password: 'test-o', password_confirmation: 'test-o')
      expect(@user.last_name).to be_present
      expect(@no_last_name).to be_invalid
    end

    it 'should have an email' do
      @no_email = User.new(first_name: 'Test', last_name: 'Tester', password: 'test-o', password_confirmation: 'test-o')
      expect(@user.email).to be_present
      expect(@no_email).to be_invalid
    end

    it 'should have a password' do
      @no_password = User.new(first_name: 'Test', last_name: 'Tester', email: 'test@example.com', password_confirmation: 'test-o')
      expect(@user.password).to be_present
      expect(@no_password).to be_invalid
    end

    it 'should have a password confirmation' do
      @no_password_confirmation = User.new(first_name: 'Test', last_name: 'Tester', email: 'test@example.com', password: 'test-o')
      expect(@user.password_confirmation).to be_present
      expect(@no_password_confirmation).to be_invalid
    end

    it 'should have matching password and password confirmation' do
      @mismatched_passwords = User.new(first_name: 'Test', last_name: 'Tester', email: 'test@example.com', password: 'test-o', password_confirmation: 'test-o-change-o')
      expect(@user.password).to eq(@user.password_confirmation)
      expect(@mismatched_passwords.password).to_not eq(@mismatched_passwords.password_confirmation)
    end

    it 'should have a unique email' do
      @good_user = User.create(
        first_name: 'Test', last_name: 'Tester', email: 'test2@example.com', password: 'test-o', password_confirmation: 'test-o')
      @duplicate_user = User.create(
        first_name: 'Test', last_name: 'Tester', email: 'test2@example.com', password: 'test-o', password_confirmation: 'test-o')
      expect(@good_user).to be_valid
      expect(@duplicate_user).to be_invalid
    end

    it 'should have a password that is at least 4 characters long' do
      @good_user = User.create(
        first_name: 'Test', last_name: 'Tester', email: 'test2@example.com', password: 'test-o', password_confirmation: 'test-o')
      @short_password = User.new(first_name: 'Test', last_name: 'Tester', email: 'tester@example.com', password: 'tes', password_confirmation: 'tes')
      expect(@good_user).to be_valid
      expect(@short_password).to be_invalid
    end

  end

  describe '.authenticate_with_credentials' do

    before :each do
      @user = User.create(
        first_name: 'Test',
        last_name: 'Tester',
        email: 'test@example.com',
        password: 'test-o',
        password_confirmation: 'test-o')
    end

    it 'should authenticate an existing user' do
      user1 = User.authenticate_with_credentials('test@example.com', 'test-o')
      expect(user1).to be_truthy
    end

    it 'should not authenticate a nonexistent user' do
      user1 = User.authenticate_with_credentials('wrong@example.com', 'wrong')
      expect(user1).to be_falsey
    end

    it 'should not matter if whitespace is used in email' do
      @whitespace = User.create(first_name: 'Test', last_name: 'Tester', email: '    whitespace@example.com  ', password: 'test-o', password_confirmation: 'test-o')
      expect(@whitespace).to be_truthy
    end

  end

end
