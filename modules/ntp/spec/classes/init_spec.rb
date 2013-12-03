require 'spec_helper'

describe 'ntp' do
  it 'should include ntp class' do
    should include_class('ntp')
  end

describe 'inheritance' do
  it 'should inherit ntp params class' do
    should include_class('ntp::params')
  end
end
# this doesn't work
  context 'with "offline" set to "offline"' do
    let(:params) { {:offline => 'offline'} }

      it 'should not contain the ntp::begin class' do
      should_not include_class('ntp::begin')
    end
  end

  context 'with "offline" set to "online"' do
    let(:params) { {:offline => 'online'} }

    it 'should contain the ntp::begin class' do
      should include_class('ntp::install')
    end
  end

end
