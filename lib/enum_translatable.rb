require "enum_translatable/version"
require 'active_support/concern'

module EnumTranslatable
  extend ActiveSupport::Concern

  included do
    defined_enums.keys.each do |key|
      define_method :"translated_#{key}" do
        enum_value = send(key)
        return nil unless enum_value.present?
        I18n.t("activerecord.attributes.#{model_name.singular}.#{key}_list.#{enum_value}", default: enum_value)
      end

      define_method :"#{key}_en" do
        I18n.with_locale(:en) do
          send("translated_#{key}")
        end
      end

      define_method :"#{key}_ar" do
        I18n.with_locale(:ar) do
          send("translated_#{key}")
        end
      end
    end
  end
end
