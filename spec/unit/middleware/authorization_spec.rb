require 'spec_helper'

describe Restforce::Middleware::Authorization do
  describe 'OAuth' do
    let(:options) { { :oauth_token => 'token' } }

    describe '.call' do
      subject { lambda { middleware.call(env) } }

      it { should change { env[:request_headers]['Authorization'] }.to eq 'OAuth token' }
    end
  end

  describe 'SessionId' do
    let(:options) { { :session_id => 'session_id' } }

    describe '.call' do
      subject { lambda { middleware.call(env) } }

      it { should change { env[:request_headers]['Authorization'] }.to eq 'OAuth session_id' }
    end
  end
end