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
end
