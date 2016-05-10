Rails.application.routes.draw do
  
  constraints(:host => "localhost") do
    resources :shorturls
    root to: 'shorturls#new'
    
  end
  constraints( :host => "short.de" ) do
   
    get '/:id' =>  'shorturls#short'
  end

end
