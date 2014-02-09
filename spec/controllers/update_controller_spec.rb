require 'spec_helper'

describe UpdateController do
  describe "POST #updates" do
    before { post :create}

    it { should render_template :nothing}
  end
end
