ActionController::Routing::Routes.draw do |map|
  map.resources :apps, :audits, :customers, :deployments, :destinations, :edges, :hosts, :services, :watchers

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end