require 'spec_helper'

describe Restforce::Middleware::Authentication::SessionId do
  let(:options) do
    { :host => 'login.salesforce.com',
      :session_id => 'session_id' }
  end

  it_behaves_like 'authentication middleware' do
    let(:success_request) do
      stub_login_request(:body => "grant_type=refresh_token&refresh_token=refresh_token&" \
        "client_id=client_id&client_secret=client_secret").
        to_return(:status => 200, :body => fixture(:auth_success_response))
    end

    let(:fail_request) do
      stub_login_request(:body => "grant_type=refresh_token&refresh_token=refresh_token&" \
        "client_id=client_id&client_secret=client_secret").
        to_return(:status => 400, :body => fixture(:refresh_error_response))
    end
  end
end