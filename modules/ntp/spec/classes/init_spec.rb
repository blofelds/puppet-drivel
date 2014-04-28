require 'spec_helper'

describe 'ntp' do
  it 'should contain ntp class' do
    should contain_class('ntp')
  end

end
