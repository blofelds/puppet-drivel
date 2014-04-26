require 'spec_helper'

describe 'host::entries' do

  it do
    should contain_class('hosts::entries')
  end
end
