require 'spec_helper'

describe 'ntp' do
  it 'should contain service' do
    should contain_service('ntpd')
  end
# need to input a parameterised option for start or stop based on vagrantness
end
