describe 'Routing' do
  # debugger
  # it { should route(:post, '/updates').to(controller: 'posts', action: 'index') }
  it { should route(:get, "/").to(controller: "home", action: "index")}


  it { should route(:get, "/plan/1").to("plan#index", id: 1) }
              # plan_index GET    /plan(.:format)                plan#index
                         # POST   /plan(.:format)                plan#create
end