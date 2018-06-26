require 'spec_helper'
describe 'base' do
  context 'with default values for all parameters' do
    it { should contain_class('base') }
  end
end
