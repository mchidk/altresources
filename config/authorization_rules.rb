# Auth rules for declarative_authorization

authorization do

  role :guest do
    description "content_assignable"
    has_permission_on :topics, :to => :read
    has_permission_on :search, :to => :read

    has_permission_on :pages, :to => :read do
      if_attribute :role => is_in { 'guest' }
    end

    has_permission_on :blog_posts, :to => :read do
      if_attribute :role => is_in { 'guest' }
    end

    has_permission_on :roled do
      to :create, :read, :update
      if_attribute :role => is_in { user.roles }
    end

    has_permission_on :roled_public_readable do
      to :read
      if_attribute :role => is_in { E9::Roles.public.roles }
    end
    has_permission_on :roled_public_readable do
      to :create, :update
      if_attribute :role => is_in { user.roles }
    end
  end

  role :prospect do
    description ""
    title "Prospect"
    includes :guest
  end

  role :user do
    description "content_assignable user_assignable"
    title "User"
    includes :prospect

    has_permission_on :topics, :to => :create 

    has_permission_on :pages, :to => :read do
      if_attribute :role => is_in { user.roles }
    end

    has_permission_on :blog_posts, :to => :read do
      if_attribute :role => is_in { user.roles }
    end

    has_permission_on :profiles, :to => [:show, :update] do
      if_attribute :id => is { user.id }
    end

    has_permission_on :favorites, :to => :manage do
      if_attribute :user_id => is { user.id }
    end
  end

  role :employee do
    description "content_assignable user_assignable"
    title "Employee"
    includes :user

    # profile directory, admin+ can just read, below they have to be in the
    # User.profile_roles array
    has_permission_on :user_profiles, :to => :read
  end

  role :administrator do
    description "content_assignable user_assignable"
    title "Administrator"
    includes :employee 

    # NOTE all "admin" controllers now have context "admin"
    has_permission_on :admin do
      to :create, :read

      # NOTE delete is defined here but resource_controller is not filtering
      #      it, rather it allows destroy to happen and expects the model
      #      destroy to fail based on role
      to :update, :delete
      if_attribute :role => is_in { user.roles }
    end

    has_permission_on :pages, :to => :manage do
      if_attribute :role => is_in { user.roles }
    end

    has_permission_on :blog_posts, :to => :manage do
      if_attribute :role => is_in { user.roles }
    end

    has_permission_on :topics, :to => :manage do
      if_attribute :role => is_in { user.roles }
    end

    # cannot destroy system mailing lists
    has_permission_on :mailing_lists, :to => :delete do
      if_attribute :system => is { false }
    end

    # cannot destroy system layouts
    has_permission_on :layouts, :to => :delete do
      if_attribute :system => is { false }
    end


    has_permission_on :users, :to => :update do
      if_attribute :role => is_in { user.roles }
    end

    has_permission_on :users, :to => :destroy do
      if_attribute :role => is_in { user.role_lesser }
    end

    # can only edit editable menus
    has_permission_on :menus, :to => :manage do
      if_attribute :editable => is { true }
    end
  end

  role :superuser do
    description "content_assignable user_assignable"
    title "Super User"
    includes :administrator
  end

  role :e9_user do
    description "content_assignable user_assignable"
    title "E9 User"
    includes :superuser

    has_omnipotence
  end
end

privileges do
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => [:edit, :layouts, :change_layout, :manage, :social_form, :social_update, :add, :update_order, :revert, :quick_edit, :send_email, :flagged, :publish, :unpublish]
  privilege :delete, :includes => [:destroy, :delete_all, :remove]
  privilege :manage, :includes => [:create, :read, :update, :delete]
end
