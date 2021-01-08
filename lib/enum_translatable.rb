require "enum_translatable/version"
require 'active_support/concern'

module EnumTranslatable
  extend ActiveSupport::Concern

  included do
    defined_enums.keys.each do |key|
      define_method :"#{key}" do
        enum_value = self[:"#{key}"]
        return nil unless enum_value.present?
        I18n.t("activerecord.enum_translatable.#{model_name.singular}.#{key}.#{enum_value}", default: enum_value)
      end

      I18n.available_locales.each do |locale|
        define_method :"#{key}_#{locale}" do
          I18n.with_locale(locale) do
            send("#{key}")
          end
        end
      end
    end
  end
end