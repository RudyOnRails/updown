module Updown
  class Engine < ::Rails::Engine
    isolate_namespace Updown

    module Updownable
      extend ActiveSupport::Concern
   
      included do
      end
   
      module ClassMethods
        def updown_able(options = {})
          # cattr_accessor :yaffle_text_field
   
          include Updown::Updownable::LocalInstanceMethods
        end
      end
   
      module LocalInstanceMethods
        
        def upvote(user)
          if self.votes.where(:user_id => user).present?
            return nil
          else
            self.votes << Vote.create(:user => user)
            true
          end
        end

        def downvote(user)
          
        end

      end
    end

  end
end

ActiveRecord::Base.send :include, Updown::Updownable