require 'rails_helper'

  describe Scan, type: :model do
    describe 'validations' do
      it {should validate_presence_of(:result)}
    end
  end
