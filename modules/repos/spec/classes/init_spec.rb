require 'spec_helper'

describe 'repos', :type => 'class' do

  it do
    should contain_file('/etc/yum.repos.d')
  end

end
