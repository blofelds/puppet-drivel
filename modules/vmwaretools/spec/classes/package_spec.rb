require 'spec_helper'

describe 'vmwaretools' do
  describe 'vmwaretools::package' do

    it do
      should contain_service('vmware-tools')
    end
  end

end


