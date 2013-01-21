authorization do
  role :guest do
    has_permission_on :posters, :to => :index
    has_permission_on :sessions, :to => [:new, :create, :destroy]
  end

  role :medlem do
    includes :guest
    has_permission_on :posters, :to => [:create, :show, :new, :cancel, :order]

    has_permission_on :posters, :to => [:edit, :update, :cancel_poster] do
      if_attribute :orderer_id => is {user.id}
    end

    has_permission_on :posters, :to => [:restore], :join_by => :and do
      if_attribute :orderer_id => is {user.id}
      if_attribute :status => is {:canceled}
    end
  end

  role :mg_layout do
    includes :medlem
    has_permission_on :posters, :to => [:edit, :update, :cancel, :cancel_poster, :restore, :take, :take_poster, :archive, :archive_poster]
    has_permission_on :dimensions, :to => [:show, :index]
  end

  role :mg_layout_sjef do
    includes :mg_layout
    has_permission_on :posters, :to => [:destroy]
    has_permission_on :dimensions, :to => [:new, :create, :edit, :update, :archive_dimension, :restore]
  end

  role :lim_web do
    includes :mg_layout_sjef
  end
end
