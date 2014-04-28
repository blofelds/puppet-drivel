require 'spec_helper'

describe 'ntp' do
  describe 'ntp::service' do
    it 'should contain ntp service' do
      should contain_service('ntpd').with(
        'ensure' => 'running',
        'enable' => 'true',
      )
    end
  end
end
