authorization do
  role :guest do
    has_permission_on :posters, :to => :index
    has_permission_on :sessions, :to => [:new, :create, :destroy]
  end

  role :medlem do
    includes :guest
    has_permission_on :posters, :to => [:create, :edit, :update, :show, :new, :cancel_poster, :cancel, :order, :restore]
  end

  role :lim_web do
    includes :medlem
    has_permission_on :posters, :to => [:take, :take_poster, :archive, :archive_poster, :destroy]
  end
end
