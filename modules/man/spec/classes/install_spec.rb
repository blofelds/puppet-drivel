require 'spec_helper'

describe 'man::install' do

  it do
    should contain_class('man::install')
    should contain_package('man')
  end
end
