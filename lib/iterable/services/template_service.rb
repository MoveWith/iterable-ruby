#
# message_type_service.rb
# Iterable
#
# Copyright (c) 2017 MoveWith. All rights reserved.

module Iterable
  module Services
    class TemplateService < BaseService
      class << self
        def all(templateType='Triggered')
          get(Util::Config.get('endpoints.templates'), { templateType: templateType }, Iterable::Responses::Templates)
        end
      end
    end
  end
end
