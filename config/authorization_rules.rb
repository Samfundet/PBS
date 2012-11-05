authorization do
  role :guest do
    has_permission_on :posters, :to => :index
    has_permission_on :sessions, :to => [:new, :create]
  end

  role :medlem do
    has_permission_on :sessions, :to => [:new, :create]
    has_permission_on :posters, :to => [:index, :create, :edit, :update, :show, :new, :cancel_poster, :cancel, :order, :restore]
  end

  role :lim_web do
    has_permission_on :posters, :to => [:index, :create, :edit, :update, :show, :new, :cancel_poster, :cancel, :order, :take, :take_poster, :archive, :archive_poster, :restore, :destroy]
  end
end
