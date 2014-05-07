require 'spec_helper'

describe 'vmwaretools' do
  describe 'vmwaretools::service' do

    it do
      should contain_service('vmware-tools')
    end

  end
end

